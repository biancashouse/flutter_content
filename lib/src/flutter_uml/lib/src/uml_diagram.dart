import 'package:flutter/widgets.dart';

import 'diagram_type.dart';
import 'kroki_encoder.dart';
import 'svg_view/svg_view.dart';

/// A widget that renders a UML or Mermaid diagram using a
/// [Kroki](https://kroki.io) server.
///
/// Use the named constructors to specify the diagram language:
///
/// ```dart
/// UmlDiagram.plantuml(
///   source: '''
///     @startuml
///     Alice -> Bob : Hello
///     @enduml
///   ''',
/// )
///
/// UmlDiagram.mermaid(
///   source: '''
///     graph TD
///     A[Start] --> B[End]
///   ''',
/// )
/// ```
///
/// By default the public [https://kroki.io](https://kroki.io) endpoint is used.
/// Supply [krokiBaseUrl] to point at a self-hosted instance.
class UmlDiagram extends StatelessWidget {
  /// The raw diagram source text (PlantUML or Mermaid syntax).
  final String source;

  /// Base URL of the Kroki server, without a trailing slash.
  ///
  /// Defaults to our cloud run kroki server.
  final String krokiBaseUrl;

  /// Width of the diagram widget. Defaults to unconstrained.
  final double? width;

  /// Height of the diagram widget. Defaults to unconstrained.
  final double? height;

  /// How to inscribe the diagram into its allocated space.
  ///
  /// Defaults to [BoxFit.contain].
  final BoxFit fit;

  /// Builder shown while the diagram is loading (native platforms only).
  ///
  /// If null, a centered [CircularProgressIndicator] is shown.
  final WidgetBuilder? loadingBuilder;

  /// Builder shown if the diagram fails to load (native platforms only).
  ///
  /// If null, a generic error message is shown.
  final Widget Function(BuildContext context, Object error)? errorBuilder;

  final DiagramType _type;

  /// Creates a widget that renders a [PlantUML](https://plantuml.com) diagram.
  ///
  /// ```dart
  /// UmlDiagram.plantuml(
  ///   source: '@startuml\nAlice -> Bob : Hello\n@enduml',
  /// )
  /// ```
  const UmlDiagram.plantuml({
    super.key,
    required this.source,
    this.krokiBaseUrl = 'https://kroki-188627927914.us-central1.run.app',
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.loadingBuilder,
    this.errorBuilder,
  }) : _type = DiagramType.plantuml;

  /// Creates a widget that renders a [Mermaid](https://mermaid.js.org) diagram.
  ///
  /// ```dart
  /// UmlDiagram.mermaid(
  ///   source: 'graph TD\nA[Start] --> B[End]',
  /// )
  /// ```
  const UmlDiagram.mermaid({
    super.key,
    required this.source,
    this.krokiBaseUrl = 'https://kroki-188627927914.us-central1.run.app',
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.loadingBuilder,
    this.errorBuilder,
  }) : _type = DiagramType.mermaid;

  @override
  Widget build(BuildContext context) {
    if (source.trim().isEmpty) {
      return const SizedBox.shrink();
    }

    final url = KrokiEncoder.buildSvgUrl(krokiBaseUrl, _type, source);

    return SvgView(
      key: ValueKey(url),
      url: url,
      width: width,
      height: height,
      fit: fit,
      loadingBuilder: loadingBuilder,
      errorBuilder: errorBuilder,
    );
  }
}
