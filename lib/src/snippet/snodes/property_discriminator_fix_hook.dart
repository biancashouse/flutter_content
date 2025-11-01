import 'package:dart_mappable/dart_mappable.dart';

// 1. Define the custom MapHook
class PropertyDiscriminatorFixHook extends MappingHook {

  const PropertyDiscriminatorFixHook();

  // This method runs BEFORE the decoding process begins.
  @override
  Object? beforeDecode(Object? value) {
    if (value is Map) {
      Map<dynamic, dynamic> map = value;
      // ExpandedNode was derived from SC, but now derived from FlexibleNode
      if (map.containsKey(map.containsKey('sc') && map['sc'] == 'ExpandedNode')) {
        map['sc'] = 'FlexibleNode';
        map['flexible'] = 'ExpandedNode';
        return map;
      }
    }
    return value;
  }

}