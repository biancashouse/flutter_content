import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:go_router/go_router.dart';

class Pages extends StatelessWidget {
  const Pages({super.key});

  @override
  Widget build(BuildContext context) {
    fco.logger.d('pages build');
    var pages = fco.pageList;
    final scaffold = Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('Available Pages in this web app')),
      body: ListView.builder(
        padding: EdgeInsets.all(30),
        itemCount: pages.length,
        itemBuilder: (context, index) {
          final label = pages[index];
          String sandboxIndicator = (fco.appInfo.userEditablePages.contains(label)) ? ' *' : "";
          return Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (label != '/')
                IconButton(
                  onPressed: () async {
                    fco.appInfo.snippetNames.remove(label);
                    fco.appInfo.userEditablePages.remove(label);
                    fco.deleteSubRoute(path: label);
                    await fco.modelRepo.saveAppInfo();
                    await fco.modelRepo.deleteSnippet(label);
                    SnippetInfoModel.removeFromCache(label);
                    fco.capiBloc.add(CAPIEvent.forceRefresh());
                  },
                  icon: Icon(Icons.delete, color: Colors.red),
                ),
              TextButton(
                onPressed: () {
                  context.go(label);
                },
                child: Text('    $label$sandboxIndicator'),
              ),
            ],
          );
        },
      ),
    );

    return BlocBuilder<CAPIBloC, CAPIState>(
      builder: (context, state) {
        bool showPencil = !fco.canEditContent();
        return Stack(
          children: [
            scaffold,
            if (showPencil)
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {
                    // ask user to sign in as editor
                    EditablePage.of(context)?.editorPasswordDialog();
                    fco.capiBloc.add(CAPIEvent.forceRefresh());
                  },
                  icon: Icon(Icons.edit, color: Colors.white),
                ),
              ),
          ],
        );
      },
    );
  }
}
