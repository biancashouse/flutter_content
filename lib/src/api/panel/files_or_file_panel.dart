// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/bloc/capi_state.dart';
import 'package:flutter_content/src/target_config/content/snippet_editor/node_properties/iframe.dart';

class C_FilesPanel extends StatefulWidget {
  final SnippetName sName;
  final double width;
  final double height;
  final ScrollController? ancestorHScrollController;
  final ScrollController? ancestorVScrollController;

  C_FilesPanel({
    required this.sName,
    required this.width,
    required this.height,
    this.ancestorHScrollController,
    this.ancestorVScrollController,
  });

  @override
  State<C_FilesPanel> createState() => FilesPanelState();
}

class FilesPanelState extends State<C_FilesPanel> {
  @override
  void initState() {
    super.initState();
  }

  // @override
  // void didChangeDependencies() {
  //   Useful.instance.initWithContext(context, force: true);
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    SnippetBloC snippetBloc = context.read<SnippetBloC>();
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 1, color: Colors.purpleAccent, style: BorderStyle.solid),
      ),
      child: BlocBuilder<CAPIBloC, CAPIState>(builder: (context, state) {
        STreeNode? selectedFileOrDirectory = FC().selectedNode;
        if (selectedFileOrDirectory == null) {
          return Placeholder();
        }
        if (selectedFileOrDirectory is DirectoryNode) {
          return SizedBox(width: widget.width, height: widget.height, child: selectedFileOrDirectory.immediateChildrenOnly(snippetBloc, context));
        }
        if (selectedFileOrDirectory is FileNode) {
          return SizedBox(
            width: 800,
            height: 800,
            child: IFrame(
              // name: selectedFileOrDirectory.name,
              src: selectedFileOrDirectory.src,
              iframeW: 800,
              iframeH: 800,
              forceRefresh: true,
            ),
          );
        }
        return const Icon(Icons.warning, color: Colors.red);
      }),
    );
  }
}
