// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';

part 'enum_target_btn_icon.mapper.dart';

@MappableEnum()
enum TargetButtonIconEnum {
  question(Icons.question_mark),
  pin(Icons.pin),
  phone(Icons.phone),
  contact(Icons.contact_mail);

  const TargetButtonIconEnum(this.flutterValue);

  final IconData flutterValue;
}
