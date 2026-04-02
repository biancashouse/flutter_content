import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'quick_pick_panel.dart' show kWidgetPickerCId;
import 'widget_entry.dart';

// Sealed union for list items: either a section header or a selectable entry.
sealed class _Item {}

class _Header extends _Item {
  _Header(this.label, this.color);
  final String label;
  final Color color;
}

class _EntryItem extends _Item {
  _EntryItem(this.entry);
  final WidgetEntry entry;
}

class _SnippetItem extends _Item {
  _SnippetItem(this.name);
  final String name;
}

/// Content widget for the full searchable widget picker overlay.
/// Shown via [fco.showOverlay] — no Dialog wrapper needed.
class WidgetPickerDialog extends StatefulWidget {
  const WidgetPickerDialog({
    super.key,
    required this.action,
    required this.candidates,
    required this.onTypeSelected,
    this.onSnippetSelected,
    this.snippetNames = const [],
    this.hasPaste = false,
    this.onPaste,
  });

  final NodeAction action;
  final List<WidgetEntry> candidates;
  final void Function(Type type) onTypeSelected;
  final void Function(String snippetName)? onSnippetSelected;
  final List<String> snippetNames;
  final bool hasPaste;
  final VoidCallback? onPaste;

  @override
  State<WidgetPickerDialog> createState() => _WidgetPickerDialogState();
}

class _WidgetPickerDialogState extends State<WidgetPickerDialog> {
  final _controller = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<_Item> _buildItems() {
    final items = <_Item>[];

    if (_query.isEmpty) {
      final byCategory = <WidgetCategory, List<WidgetEntry>>{};
      for (final e in widget.candidates) {
        byCategory.putIfAbsent(e.category, () => []).add(e);
      }
      for (final cat in WidgetCategory.values) {
        final entries = byCategory[cat];
        if (entries == null || entries.isEmpty) continue;
        items.add(_Header(cat.displayName, cat.color));
        for (final e in entries) {
          items.add(_EntryItem(e));
        }
      }
      if (widget.snippetNames.isNotEmpty && widget.onSnippetSelected != null) {
        items.add(_Header('Snippets', WidgetCategory.snippet.color));
        for (final name in widget.snippetNames) {
          items.add(_SnippetItem(name));
        }
      }
    } else {
      final q = _query.toLowerCase();
      final matched =
          widget.candidates.where((e) => e.matches(_query)).toList();
      matched.sort((a, b) {
        final aStarts = a.label.toLowerCase().startsWith(q) ? 0 : 1;
        final bStarts = b.label.toLowerCase().startsWith(q) ? 0 : 1;
        if (aStarts != bStarts) return aStarts - bStarts;
        return a.label.compareTo(b.label);
      });
      for (final e in matched) {
        items.add(_EntryItem(e));
      }
      if (widget.onSnippetSelected != null) {
        final matchedSnippets = widget.snippetNames
            .where((s) => s.toLowerCase().contains(q))
            .toList();
        for (final name in matchedSnippets) {
          items.add(_SnippetItem(name));
        }
      }
    }

    return items;
  }

  void _selectType(Type type) {
    fco.dismiss(kWidgetPickerCId);
    widget.onTypeSelected(type);
  }

  void _selectSnippet(String name) {
    fco.dismiss(kWidgetPickerCId);
    widget.onSnippetSelected?.call(name);
  }

  @override
  Widget build(BuildContext context) {
    final items = _buildItems();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Title bar.
        Container(
          padding: const EdgeInsets.fromLTRB(16, 14, 8, 8),
          child: Row(
            children: [
              Text(
                widget.action.displayName,
                style: const TextStyle(
                  color: Colors.purple,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              const Spacer(),
              if (widget.hasPaste && widget.onPaste != null)
                TextButton.icon(
                  onPressed: () {
                    fco.dismiss(kWidgetPickerCId);
                    widget.onPaste!();
                  },
                  icon: const Icon(Icons.paste, size: 14),
                  label:
                      const Text('paste', style: TextStyle(fontSize: 12)),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                  ),
                ),
              IconButton(
                icon: const Icon(Icons.close, size: 18),
                onPressed: () => fco.dismiss(kWidgetPickerCId),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ],
          ),
        ),
        // Search field.
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 0, 12, 8),
          child: TextField(
            controller: _controller,
            autofocus: true,
            decoration: const InputDecoration(
              hintText: 'Search widgets...',
              prefixIcon: Icon(Icons.search, size: 18),
              isDense: true,
              contentPadding: EdgeInsets.symmetric(vertical: 8),
              border: OutlineInputBorder(),
            ),
            onChanged: (v) => setState(() => _query = v),
          ),
        ),
        const Divider(height: 1),
        // Results list.
        Expanded(
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              if (item is _Header) {
                return Container(
                  padding: const EdgeInsets.fromLTRB(12, 8, 12, 4),
                  color: item.color.withValues(alpha: .18),
                  child: Text(
                    item.label,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade700,
                      letterSpacing: 0.8,
                    ),
                  ),
                );
              }
              if (item is _EntryItem) {
                final e = item.entry;
                return ListTile(
                  dense: true,
                  title: Text(e.label),
                  trailing: _query.isNotEmpty ? _CategoryBadge(e.category) : null,
                  onTap: () => _selectType(e.type),
                );
              }
              if (item is _SnippetItem) {
                return ListTile(
                  dense: true,
                  leading: const Icon(Icons.widgets_outlined, size: 16),
                  title: Text(item.name),
                  onTap: () => _selectSnippet(item.name),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ],
    );
  }
}

class _CategoryBadge extends StatelessWidget {
  const _CategoryBadge(this.category);
  final WidgetCategory category;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: category.color.withValues(alpha: .35),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        category.displayName,
        style: const TextStyle(fontSize: 10),
      ),
    );
  }
}
