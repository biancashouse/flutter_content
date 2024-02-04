// ignore_for_file: constant_identifier_names

library flutter_content;

import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/bloc/capi_bloc.dart';
// import 'package:flutter_content/src/measuring/offstage_overlay.dart';
import 'package:get_it/get_it.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'src/bloc/bloc_observer.dart';
import 'src/feature_discovery/discovery_controller.dart';
import 'src/feature_discovery/featured_widget.dart';
import 'src/snippet/pnodes/enums/enum_alignment.dart';
import 'src/snippet/pnodes/enums/enum_arrow_type.dart';
import 'src/snippet/snodes/named_text_style.dart';

// export 'src/target_config/content/snippet_editor/node_properties/properties_drawer.dart';
// export 'src/target_config/content/snippet_editor/node_properties/tree_drawer.dart';
export 'src/app/constant_scrolling_behavior.dart';
export 'src/blink.dart';

// export 'src/feature_discovery/discovery_controller.dart';
// export 'src/feature_discovery/featured_widget.dart';
export 'src/feature_discovery/flat_icon_button_with_callout_player.dart';
export 'src/measuring/find_global_rect.dart';
export 'src/measuring/measure_sizebox.dart';
export 'src/measuring/text_measuring.dart';
export 'src/model/model.dart';
export 'src/overlays/callouts/callout.dart';
export 'src/overlays/overlay_manager.dart';
export 'src/overlays/callouts/callout_config.dart';
export 'src/overlays/callouts/toast.dart';
export 'src/target_config/content/expansion_tile_section.dart';
export 'src/snippet/node.dart';
export 'src/snippet/snode.dart';
export 'src/snippet/pnode.dart';
export 'src/snippet/snodes/align_node.dart';
export 'src/snippet/snodes/asset_image_node.dart';
export 'src/snippet/snodes/button_node.dart';
export 'src/snippet/snodes/center_node.dart';
export 'src/snippet/snodes/childless_node.dart';
export 'src/snippet/snodes/column_node.dart';
export 'src/snippet/snodes/container_node.dart';
export 'src/snippet/snodes/default_text_style_node.dart';
export 'src/snippet/snodes/elevated_button_node.dart';
export 'src/snippet/snodes/expanded_node.dart';
export 'src/snippet/snodes/filled_button_node.dart';
export 'src/snippet/snodes/flex_node.dart';
export 'src/snippet/snodes/flexible_node.dart';
export 'src/snippet/snodes/icon_button_node.dart';
export 'src/snippet/snodes/inlinespan_node.dart';
export 'src/snippet/snodes/multi_child_node.dart';
export 'src/snippet/snodes/named_text_style.dart';
export 'src/snippet/snodes/network_image_node.dart';

// content
export 'src/snippet/snodes/outlined_button_node.dart';
export 'src/snippet/snodes/padding_node.dart';
export 'src/snippet/snodes/positioned_node.dart';
export 'src/snippet/snodes/rich_text_node.dart';
export 'src/snippet/snodes/row_node.dart';
export 'src/snippet/snodes/single_child_node.dart';
export 'src/snippet/snodes/sizedbox_node.dart';
export 'src/snippet/snodes/placeholder_node.dart';
export 'src/snippet/snodes/snippet_root_node.dart';
export 'src/snippet/snodes/title_snippet_root_node.dart';
export 'src/snippet/snodes/subtitle_snippet_root_node.dart';
export 'src/snippet/snodes/content_snippet_root_node.dart';
export 'src/snippet/snodes/snippet_ref_node.dart';
export 'src/snippet/snodes/stack_node.dart';
export 'src/snippet/snodes/text_button_node.dart';
export 'src/snippet/snodes/text_node.dart';
export 'src/snippet/snodes/textspan_node.dart';
export 'src/snippet/snodes/widgetspan_node.dart';
export 'src/snippet/snodes/iframe_node.dart';
export 'src/snippet/snodes/directory_node.dart';
export 'src/snippet/snodes/file_node.dart';
export 'src/snippet/snodes/split_view_node.dart';
export 'src/snippet/snodes/menu_bar_node.dart';
export 'src/snippet/snodes/submenu_button_node.dart';
export 'src/snippet/snodes/menu_item_button_node.dart';
export 'src/snippet/snodes/carousel_node.dart';
export 'src/snippet/snodes/target_wrapper_node.dart';
export 'src/snippet/snodes/target_group_wrapper_node.dart';
export 'src/snippet/snodes/aspect_ratio_node.dart';
export 'src/snippet/snodes/google_drive_iframe_node.dart';
export 'src/snippet/snodes/poll_node.dart';
export 'src/snippet/snodes/poll_option_node.dart';
export 'src/snippet/snodes/gap_node.dart';
export 'src/snippet/snodes/step_node.dart';
export 'src/snippet/snodes/stepper_node.dart';
export 'src/snippet/snodes/singlechildscrollview_node.dart';
export 'src/snippet/snodes/transformable_scaffold_node.dart';
export 'src/snippet/snodes/scaffold_node.dart';
export 'src/snippet/snodes/appbar_node.dart';
export 'src/snippet/snodes/tabbar_node.dart';
export 'src/snippet/snodes/tabbarview_node.dart';
export 'src/snippet/snodes/generic_single_child_node.dart';
export 'src/snippet/snodes/generic_multi_child_node.dart';

export 'src/text_editing/text_editor.dart';
export 'src/useful.dart';
export 'src/widget_helper.dart';
export 'src/gotits/gotits_helper_string.dart';

