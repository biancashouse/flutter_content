
import 'package:flutter_content/flutter_content.dart';

bool testSNodeSerialization() {
  if (test_ColorModel() &&
      test_UpTo6Colors() &&
      test_TextStyleProperties() &&
      test_AppBarNode() &&
      test_GenericSingleChildNode() &&
      test_GenericMultiChildNode() &&
      test_NamedPreferredSizeSC() &&
      // test_ScaffoldNode() &&
      test_ContainerStyleProperties() &&
      test_ContainerNode()) {
    return true;
  }

  return false;
}

bool test_ColorModel() {
  // 1. Arrange: Create a complex node structure.
  final originalColor = ColorModel.blue();

  // 2. Act: Serialize the node to a JSON map and then deserialize it back.
  final originalJson = originalColor.toJson();
  final originalMap = originalColor.toMap();
  final decodedColor = ColorModelMapper.fromJson(originalJson);
  final decodedJson = decodedColor.toJson();

  // 3. Assert: Check if the decoded node is identical to the original.
  if (originalJson != decodedJson) {
    print('failure');
    return false;
  }

  return true;
}

bool test_UpTo6Colors() {
  // 1. Arrange: Create a complex node structure.
  final originalColors = UpTo6Colors(
    color1: ColorModel.blue(),
    color2: ColorModel.red(),
  );

  // 2. Act: Serialize the node to a JSON map and then deserialize it back.
  final originalJson = originalColors.toJson();
  final originalMap = originalColors.toMap();
  final decodedColor = UpTo6ColorsMapper.fromJson(originalJson);
  final decodedJson = decodedColor.toJson();

  // 3. Assert: Check if the decoded node is identical to the original.
  if (originalJson != decodedJson) {
    print('failure');
    return false;
  }

  return true;
}

bool test_ContainerNode() {
  // 1. Arrange: Create a complex node structure.
  final originalNode = ContainerNode(
    csPropGroup: ContainerStyleProperties(
      width: 150.0,
      height: 80.0,
      margin: EdgeInsetsValue(left: 8.0, right: 8.0, top: 8.0, bottom: 8.0),
      padding: EdgeInsetsValue(left: 16.0, right: 16.0, top: 4.0, bottom: 4.0),
      alignment: AlignmentEnum.center,
      fillColors: UpTo6Colors(color1: ColorModel.blue()),
      // Blue
      borderColors: UpTo6Colors(color1: ColorModel.black()),
      // Black
      borderThickness: 2.0,
      borderRadius: 12.0,
      radialGradient: true,
    ),
    child: TextNode(text: 'Test', tsPropGroup: TextStyleProperties()),
  );

  // 2. Act: Serialize the node to a JSON map and then deserialize it back.
  final originalJson = originalNode.toJson();
  final originalMap = originalNode.toMap();
  final decodedContainerNode = ContainerNodeMapper.fromJson(originalJson);
  final decodedJson = decodedContainerNode.toJson();

  // 3. Assert: Check if the decoded node is identical to the original.
  if (originalJson != decodedJson) {
    print('failure');
    return false;
  }

  return true;
}

bool test_ContainerStyleProperties() {
  // 1. Arrange: Create a complex node structure.
  final originalCSP = ContainerStyleProperties(
    width: 150.0,
    height: 80.0,
    margin: EdgeInsetsValue(left: 8.0, right: 8.0, top: 8.0, bottom: 8.0),
    padding: EdgeInsetsValue(left: 16.0, right: 16.0, top: 4.0, bottom: 4.0),
    alignment: AlignmentEnum.center,
    fillColors: UpTo6Colors(color1: ColorModel.blue()),
    // Blue
    borderColors: UpTo6Colors(color1: ColorModel.black()),
    // Black
    borderThickness: 2.0,
    borderRadius: 12.0,
    radialGradient: true,
  );

  // 2. Act: Serialize the node to a JSON map and then deserialize it back.
  final originalJson = originalCSP.toJson();
  final originalMap = originalCSP.toMap();
  final decodedContainerNode = ContainerStylePropertiesMapper.fromJson(
    originalJson,
  );
  final decodedJson = decodedContainerNode.toJson();

  // 3. Assert: Check if the decoded node is identical to the original.
  if (originalJson != decodedJson) {
    print('failure');
    return false;
  }

  return true;
}

