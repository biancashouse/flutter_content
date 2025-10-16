import 'package:flutter_content/flutter_content.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'fancy_tree/tree_controller.dart';

abstract class Node extends Object {
  @JsonKey(includeFromJson: false, includeToJson: false)
  Node? _parent;

  Node? getParent() => _parent;

  void setParent(Node? parentNode) => _parent = parentNode;

  // CAPIBloC get capiBlocBloc => fco.capiBloc;

  Node();
}

