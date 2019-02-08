import 'package:custom_serializer/models/custom_value.dart';
import 'package:custom_serializer/serializers/serializers.dart';
import 'package:test_api/test_api.dart';
import 'dart:convert' as json;

void main() {
  test("Single value", () {
    var value = "test";
    var jsonMap = '{"value": "$value"}';

    var encodedJson = json.jsonDecode(jsonMap);

    CustomValue customValue = standardSerializers.deserializeWith(CustomValue.serializer, encodedJson);

    expect(customValue.value, equals(value));
    expect(customValue.values, isNull);
  });

  test("Single value", () {
    var value1 = "test";
    var value2 = "system";
    var value = '["$value1", "$value2"]';
    var jsonMap = '{"value": $value}';

    var encodedJson = json.jsonDecode(jsonMap);

    CustomValue customValue = standardSerializers.deserializeWith(CustomValue.serializer, encodedJson);

    expect(customValue.value, isNull);
    expect(customValue.values, equals([value1, value2]));
  });
}