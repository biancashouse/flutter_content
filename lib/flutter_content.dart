// ignore_for_file: constant_identifier_names

library flutter_content;

import 'dart:math';

import 'package:bh_shared/bh_shared.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_callouts/flutter_callouts.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/model/firestore_model_repo.dart';
import 'package:flutter_content/src/snippet/snodes/widget/fs_folder_node.dart';
import 'package:go_router/go_router.dart';

import 'src/api/snippet_panel/clipboard_view.dart';
import 'src/bloc/bloc_observer.dart';
import 'src/model/model_repo.dart';

export 'package:flutter_content/src/api/snippet_panel/callout_snippet_tree_and_properties_content.dart';

export 'src/api/app/dynamic_page_route.dart';
export 'src/api/app/editable_page.dart';
export 'src/api/app/editable_page_route.dart';
export 'src/api/app/fc_app.dart';
export 'src/api/app/zoomer.dart';
export 'src/api/snippet_panel/snippet_panel.dart';
export 'src/api/snippet_panel/snippet_templates.dart';
// callouts
export 'src/bloc/capi_bloc.dart';
export 'src/bloc/capi_event.dart';
export 'src/bloc/capi_state.dart';
// export 'src/feature_discovery/discovery_controller.dart';
// export 'src/feature_discovery/featured_widget.dart';
export 'src/gotits/gotits_helper_string.dart';
export 'src/gsi/sign_in_button.dart';
export 'src/measuring/find_global_rect.dart';
export 'src/measuring/measure_sizebox.dart';
export 'src/measuring/text_measuring.dart';
export 'src/model/app_info_model.dart';
// export 'src/model/branch_model.dart';
export 'src/model/snippet_info_model.dart';
export 'src/model/target_group_model.dart';
export 'src/model/target_model.dart';
export 'src/passwordless/passwordless_mixin.dart';
export 'src/snippet/node.dart';
export 'src/snippet/pnode.dart';
export 'src/snippet/pnodes/enums/enum_axis.dart';
export 'src/snippet/pnodes/enums/enum_material3_text_size.dart';
export 'src/snippet/snode.dart';
export 'src/snippet/snodes/align_node.dart';
export 'src/snippet/snodes/appbar_node.dart';
export 'src/snippet/snodes/aspect_ratio_node.dart';
export 'src/snippet/snodes/asset_image_node.dart';
export 'src/snippet/snodes/button_node.dart';
export 'src/snippet/snodes/carousel_node.dart';
export 'src/snippet/snodes/center_node.dart';
export 'src/snippet/snodes/childless_node.dart';
export 'src/snippet/snodes/chip_node.dart';
export 'src/snippet/snodes/column_node.dart';
export 'src/snippet/snodes/container_node.dart';
export 'src/snippet/snodes/content_snippet_root_node.dart';
export 'src/snippet/snodes/default_text_style_node.dart';
export 'src/snippet/snodes/directory_node.dart';
export 'src/snippet/snodes/edgeinsets_node_value.dart';
export 'src/snippet/snodes/elevated_button_node.dart';
export 'src/snippet/snodes/expanded_node.dart';
export 'src/snippet/snodes/file_node.dart';
export 'src/snippet/snodes/filled_button_node.dart';
export 'src/snippet/snodes/firebase_storage_image_node.dart';
export 'src/snippet/snodes/flex_node.dart';
export 'src/snippet/snodes/flexible_node.dart';
export 'src/snippet/snodes/fs_folder_node.dart';
export 'src/snippet/snodes/gap_node.dart';
export 'src/snippet/snodes/generic_multi_child_node.dart';
export 'src/snippet/snodes/generic_single_child_node.dart';
export 'src/snippet/snodes/google_drive_iframe_node.dart';
export 'src/snippet/snodes/hotspots/hotspots_node.dart';
export 'src/snippet/snodes/hotspots/widgets/callout_snippet_content.dart';
export 'src/snippet/snodes/hotspots/widgets/config_toolbar/callout_config_toolbar.dart';
export 'src/snippet/snodes/hotspots/widgets/targets_wrapper.dart';
export 'src/snippet/snodes/icon_button_node.dart';
export 'src/snippet/snodes/iframe_node.dart';
export 'src/snippet/snodes/inlinespan_node.dart';
export 'src/snippet/snodes/markdown_node.dart';
export 'src/snippet/snodes/menu_bar_node.dart';
export 'src/snippet/snodes/menu_item_button_node.dart';
export 'src/snippet/snodes/multi_child_node.dart';
export 'src/snippet/snodes/named_text_style.dart';
// content
export 'src/snippet/snodes/outlined_button_node.dart';
export 'src/snippet/snodes/padding_node.dart';
export 'src/snippet/snodes/placeholder_node.dart';
export 'src/snippet/snodes/poll_node.dart';
export 'src/snippet/snodes/poll_option_node.dart';
export 'src/snippet/snodes/positioned_node.dart';
export 'src/snippet/snodes/rich_text_node.dart';
export 'src/snippet/snodes/row_node.dart';
export 'src/snippet/snodes/scaffold_node.dart';
export 'src/snippet/snodes/single_child_node.dart';
export 'src/snippet/snodes/singlechildscrollview_node.dart';
export 'src/snippet/snodes/sizedbox_node.dart';
export 'src/snippet/snodes/snippet_root_node.dart';
export 'src/snippet/snodes/split_view_node.dart';
export 'src/snippet/snodes/stack_node.dart';
export 'src/snippet/snodes/step_node.dart';
export 'src/snippet/snodes/stepper_node.dart';
export 'src/snippet/snodes/submenu_button_node.dart';
export 'src/snippet/snodes/subtitle_snippet_root_node.dart';
export 'src/snippet/snodes/tabbar_node.dart';
export 'src/snippet/snodes/tabbarview_node.dart';
export 'src/snippet/snodes/text_button_node.dart';
export 'src/snippet/snodes/text_node.dart';
export 'src/snippet/snodes/textspan_node.dart';
export 'src/snippet/snodes/title_snippet_root_node.dart';
export 'src/snippet/snodes/uml_image_node.dart';
export 'src/snippet/snodes/widgetspan_node.dart';
export 'src/snippet/snodes/wrap_node.dart';
export 'src/snippet/snodes/yt_node.dart';
// export 'src/snippet/snodes/fs_bucket_node.dart';
// export 'src/snippet/snodes/fs_directory_node.dart';
// export 'src/snippet/snodes/fs_file_node.dart';