bool test_TextStyleProperties() {
  // 1. Arrange: Create a complex node structure.
  final original = TextStyleProperties();

  // 2. Act: Serialize the node to a JSON map and then deserialize it back.
  final originalJson = original.toJson();
  final originalMap = original.toMap();
  final decodedContainerNode = TextStylePropertiesMapper.fromJson(originalJson);
  final decodedJson = decodedContainerNode.toJson();

  // 3. Assert: Check if the decoded node is identical to the original.
  if (originalJson != decodedJson) {
    print('TextStyleProperties failure');
    return false;
  }

  return true;
}

bool test_GenericSingleChildNode() {
  // 1. Arrange: Create a complex node structure.
  final originalCSP = NamedSC(
    propertyName: 'title',
    child: TextNode(text: 'my title', tsPropGroup: TextStyleProperties()),
  );

  // 2. Act: Serialize the node to a JSON map and then deserialize it back.
  final originalJson = originalCSP.toJson();
  final originalMap = originalCSP.toMap();
  final decodedContainerNode = NamedSCMapper.fromJson(
    originalJson,
  );
  final decodedJson = decodedContainerNode.toJson();

  // 3. Assert: Check if the decoded node is identical to the original.
  if (originalJson != decodedJson) {
    print('GenericSingleChildNode failure');
    return false;
  }

  return true;
}

bool test_GenericMultiChildNode() {
  // 1. Arrange: Create a complex node structure.
  final originalCSP = NamedMC(
    propertyName: 'actions',
    children: [],
  );

  // 2. Act: Serialize the node to a JSON map and then deserialize it back.
  final originalJson = originalCSP.toJson();
  final originalMap = originalCSP.toMap();
  final decodedContainerNode = NamedMCMapper.fromJson(
    originalJson,
  );
  final decodedJson = decodedContainerNode.toJson();

  // 3. Assert: Check if the decoded node is identical to the original.
  if (originalJson != decodedJson) {
    print('GenericMultiChildNode failure');
    return false;
  }

  return true;
}

bool test_NamedPreferredSizeSC() {
  // 1. Arrange: Create a complex node structure.
  final original = NamedPS(
    propertyName: 'actions',
    child: PlaceholderNode(),
  );

  // 2. Act: Serialize the node to a JSON map and then deserialize it back.
  final originalJson = original.toJson();
  final originalMap = original.toMap();
  final decodedContainerNode =
      NamedPSMapper.fromJson(originalJson);
  final decodedJson = decodedContainerNode.toJson();

  // 3. Assert: Check if the decoded node is identical to the original.
  if (originalJson != decodedJson) {
    print('NamedPreferredSizeSC failure');
    return false;
  }

  return true;
}

bool test_AppBarNode() {
  // 1. Arrange: Create a complex node structure.
  final original = AppBarNode(
    // tabBarName: uniqueTabBarName,
    bgColor: ColorModel.grey(),
    title: NamedSC(
      propertyName: 'title',
      child: TextNode(text: 'my title', tsPropGroup: TextStyleProperties()),
    ),
    titleTextStyle: TextStyleProperties(),
    actions: NamedMC(propertyName: 'actions', children: []),
    leading: NamedSC(propertyName: 'leading'),
    bottom: NamedPS(
      propertyName: 'bottom',
      child: TabBarNode(
        name: 'some-tabbar-name',
        labelTSPropGroup: TextStyleProperties(),
        children: [
          TextNode(text: 'tab 1', tsPropGroup: TextStyleProperties()),
          TextNode(text: 'Tab 2', tsPropGroup: TextStyleProperties()),
        ],
      ),
    ),
  );

  // 2. Act: Serialize the node to a JSON map and then deserialize it back.
  final originalJson = original.toJson();
  final originalMap = original.toMap();
  final decodedContainerNode = AppBarNodeMapper.fromJson(originalJson);
  final decodedJson = decodedContainerNode.toJson();

  // 3. Assert: Check if the decoded node is identical to the original.
  if (originalJson != decodedJson) {
    print('AppBarNode failure');
    return false;
  }

  return true;
}

