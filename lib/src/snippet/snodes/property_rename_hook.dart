import 'package:dart_mappable/dart_mappable.dart';

// 1. Define the custom MapHook
class PropertyRenameHook extends MappingHook {
  final String oldName;
  final String newName;

  const PropertyRenameHook(this.oldName, this.newName);

  // This method runs BEFORE the decoding process begins.
  @override
  Object? beforeDecode(Object? value) {
    if (value is! Map<String, dynamic>) {
      return value;
    }

    // First, handle the simple top-level property rename.
    // This is much cleaner and safer than the previous implementation.
    final map = Map<String, dynamic>.from(value);
    if (map.containsKey(oldName)) {
      map[newName] = map.remove(oldName);
      // After renaming, we can attempt to decode with the updated structure.
      // Or if this hook is only for migration, we can just return the modified map.
    }

    // Now, handle the deep nested migration for 'ExpandedNode'.
    // We create a recursive function to walk the map.
    _migrateExpandedNode(map);

    // Return the potentially modified map for dart_mappable to process.
    return map;
  }

  /// Recursively traverses a map structure to find and migrate 'ExpandedNode'.
  void _migrateExpandedNode(Map<String, dynamic> data) {
    // Base Case: Check if the current map is the one we need to migrate.
    if (data['sc'] == 'ExpandedNode') {
      // print('Found and migrating ExpandedNode...');
      // 1. Remove the old key-value pair.
      data.remove('sc');
      // 2. Add the two new key-value pairs.
      data['sc'] = 'FlexibleNode'; // The new base type
      data['flexible'] = 'ExpandedNode'; // The new property value

      // dart_mappable is smart enough to handle the discriminator key automatically
      // when it sees the new 'sc' and 'flexible' fields. No need to manipulate __type.
      return; // Stop recursion for this branch
    } else if (data['DK:sc'] == 'ExpandedNode') {
      // print('Found and migrating ExpandedNode...');
      // 1. Remove the old key-value pair.
      data.remove('DK:sc');
      // 2. Add the two new key-value pairs.
      data['DK:sc'] = 'FlexibleNode'; // The new base type
      data['DK:flexible'] = 'ExpandedNode'; // The new property value

      // dart_mappable is smart enough to handle the discriminator key automatically
      // when it sees the new 'sc' and 'flexible' fields. No need to manipulate __type.
      return; // Stop recursion for this branch
    }

    // Recursive Step: Iterate through all values in the map.
    for (var key in data.keys) {
      final value = data[key];
      if (value is Map<String, dynamic>) {
        // If the value is another map, recurse into it.
        _migrateExpandedNode(value);
      } else if (value is List) {
        // If the value is a list, iterate and recurse into any maps within it.
        for (var item in value) {
          if (item is Map<String, dynamic>) {
            _migrateExpandedNode(item);
          }
        }
      }
    }
  }
}
