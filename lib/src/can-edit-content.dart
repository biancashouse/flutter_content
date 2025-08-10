// import 'package:flutter/cupertino.dart';
// import 'package:flutter_content/flutter_content.dart';
//
// class CanEditContentVN extends ValueNotifier<bool> {
//   CanEditContentVN(super.value);
//
//   // as well as setting value true when signing in as an editor, true is also
//   // returned if the current route is a sandbox page.
//   bool get isTrue {
//     var list = fco.appInfo.sandboxPageNames;
//     String? currentPagePath = fco.currentEditablePagePath;
//     bool isGuestPage = fco.appInfo.sandboxPageNames.contains(currentPagePath);
//     return super.value || isGuestPage;
//   }
// }