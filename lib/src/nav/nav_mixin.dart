import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:go_router/go_router.dart';

mixin NavMixin {
  Widget NavigationDD({Color pencilIconColor = Colors.white}) =>
      StatefulBuilder(builder: (context, StateSetter setState) {
        return ValueListenableBuilder<bool>(
          valueListenable: fco.authenticated,
          builder: (context, value, child) {
            bool showPencil = !fco.authenticated.isTrue;
            if (showPencil) {
              final dropdownItems = <DropdownMenuItem<String>>[];
              dropdownItems.add(DropdownMenuItem<String>(
                value: 'sign-in-as-editor',
                child: Text('sign in as a Content editor'),
              ));
              dropdownItems.add(
                DropdownMenuItem<String>(
                  value: 'create-sandbox-page',
                  child: RichText(
                    text: TextSpan(
                      text: 'create your own ',
                      style: TextStyle(color: Colors.grey),
                      children: [
                        TextSpan(
                            text: 'editable',
                            style: TextStyle(color: Colors.purpleAccent)),
                        TextSpan(text: ' page'),
                      ],
                    ),
                  ),
                ),
              );
              return DropdownButton<String>(
                // key: fco.authIconGK,
                items: dropdownItems,
                underline: Offstage(),
                icon: Icon(
                  Icons.edit,
                  color: pencilIconColor,
                  size: 24,
                ),
                dropdownColor: Colors.white,
                // focusColor: ,
                onChanged: (value) {
                  switch (value) {
                    case 'sign-in-as-editor':
                      EditablePage.of(context)?.editorPasswordDialog();
                      break;
                    default:
                      EditablePage.of(context)?.userSandboxPageNameDialog();
                      break;
                  }
                },
              );
            } else {
              var pages = fco.pageList;
              final dropdownItems = <DropdownMenuItem<String>>[];
              dropdownItems.add(DropdownMenuItem<String>(
                value: 'sign-out',
                child: _signOutBtn(),
              ));
              for (String pagePath in pages) {
                // skip currentPath
                final String currentPath =
                    GoRouterState.of(context).uri.toString();
                if (pagePath != currentPath) {
                  dropdownItems.add(DropdownMenuItem<String>(
                    value: pagePath,
                    child: _pageNavBtn(context, pagePath, setState),
                  ));
                }
              }
              final dd = DropdownButton<String>(
                items: dropdownItems,
                underline: Offstage(),
                icon: Icon(
                  Icons.more_vert,
                  color: Colors.red,
                  size: 24,
                ),
                onChanged: (_) {},
              );
              return dd;
            }
          },
        );
      });

  Widget _signOutBtn() => TextButton(
        onPressed: () {
          if (!fco.anyPresent([CalloutConfigToolbar.CID])) {
            fco.setCanEditContent(false);
          }
          fco.forceRefresh();
        },
        child: fco.coloredText('Sign Out', color: Colors.red),
      );

  Widget _pageNavBtn(
          BuildContext context, String pagePath, StateSetter setState) =>
      GestureDetector(
        onTap: () {
          context.go(pagePath);
        },
        child: SizedBox(
          width: 260,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: RichText(
                  text: TextSpan(
                    text: 'goto ',
                    style: TextStyle(color: Colors.grey),
                    children: <TextSpan>[
                      TextSpan(
                          text: pagePath,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.blue)),
                    ],
                  ),
                ),
              ),
              // if (pagePath != '/') Spacer(),
              if (pagePath != '/')
                IconButton(
                  onPressed: () async {
                    fco.appInfo.snippetNames.remove(pagePath);
                    fco.deleteSubRoute(path: pagePath);
                    await fco.modelRepo.saveAppInfo();
                    await fco.modelRepo.deleteSnippet(pagePath);
                    SnippetInfoModel.removeFromCache(pagePath);
                    context.pop();
                  },
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                )
            ],
          ),
        ),
      );

  Widget _pageNavBtnOLD(context, String pagePath) => Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () {
              context.replace(pagePath);
            },
            child: Text(pagePath),
          ),
          if (pagePath != '/')
            IconButton(
              onPressed: () async {
                fco.appInfo.snippetNames.remove(pagePath);
                fco.deleteSubRoute(path: pagePath);
                await fco.modelRepo.saveAppInfo();
                await fco.modelRepo.deleteSnippet(pagePath);
                SnippetInfoModel.removeFromCache(pagePath);
                // setState(() {});
              },
              icon: Icon(
                Icons.delete,
                color: Colors.red,
              ),
            )
        ],
      );
}
