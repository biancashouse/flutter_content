import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';

bool biancaTouched = false;

final GlobalKey<ScaffoldState> homeScaffoldKey = GlobalKey<ScaffoldState>();

class Page_BH extends StatefulWidget {
  static String pagePath = 'bh';

  const Page_BH({super.key});

  @override
  Page_BHState createState() => Page_BHState();
}

class Page_BHState extends State<Page_BH> with TickerProviderStateMixin {
  GlobalKey? biancaKG = GlobalKey(); //will go null after user tap bianca
  Offset offset = const Offset(-100, 0); // changed
  bool calloutWasDragged = false;
  bool biancaAutoFlipped = false;

  AnimationController? _ac;
  late Animation<Color?> _bgColorAnimation;
  late Animation<Color?> _fgColorAnimation;

  NamedScrollController? namedSC(ctx) => EditablePage.of(ctx)?.namedSC;

  @override
  void initState() {
    super.initState();

    print('Page_BH ********');

    _ac = AnimationController(
      duration: const Duration(milliseconds: 5000),
      vsync: this,
    );

    _bgColorAnimation = TweenSequence<Color?>(<TweenSequenceItem<Color?>>[
      TweenSequenceItem<Color?>(
        tween: ColorTween(
          begin: Colors.white,
          end: Colors.red.withValues(alpha: .1),
        ),
        weight: 50,
      ),
      TweenSequenceItem<Color?>(
        tween: ColorTween(begin: Colors.red, end: Colors.green),
        weight: 50,
      ),
      TweenSequenceItem<Color?>(
        tween: ColorTween(begin: Colors.green, end: Colors.blue),
        weight: 50,
      ),
      TweenSequenceItem<Color?>(
        tween: ColorTween(begin: Colors.blue, end: Colors.orange),
        weight: 50,
      ),
      TweenSequenceItem<Color?>(
        tween: ColorTween(begin: Colors.orange, end: Colors.red),
        weight: 50,
      ),
      TweenSequenceItem<Color?>(
        tween: ColorTween(begin: Colors.orange, end: Colors.white),
        weight: 50,
      ),
    ]).animate(_ac!);

    _fgColorAnimation = TweenSequence<Color?>(<TweenSequenceItem<Color?>>[
      TweenSequenceItem<Color?>(
        tween: ColorTween(begin: Colors.pink, end: Colors.white),
        weight: 50,
      ),
      TweenSequenceItem<Color?>(
        tween: ColorTween(begin: Colors.white, end: Colors.yellow),
        weight: 50,
      ),
      TweenSequenceItem<Color?>(
        tween: ColorTween(begin: Colors.yellow, end: Colors.orange),
        weight: 50,
      ),
      TweenSequenceItem<Color?>(
        tween: ColorTween(begin: Colors.orange, end: Colors.blue),
        weight: 50,
      ),
      TweenSequenceItem<Color?>(
        tween: ColorTween(begin: Colors.blue, end: Colors.yellow),
        weight: 50,
      ),
      TweenSequenceItem<Color?>(
        tween: ColorTween(begin: Colors.yellow, end: Colors.pink),
        weight: 50,
      ),
    ]).animate(_ac!);

    // fco.afterNextBuildDo(() {
    //   fco.afterMsDelayDo(5000, () {
    //     if (mounted) _ac?.forward();
    //   });
    //   fco.afterMsDelayDo(3000, () {
    //     biancaAutoFlipped = true;
    //   });
    //   //context.go('/flutter-callouts');
    // });
  }

  @override
  void dispose() {
    if (!mounted) return;
    _ac?.dispose();
    super.dispose();
  }

  // // https://github.com/flutter/flutter/issues/25827
  // @override
  // Widget build(BuildContext context) {
  //   fco.logger.d('build....................................');
  //
  //   String routePath = widget.goRouterState.path ?? 'missing route path!';
  //   fco.currentRoute = routePath;
  //   return EditablePage(
  //     key: GlobalKey(), // provides access to state later
  //     routePath: widget.goRouterState.path!,
  //     builder: (context) => _build(context),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    // maintain offset after each build
    // fco.afterNextBuildDo((){
    //   sC.restoreOffset();
    // });

    // var pagePath = EditablePage.name(context);
    // if (sC.hasClients &&
    //     sC.offset != NamedScrollController.vScrollOffset(pagePath)) {
    //   sC.jumpTo(NamedScrollController.vScrollOffset(pagePath));
    // }

    if (mounted && (namedSC(context)?.hasClients ?? false)) {
      fco.logger.i(
        '******************************************************************************************** ${namedSC(context)?.name}.offset = ${namedSC(context)?.offset}',
      );
    }

    final scaffold = Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          SingleChildScrollView(
            // key: const PageStorageKey('bh'),
            controller: namedSC(context),
            child: Column(
              key: ValueKey(99),
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Gap(20),
                _welcomeTxt(),
                const Gap(20),
                _whatWeDoSnippet(),
                const Gap(20),
                _aboutHotspotsSnippet(),
                const Gap(20),
                _aboutAlgCSnippet(),
                const Gap(20),
                Container(
                  color: Colors.black,
                  height: 20,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: FutureBuilder<String>(
                      future: fco.versionAndBuild,
                      builder:
                          (context, snap) => Offstage(
                            offstage: !snap.hasData,
                            child: fco.coloredText(
                              'v.${snap.data}  ',
                              color: Colors.white,
                            ),
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    return ValueListenableBuilder<bool>(
      valueListenable: fco.authenticated,
      builder: (context, value, child) {
        return Stack(
          children: [
            scaffold,
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: fco.NavigationDD(),
              ),
            ),
          ],
        );
      },
      child: scaffold,
    );
  }

  Widget _welcomeTxt() => RichText(
    textAlign: TextAlign.center,
    textScaler: const TextScaler.linear(2.0),
    text: const TextSpan(
      text: 'Welcome to Bianca\'s House',
      style: TextStyle(
        fontFamily: 'Times',
        color: Colors.white,
        fontSize: 20.0,
      ),
    ),
  );

  Widget _whatWeDoSnippet() => SnippetPanel.fromNodes(
    snippetRootNode: SnippetTemplateEnum.empty.templateSnippet().clone(
      cloneName: 'we-create',
    ),
    scName: namedSC(context)?.name,
  );

  Widget _aboutHotspotsSnippet() => Padding(
    padding: const EdgeInsets.all(18.0),
    child: SnippetPanel.fromNodes(
      snippetRootNode: SnippetTemplateEnum.empty.templateSnippet().clone(
        cloneName: 'about-hotspots',
      ),
      scName: namedSC(context)?.name,
    ),
  );

  Widget _aboutAlgCSnippet() => SnippetPanel.fromNodes(
    // panelName: 'about-algc',
    snippetRootNode: SnippetTemplateEnum.empty.templateSnippet().clone(
      cloneName: 'about-algc',
    ),
    scName: namedSC(context)?.name,
  );

  Align _findOutMoreAboutAlgCLink() => Align(
    alignment: Alignment.centerRight,
    child: InkWell(
      child: const Text(
        'find out more',
        textScaler: TextScaler.linear(2.0),
        style: TextStyle(color: Colors.blue),
      ),
      onTap: () async {
        fco.dismissAll();
        final url = Uri(scheme: 'https', host: 'algorithmcreator.com');
        final ctx = fco.rootContext;
        if (await canLaunchUrl(url)) {
          await launchUrl(url);
          ScaffoldMessenger.of(ctx).hideCurrentSnackBar();
        }
      },
    ),
  );
}
