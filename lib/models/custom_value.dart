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
        CustomValue, // variable type
        _$CustomValue, // internal built_value type
      ];
  // name of the variable we are going to Serialize
  @override
  final String wireName = 'CustomValue';

  @override
  CustomValue deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    // Initialize an empty builder
    final result = new CustomValueBuilder();

    // Create an `Iterator` from the serialized data received
    final iterator = serialized.iterator;
    // Loop the iterator for each key
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      // for each key, assign the correct value to the builder
      switch (key) {
        case 'value':
          // If the value is of type List<dynamic>, assign it to `values`
          if (value is List<dynamic>) {
            result.values.replace(serializers.deserialize(value,
                specifiedType: const FullType(BuiltList, const [
                  const FullType(String)
                ])) as BuiltList);
          // else, the value is of type `String`
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
    // Create an empty object array
    final result = <Object>[];
    // if the value of the `CustomValue` is not null, then assign it to a String
    if (object.value != null) {
      result
        ..add('value')
        ..add(serializers.serialize(object.value,
            specifiedType: const FullType(String)));
    }
    // Else, it means that we have a list. In this case the list will always override
    // the defined String value
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
