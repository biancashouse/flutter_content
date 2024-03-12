import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:url_launcher/url_launcher.dart';

bool biancaTouched = false;

final GlobalKey<ScaffoldState> homeScaffoldKey = GlobalKey<ScaffoldState>();

class HomePageMobile extends StatefulWidget {
  const HomePageMobile({super.key});

  @override
  HomePageMobileState createState() => HomePageMobileState();
}

class HomePageMobileState extends State<HomePageMobile> with SingleTickerProviderStateMixin {
  late GlobalKey biancaKG; //will go null after user tap bianca
  Offset offset = Offset.zero; // changed
  bool calloutWasDragged = false;
  bool biancaAutoFlipped = false;

  late AnimationController _ac;
  late Animation<Color?> _bgColorAnimation;
  late Animation<Color?> _fgColorAnimation;

  @override
  void initState() {
    biancaKG = GlobalKey();

    _ac = AnimationController(
      duration: const Duration(milliseconds: 5000),
      vsync: this,
    );

    _bgColorAnimation = TweenSequence<Color?>(<TweenSequenceItem<Color?>>[
      TweenSequenceItem<Color?>(
        tween: ColorTween(begin: Colors.white, end: Colors.red.withOpacity(.1)),
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
    ]).animate(_ac);

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
    ]).animate(_ac);

    Useful.afterMsDelayDo(2000, () {
      _ac.forward();
    });
    Useful.afterMsDelayDo(8000, () {
      biancaCallout();
    });

