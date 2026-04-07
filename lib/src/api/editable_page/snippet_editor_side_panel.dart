import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/api/editable_page/snippet_properties_tree_view.dart';
import 'package:flutter_content/src/api/editable_page/snippet_tree_view.dart';
import 'package:flutter_content/src/snippet/snodes/hotspots/widgets/hotspot_target_config_toolbar/hotspot_target_config_toolbar.dart';

const double kSidePanelWidth = 420.0;

/// Self-contained side panel shown over the live page during snippet editing.
/// The page content remains fully visible behind the panel.
class SnippetEditorSidePanel extends StatelessWidget {
  const SnippetEditorSidePanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: SizedBox(
        width: kSidePanelWidth,
        height: double.infinity,
        child: Material(
          elevation: 8,
          child: Column(
            children: [
              _PanelHeader(),
              const Expanded(child: _PanelBody()),
            ],
          ),
        ),
      ),
    );
  }
}

class _PanelHeader extends StatelessWidget {
  const _PanelHeader();

  @override
  Widget build(BuildContext context) {
    final snippetName =
        fco.snippetBeingEdited?.getRootNode().name ?? '?';
    final snippetInfo = fco.appInfo.cachedSnippetInfo(snippetName);

    return Container(
      color: Colors.purple,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      height: 48,
      child: Row(
        children: [
          Expanded(
            child: fco.coloredText(snippetName, color: Colors.white, fontSize: 13),
          ),
          _UndoRedoButtons(),
          IconButton(
            icon: const Icon(Icons.close, color: Colors.white),
            onPressed: () => _close(snippetName, snippetInfo),
          ),
        ],
      ),
    );
  }

  void _close(String snippetName, SnippetInfoModel? snippetInfo) {
    if (SnippetRootNode.isHotspotCalloutContent(snippetName)) {
      fco.dismissAll();
    } else {
      fco.dismiss('selected-node');
      fco.unhide(HotspotTargetConfigToolbar.CID);
      fco.appInfo.hideClipboard();
    }
    fco.dismissAll();
    fco.capiBloc.add(const CAPIEvent.popSnippetEditor());
    final rootNode = snippetInfo?.currentVersionInCache();
    if (rootNode != null) {
      snippetInfo!.getChangeNotifier().value = rootNode.toJson();
    }
  }
}

class _UndoRedoButtons extends StatelessWidget {
  const _UndoRedoButtons();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CAPIBloC, CAPIState>(
      buildWhen: (prev, curr) => prev.force != curr.force,
      builder: (context, state) {
        final undoRedo = state.snippetBeingEdited?.undoRedo;
        final canUndo = undoRedo?.canUndo ?? false;
        final canRedo = undoRedo?.canRedo ?? false;
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              tooltip: 'Undo (${undoRedo?.undoCount ?? 0})',
              icon: const Icon(Icons.undo, size: 24),
              color: Colors.white,
              disabledColor: Colors.white24,
              onPressed: canUndo
                  ? () => fco.capiBloc.add(const CAPIEvent.undo())
                  : null,
            ),
            IconButton(
              tooltip: 'Redo (${undoRedo?.redoCount ?? 0})',
              icon: const Icon(Icons.redo, size: 24),
              color: Colors.white,
              disabledColor: Colors.white24,
              onPressed: canRedo
                  ? () => fco.capiBloc.add(const CAPIEvent.redo())
                  : null,
            ),
          ],
        );
      },
    );
  }
}

class _PanelBody extends StatelessWidget {
  const _PanelBody();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CAPIBloC, CAPIState>(
      buildWhen: (prev, curr) =>
          prev.snippetBeingEdited?.selectedNode !=
          curr.snippetBeingEdited?.selectedNode,
      builder: (context, state) {
        final selectedNode = state.snippetBeingEdited?.selectedNode;
        final pTreeC = selectedNode?.pTreeC(context, {});

        return Column(
          children: [
            Expanded(
              child: _TreeArea(),
            ),
            if (pTreeC != null) ...[
              const Divider(height: 1, thickness: 1, color: Colors.purple),
              Expanded(
                child: _PropertiesArea(
                  selectedNode: selectedNode!,
                  pTreeC: pTreeC,
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}

class _TreeArea extends StatefulWidget {
  const _TreeArea();

  @override
  State<_TreeArea> createState() => _TreeAreaState();
}

class _TreeAreaState extends State<_TreeArea> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Scroll to the already-selected node when the panel first opens.
    // BlocListener only fires on changes, so we handle the initial state here.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final node = fco.capiBloc.state.snippetBeingEdited?.selectedNode;
      if (node != null) _scrollToSelectedNode(node);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSelectedNode(SNode node) {
    final ctx = node.nodeGK?.currentContext;
    if (ctx == null) return;
    Scrollable.ensureVisible(
      ctx,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      alignment: 0.5,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CAPIBloC, CAPIState>(
      listenWhen: (prev, curr) =>
          curr.snippetBeingEdited?.selectedNode != null &&
          prev.snippetBeingEdited?.selectedNode !=
              curr.snippetBeingEdited?.selectedNode,
      listener: (_, state) =>
          _scrollToSelectedNode(state.snippetBeingEdited!.selectedNode!),
      child: GestureDetector(
        onTap: () {
          fco.dismissAll();
          fco.capiBloc.add(CAPIEvent.clearNodeSelection());
          fco.hide('floating-clipboard');
        },
        child: Material(
          color: Colors.purple.shade200,
          child: SingleChildScrollView(
            controller: _scrollController,
            padding: const EdgeInsets.all(8),
            child: const SnippetTreeView(shrinkWrap: true),
          ),
        ),
      ),
    );
  }
}

class _PropertiesArea extends StatelessWidget {
  final SNode selectedNode;
  final PNodeTreeController pTreeC;

  const _PropertiesArea({
    required this.selectedNode,
    required this.pTreeC,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        automaticallyImplyLeading: false,
        title: fco.coloredText('Properties', color: Colors.white),
      ),
      body: Material(
        color: Colors.blue[50],
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: InteractiveViewer(
            transformationController: fco.propertiesTreeTC,
            alignment: Alignment.topLeft,
            constrained: false,
            child: SizedBox(
              width: kSidePanelWidth - 20,
              height: 1000,
              child: PropertiesTreeView(
                treeC: pTreeC,
                sNode: selectedNode,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
