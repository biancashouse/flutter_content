import 'package:freezed_annotation/freezed_annotation.dart';


abstract class Node extends Object {
  @JsonKey(includeFromJson: false, includeToJson: false)
  Node? _parent;

  Node? getParent() => _parent;

  void setParent(Node? parentNode) => _parent = parentNode;

  // CAPIBloC get capiBlocBloc => fco.capiBloc;

  Node();
}

