import 'package:flutter/material.dart';

extension AlignmentExtension on Alignment {
  Alignment get oppositeAlignment => switch (this) {
    Alignment.topLeft => Alignment.bottomRight,
    Alignment.topCenter => Alignment.bottomCenter,
    Alignment.topRight => Alignment.bottomLeft,
    Alignment.centerLeft => Alignment.centerRight,
    Alignment.center => Alignment.center,
    Alignment.centerRight => Alignment.centerLeft,
    Alignment.bottomLeft => Alignment.topRight,
    Alignment.bottomCenter => Alignment.topCenter,
    Alignment.bottomRight => Alignment.topLeft,
    // TODO: Handle this case.
    Alignment() => Alignment.center,
  };
}