bool test_ScaffoldNode() {
  // 1. Arrange: Create a complex node structure.
  final originalScaffold = ScaffoldNode(
    bgColor: ColorModel.grey(),
    appBar: NamedPS(
      propertyName: 'appBar',
      child: AppBarNode(
        // tabBarName: uniqueTabBarName,
        bgColor: ColorModel.grey(),
        title: NamedSC(
          propertyName: 'title',
          child: TextNode(text: 'my title', tsPropGroup: TextStyleProperties()),
        ),
        titleTextStyle: TextStyleProperties(),
        actions: NamedMC(propertyName: 'actions', children: []),
        leading: NamedSC(propertyName: 'leading'),
        bottom: NamedPS(propertyName: 'bottom'),
      ),
    ),
    body: NamedSC(
      propertyName: 'body',
      // child: TabBarViewNode(
      //   tabBarName: 'some-tabbar-name',
      //   children: [PlaceholderNode(), PlaceholderNode()],
      // ),
    ),
    canShowEditorLoginBtn: true,
  );

  // 2. Act: Serialize the node to a JSON map and then deserialize it back.
  final originalJson = originalScaffold.toJson();
  final originalMap = originalScaffold.toMap();
  final decodedScaffoldNode = ScaffoldNodeMapper.fromJson(originalJson);
  final decodedJson = decodedScaffoldNode.toJson();

  // 3. Assert: Check if the decoded node is identical to the original.
  if (originalJson != decodedJson) {
    print('ScaffoldNode failure');
    print('-----------------------------');
    print(originalJson);
    print('-----------------------------');
    print(decodedJson);
    return false;
  }

  return true;
}

var json = {
  "bgColor": {
    "a": 1,
    "r": 0.6196078431372549,
    "g": 0.6196078431372549,
    "b": 0.6196078431372549,
  },
  "appBar": {
    "propertyName": "appBar",
    "width": null,
    "height": null,
    "child": {
      "bgColor": null,
      "fgColor": null,
      "toolbarHeight": null,
      "titleTextStyle": {
        "fontFamily": null,
        "fontSize": null,
        "fontSizeName": null,
        "fontStyle": null,
        "fontWeight": null,
        "lineHeight": null,
        "letterSpacing": null,
        "color": null,
      },
      "leading": {
        "propertyName": "leading",
        "child": null,
        "snode": "SC",
        "sc": "GenericSingleChildNode",
      },
      "title": {
        "propertyName": "title",
        "child": null,
        "snode": "SC",
        "sc": "GenericSingleChildNode",
      },
      "bottom": {
        "propertyName": "bottom",
        "width": null,
        "height": null,
        "child": null,
        "snode": "SC",
        "sc": "NamedPreferredSizeSC",
      },
      "actions": {
        "propertyName": "actions",
        "children": [],
        "snode": "MC",
        "mc": "GenericMultiChildNode",
      },
      "snode": "CL",
      "cl": "AppBarNode",
    },
    "snode": "SC",
    "sc": "NamedPreferredSizeSC",
  },
  "body": {
    "propertyName": "body",
    "child": null,
    "snode": "SC",
    "sc": "GenericSingleChildNode",
  },
  "canShowEditorLoginBtn": true,
  "snode": "CL",
  "cl": "ScaffoldNode",
};
