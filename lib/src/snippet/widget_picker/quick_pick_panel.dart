import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'widget_entry.dart';

const String kWidgetPickerCId = 'widget-picker';

class QuickPickPanel extends StatelessWidget {
  const QuickPickPanel({
    super.key,
    required this.action,
    required this.recommended,
    required this.onTypeSelected,
    required this.onMorePressed,
    this.onSnippetSelected,
    this.hasPaste = false,
    this.onPaste,
  });

  final NodeAction action;
  final List<WidgetEntry> recommended;
  final void Function(Type type) onTypeSelected;
  final void Function(String snippetName)? onSnippetSelected;
  final VoidCallback onMorePressed;
  final bool hasPaste;
  final VoidCallback? onPaste;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            action.displayName,
            style: const TextStyle(
              color: Colors.purple,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          if (recommended.isNotEmpty) ...[
            const SizedBox(height: 12),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: [
                for (final entry in recommended.take(5))
                  ActionChip(
                    label: Text(
                      entry.label,
                      style: const TextStyle(fontSize: 13),
                    ),
                    backgroundColor: entry.category.color.withValues(alpha: .35),
                    side: BorderSide.none,
                    onPressed: () {
                      fco.dismiss(kWidgetPickerCId);
                      onTypeSelected(entry.type);
                    },
                  ),
              ],
            ),
          ],
          if (hasPaste && onPaste != null) ...[
            const SizedBox(height: 8),
            TextButton.icon(
              onPressed: () {
                fco.dismiss(kWidgetPickerCId);
                onPaste!();
              },
              icon: const Icon(Icons.paste, size: 14),
              label: const Text('paste from clipboard',
                  style: TextStyle(fontSize: 12)),
              style: TextButton.styleFrom(
                foregroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 0),
              ),
            ),
          ],
          const SizedBox(height: 8),
          const Divider(height: 1),
          const SizedBox(height: 4),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                fco.dismiss(kWidgetPickerCId);
                onMorePressed();
              },
              child: const Text('more...'),
            ),
          ),
        ],
      ),
    );
  }
}