// callouts
export 'src/bloc/capi_bloc.dart';
export 'src/bloc/snippet_bloc.dart';
export 'src/api/wrapper/material_app_wrapper.dart';
export 'src/api/wrapper/material_spa.dart';
export 'src/home_page_provider/flutter_content_page.dart';
export 'src/api/wrapper/multiple/target_group_wrapper.dart';
export 'src/api/wrapper/single/single_target_wrapper.dart';
export 'src/api/snippet_panel/snippet_panel.dart';
export 'src/api/wrapper/old_transformable_scaffold.dart';
export 'src/api/panel/files_or_file_panel.dart';

// const String getIt_offstageGK = "offstage:gk";
// const String getIt_offstageOverlay = "offstage-widget-builder";
const String getIt_scaffoldGK = "scaffold:gk";
const String getIt_calloutGKs = "calloutGKs:feature";
const String getIt_singleTargetBtnFeatures = "singleTargetBtns:feature";
const String getIt_singleTargets = "singleTargets:name";
const String getIt_multiTargets = "multiTargets:uid";
// const String getIt_snippets = "snippets:snippetName";
const String getIt_textFields = "snippets:textFields";

const String SELECTED_NODE_BORDER_CALLOUT = "selected-node-border-callout";
const String TREENODE_MENU_CALLOUT = "TreeNodeMenu-callout";
const String NODE_PROPERTY_CALLOUT_BUTTON = "NodePropertyCalloutButton";

typedef Feature = String;

typedef EmailAddress = String;
typedef VoterId = String;
typedef PollOptionId = String;  // 'a', 'b', 'c' etc.
typedef OptionCountsAndVoterRecord = ({Map<PollOptionId, int>? optionVoteCountMap, PollOptionId? userVotedForOptionId, int? when});

typedef SnippetName = String;
typedef PanelName = String;
typedef EncodedSnippetJson = String;

typedef SizeFunc = Size Function();
typedef PosFunc = Offset Function();
typedef TargetGroupWrapperName = String;

typedef DoubleFunc = double Function();

typedef TargetKeyFunc = GlobalKey? Function();
// typedef CalloutConfigChangedF = void Function(AlignmentEnum newTA, ArrowTypeEnum newAT);

typedef HandlerName = String;

typedef PropertyName = String;

typedef CalloutConfigChangedF = void Function(AlignmentEnum newTA, ArrowTypeEnum newAT);

typedef MaterialAppHomeFunc = Widget Function();
typedef MaterialAppThemeFunc = ThemeData Function();
typedef CAPIBlocFunc = CAPIBloC Function();

typedef GKMap = Map<Feature, GlobalKey>;
typedef FeatureList = List<Feature>;

typedef FeaturedWidgetHelpContentBuilder = Widget Function(BuildContext context, FeaturedWidget? parent);
typedef FeaturedWidgetActionF = void Function(BuildContext, DiscoveryController);

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

class FlutterContent {
  final bool skipAssetPkgName;  // when using assets from within the flutter_content pkg itself
  final List<String> googleFontNames;
  final Map<String, NamedTextStyle> namedStyles;

  FlutterContent.init({
    this.googleFontNames = const [
      'Roboto',
      'Roboto Mono',
      'Merriweather',
      'Merriweather Sans',
    ],
    this.namedStyles = const {},
    this.skipAssetPkgName = false,  // would only use true when pkg dir is actually inside current project
  }) {
    GetIt.I.reset(dispose: true).then((_) {
      if (!GetIt.I.isRegistered<FlutterContent>()) {
        GetIt.I.registerSingleton<FlutterContent>(this);
      }
      // if (!GetIt.I.isRegistered<GlobalKey>(instanceName: getIt_offstageGK)) {
      //   GetIt.I.registerSingleton<GlobalKey>(GlobalKey(debugLabel: 'offstage'), instanceName: getIt_offstageGK);
      // }
      // if (!GetIt.I.isRegistered<OffstageOverlay>(instanceName: getIt_offstageOverlay)) {
      //   GetIt.I.registerSingleton<OffstageOverlay>(OffstageOverley(), instanceName: getIt_offstageOverlay);
      // }
      if (!GetIt.I.isRegistered<GKMap>(instanceName: getIt_calloutGKs)) {
        GetIt.I.registerSingleton<GKMap>({}, instanceName: getIt_calloutGKs);
      }
      if (!GetIt.I.isRegistered<FeatureList>(instanceName: getIt_singleTargetBtnFeatures)) {
        GetIt.I.registerSingleton<FeatureList>([], instanceName: getIt_singleTargetBtnFeatures);
      }
      if (!GetIt.I.isRegistered<GKMap>(instanceName: getIt_singleTargets)) {
        GetIt.I.registerSingleton<GKMap>({}, instanceName: getIt_singleTargets);
      }
      if (!GetIt.I.isRegistered<GKMap>(instanceName: getIt_multiTargets)) {
        GetIt.I.registerSingleton<GKMap>({}, instanceName: getIt_multiTargets);
      }
      // if (!GetIt.I.isRegistered<GKMap>(instanceName: getIt_snippets)) {
      //   GetIt.I.registerSingleton<GKMap>({}, instanceName: getIt_snippets);
      // }
      if (!GetIt.I.isRegistered<GlobalKey>(instanceName: getIt_scaffoldGK)) {
        GetIt.I.registerSingleton<GlobalKey>(GlobalKey(debugLabel: 'scaffold'), instanceName: getIt_scaffoldGK);
      }
      if (!GetIt.I.isRegistered<List<TextField>>(instanceName: getIt_textFields)) {
        GetIt.I.registerSingleton<List<TextField>>([], instanceName: getIt_textFields);
      }
    });
    Bloc.observer = MyGlobalObserver();
  }
}
