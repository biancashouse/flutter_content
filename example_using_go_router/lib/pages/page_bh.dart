import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

// import 'package:flutter_callouts/flutter_callouts.dart';
import 'package:flutter_content/flutter_content.dart';

bool biancaTouched = false;

final GlobalKey<ScaffoldState> homeScaffoldKey = GlobalKey<ScaffoldState>();

class Page_BH extends StatefulWidget {
  const Page_BH({super.key});

  @override
  Page_BHState createState() => Page_BHState();
}

class Page_BHState extends State<Page_BH> with TickerProviderStateMixin {
  GlobalKey? biancaKG = GlobalKey(); //will go null after user tap bianca
  Offset offset = const Offset(-100, 0); // changed
  bool calloutWasDragged = false;
  bool biancaAutoFlipped = false;

  late AnimationController _ac;

  // late Animation<Color?> _bgColorAnimation;
  // late Animation<Color?> _fgColorAnimation;

  @override
  void initState() {
    super.initState();

    // var pagePath = EditablePage.name(context);
    // sC = NamedScrollController(pagePath, Axis.vertical);
    // sC.listenToOffset();

    _ac = AnimationController(
      duration: const Duration(milliseconds: 5000),
      vsync: this,
    );

    fco.afterNextBuildDo(() {
      fco.afterMsDelayDo(5000, () {
        if (mounted) {
          _ac.forward();
        }
      });
      fco.afterMsDelayDo(3000, () {
        biancaAutoFlipped = true;
      });
      //context.go('/flutter-callouts');
    });
  }

  @override
  void dispose() {
    if (!mounted) return;
    _ac.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        appBar: AppBar(
          title: _welcomeTxt(),
          actions: [fco.NavigationDD(pencilIconColor: Colors.red)],
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            _animatedBiancaBg(),
            SingleChildScrollView(
              controller: ScrollController(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // const Gap(20),
                  // _whatWeDoSnippet(),
                  // const Gap(20),
                  // _aboutUs(),
                  // const Gap(20),
                  // MouseInfoViewer(child: _weCreateFlutterPackages()),
                  const Gap(20),
                  MouseInfoViewer(child: _weCreate()),
                  // const Gap(20),
                  // _aboutFlutterCallouts(),
                  const Gap(20),
                  MouseInfoViewer(child: _aboutHotspots()),
                  // const Gap(20),
                  // _aboutFlutterContent(),
                  // const Gap(20),
                  // _aboutAlgCSnippet(),
                  const Gap(20),
                  Container(
                    color: Colors.black,
                    height: 20,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: FutureBuilder<String>(
                        future: fco.versionAndBuild,
                        builder: (context, snap) =>
                        snap.hasData
                            ? fco.coloredText(
                          'v.${snap.data}  ',
                          color: Colors.white,
                        )
                            : const Offstage(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  Widget _animatedBiancaBg() =>
      TweenAnimationBuilder(
        tween: Tween<Offset>(
            begin: const Offset(-50, 0), end: const Offset(0, 0)),
        duration: const Duration(seconds: 2),
        builder: (context, Offset val, _) {
          offset = val;
          return _transformedBiancaImage();
        },
      );

  Widget _welcomeTxt() =>
      RichText(
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

  Widget _transformedBiancaImage() =>
      Transform(
        key: biancaKG,
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001) // perspective
          ..rotateX(0.01 * offset.dy) // changed
          ..rotateY(-0.01 * offset.dx), // changed
        alignment: FractionalOffset.center,
        child: Opacity(
          opacity: .1,
          child: fco.assetPicWithFadeIn(
            path: 'assets/images/bianca-1024x1024.png',
            padding: EdgeInsets.zero,
            alignment: Alignment.center,
            fit: BoxFit.fill,
          ),
        ),
      );

  Widget _weCreate() =>
      SnippetBuilder(
        templateSnippet: SnippetRootNode(
          name: 'we-create',
          child: PlaceholderNode(),
        ),
      );

  Widget _aboutHotspots() =>
      Padding(
        padding: const EdgeInsets.all(18.0),
        child: SnippetBuilder(
          templateSnippet: SnippetRootNode(
            name: 'about-hotspots',
            child: PlaceholderNode(),
          ),
        ),
      );

}