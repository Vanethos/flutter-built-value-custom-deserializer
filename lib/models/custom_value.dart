import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'custom_value.g.dart';

abstract class CustomValue implements Built<CustomValue, CustomValueBuilder> {
  @BuiltValueSerializer(custom: true)
  static Serializer<CustomValue> get serializer => CustomDataSerializer();

  @nullable String get value;

  @nullable BuiltList<String> get values;

  CustomValue._();

  factory CustomValue([updates(CustomValueBuilder b)]) = _$CustomValue;
}

class CustomDataSerializer implements StructuredSerializer<CustomValue> {
  @override
  Iterable<Type> get types => [
        CustomValue,
        _$CustomValue,
      ];
  @override
  final String wireName = 'CustomValue';

  @override
  CustomValue deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CustomValueBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'value':
          if (value is List<dynamic>) {
            result.values.replace(serializers.deserialize(value,
                specifiedType: const FullType(BuiltList, const [
                  const FullType(String)
                ])) as BuiltList);
          } else {
            result.value = serializers.deserialize(value.toString(),
                specifiedType: const FullType(String)) as String;
          }
          break;
      }
    }

    return result.build();
  }

  @override
  Iterable serialize(Serializers serializers, CustomValue object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.value != null) {
      result
        ..add('value')
        ..add(serializers.serialize(object.value,
            specifiedType: const FullType(String)));
    }
    if (object.values != null) {
      result
        ..add('values')
        ..add(serializers.serialize(object.values,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }

    return result;
  }
}
