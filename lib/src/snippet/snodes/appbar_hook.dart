// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter_content/flutter_content.dart';


class AppBarHook extends MappingHook {
  const AppBarHook();

  @override
  Object? beforeDecode(Object? value) {
    if (value is Map && value.containsKey('snode')) {
      return NamedPS(
        propertyName: 'appBar',
        child: AppBarNode(
          title: NamedSC(propertyName: 'title'),
          titleTextStyle: TextStyleProperties(),
          actions: NamedMC(propertyName: 'actions', children: []),
          leading: NamedSC(propertyName: 'leading'),
          bottom: NamedPS(propertyName: 'bottom')
        ),
      );
    }
    return value;
  }
}
