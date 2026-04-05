import 'package:flutter/material.dart';
import 'package:flutter_uml/flutter_uml.dart';

void main() => runApp(const ExampleApp());

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter_uml example',
      theme: ThemeData(colorSchemeSeed: Colors.indigo, useMaterial3: true),
      home: const ExampleScreen(),
    );
  }
}

class ExampleScreen extends StatefulWidget {
  const ExampleScreen({super.key});

  @override
  State<ExampleScreen> createState() => _ExampleScreenState();
}

class _ExampleScreenState extends State<ExampleScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabs;

  @override
  void initState() {
    super.initState();
    _tabs = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabs.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('flutter_uml'),
        bottom: TabBar(
          controller: _tabs,
          tabs: const [Tab(text: 'PlantUML'), Tab(text: 'Mermaid')],
        ),
      ),
      body: TabBarView(
        controller: _tabs,
        children: const [_PlantUmlTab(), _MermaidTab()],
      ),
    );
  }
}

// ── PlantUML scenario ─────────────────────────────────────────────────────────

const _plantUmlSource = '''
@startuml
skinparam classAttributeIconSize 0

package "E-commerce" {
  class Order {
    +id: String
    +createdAt: DateTime
    +status: OrderStatus
    +total(): Money
  }

  class Customer {
    +id: String
    +name: String
    +email: String
    +placeOrder(items): Order
  }

  class Product {
    +id: String
    +name: String
    +price: Money
    +stock: int
  }

  class OrderItem {
    +quantity: int
    +unitPrice: Money
    +subtotal(): Money
  }

  enum OrderStatus {
    PENDING
    CONFIRMED
    SHIPPED
    DELIVERED
  }
}

Customer "1" --> "0..*" Order : places
Order "1" *-- "1..*" OrderItem : contains
OrderItem "0..*" --> "1" Product : references
Order --> OrderStatus : has
@enduml
''';

class _PlantUmlTab extends StatelessWidget {
  const _PlantUmlTab();

  @override
  Widget build(BuildContext context) {
    return _DiagramScenario(
      title: 'Class diagram',
      description:
          'A PlantUML class diagram for a simple e-commerce domain model.',
      source: _plantUmlSource,
      diagram: UmlDiagram.plantuml(
        source: _plantUmlSource,
        loadingBuilder: (_) => const Center(child: CircularProgressIndicator()),
        errorBuilder: (_, err) =>
            Center(child: Text('Error: $err', style: const TextStyle(color: Colors.red))),
      ),
    );
  }
}

// ── Mermaid scenario ──────────────────────────────────────────────────────────

const _mermaidSource = '''
sequenceDiagram
  actor User
  participant App
  participant AuthService
  participant Database

  User->>App: Login(email, password)
  App->>AuthService: authenticate(credentials)
  AuthService->>Database: findUser(email)
  Database-->>AuthService: User record
  AuthService->>AuthService: verifyPassword(hash)
  alt valid credentials
    AuthService-->>App: JWT token
    App-->>User: Dashboard
  else invalid credentials
    AuthService-->>App: 401 Unauthorized
    App-->>User: Error message
  end
''';

class _MermaidTab extends StatelessWidget {
  const _MermaidTab();

  @override
  Widget build(BuildContext context) {
    return _DiagramScenario(
      title: 'Sequence diagram',
      description: 'A Mermaid sequence diagram showing a login flow.',
      source: _mermaidSource,
      diagram: UmlDiagram.mermaid(
        source: _mermaidSource,
        loadingBuilder: (_) => const Center(child: CircularProgressIndicator()),
        errorBuilder: (_, err) =>
            Center(child: Text('Error: $err', style: const TextStyle(color: Colors.red))),
      ),
    );
  }
}

// ── Shared layout ─────────────────────────────────────────────────────────────

class _DiagramScenario extends StatefulWidget {
  final String title;
  final String description;
  final String source;
  final Widget diagram;

  const _DiagramScenario({
    required this.title,
    required this.description,
    required this.source,
    required this.diagram,
  });

  @override
  State<_DiagramScenario> createState() => _DiagramScenarioState();
}

class _DiagramScenarioState extends State<_DiagramScenario> {
  bool _showSource = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.title, style: theme.textTheme.titleMedium),
                    const SizedBox(height: 2),
                    Text(
                      widget.description,
                      style: theme.textTheme.bodySmall
                          ?.copyWith(color: theme.colorScheme.outline),
                    ),
                  ],
                ),
              ),
              TextButton.icon(
                onPressed: () => setState(() => _showSource = !_showSource),
                icon: Icon(_showSource ? Icons.visibility_off : Icons.code),
                label: Text(_showSource ? 'Hide source' : 'View source'),
              ),
            ],
          ),
        ),
        if (_showSource)
          Expanded(
            child: _SourcePanel(source: widget.source),
          )
        else
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: widget.diagram,
            ),
          ),
      ],
    );
  }
}

class _SourcePanel extends StatelessWidget {
  final String source;

  const _SourcePanel({required this.source});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(8),
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Text(
          source.trim(),
          style: theme.textTheme.bodySmall?.copyWith(
            fontFamily: 'monospace',
            color: theme.colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}
