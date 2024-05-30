import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';

part 'file_node.mapper.dart';

Widget driveFileIcon(String src) {
  if (src.contains('https://docs.google.com/document/')) {
    return Image.asset(googleDocsIconSrc, height: 24);
  }
  if (src.contains('https://docs.google.com/spreadsheets/')) {
    return Image.asset(googleSheetsIconSrc, height: 24);
  }
  if (src.contains('https://docs.google.com/presentation/')) {
    return Image.asset(googleSlidesIconSrc, height: 24);
  }
  if (src.contains('https://docs.google.com/forms/')) {
    return Image.asset(googleSlidesIconSrc, height: 24);
  }
  return const Icon(Icons.question_mark, color: Colors.red);
}

get googleDocsIconSrc =>
    Useful.asset('lib/assets/images/google-icons/docs.png');

get googleSheetsIconSrc =>
    Useful.asset('lib/assets/images/google-icons/sheets.png');

get googleSlidesIconSrc =>
    Useful.asset('lib/assets/images/google-icons/slides.png');

get googleFormsIconSrc =>
    Useful.asset('lib/assets/images/google-icons/forms.png');

@MappableClass()
class FileNode extends CL with FileNodeMappable {
  String name;
  String src;

  // Color? color;
  // Animation<double>? opacity;
  // BlendMode? colorBlendMode;

  FileNode({
    required this.name,
    required this.src,
  });

  @override
  List<PTreeNode> properties(BuildContext context) => [
        StringPropertyValueNode(
          snode: this,
          name: 'name',
          stringValue: name,
          onStringChange: (newValue) =>
              refreshWithUpdate(() => name = newValue??''),
          calloutButtonSize: const Size(280, 70),
          calloutWidth: 280,
        ),
        StringPropertyValueNode(
          snode: this,
          name: 'src',
          stringValue: src,
          onStringChange: (newValue) => refreshWithUpdate(() => src = newValue??''),
          calloutButtonSize: const Size(280, 70),
          calloutWidth: 280,
        ),
      ];

  // @override
  // List<Widget> nodePropertyEditors(BuildContext context, {bool allowButtonCallouts = false}) => [
  //       NodePropertyButtonText(
  //           label: "name",
  //           text: name,
  //           calloutSize: const Size(600, 200),
  //           onChangeF: (s) {
  //             name = s;
  //             bloc.add(const CAPIEvent.forceRefresh());
  //           }),
  //       const SizedBox(height: 10),
  //       NodePropertyButtonText(
  //           label: "src",
  //           text: src,
  //           calloutSize: const Size(600, 200),
  //           onChangeF: (s) {
  //             src = s;
  //             bloc.add(const CAPIEvent.forceRefresh());
  //           }),
  //     ];

  @override
  Widget toWidget(BuildContext context, STreeNode? parentNode) {
    setParent(parentNode); // propagating parents down from root
    possiblyHighlightSelectedNode();
    return SizedBox(
      key: createNodeGK(),
      width: 200,
      height: 30,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          hspacer(10),
          Useful.coloredText(name.isEmpty ? 'filename?' : name,
              color: Colors.blue),
          hspacer(10),
          driveFileIcon(src),
        ],
      ),
    );
  }

  @override
  String toSource(BuildContext context) => "";

  // @override
  // List<Widget> wrapWithCandidates(final BuildContext context, final STreeNode? parentNode, ValueChanged<Type> onPressed) {
  //   List<Type> candidateTypes = [DirectoryNode];
  //   return toMenuItems(context, nodeTypeCandidates: candidateTypes, onPressedF: onPressed);
  // }
  //
  // @override
  // List<Widget> siblingCandidates(final BuildContext context, final STreeNode? parentNode, AddAction action, ValueChanged<Type> onPressed) {
  //   List<Type> candidateTypes = [DirectoryNode, FileNode];
  //   return toMenuItems(context, nodeTypeCandidates: candidateTypes, onPressedF: onPressed);
  // }

  @override
  List<Type> wrapWithOnly() => [DirectoryNode];

  @override
  String toString() => FLUTTER_TYPE;

  @override
  Widget? logoSrc() => null;

  static const String FLUTTER_TYPE = "File";
}
