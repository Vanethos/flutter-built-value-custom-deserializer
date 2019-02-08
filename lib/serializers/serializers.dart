import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:custom_serializer/models/custom_value.dart';

part 'serializers.g.dart';

/// Class to be used for built_value serialization
///
/// We need to declare a list of all the classes to be serialized  and initialize a
/// standard serializer to deal with them
/// In order to generate the '.g' classes, we need to run the following in the terminal:
/// `flutter packages pub run build_runner watch`
@SerializersFor(const [
  CustomValue
])

Serializers serializers = _$serializers;

Serializers standardSerializers =
(serializers.toBuilder()
  ..addPlugin(StandardJsonPlugin())
).build();