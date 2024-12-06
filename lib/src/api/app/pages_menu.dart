// import 'package:flutter/material.dart';
// import 'package:flutter_content/flutter_content.dart';
//
// class PagesDropDownMenu extends StatelessWidget {
//   const PagesDropDownMenu({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder<bool>(
//       valueListenable: fco.canEditContent,
//       builder: (context, value, child) {
//         bool showPencil = !value;
//         if (showPencil) {
//           return IconButton(
//               tooltip: 'sign in as a Content Editor',
//               onPressed: () {
//                 // ask user to sign in as editor
//                 // setState(() {
//                 EditablePage.of(context)?.editorPasswordDialog();
//                 // });
//               },
//               icon: Icon(Icons.edit, color: Colors.white));
//         } else {
//           var pages = fco.pageList;
//           final dropdownItems = <DropdownMenuEntry<String>>[];
//           dropdownItems.add(DropdownMenuEntry<String>(
//             label: 'sign out',
//             labelWidget: signOutBtn(),
//             value: 'sign out',
//           ));
//           for (String pagePath in pages) {
//             dropdownItems.add(DropdownMenuEntry<String>(
//               label: 'sign out',
//               labelWidget: pageNavBtn(context, pagePath),
//               value: 'sign out',
//             ));
//           }
//           final dd = DropdownMenu<String>(
//             dropdownMenuEntries: dropdownItems,
//           );
//           return dd;
//         }
//       },
//     );
//   }
//
//   Widget signOutBtn() => IconButton(
//         onPressed: () {
//           if (!fco.anyPresent([CalloutConfigToolbar.CID])) {
//             fco.setCanEditContent(false);
//           }
//         },
//         icon: Icon(Icons.close, color: Colors.deepOrange),
//       );
//
//   Widget pageNavBtn(context, String pagePath) => Row(
//     mainAxisSize: MainAxisSize.max,
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: [
//       TextButton(
//         onPressed: () {
//           context.go(pagePath);
//         },
//         child: Text(pagePath),
//       ),
//       if (pagePath != '/')
//         IconButton(
//           onPressed: () async {
//             fco.appInfo.snippetNames.remove(pagePath);
//             fco.deleteSubRoute(path: pagePath);
//             await fco.modelRepo.saveAppInfo();
//             await fco.modelRepo.deleteSnippet(pagePath);
//             SnippetInfoModel.removeFromCache(pagePath);
//             // setState(() {});
//           },
//           icon: Icon(
//             Icons.delete,
//             color: Colors.red,
//           ),
//         )
//     ],
//   );
// }
