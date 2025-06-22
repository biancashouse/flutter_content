// ignore_for_file: constant_identifier_names
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/bool_pnode.dart';
import 'package:flutter_content/src/snippet/pnodes/decimal_pnode.dart';
import 'package:flutter_content/src/snippet/pnodes/enum_pnode.dart';
import 'package:flutter_content/src/snippet/pnodes/fyi_pnodes.dart';
import 'package:flutter_content/src/snippet/pnodes/int_pnode.dart';
import 'package:flutter_content/src/snippet/snodes/fs_image_node.dart';
// import 'package:flutter_content/src/carousel_slider_4.2.1x/carousel_options.dart';
// import 'package:flutter_content/src/carousel_slider_4.2.1x/carousel_slider.dart';

part 'carousel_node.mapper.dart';

List<String> kDemoImages = [
  'lib/assets/images/carousel-demo/2-carnations.jpeg',
  'lib/assets/images/carousel-demo/blue-jug.jpeg',
  'lib/assets/images/carousel-demo/cherries.jpeg',
  'lib/assets/images/carousel-demo/grapes.jpeg',
  'lib/assets/images/carousel-demo/honey.jpeg',
  'lib/assets/images/carousel-demo/jug.webp',
  'lib/assets/images/carousel-demo/lamp.jpeg',
  'lib/assets/images/carousel-demo/pears.jpg',
];

@MappableClass()
class CarouselNode extends MC with CarouselNodeMappable {
  bool autoPlay;
  int autoPlayIntervalSecs;
  bool enlargeCenterPage;
  double aspectRatio;
  double? height;
  AxisEnum axis;

  CarouselNode({
    this.autoPlay = true,
    this.autoPlayIntervalSecs = 2,
    this.enlargeCenterPage = true,
    this.aspectRatio = 1.0,
    this.height,
    this.axis = AxisEnum.horizontal,
    required super.children,
  });

  @override
  List<PNode> properties(BuildContext context, SNode? parentSNode) => [
    FlutterDocPNode(
        buttonLabel: 'Carousel',
        webLink: 'https://pub.dev/packages/carousel_slider',
        snode: this,
        name: 'fyi'),
    DecimalPNode(
          snode: this,
          name: 'aspectRatio',
          decimalValue: aspectRatio,
          onDoubleChange: (newValue) =>
              refreshWithUpdate(context,() => aspectRatio = newValue ?? 1.0),
          calloutButtonSize: const Size(130, 30),
        ),
        IntPNode(
            snode: this,
            name: 'autoPlayInterval (secs)',
            intValue: autoPlayIntervalSecs,
            onIntChange: (newValue) =>
                refreshWithUpdate(context,() => autoPlayIntervalSecs = newValue ?? 2),
            calloutButtonSize: const Size(180, 30),
            viaButton: false),
        BoolPNode(
          snode: this,
          name: 'autoPlay',
          boolValue: autoPlay,
          onBoolChange: (newValue) =>
              refreshWithUpdate(context,() => autoPlay = newValue ?? true),
        ),
        BoolPNode(
          snode: this,
          name: 'enlargeCenterPage',
          boolValue: enlargeCenterPage,
          onBoolChange: (newValue) =>
              refreshWithUpdate(context,() => enlargeCenterPage = newValue ?? true),
        ),
        EnumPNode<AxisEnum?>(
          snode: this,
          name: 'axis',
          valueIndex: axis.index,
          onIndexChange: (newValue) => refreshWithUpdate(context,
              () => axis = AxisEnum.of(newValue) ?? AxisEnum.horizontal),
        ),
      ];

  @override
  String toSource(BuildContext context) => '''Carousel(
        children: super.children.map((child) => child.toWidget(context, this)).toList(),
      );
  ''';

  @override
  Widget toWidget(BuildContext context, SNode? parentNode) {
    try {
      setParent(parentNode);
      List<Widget> images = super.children.isEmpty
              ? kDemoImages
                  .map((name) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: kElevationToShadow[2],
                            image: DecorationImage(
                                image: AssetImage(
                                  name,
                                  package: 'flutter_content',
                                ),
                                fit: BoxFit.fill),
                          ),
                        ),
                      ))
                  .toList()
              : super
                  .children
                  .map((SNode node) => node is AssetImageNode
                      ? node.toWidget(context, this)
                      : node is FSImageNode
                          ? node.toWidget(context, this)
                          : const Placeholder(
                              child: Text('not an asset image!'),
                            ))
                  .toList();

      //ScrollControllerName? scName = EditablePage.name(context);
    //possiblyHighlightSelectedNode(scName);


      // SnippetPanelState? spState = SnippetPanel.of(context);  // vsync
      // if (spState == null) return fco.errorIcon(Colors.red);
      //
      // int i=0;
      // final AnimationController aC = AnimationController(
      //   duration: Duration(seconds: images.length*2),
      //   vsync: spState,
      // )..repeat();
      // final Animation<int> animation = IntTween(begin: 0, end: images.length-1).animate(aC);
      // return StatefulBuilder(
      //   builder: (context, StateSetter setState) {
      //     return CarouselView(
      //       controller: CarouselController(initialItem: animation.value),
      //       itemExtent: 300,
      //       itemSnapping: true,
      //       children: images,
      //     );
      //   }
      // );

      return CarouselSlider.builder(
            key: createNodeWidgetGK(),
            itemCount: images.length,
            options: CarouselOptions(
              autoPlay: autoPlay,
              aspectRatio: aspectRatio,
              autoPlayInterval: Duration(seconds: autoPlayIntervalSecs),
              enlargeCenterPage: enlargeCenterPage,
              scrollDirection: axis.flutterValue,
            ),
            itemBuilder: (context, itemIndex, realIndex) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: images[itemIndex],
              );
            },
          );
    } catch (e) {
      return Error(key: createNodeWidgetGK(), FLUTTER_TYPE, color: Colors.red, size: 16, errorMsg: e.toString());
    }
  }

  @override
  bool canBeDeleted() => children.isEmpty;

  // @override
  // List<Type> addChildOnly() => [AssetImageNode, FSImageNode];

  @override
  Widget? widgetLogo() => Image.asset(
    fco.asset('lib/assets/images/pub.dev.png'),
    width: 16,
  );

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "Carousel";
}
