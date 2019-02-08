// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_value.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CustomValue extends CustomValue {
  @override
  final String value;
  @override
  final BuiltList<String> values;

  factory _$CustomValue([void updates(CustomValueBuilder b)]) =>
      (new CustomValueBuilder()..update(updates)).build();

  _$CustomValue._({this.value, this.values}) : super._();

  @override
  CustomValue rebuild(void updates(CustomValueBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  CustomValueBuilder toBuilder() => new CustomValueBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CustomValue &&
        value == other.value &&
        values == other.values;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, value.hashCode), values.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CustomValue')
          ..add('value', value)
          ..add('values', values))
        .toString();
  }
}

class CustomValueBuilder implements Builder<CustomValue, CustomValueBuilder> {
  _$CustomValue _$v;

  String _value;
  String get value => _$this._value;
  set value(String value) => _$this._value = value;

  ListBuilder<String> _values;
  ListBuilder<String> get values =>
      _$this._values ??= new ListBuilder<String>();
  set values(ListBuilder<String> values) => _$this._values = values;

  CustomValueBuilder();

  CustomValueBuilder get _$this {
    if (_$v != null) {
      _value = _$v.value;
      _values = _$v.values?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CustomValue other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$CustomValue;
  }

  @override
  void update(void updates(CustomValueBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$CustomValue build() {
    _$CustomValue _$result;
    try {
      _$result =
          _$v ?? new _$CustomValue._(value: value, values: _values?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'values';
        _values?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'CustomValue', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
