import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:go_router/go_router.dart';

mixin NavMixin {
  Widget NavigationDD({
    Color pencilIconColor = Colors.white,
  }) => BlocBuilder<CAPIBloC, CAPIState>(
    builder: (context, state) {
      bool showPencil = !fco.canEditContent();
      if (showPencil) {
        final dropdownItems = <DropdownMenuItem<String>>[];
        dropdownItems.add(
          DropdownMenuItem<String>(
            value: 'sign-in-as-editor',
            child: Text('sign in as a Content editor'),
          ),
        );
        if (fco.router != null) {
          dropdownItems.add(
            DropdownMenuItem<String>(
              value: 'create-editable-page',
              child: RichText(
                text: TextSpan(
                  text: 'create your own ',
                  style: TextStyle(color: Colors.grey),
                  children: [
                    TextSpan(
                      text: 'editable',
                      style: TextStyle(color: Colors.purpleAccent),
                    ),
                    TextSpan(text: ' page'),
                  ],
                ),
              ),
            ),
          );
        }
        return DropdownButton<String>(
          // key: fco.authIconGK,
          items: dropdownItems,
          underline: Offstage(),
          icon: Icon(Icons.edit, color: pencilIconColor, size: 24),
          dropdownColor: Colors.white,
          // focusColor: ,
          onChanged: (value) {
            switch (value) {
              case 'sign-in-as-editor':
                EditablePage.of(context)?.editorPasswordDialog();
                break;
              default:
                if (fco.router != null) {
                  EditablePage.of(context)?.pageNameDialog();
                }
                break;
            }
          },
        );
      } else {
        final dropdownItems = <DropdownMenuItem<String>>[];
        dropdownItems.add(
          DropdownMenuItem<String>(value: 'sign-out', child: _signOutBtn()),
        );
        if (fco.router != null) {
          dropdownItems.add(
            DropdownMenuItem<String>(
              value: 'create-editable-page',
              child: RichText(
                text: TextSpan(
                  text: 'create an ',
                  style: TextStyle(color: Colors.grey),
                  children: [
                    TextSpan(
                      text: 'editable',
                      style: TextStyle(color: Colors.purpleAccent),
                    ),
                    TextSpan(text: ' page'),
                  ],
                ),
              ),
            ),
          );
        }
        for (String pagePath in fco.pageList) {
          // skip currentPath
          final String currentPath = GoRouterState.of(context).uri.toString();
          if (pagePath != currentPath) {
            String sandboxIndicator =
                (fco.appInfo.userEditablePages.contains(pagePath)) ? ' *' : "";
            dropdownItems.add(
              DropdownMenuItem<String>(
                value: pagePath,
                child: _pageNavBtn(context, pagePath, sandboxIndicator),
              ),
            );
          }
        }
        final dd = DropdownButton<String>(
          items: dropdownItems,
          underline: Offstage(),
          icon: Icon(Icons.more_vert, color: Colors.red, size: 24),
          onChanged: (value) {
            if (fco.router != null) {
              switch (value) {
                case 'create-editable-page':
                  EditablePage.of(context)?.pageNameDialog();
                  break;
                default:
                  break;
              }
            }
          },
        );
        return dd;
      }
    },
  );

  Widget _signOutBtn() => TextButton(
    onPressed: () {
      if (!fco.anyPresent([CalloutConfigToolbar.CID])) {
        fco.setCanEditContent(false);
        fco.forceRefresh();
      }
    },
    child: fco.coloredText('Sign Out', color: Colors.red),
  );

  Widget _pageNavBtn(
    BuildContext context,
    String pagePath,
    String sandboxIndicator,
  ) => GestureDetector(
    onTap: () {
      context.go(pagePath);
    },
    child: SizedBox(
      width: 400,
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
                    text: '$pagePath$sandboxIndicator',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // if (pagePath != '/') Spacer(),
          if (pagePath != '/')
            IconButton(
              onPressed: () async {
                fco.appInfo.snippetNames.remove(pagePath);
                fco.appInfo.userEditablePages.remove(pagePath);
                fco.deleteSubRoute(path: pagePath);
                context.pop();
                await fco.modelRepo.saveAppInfo();
                await fco.modelRepo.deleteSnippet(pagePath);
                SnippetInfoModel.removeFromCache(pagePath);
                fco.capiBloc.add(CAPIEvent.forceRefresh());
              },
              icon: Icon(Icons.delete, color: Colors.red),
            ),
        ],
      ),
    ),
  );

  // Widget _pageNavBtnOLD(context, String pagePath) => Row(
  //   mainAxisSize: MainAxisSize.max,
  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //   children: [
  //     TextButton(
  //       onPressed: () {
  //         context.replace(pagePath);
  //       },
  //       child: Text(pagePath),
  //     ),
  //     if (pagePath != '/')
  //       IconButton(
  //         onPressed: () async {
  //           fco.appInfo.snippetNames.remove(pagePath);
  //           fco.deleteSubRoute(path: pagePath);
  //           await fco.modelRepo.saveAppInfo();
  //           await fco.modelRepo.deleteSnippet(pagePath);
  //           SnippetInfoModel.removeFromCache(pagePath);
  //         },
  //         icon: Icon(Icons.delete, color: Colors.red),
  //       ),
  //   ],
  // );
}
