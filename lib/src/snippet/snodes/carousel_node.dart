import 'package:carousel_slider/carousel_slider.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_axis.dart';

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
  List<PTreeNode> createPropertiesList(BuildContext context) => [
        DecimalPropertyValueNode(
          snode: this,
          name: 'aspectRatio',
          decimalValue: aspectRatio,
          onDoubleChange: (newValue) => refreshWithUpdate(() => aspectRatio = newValue ?? 1.0),
          calloutButtonSize: const Size(130, 30),
        ),
        IntPropertyValueNode(
            snode: this,
            name: 'autoPlayInterval (secs)',
            intValue: autoPlayIntervalSecs,
            onIntChange: (newValue) => refreshWithUpdate(() => autoPlayIntervalSecs = newValue ?? 2),
            calloutButtonSize: const Size(180, 30),
            viaButton: false),
        BoolPropertyValueNode(
          snode: this,
          name: 'autoPlay',
          boolValue: autoPlay,
          onBoolChange: (newValue) => refreshWithUpdate(() => autoPlay = newValue ?? true),
        ),
        BoolPropertyValueNode(
          snode: this,
          name: 'enlargeCenterPage',
          boolValue: enlargeCenterPage,
          onBoolChange: (newValue) => refreshWithUpdate(() => enlargeCenterPage = newValue ?? true),
        ),
        EnumPropertyValueNode<AxisEnum?>(
          snode: this,
          name: 'axis',
          valueIndex: axis.index,
          onIndexChange: (newValue) => refreshWithUpdate(() => axis = AxisEnum.of(newValue) ?? AxisEnum.horizontal),
        ),
      ];

  @override
  String toSource(BuildContext context) => '''Carousel(
        children: super.children.map((child) => child.toWidget(context, this)).toList(),
      );
  ''';

  @override
  Widget toWidget(BuildContext context, STreeNode? parentNode) {
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
                            name, package:'flutter_content',
                          ),
                          fit: BoxFit.fill),
                    ),
                  ),
                ))
            .toList()
        : super
            .children
            .map((STreeNode node) => node is AssetImageNode
                ? node.toWidget(context, this)
                : node is FirebaseStorageImageNode
        ? node.toWidget(context, this)
        : const Placeholder(
                    child: Text('not an asset image!'),
                  ))
            .toList();

    possiblyHighlightSelectedNode();
    return CarouselSlider.builder(
      key: createNodeGK(),
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
  }

  @override
  bool canBeDeleted() => children.isEmpty;

  @override
  List<Type> addChildOnly() => [AssetImageNode, FirebaseStorageImageNode];

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "Carousel";
}