    super.initState();
  }

  // https://github.com/flutter/flutter/issues/25827
  @override
  Widget build(BuildContext context) {
    // Useful.instance.initWithContext(context);
    return Useful.isAndroid ? _buildAndroid(context) : _build(context);
  }

  // wait for android to register screen size
  Widget _buildAndroid(BuildContext context) => FutureBuilder<double?>(
      future: _whenNotZero(
        Stream<double>.periodic(const Duration(milliseconds: 50), (_) => MediaQuery.of(context).size.width),
      ),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData && (snapshot.data ?? 0) > 0) {
          return _build(context);
        }
        return const CircularProgressIndicator(
          color: Colors.orange,
        );
      });

  Widget _build(BuildContext context) {
    return AnimatedBuilder(
        animation: _ac,
        builder: (context, _) {
          return SnippetPanel(panelName: 'home', snippetName: 'mobile-snippet');
          // return TransformableScaffold(
          //   scaffoldBgColor: Colors.black,
          //   scaffoldBody: () => SafeArea(
          //     child: Flex(
          //       direction: Useful.isLandscape ? Axis.horizontal : Axis.vertical,
          //       mainAxisSize: MainAxisSize.max,
          //       mainAxisAlignment: MainAxisAlignment.spaceAround,
          //       children: [
          //         Expanded(
          //           child: _welcomeTxtAndImage(),
          //         ),
          //         Expanded(
          //           child: Flex(
          //             direction: Useful.isPortrait ? Axis.horizontal : Axis.vertical,
          //             mainAxisSize: MainAxisSize.max,
          //             mainAxisAlignment: MainAxisAlignment.spaceAround,
          //             children: [
          //               RainbowSurround(
          //                 bgColorAnimation: _bgColorAnimation.value!,
          //                 contents: const Text('Algorithm Creator'),
          //               ),
          //               RainbowSurround(
          //                 bgColorAnimation: _bgColorAnimation.value!,
          //                 contents: Column(
          //                   children: [
          //                     const Text('For Flutter Developers'),
          //                     SizedBox(
          //                       width: Useful.scrW / 2 - 100,
          //                       child: TargetGroupWrapper(
          //                         name: "cats",
          //                         child: assetPicWithFadeIn(
          //                           path: 'images/top-cat-gang.png',
          //                           padding: EdgeInsets.zero,
          //                           alignment: Alignment.center,
          //                           fit: BoxFit.fitHeight,
          //                         ),
          //                       ),
          //                     )
          //                   ],
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // );
        });
  }

  void biancaCallout() {
    Callout.showOverlay(
      calloutConfig: CalloutConfig(
        feature: 'drag-with-your-finger',
        suppliedCalloutW: 250,
        suppliedCalloutH: 60,
        initialCalloutAlignment: Useful.isPortrait ? Alignment.topCenter : Alignment.centerLeft,
        initialTargetAlignment: Useful.isPortrait ? Alignment.bottomCenter : Alignment.centerRight,
        //contentTranslateX: Useful.isPortrait ? -50 : 130,
        // contentTranslateY: Useful.isLandscape() ? -100 : 0,
        toDelta: 20,
        finalSeparation: 50,
        //roundedCorners: 20,
        animate: true,
        arrowColor: Colors.yellowAccent,
        arrowType: ArrowType.THIN,
        onDragStartedF: () {
          if (!calloutWasDragged) {
            calloutWasDragged = true;
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              duration: Duration(seconds: 3),
              backgroundColor: Colors.red,
              elevation: 10,
              content: Text(
                'no, drag the Puss ;-)',
                textScaler: TextScaler.linear(2.0),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.yellow),
              ),
            ));
          }
        },
        notUsingHydratedStorage: true,
      ),
      targetGkF: () => biancaKG,
      boxContentF: (_) => Center(
        child: Text(
          'Drag me with your finger to see\nFlutter interactivity in action ?',
          textAlign: TextAlign.center,
          textScaler: TextScaler.linear(Useful.isPortrait ? .75 : 1),
          style: const TextStyle(color: Colors.black),
        ),
      ),
      removeAfterMs: 5000,
    );
  }

  Widget _welcomeTxtAndImage() => Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                text: 'Welcome to\nBianca\'s House',
                style: TextStyle(fontFamily: 'Times', color: Colors.white, fontSize: 20.0),
              ),
              textScaler: const TextScaler.linear(2),
            ),
          ),
          biancaAutoFlipped
              ? _transformedBiancaImage()
              : TweenAnimationBuilder(
                  tween: Tween<Offset>(begin: const Offset(-60, 0), end: const Offset(0, 0)),
                  duration: const Duration(seconds: 2),
                  builder: (context, Offset val, child) {
                    offset = val;
                    return _transformedBiancaImage();
                  },
                ),
          ShaderMask(
            shaderCallback: (Rect bounds) {
              return RadialGradient(
                center: Alignment.topLeft,
                radius: 1.0,
                colors: <Color>[Colors.yellow, Colors.deepOrange.shade900],
                tileMode: TileMode.mirror,
              ).createShader(bounds);
            },
            child: Padding(
              padding: const EdgeInsets.all(28.0),
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  text: 'Creating\nFlutter apps',
                  style: TextStyle(fontFamily: 'Times', color: Colors.white, fontSize: 32.0),
                ),
                textScaler: const TextScaler.linear(2),
              ),
            ),
          ),
        ],
      );

  _transformedBiancaImage() => Transform(
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001) // perspective
          ..rotateX(0.01 * offset.dy) // changed
          ..rotateY(-0.01 * offset.dx), // changed
        alignment: FractionalOffset.center,
        child: GestureDetector(
            onTap: () {
              _removeCallout();
            },
            onPanUpdate: (details) {
              setState(() {
                offset += details.delta;
                _removeCallout();
              });
              // debugPrint('offset ${offset.toString()}');
            },
            onDoubleTap: () => setState(() => offset = Offset.zero),
            child: assetPicWithFadeIn(
              key: biancaKG,
              path: 'assets/bianca-1024x1024.png',
              padding: EdgeInsets.zero,
              alignment: Alignment.center,
              fit: BoxFit.fitHeight,
              height: Useful.narrowWidth || Useful.isLandscape ? 300 : null,
            )),
      );

  // Widget _whatWeDo() => Column(
  //       mainAxisSize: MainAxisSize.max,
  //       mainAxisAlignment: MainAxisAlignment.spaceAround,
  //       children: [
  //         Expanded(
  //             child: ShaderMask(
  //           shaderCallback: (Rect bounds) {
  //             return RadialGradient(
  //               center: Alignment.topLeft,
  //               radius: 1.0,
  //               colors: <Color>[Colors.yellow, Colors.deepOrange.shade900],
  //               tileMode: TileMode.mirror,
  //             ).createShader(bounds);
  //           },
  //           child: Center(
  //             child: RichText(
  //               textAlign: TextAlign.center,
  //               text: const TextSpan(
  //                 text: 'We create Flutter apps\nthat work\nin the browser,\non the desktop,\nand on mobile devices',
  //                 style: TextStyle(fontFamily: 'OpenSans', color: Colors.grey, fontSize: 12.0),
  //               ),
  //               textScaler: TextScaler.linear(Useful.narrowWidth ? 2 : 2.5),
  //             ),
  //           ),
  //         )),
  //         Expanded(
  //             child: Container(
  //           decoration: BoxDecoration(
  //               border: const GradientBoxBorder(
  //                 gradient: LinearGradient(colors: [Colors.blue, Colors.green, Colors.yellow, Colors.red]),
  //                 width: 3,
  //               ),
  //               borderRadius: BorderRadius.circular(16)),
  //           child: ShaderMask(
  //             shaderCallback: (Rect bounds) {
  //               // return LinearGradient(
  //               //   colors: [Colors.white, Colors.yellow, Colors.yellow]
  //               // ).createShader(bounds);
  //               return RadialGradient(
  //                 center: Alignment.topLeft,
  //                 radius: 1,
  //                 colors: <Color>[Colors.white, _bgColorAnimation.value!, Colors.white],
  //                 tileMode: TileMode.mirror,
  //               ).createShader(bounds);
  //             },
  //             child: Container(
  //               color: Colors.purple,
  //               child: Flex(
  //                 direction: Useful.narrowWidth || Useful.isLandscape ? Axis.horizontal : Axis.vertical,
  //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                 crossAxisAlignment: CrossAxisAlignment.center,
  //                 mainAxisSize: MainAxisSize.max,
  //                 children: [
  //                   Column(
  //                     mainAxisSize: MainAxisSize.min,
  //                     mainAxisAlignment: MainAxisAlignment.center,
  //                     crossAxisAlignment: CrossAxisAlignment.center,
  //                     children: [
  //                       Container(
  //                         color: Colors.red,
  //                         child: RichText(
  //                           textAlign: TextAlign.center,
  //                           text: TextSpan(style: const TextStyle(fontFamily: 'Times', color: Colors.black38), children: [
  //                             TextSpan(
  //                               text: 'Our product ',
  //                               style: const TextStyle(fontFamily: 'OpenSans', color: Colors.white),
  //                               children: [
  //                                 TextSpan(
  //                                     text: 'Algorithm Creator\n',
  //                                     style: TextStyle(fontFamily: 'OpenSans', fontWeight: FontWeight.bold, color: _fgColorAnimation.value),
  //                                     children: const [
  //                                       TextSpan(
  //                                           text: 'works on your phone, or tablet,\nin  browsers, or on your laptop',
  //                                           style: TextStyle(fontFamily: 'OpenSans', color: Colors.white, fontWeight: FontWeight.normal),
  //                                           children: [])
  //                                     ])
  //                               ],
  //                             ),
  //                           ]),
  //                           textScaler: const TextScaler.linear(1),
  //                         ),
  //                       ),
  //                       _findOutMoreAboutAlgCLink(),
  //                     ],
  //                   ),
  //                   Container(
  //                     color: Colors.yellow,
  //                     child: assetPicWithFadeIn(
  //                       path: 'assets/algc-icon-128x128.png',
  //                       // padding: EdgeInsets.symmetric(vertical: 30),
  //                       alignment: Alignment.center,
  //                       height: 150,
  //                       fit: BoxFit.fitHeight,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ),
  //         )),
  //         _bhLink(),
  //       ],
  //     );

  void _removeCallout() {
    if (!biancaTouched) {
      biancaTouched = true;
      Useful.afterMsDelayDo(3000, () {
        // Callout.removeOverlayAll();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            key: UniqueKey(),
            duration: const Duration(seconds: 10),
            backgroundColor: Colors.black54,
            content: InkWell(
                child: const Text(
                  'Tap to see more Flutter in action',
                  textScaleFactor: 1.5,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  Callout.dismissAll();
                  final url = Uri(
                    scheme: 'https',
                    host: 'flutterplasma.dev',
                  );
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  launchUrl(url);
                })));
      });
    }
  }

  _bhLink() => Align(
        alignment: Alignment.centerRight,
        child: InkWell(
            child: const Text(
              'biancashouse.com ',
              textScaleFactor: 1,
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
            onTap: () {
              Callout.dismissAll();
              final url = Uri(
                scheme: 'https',
                host: 'biancashouse.com',
              );
              launchUrl(url);
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            }),
      );

  _findOutMoreAboutAlgCLink() => Align(
        alignment: Alignment.centerRight,
        child: InkWell(
            child: const Text(
              'find out more',
              textScaleFactor: 1,
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
            onTap: () async {
              Callout.dismissAll();
              final url = Uri(
                scheme: 'https',
                host: 'algorithmcreator.com',
              );
              launchUrl(url);
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            }),
      );

// https://github.com/flutter/flutter/issues/25827
  Future<double?> _whenNotZero(Stream<double> source) async {
    await for (double value in source) {
      if (value > 0) {
        return value;
      }
    }
    return null;
    // stream exited without a true value, maybe return an exception.
  }
}