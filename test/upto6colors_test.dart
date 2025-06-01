import 'package:flutter_callouts/flutter_callouts.dart' show ColorModel;
import 'package:flutter_content/src/snippet/snodes/upto6colors.dart'
    show UpTo6Colors;
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UpTo6Colors Tests', () {
    // Define some common Color instances for tests
    final cRed = ColorModel.red();
    final cGreen = ColorModel.green();
    final cBlue = ColorModel.blue();
    final cYellow = ColorModel.yellow();
    final cOrange = ColorModel.orange();
    final cPurple = ColorModel.purple();
    final cBlack = ColorModel.black();

    // --- Constructor and Properties Tests ---
    group('Constructor and Properties', () {
      test('Default constructor should initialize all colors to null', () {
        final model = UpTo6Colors();
        expect(model.color1, isNull);
        expect(model.color2, isNull);
        expect(model.color3, isNull);
        expect(model.color4, isNull);
        expect(model.color5, isNull);
        expect(model.color6, isNull);
      });

      test('Constructor should correctly initialize provided colors', () {
        final model = UpTo6Colors(
          color1: cRed,
          color3: cBlue,
          color5: cOrange,
        );
        expect(model.color1, cRed);
        expect(model.color2, isNull);
        expect(model.color3, cBlue);
        expect(model.color4, isNull);
        expect(model.color5, cOrange);
        expect(model.color6, isNull);
      });

      test('Constructor with all colors provided', () {
        final model = UpTo6Colors(
          color1: cRed,
          color2: cGreen,
          color3: cBlue,
          color4: cYellow,
          color5: cOrange,
          color6: cPurple,
        );
        expect(model.color1, cRed);
        expect(model.color2, cGreen);
        expect(model.color3, cBlue);
        expect(model.color4, cYellow);
        expect(model.color5, cOrange);
        expect(model.color6, cPurple);
      });
    });

    // --- Equality (operator ==) and HashCode Tests ---
    group('Equality and HashCode', () {
      final fullModel1 = UpTo6Colors(
          color1: cRed,
          color2: cGreen,
          color3: cBlue,
          color4: cYellow,
          color5: cOrange,
          color6: cPurple);
      final fullModel1Again = UpTo6Colors(
          color1: cRed,
          color2: cGreen,
          color3: cBlue,
          color4: cYellow,
          color5: cOrange,
          color6: cPurple);
      final partialModel1 = UpTo6Colors(color1: cRed, color3: cBlue);
      final partialModel1Again = UpTo6Colors(color1: cRed, color3: cBlue);
      final defaultModel1 = UpTo6Colors();
      final defaultModel2 = UpTo6Colors();

      test('Instances with identical color properties should be equal', () {
        expect(fullModel1 == fullModel1Again, isTrue);
        expect(partialModel1 == partialModel1Again, isTrue);
        expect(defaultModel1 == defaultModel2, isTrue);
      });

      test('Instances with different color properties should not be equal', () {
        final diffModel = UpTo6Colors(
            color1: cRed,
            color2: cGreen,
            color3: cBlue,
            color4: cYellow,
            color5: cOrange,
            color6: cBlack); // c6 different
        expect(fullModel1 == diffModel, isFalse);

        final diffPartial =
            UpTo6Colors(color1: cRed, color3: cGreen); // c3 different
        expect(partialModel1 == diffPartial, isFalse);
      });

      test(
          'Instances with different null/non-null patterns should not be equal',
          () {
        final modelA = UpTo6Colors(color1: cRed);
        final modelB = UpTo6Colors(color1: cRed, color2: cGreen);
        expect(modelA == modelB, isFalse);

        final modelC = UpTo6Colors(color1: cRed, color2: null);
        expect(
            modelA == modelC, isTrue); // Assuming color2: null is the default
      });

      test('An instance should be equal to itself', () {
        expect(fullModel1 == fullModel1, isTrue);
        expect(partialModel1 == partialModel1, isTrue);
      });

      test('Should not be equal to an instance of a different type', () {
        expect(fullModel1 == "A String", isFalse);
      });

      test('Equal instances should have the same hashCode', () {
        expect(fullModel1.hashCode, equals(fullModel1Again.hashCode));
        expect(partialModel1.hashCode, equals(partialModel1Again.hashCode));
        expect(defaultModel1.hashCode, equals(defaultModel2.hashCode));
      });

      test('HashCode consistency', () {
        expect(fullModel1.hashCode, equals(fullModel1.hashCode));
      });
    });
  });
}
