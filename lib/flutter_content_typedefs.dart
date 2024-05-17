// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_content/src/bloc/capi_bloc.dart';
import 'package:flutter_content/src/bloc/snippet_bloc.dart';
import 'package:flutter_content/src/feature_discovery/discovery_controller.dart';
import 'package:flutter_content/src/feature_discovery/featured_widget.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_alignment.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_arrow_type.dart';
import 'package:flutter_content/src/snippet/snode.dart';
import 'package:flutter_content/src/snippet/snodes/snippet_root_node.dart';

typedef Feature = String;

typedef EmailAddress = String;
typedef VoterId = String;
typedef PollOptionId = String; // 'a', 'b', 'c' etc.
typedef OptionCountsAndVoterRecord = ({
  Map<PollOptionId, int>? optionVoteCountMap,
  PollOptionId? userVotedForOptionId,
  int? when
});

typedef SnippetName = String;
typedef BucketName = String;
typedef BranchName = String;
typedef PanelName = String;
typedef RouteName = String;
typedef PageName = String;
typedef TargetId = int;
typedef VersionId = String;
// typedef VersionIdHistory = List<VersionId>;
typedef SnippetVersions = Map<VersionId, SnippetRootNode>;
typedef VersionedSnippet = (VersionId, SnippetRootNode);
typedef EncodedJson = String;
typedef SnippetMap = Map<SnippetName, SnippetRootNode>;
typedef EncodedSnippetJson = String;
typedef JsonMap = Map<String, dynamic>;
typedef SizeFunc = Size Function();
typedef PosFunc = Offset Function();

typedef DoubleFunc = double Function();

typedef TargetKeyFunc = GlobalKey? Function();
// typedef CalloutConfigChangedF = void Function(AlignmentEnum newTA, ArrowTypeEnum newAT);

typedef HandlerName = String;

typedef PropertyName = String;

typedef CalloutConfigChangedF = void Function(
    AlignmentEnum newTA, ArrowTypeEnum newAT);

typedef MaterialAppHomeFunc = Widget Function();
typedef MaterialAppThemeFunc = ThemeData Function();
typedef CAPIBlocFunc = CAPIBloC Function();

typedef GksByFeature = Map<Feature, GlobalKey>;
typedef GksByTargetId = Map<TargetId, GlobalKey>;
typedef FeatureList = List<Feature>;

typedef FeaturedWidgetHelpContentBuilder = Widget Function(
    BuildContext context, FeaturedWidget? parent);
typedef FeaturedWidgetActionF = void Function(
    BuildContext, DiscoveryController);

typedef TextStyleF = TextStyle Function();
typedef TextAlignF = TextAlign Function();

typedef JSON = Map<String, dynamic>;
typedef SnippetJson = String;
typedef Expansions = Set<STreeNode>;

typedef SnippetBlocFunc = SnippetBloC Function();

typedef SetStateF = void Function(VoidCallback f);

// typedef PassBlocF = void Function(CAPIBloc);
// typedef PassGlobalKeyF = void Function(GlobalKey);

// typedef TextAlignCallback = void Function(NodeTextAlign value);
// typedef AnimateArrowFunc = bool Function();
// typedef ArrowTypeFunc = ArrowType Function();
// typedef TextStyleFunc = TextStyle Function();
// typedef TextAlignFunc = TextAlign Function();

// typedef Adder<Node> = void Function({Node? parentNode, required Node selectedNode, required Node newNode});
