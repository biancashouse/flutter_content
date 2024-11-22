import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_content/flutter_content.dart';

class PollOptionCounts {
  Map<PollOptionId, int>? optionVoteCounts;

  PollOptionCounts({
    this.optionVoteCounts,
  });

  factory PollOptionCounts.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot, SnapshotOptions? options) {
    // final data = snapshot.data();
    // var mapFieldData = data?['option-vote-counts'];
    Map<PollOptionId, int>? map = {};
    return PollOptionCounts(optionVoteCounts: map);
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (optionVoteCounts != null) "option-vote-counts": optionVoteCounts,
    };
  }
}
