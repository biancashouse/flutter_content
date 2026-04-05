/// Internal enum representing the supported diagram languages.
enum DiagramType {
  /// PlantUML diagram format.
  plantuml('plantuml'),

  /// Mermaid diagram format.
  mermaid('mermaid');

  /// The Kroki API path segment for this diagram type.
  final String krokiId;

  const DiagramType(this.krokiId);
}
