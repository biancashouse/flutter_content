import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MouseInfoViewer extends HookWidget {
  const MouseInfoViewer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final overlayController = useMemoized(() => OverlayPortalController());
    final targetKey = useMemoized(() => GlobalKey());
    final globalPosition = useState(Offset.zero);
    final localPosition = useState(Offset.zero);
    final widgetSize = useState(Size.zero);

    void updateOverlay(PointerEvent details) {
      globalPosition.value = details.position;
      localPosition.value = details.localPosition;

      final RenderBox? renderBox =
          targetKey.currentContext?.findRenderObject() as RenderBox?;
      if (renderBox != null) {
        widgetSize.value = renderBox.size;
      }

      if (!overlayController.isShowing) {
        overlayController.show();
      }
    }

    void hideOverlay(PointerEvent details) {
      if (overlayController.isShowing) {
        overlayController.hide();
      }
    }

    return MouseRegion(
      onHover: updateOverlay,
      onExit: hideOverlay,
      child: OverlayPortal(
        controller: overlayController,
        overlayChildBuilder: (context) {
          final screenWidth = MediaQuery.of(context).size.width;
          final screenHeight = MediaQuery.of(context).size.height;
          final cursorX = globalPosition.value.dx;
          final cursorY = globalPosition.value.dy;
          const offset = 15.0; // Distance from cursor

          // Decide whether to show the popup on the left/right or top/bottom
          final bool showOnLeft = cursorX > screenWidth / 2;
          final bool showAbove = cursorY > screenHeight / 2;

          final scrollConfig = fco.findAncestorScrollControllerAndDirection(
            context,
          );
          final scrollOffset = scrollConfig?.controller?.offset ?? 0.0;
          final scrollDirection = scrollConfig?.direction;

          final Offset scrollAwarePosition;
          if (scrollDirection == Axis.vertical) {
            scrollAwarePosition = globalPosition.value.translate(0, scrollOffset);
          } else if (scrollDirection == Axis.horizontal) {
            scrollAwarePosition = globalPosition.value.translate(scrollOffset, 0);
          } else {
            scrollAwarePosition = globalPosition.value;
          }

          return Positioned(
            left: showOnLeft ? null : cursorX + offset,
            right: showOnLeft ? screenWidth - cursorX + offset : null,
            top: showAbove ? null : cursorY + offset,
            bottom: showAbove ? screenHeight - cursorY + offset : null,
            child: Material(
              elevation: 4.0,
              borderRadius: BorderRadius.circular(8.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Global Pos: (${globalPosition.value.dx.rounded()}, ${globalPosition.value.dy.rounded()})\n'
                  'Scroll-aware Pos: (${scrollAwarePosition.dx.rounded()}, ${scrollAwarePosition.dy.rounded()})\n'
                  'Local Pos: (${localPosition.value.dx.rounded()}, ${localPosition.value.dy.rounded()})\n'
                  'Widget Size: (${widgetSize.value.width.rounded()}x${widgetSize.value.height.rounded()})'
                  "${scrollOffset > 0 ? '\nScroll Offset: ${scrollOffset.rounded()}' : ''}"
                  "${scrollOffset > 0 ? '\nScroll Direction: $scrollDirection' : ''}",
                  style: const TextStyle(fontSize: 12),
                ),
              ),
            ),
          );
        },
        child: KeyedSubtree(key: targetKey, child: child),
      ),
    );
  }
}

// Extension to format double for cleaner display
extension on double {
  String rounded() => toStringAsFixed(0);
}