// const String getIt_offstageGK = "offstage:gk";
// const String getIt_offstageOverlay = "offstage-widget-builder";
// const String getIt_capiBloc = "capiBloC";
// const String getIt_scaffoldGK = "scaffold:gk";
// const String getIt_calloutGKs = "calloutGKs:feature";
// const String getIt_singleTargetBtnFeatures = "singleTargetBtns:feature";
// const String getIt_singleTargets = "singleTargets:name";
// const String getIt_multiTargets = "multiTargets:uid";
// const String getIt_snippets = "snippets:snippetName";
// const String getIt_textFields = "snippets:textFields";

export 'src/typedefs.dart';

FlutterContentMixins fco = FlutterContentMixins.instance;

const String SELECTED_NODE_BORDER_CALLOUT = "selected-node-border-callout";
const String TREENODE_MENU_CALLOUT = "TreeNodeMenu-callout";
const String NODE_PROPERTY_CALLOUT_BUTTON = "NodePropertyCalloutButton";

/// this is a global container
class FlutterContentMixins
    with
        MeasuringMixin,
        CalloutMixin,
        RootContextMixin,
        SystemMixin,
        WidgetHelperMixin,
        CanvasMixin,
        RootContextMixin,
        MQMixin,
        CanvasMixin,
        GotitsMixin,
        PasswordlessMixin,
        // ImageCaptureMixin,
        LocalStorageMixin {
  FlutterContentMixins._internal() // Private constructor
  {
    logi('FlutterContent._internal()');
  }

  static final FlutterContentMixins _instance =
      FlutterContentMixins._internal();

  static FlutterContentMixins get instance {
    FlutterCalloutMixins.instance;
    return _instance;
  }

  // called by _initApp() to set the late variables
  Future<CAPIBloC> init({
    required String appName,
    required String editorPassword,
    FirebaseOptions? fbOptions,
    bool useEmulator = false,
    bool useFBStorage = false,
    final IModelRepository? testModelRepo,
    // created in tests by a when(mockRepository.getCAPIModel(modelName: modelName...
    final Widget? testWidget,
    List<String> googleFontNames = const [
      'Roboto',
      'Roboto Mono',
      'Merriweather',
      'Merriweather Sans',
    ],
    Map<String, void Function(GlobalKey? gk)> namedCallbacks = const {},
    Map<String, TextStyle> namedTextStyles = const {},
    Map<String, ButtonStyle> namedButtonStyles = const {},
    required RoutingConfig routingConfig,
    required String initialRoutePath,
    bool skipAssetPkgName =
        false, // would only use true when pkg dir is actually inside current project
  }) async {
    stopwatch.start();

    debugPrint('init() ${stopwatch.elapsedMilliseconds}');

    _appName = appName;
    _editorPassword = editorPassword;
    _googleFontNames = googleFontNames;
    _namedTextStyles = namedTextStyles;
    _namedButtonStyles = namedButtonStyles;
    Bloc.observer = MyGlobalObserver();

    // Dynamic RoutingConfig - https://pub.dev/documentation/go_router/latest/topics/Configuration-topic.html
    // setPathUrlStrategy();
    routingConfigVN = ValueNotifier<RoutingConfig>(routingConfig);
    router = GoRouter.routingConfig(
      debugLogDiagnostics: true,
      // initialLocation: initialRoutePath,
      routingConfig: routingConfigVN,
      errorBuilder: (context, state) {
        return Material(
          child: Text(
            state.error?.message ?? 'Unknown go error',
            textScaler: const TextScaler.linear(2.0),
          ),
        );
      },
    );

    // extract go routes
    void parseRouteConfig(List<String> names, List<GoRoute> routes) {
      for (GoRoute route in routes) {
        if (route.name != null) names.add(route.name!);
        parseRouteConfig(names, List.from(route.routes));
      }
    }

    logi('starting parseRouteConfig');
    parseRouteConfig(pagePaths, List.from(router.configuration.routes));
    logi('finished parseRouteConfig');

    logi('Routes--------------------------');
    logi(pagePaths.toString());
    logi('--------------------------------');

    if (fbOptions != null) {
      fco.logi('init 1. ${fco.stopwatch.elapsedMilliseconds}');

      modelRepo = FireStoreModelRepository(fbOptions);
      await (modelRepo as FireStoreModelRepository)
          .possiblyInitFireStoreRelatedAPIs(useEmulator: useEmulator);

      fco.logi('init 2. ${fco.stopwatch.elapsedMilliseconds}');

      // fetch model
      AppInfoModel? fbAppInfo = await modelRepo.getAppInfo();
      _appInfo = fbAppInfo ?? AppInfoModel();

      _gcrServerUrl = await modelRepo.getGcrServerUrl();

      fco.logi('init 3. ${fco.stopwatch.elapsedMilliseconds}');

      // add any snippet names that start with /, because they are also page pathnames
      for (String snippetName in _appInfo.snippetNames) {
        if (snippetName.startsWith('/') && !pagePaths.contains(snippetName)) {
          addRoute(newPath: snippetName, template: SnippetTemplateEnum.empty);
        }
      }
      pagePaths.sort();

      // await loadLatestSnippetMap();

      fco.logi('init 4. ${fco.stopwatch.elapsedMilliseconds}');

      if (useFBStorage) {
        loadFirebaseStorageFolders();
      }
    }

    fco.logi('init 5. ${fco.stopwatch.elapsedMilliseconds}');
    await initLocalStorage();
    fco.logi('init 6. ${fco.stopwatch.elapsedMilliseconds}');

    bool b = hiveBox.get("canEditContent") ?? false;
    canEditContent = ValueNotifier<bool>(b);

    // FutureBuilder requires this return
    CAPIBloC capiBloc = CAPIBloC(modelRepo: modelRepo);

    fco.logi('init 7. ${fco.stopwatch.elapsedMilliseconds}');
    return capiBloc;
  }

  bool emailIsValid(String theEA) => EmailValidator.validate(theEA);

  final stopwatch = Stopwatch();

  late IModelRepository modelRepo;

  // set by .init()
  String get appName => _appName;

  String get editorPassword => _editorPassword;

  late String _appName;
  late String _editorPassword;

  late AppInfoModel _appInfo; // must be instantiated in init()
  late String? _gcrServerUrl;
  AppInfoModel get appInfo => _appInfo;

  String? get gcrServerUrl => _gcrServerUrl;

  Map<String, dynamic> get appInfoAsMap => _appInfo.toMap();

  late ValueNotifier<RoutingConfig> routingConfigVN;

  late ValueNotifier<bool> canEditContent;

  late GoRouter router;

  List<RoutePath> get pagePaths {
    List<RouteBase> routes = routingConfigVN.value.routes;
    return routes.map((route) => (route as GoRoute).path).toList();
  }

  //
  void addRoute({
    required String newPath,
    required SnippetTemplateEnum template,
  }) {
    routingConfigVN.value = RoutingConfig(
      routes: <RouteBase>[
        ...routingConfigVN.value.routes,
        DynamicPageRoute(
          path: newPath,
          template: template,
        ),
      ],
    );
  }

  void setAppInfo(AppInfoModel newModel) => _appInfo = newModel;

  // void addVersionId(SnippetName snippetName, VersionId versionId) {
  //   final newVersionIds = Map<SnippetName, List<VersionId>>.of(versionIds);
  //   if (versionIds.containsKey(snippetName)) {
  //     newVersionIds[snippetName]!.insert(0, versionId);

  //   } else {
  //     newVersionIds[snippetName] = [versionId];
  //   }
  //   _appInfo.versionIds = newVersionIds;
  // }

  STreeNode? get clipboard => _appInfo.clipboard;

  bool get clipboardIsEmpty => _appInfo.clipboard == null;

  void setClipboard(STreeNode? newClipboard) =>
      _appInfo.clipboard = newClipboard;

  List<SnippetName> snippetsBeingReadFromFB = [];

  // must be instantiated in init()
  Map<SnippetName, SnippetInfoModel> snippetInfoCache = {};
  Map<SnippetName, List<VersionId>> versionIdCache = {};

  // Map<SnippetName, LinkedList<VersionEntryItem>> versionIdCache = {};
  List<VersionId> versionIds(SnippetName snippetName) =>
      versionIdCache[snippetName] ?? [];

  // versionIdCache[snippetName]?.map((e) => e.versionId).toList() ??[];
  Map<SnippetName, Map<VersionId, SnippetRootNode>> versionCache = {};

  // create new snippet version in cache, then write through to FB
  Future<void> cacheAndSaveANewSnippetVersion({
    required SnippetName snippetName,
    String? pagePath,
    required SnippetRootNode rootNode,
    bool? publish,
  }) async {
    logi('newSnippetVersion($snippetName)');
    SnippetInfoModel snippetInfo;
    // snippet has changed
    VersionId newVersionId = DateTime.now().millisecondsSinceEpoch.toString();

    // hopefully write new version to FB
    versionCache[snippetName] ??= {};
    versionIdCache[snippetName] ??= []; //LinkedList<VersionEntryItem>();
    versionIdCache[snippetName]
        ?.add(newVersionId); //add(VersionEntryItem(newVersionId));
    versionCache[snippetName]?.addAll({newVersionId: rootNode});
    bool fbSuccess =
        await modelRepo.saveLatestSnippetVersion(snippetName: snippetName);

    if (!fbSuccess) {
      versionIdCache[snippetName]?.remove(newVersionId);
      versionCache[snippetName]?.remove(newVersionId);
      return;
    }

    // NEW snippet - initial version
    if (!snippetInfoCache.containsKey(snippetName)) {
      appInfo.snippetNames = [snippetName, ...appInfo.snippetNames];
      // bool publishImmediately = true; //publish ?? appInfo.autoPublishDefault;
      snippetInfo = snippetInfoCache[snippetName] = SnippetInfoModel(
        snippetName,
        routePath: pagePath,
        editingVersionId: newVersionId,
        publishedVersionId: newVersionId,
        //publishImmediately ? newVersionId : null,
        autoPublish: true, //appInfo.autoPublishDefault,
      );
      await modelRepo.saveAppInfo();
      await modelRepo.saveLatestSnippetVersion(snippetName: snippetName);
    } else {
      // EXISTING snippet - just add new version
      snippetInfo = snippetInfoCache[snippetName]!
        ..editingVersionId = newVersionId;
      // if (snippetInfo.autoPublish ?? false) {
      snippetInfo.publishedVersionId = newVersionId;
      // }
    }
  }

  late FSFolderNode? rootFSFolderNode;

  /// The package name. `bundleIdentifier` on iOS, `getPackageName` on Android.

  // model that was loaded from facebook when this app started up
  late String? prevSavedModelVersion;
  late String? nextSavedModelVersion;

  /// The build number. `CFBundleVersion` on iOS, `versionCode` on Android.
  /// Note, on iOS if an app has no buildNumber specified this property will return version
  /// Docs about CFBundleVersion: https://developer.apple.com/documentation/bundleresources/information_property_list/cfbundleversion

  late List<String> _googleFontNames;
  final Map<String, void Function(BuildContext, GlobalKey)> _namedCallbacks =
      {};
  late Map<String, TextStyle> _namedTextStyles;
  late Map<String, ButtonStyle> _namedButtonStyles;
  Offset? _devToolsFABPos;

  // ---- callout config tool pos -------------------------
  Offset? _calloutConfigToolbarPos;
  bool calloutConfigToolbarAtTopOfScreen = false;

  // ---- callout config tool pos -------------------------
  bool skipEditModeEscape =
      false; // property editors can set this to prevent exit from EditMode

  final inEditMode = ValueNotifier<bool>(false);

  void forceRefresh({bool onlyTargetsWrappers = false}) =>
      FlutterContentApp.capiBloc.add(CAPIEvent.forceRefresh(
        onlyTargetsWrappers: onlyTargetsWrappers,
      ));

  Future<void> setCanEditContent(bool b) async {
    canEditContent.value = b;
    return hiveBox.put("canEditContent", b);
  }

  Offset calloutConfigToolbarPos() =>
      _calloutConfigToolbarPos ??
      Offset(
        scrW / 2 - 350,
        calloutConfigToolbarAtTopOfScreen ? 10 : scrH - 90,
      );

  void setCalloutConfigToolbarPos(Offset newPos) =>
      _calloutConfigToolbarPos = newPos;

  Offset devToolsFABPos(context) =>
      _devToolsFABPos ?? Offset(40, MediaQuery.sizeOf(context).height - 100);

  void setDevToolsFABPos(Offset newPos) => _devToolsFABPos = newPos;

  bool? showingNodeBoundaryOverlays;

  registerHandler(HandlerName name, void Function(BuildContext) f) =>
      _handlers[name] = f;

  void Function(BuildContext)? namedHandler(HandlerName name) =>
      _handlers[name];

  // each snippet panel has a gk, a last selected node, and a ur
  final Map<RouteName, GlobalKey> pageGKs = {};

  // if a page has a scrollable, its offset can be stored in this map to avoid rebuild losing it
  final Map<String, double> scrollControllerOffsets = {};
  String? currentRoute;

  final Map<GlobalKey, STreeNode> gkSTreeNodeMap =
      {}; // every node's toWidget() creates a GK
  // final Map<PanelName, SnippetName> snippetPlacementMap = {};
  final List<SnippetPlaceName> placeNames = [];
  final Map<SnippetPlaceName, SnippetName> snippetPlacementMap = {};

  EditablePageState? get currentPageState {
    return currentRoute != null
        ? pageGKs[currentRoute]?.currentState as EditablePageState?
        : null;
  }

  final Map<PanelName, GlobalKey> panelGkMap = {};
  final Map<STreeNode, Set<PTreeNode>> expandedNodes = {};
  final Map<HandlerName, void Function(BuildContext)> _handlers = {};

  bool showingNodeButtons = true;

  List<String> get googleFontNames => _googleFontNames;

  void Function(BuildContext, GlobalKey)? getNamedCallback(
          String callbackName) =>
      _namedCallbacks[callbackName];

  void setNamedCallback(String callbackName,
          void Function(BuildContext, GlobalKey) callback) =>
      _namedCallbacks[callbackName] = callback;

  Map<String, TextStyle> get namedTextStyles => _namedTextStyles;

  Map<String, ButtonStyle> get namedButtonStyles => _namedButtonStyles;

  // PTreeNodeTreeController? selectedNodePTree;
  SnippetRootNode? targetSnippetBeingConfigured;

  // void updateSnippetBeingEdited(SnippetRootNode rootNode) {
  //   if (_snippetsBeingEdited.isEmpty) {
  //     _snippetsBeingEdited.addFirst(snippetBloc);
  //
  //   }
  //   logi("snippetBeingEdited is $snippetBeingEdited");
  //   return;
  // }

  /// A FlutterContentPage has a snippet with the same route name
  void pushPage({
    required String routeName,
    required String path,
  }) {}

  final GksByFeature _calloutGkMap = {};

  GlobalKey? getCalloutGk(feature) => _calloutGkMap[feature];

  GlobalKey setCalloutGk(Feature feature, GlobalKey gk) {
    _calloutGkMap[feature] = gk;
    return gk;
  }

  // final GKMap _singleTargetGkMap = {};

  // GlobalKey? getSingleTargetGk(feature) => _singleTargetGkMap[feature];

  // GlobalKey setSingleTargetGk(Feature feature, GlobalKey gk) {
  //   _singleTargetGkMap[feature] = gk;
  //   return gk;
  // }

  final GksByTargetId _targetGK = {};

  GlobalKey? getTargetGk(TargetId targetId) => _targetGK[targetId];

  GlobalKey setTargetGk(TargetId targetId, GlobalKey gk) {
    // if (_targetGK.containsKey(targetId) && _targetGK != gk) {
    //   logi('target changed.');
    // }
    _targetGK[targetId] = gk;
    return gk;
  }

  // TargetsWrapperState? parentTW(String twName) =>
  //     targetsWrappers[twName]?.currentState as TargetsWrapperState?;

  // final FeatureList _singleTargetBtnFeatures = [];

  // FeatureList get singleTargetBtnFeatures => _singleTargetBtnFeatures;

  SnippetRootNode? currentSnippetVersion(SnippetName snippetName) {
    SnippetRootNode? rootNode;
    SnippetInfoModel? snippetInfo = snippetInfoCache[snippetName];
    VersionId? currentVersionId = snippetInfo?.currentVersionId;
    if (currentVersionId != null) {
      rootNode = versionCache[snippetName]?[currentVersionId];
    }
    return rootNode;
  }

  // STreeNode? gkToNode(GlobalKey gk) => gkSTreeNodeMap[gk];

  void hideClipboard() => dismiss("floating-clipboard");

  void showFloatingClipboard() {
    dismiss("floating-clipboard");
    fco.showOverlay(
        calloutContent: const ClipboardView(),
        calloutConfig: CalloutConfig(
          cId: "floating-clipboard",
          initialCalloutW: 300,
          initialCalloutH: 180,
          initialCalloutPos: Offset(scrW - 400, 0),
          fillColor: Colors.transparent,
          arrowType: ArrowType.NONE,
          borderRadius: 16,
        ));
  }

  //  Map<String, TargetGroupModel> parseTargetGroups(CAPIModel model) {
  //   Map<String, TargetGroupModel> imageTargetListMap = {};
  //   if (model.TargetGroupModels.isNotEmpty) {
  //     try {
  //       for (String name in model.TargetGroupModels.keys) {
  //         TargetGroupModel? imageConfig = model.TargetGroupModels[name];
  //         if (imageConfig != null && imageConfig.targets.isNotEmpty) {
  //           imageTargetListMap[name] = imageConfig;
  //         }
  //       }
  //     } catch (e) {
  //       logi("_parseImageTargets(): ${e.toString()}");
  //       rethrow;
  //     }
  //   }
  //   return imageTargetListMap;
  // }

  //  Future<void> loadLatestSnippetMap() async {
  //   var versionToLoad = canEditContent
  //       ? appInfo.editingVersionId
  //       : appInfo.publishedVersionId;
  //   snippets = (versionToLoad == null)
  //       ? SnippetMapModel({})
  //       : await FC()
  //               .fbModelRepo
  //               .getVersionedSnippetMap(versionId: versionToLoad) ??
  //           SnippetMapModel({});
  // }

  Future<void> loadFirebaseStorageFolders() async {
    var rootRef = fbStorage.ref('/$appName'); // .child("/");
    rootFSFolderNode = await modelRepo.createAndPopulateFolderNode(ref: rootRef);
  }

  // snippet editing
  CalloutConfig snippetTreeCalloutConfig({
    required String cId,
    required VoidCallback onDismissedF,
  }) {
    double width() {
      double? w = fco.hiveBox.get("snippet-tree-callout-width");
      if (w != null) return w.abs();

      // if (root?.child == null) return 190;
      w = min(FlutterContentApp.capiBloc.state.snippetTreeCalloutW ?? 500, 600);
      return w > 0 ? w : 500;
    }

    double height() {
      double? h = fco.hiveBox.get("snippet-tree-callout-height");
      if (h != null) return h.abs();

      // if (root?.child == null) return 60;
// int numNodes = root != null ? bloc.state.snippetTreeC.countNodesInTree(root) : 0;
// double h = numNodes == 0 ? min(bloc.state.snippetTreeCalloutH ?? 400, 600) : numNodes * 60;
      h = min(FlutterContentApp.capiBloc.state.snippetTreeCalloutH ?? 500,
          fco.scrH - 50);
      return h > 0 ? h : 500;
    }

    return CalloutConfig(
      cId: cId,
      // frameTarget: true,
      arrowType: ArrowType.NONE,
      barrier: CalloutBarrier(
        opacity: .1,
        // closeOnTapped: false,
        // hideOnTapped: true,
      ),
      onDismissedF: onDismissedF,
// onHiddenF: () {
//   STreeNode.unhighlightSelectedNode();
//   FCO.capiBloc.add(const CAPIEvent.unhideAllTargetGroups());
//   fco.dismiss(TREENODE_MENU_CALLOUT);
//   MaterialAppWrapper.showAllPinkSnippetOverlays();
//   if (snippetBloc.state.canUndo()) {
//     FCO.capiBloc.add(const CAPIEvent.saveModel());
//   }
// },
      initialCalloutW: width(),
      initialCalloutH: height(),
//calloutH ?? 500,
// barrierOpacity: .1,
// arrowType: ArrowType.POINTY,
// color: Colors.purpleAccent.shade100,
      borderRadius: 16,
// initialCalloutPos: bloc.state.snippetTreeCalloutInitialPos,
      finalSeparation: 40,
// onBarrierTappedF: () async {
//   // also check whether any snippet change
//   var newSnippetMap = CAPIBloc.getSnippetJsonsFromTree(bloc.state.snippetTreeC);
//   bool changeOccurred = true || !mapEquals(originalSnippetMap, newSnippetMap) || originalClipboardJson != bloc.state.jsonClipboard;
//   bloc.add(CAPIEvent.hideSnippetTree(save: changeOccurred));
//   removeSnippetTreeCallout(snippetName);
//   onClosedF.call();
// },
// draggable: false,
      dragHandleHeight: 40,
      resizeableH: true,
      resizeableV: true,
      onResizeF: (newSize) {
        // keep size in localstorage for future use
        fco.hiveBox.put("snippet-tree-callout-width", newSize.width);
        fco.hiveBox.put("snippet-tree-callout-height", newSize.height);
      },
      onDragStartedF: () {
        FlutterContentApp.selectedNode?.hidePropertiesWhileDragging = true;
      },
      onDragEndedF: (_) {
        FlutterContentApp.selectedNode?.hidePropertiesWhileDragging = false;
      },
    );
  }

  void showSnippetTreeAndPropertiesCallout({
    required TargetKeyFunc targetGKF,
    String? scrollControllerName,
    required VoidCallback onDismissedF,
    required STreeNode startingAtNode,
    required STreeNode selectedNode,
    // required STreeNode tappedNode,
    bool allowButtonCallouts = false,
    TargetModel? targetBeingConfigured,
  }) async {
    SnippetRootNode? rootNode = FlutterContentApp.snippetBeingEdited?.rootNode;
    if (rootNode == null) return;

    // dismiss any pink border overlays
    fco.dismissAll(exceptFeatures: [
      rootNode.name,
      CalloutConfigToolbar.CID,
      targetBeingConfigured?.contentCId ?? 'n/a',
    ]);

    // if (rootNode == null) return;

    // to check for any change
    // String? originalTcS = tc != null ? jsonEncode(initialTC?.toJson()) : null;
    // EncodedSnippetJson originalSnippetJson = rootNode.toJson();
    // String? originalClipboardJson = FlutterContentApp.capiBloc.state.jsonClipboard;
    // tree and properties callouts using snippetName.hashCode, and snippetName.hashCode+1 resp.

    CalloutConfig cc = snippetTreeCalloutConfig(
        cId: FlutterContentApp.snippetBeingEdited!.rootNode.name,
        onDismissedF: onDismissedF);
    Widget content = SnippetTreeAndPropertiesCalloutContents(
      scrollControllerName: scrollControllerName,
      allowButtonCallouts: allowButtonCallouts,
    );
    fco.showOverlay(
      calloutConfig: cc,
      calloutContent: content,
      targetGkF: targetGKF,
    );
    // imm select a node
    STreeNode sel = selectedNode;
    FlutterContentApp.capiBloc.add(CAPIEvent.selectNode(
      node: sel,
      //selectedTreeNodeGK: GlobalKey(debugLabel: 'selectedTreeNodeGK'),
// imageTC: tc,
    ));
    fco.afterNextBuildDo(() {
      selectedNode.showNodeWidgetOverlay();
    });
  }
}

//   String encodeAllSnippets() {
//     List<SnippetRootNode>? rootNodes = snippetsMap.values.toList();
//     Map<String, String> snippetJsons = {};
//     for (SnippetRootNode rootNode in rootNodes) {
//       snippetJsons[rootNode.name] = rootNode.toJson();
//     }
//     return snippetJsons;
//   }
//
//    Map<SnippetName, SnippetRootNode> parseSnippetJsons(CAPIModel model) {
//     Map<SnippetName, SnippetRootNode> snippetMap = {};
//     late String snippetJson;
//     try {
//       for (snippetJson in model.snippetMap.values) {
//         SnippetRootNode rootNode = SnippetRootNodeMapper.fromJson(snippetJson);
//         snippetMap[rootNode.name] = rootNode..validateTree();
//       }
//     } catch (e) {
//       logi("parseSnippetJsons(): ${e.toString()}");
//       logi(snippetJson);
//       // rethrow;
//     }
//     return snippetMap;
//   }
// }
