import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/model/alignment_model.dart';
import 'package:flutter_content/src/model/size_model.dart';

// 1. Define the custom MapHook
class TargetModelHook extends MappingHook {
  const TargetModelHook();

  // This method runs BEFORE the decoding process begins.
  @override
  Object? beforeDecode(Object? value) {
    if (value is! Map<String, dynamic>) {
      return value;
    }

    // First, handle the simple top-level property rename.
    // This is much cleaner and safer than the previous implementation.
    final map = Map<String, dynamic>.from(value);
    if (!map.containsKey('targetCLocalPc') &&
        map.containsKey('targetLocalPosLeftPc')) {
      map['targetCLocalPc'] = OffsetModel(
        map['targetLocalPosLeftPc'] ?? 0.0,
        map['targetLocalPosTopPc'] ?? 0.0,
      ).toMap();
    }
    if (!map.containsKey('btnCLocalPosPc') &&
        map.containsKey('btnLocalTopPc')) {
      map['btnCLocalPosPc'] = OffsetModel(
        map['btnLocalLeftPc'] ?? 0.0,
        map['btnLocalTopPc'] ?? 0.0,
      ).toMap();
    }

    if (!map.containsKey('calloutAlignment') &&
        map.containsKey('targetAlignmentX')) {
      map['calloutAlignment'] = AlignmentModel(
        map['targetAlignmentX'] ?? 1.5,
        map['targetAlignmentY'] ?? 0.0,
      ).toMap();
    }

    if (!map.containsKey('calloutSize') && map.containsKey('calloutWidth')) {
      map['calloutSize'] = SizeModel(
        map['calloutWidth'] ?? 200.0,
        map['calloutHeight'] ?? 80.0,
      ).toMap();
    }

    if (map.containsKey('calloutAlignment')) {
      map['tcAlignment'] = map['calloutAlignment'];
    }
    if (map.containsKey('separation')) {
      map['tcSeparation'] = map['separation'];
    }

    // Return the potentially modified map for dart_mappable to process.
    return map;
  }
}

// old naming
// double? targetLocalPosLeftPc;
// double? targetLocalPosTopPc;

// double? btnLocalTopPc;
// double? btnLocalLeftPc;

// double? targetAlignmentX;
// double? targetAlignmentY;

// double calloutWidth;
// double calloutHeight;
