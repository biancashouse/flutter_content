import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_uml/src/diagram_type.dart';
import 'package:flutter_uml/src/kroki_encoder.dart';

void main() {
  group('KrokiEncoder', () {
    test('encode produces non-empty base64url string', () {
      final result = KrokiEncoder.encode('@startuml\nA -> B\n@enduml');
      expect(result, isNotEmpty);
      // base64url characters only (no + or /)
      expect(result, matches(RegExp(r'^[A-Za-z0-9\-_=]+$')));
    });

    test('encode is deterministic', () {
      const source = 'graph TD\nA-->B';
      expect(KrokiEncoder.encode(source), equals(KrokiEncoder.encode(source)));
    });

    test('buildSvgUrl returns empty string for empty source', () {
      final url = KrokiEncoder.buildSvgUrl(
        'https://kroki.io',
        DiagramType.plantuml,
        '',
      );
      expect(url, isEmpty);
    });

    test('buildSvgUrl includes type and base URL', () {
      final url = KrokiEncoder.buildSvgUrl(
        'https://kroki.io',
        DiagramType.plantuml,
        '@startuml\nA -> B\n@enduml',
      );
      expect(url, startsWith('https://kroki.io/plantuml/svg/'));
    });

    test('buildSvgUrl uses correct Kroki id for mermaid', () {
      final url = KrokiEncoder.buildSvgUrl(
        'https://kroki.io',
        DiagramType.mermaid,
        'graph TD\nA-->B',
      );
      expect(url, startsWith('https://kroki.io/mermaid/svg/'));
    });

    test('buildSvgUrl respects custom base URL', () {
      final url = KrokiEncoder.buildSvgUrl(
        'https://my-kroki.example.com',
        DiagramType.plantuml,
        '@startuml\nA -> B\n@enduml',
      );
      expect(url, startsWith('https://my-kroki.example.com/plantuml/svg/'));
    });
  });
}
