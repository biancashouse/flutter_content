// ignore_for_file: constant_identifier_names

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_callouts/flutter_callouts.dart' show ArrowTypeEnum, AlignmentEnum, CalloutId, TargetId;
import 'package:flutter_content/src/snippet/pnodes/groups/button_style_properties.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/container_style_properties.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/text_style_properties.dart';
import 'package:flutter_content/src/snippet/snodes/snippet_root_node.dart';

typedef VoterId = String;
typedef PollOptionId = String;
typedef OptionVoteCountMap = Map<PollOptionId, int>;
typedef UserVoterRecord = ({PollOptionId? optionId, int? when});

typedef UnconfirmedEaRecord = ({
  String ea,
  String token,
});

typedef UMLRecord = ({
  String? text,
  String? encodedText,
  Uint8List? bytes,
  double? width,
  double? height
});

typedef TextStyleName = String;
typedef ButtonStyleName = String;
typedef ContainerStyleName = String;
typedef GoogleFontName = String;
typedef SnippetName = String;
typedef BucketName = String;
typedef BranchName = String;
typedef PanelName = String;
typedef SnippetPlaceName = String; // panel or placeholder name
// typedef RouteName = String;
// typedef RouteName = String;  // Go Route Page Name
typedef RoutePath = String; // Go Route Path
// typedef TargetId = int;
typedef EmailAddress = String;
typedef RouteName = String; // Go Route Page Name
// typedef BucketName = String;
// typedef TextStyleName = String;
typedef VersionId = String;
typedef VersionIdHistory = List<VersionId>;
typedef EncodedJson = String;
typedef EncodedSnippetJson = String;
typedef JsonMap = Map<String, dynamic>;
typedef SizeFunc = Size Function();
typedef PosFunc = Offset Function();

typedef DoubleFunc = double Function();

typedef HandlerName = String;

typedef PropertyName = String;

typedef ButtonStyleFunc = ButtonStyle Function();

// typedef VersionIdHistory = List<VersionId>;
typedef SnippetVersions = Map<VersionId, SnippetRootNode>;
typedef VersionedSnippet = (VersionId, SnippetRootNode);
// typedef EncodedJson = String;
typedef SnippetMap = Map<SnippetName, SnippetRootNode>;
// typedef EncodedSnippetJson = String;
// typedef SizeFunc = Size Function();
// typedef PosFunc = Offset Function();

// typedef DoubleFunc = double Function();

// typedef CalloutConfigChangedF = void Function(AlignmentEnum newTA, ArrowTypeEnum newAT);

typedef CalloutConfigChangedF = void Function(
    AlignmentEnum newTA, ArrowTypeEnum newAT);

typedef MaterialAppHomeFunc = Widget Function();
typedef MaterialAppThemeFunc = ThemeData Function();
// typedef CAPIBlocFunc = CAPIBloC Function();

typedef GksByFeature = Map<CalloutId, GlobalKey>;
typedef GksByTargetId = Map<TargetId, GlobalKey>;
typedef FeatureList = List<CalloutId>;

typedef StyleNameChangeCallback = void Function(String? styleName);
typedef SuggestionSelectionCallback = void Function(String selectedSuggestion);
typedef TextStylePropertiesChangeCallback = void Function(TextStyleProperties newTSProps, bool refreshPTree);
typedef ButtonStylePropertiesChangeCallback = void Function(ButtonStyleProperties newBSProps, bool refreshPTree);
typedef ContainerStylePropertiesChangeCallback = void Function(ContainerStyleProperties newCSProps, bool refreshPTree);

// typedef FeaturedWidgetHelpSnippetBuilder = Widget Function(
//     BuildContext context, FeaturedWidget? parent);
// typedef FeaturedWidgetActionF = void Function(
//     BuildContext, DiscoveryController);

// typedef TextStyleF = TextStyle Function();
// typedef TextAlignF = TextAlign Function();

// typedef JSON = Map<String, dynamic>;
// typedef SnippetJson = String;
// typedef Expansions = Set<STreeNode>;
//
// typedef SetStateF = void Function(VoidCallback f);
//

//deprecated
typedef ColorValue = int;

// typedef PassBlocF = void Function(CAPIBloc);
// typedef PassGlobalKeyF = void Function(GlobalKey);

// typedef TextAlignCallback = void Function(NodeTextAlign value);
// typedef AnimateArrowFunc = bool Function();
// typedef ArrowTypeFunc = ArrowType Function();
// typedef TextStyleFunc = TextStyle Function();
// typedef TextAlignFunc = TextAlign Function();

// typedef Adder<Node> = void Function({Node? parentNode, required Node selectedNode, required Node newNode});
