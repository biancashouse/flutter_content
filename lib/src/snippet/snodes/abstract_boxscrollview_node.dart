import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/snodes/abstract_scrollview_node.dart';

import '../pnodes/fyi_pnodes.dart';

part 'abstract_boxscrollview_node.mapper.dart';

@MappableClass(discriminatorKey: 'DK:boxscrollview', includeSubClasses: [ListViewNode, GridViewNode])
abstract class BoxScrollViewNode extends ScrollViewNode with BoxScrollViewNodeMappable {
  EdgeInsetsValue? padding;

  BoxScrollViewNode({
    super.scrolDirection,
    super.shrinkWrap,
    this.padding,
  });


}
