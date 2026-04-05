# flutter_uml

A Flutter widget for rendering **PlantUML** and **Mermaid** diagrams using a
[Kroki](https://kroki.io) server.

## Features
revert
- `UmlDiagram.plantuml` — renders any PlantUML diagram.
- `UmlDiagram.mermaid` — renders any Mermaid diagram.
- Works on **web**, **iOS**, **Android**, and **desktop**.
- Platform-optimised rendering:
  - **Web**: native browser `<img>` element (correctly renders Mermaid CSS styles).
  - **Native**: `SvgPicture.network` from `flutter_svg`.
- Configurable Kroki server via `krokiBaseUrl`.

## Getting started

Add the package to your `pubspec.yaml`:

```yaml
dependencies:
  flutter_uml: ^0.1.0
```

## Usage

```dart
import 'package:flutter_uml/flutter_uml.dart';

// PlantUML
UmlDiagram.plantuml(
  source: '''
    @startuml
    Alice -> Bob : Hello
    Bob --> Alice : Hi!
    @enduml
  ''',
)

// Mermaid
UmlDiagram.mermaid(
  source: '''
    graph TD
    A[Start] --> B{OK?}
    B -- Yes --> C([Done])
    B -- No  --> D[Fix] --> B
  ''',
)
```

### Custom Kroki server

```dart
UmlDiagram.plantuml(
  source: '@startuml\nA -> B\n@enduml',
  krokiBaseUrl: 'https://my-kroki.example.com',
)
```

### Sizing and fit

```dart
UmlDiagram.mermaid(
  source: 'graph LR\nA-->B',
  width: 400,
  height: 300,
  fit: BoxFit.contain,
)
```

### Loading and error builders (native only)

```dart
UmlDiagram.plantuml(
  source: source,
  loadingBuilder: (context) => const CircularProgressIndicator(),
  errorBuilder: (context, error) => Text('Failed: $error'),
)
```

## How it works

The diagram source is UTF-8 encoded, zlib-deflated, and base64url-encoded to
produce the Kroki URL path segment, following the
[Kroki encoding specification](https://docs.kroki.io/kroki/setup/encode-diagram/).

## Additional information

- [Kroki documentation](https://docs.kroki.io)
- [PlantUML language reference](https://plantuml.com)
- [Mermaid language reference](https://mermaid.js.org)
