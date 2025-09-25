// ignore_for_file: constant_identifier_names

// library flutter_content;

import 'dart:async';

import 'package:email_validator/email_validator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart'
    show Reference, FirebaseStorage;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_callouts/flutter_callouts.dart';
import 'package:flutter_content/src/bloc/snippet_being_edited.dart';
import 'package:flutter_content/src/model/firestore_model_repo.dart';
import 'package:flutter_content/src/snippet/fancy_tree/tree_controller.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/button_style_properties.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/container_style_properties.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/text_style_properties.dart';

// import 'package:flutter_content/src/snippet/pnodes/groups/text_style_properties.dart';
import 'package:flutter_content/src/snippet/snodes/center_node.dart';
import 'package:flutter_content/src/snippet/snodes/text_node.dart';
import 'package:flutter_content/src/snippet/snodes/widget/fs_folder_node.dart';
import 'package:flutter_content/src/text_styles/button_style_search_anchor.dart';
import 'package:flutter_content/src/text_styles/container_style_search_anchor.dart';
import 'package:flutter_content/src/text_styles/text_style_search_anchor.dart';
import 'package:flutter_content/x_flutter_content/button_styles_extn.dart';
import 'package:flutter_content/x_flutter_content/container_styles_extn.dart';
import 'package:flutter_content/x_flutter_content/google_font_names_extn.dart';
import 'package:flutter_content/x_flutter_content/routes_extn.dart';
import 'package:flutter_content/x_flutter_content/text_styles_extn.dart';

// import 'package:flutter_content/src/snippet/snodes/widget/fs_folder_node.dart';
import 'package:go_router/go_router.dart';

import 'src/bloc/capi_bloc.dart';
import 'src/bloc/capi_event.dart';
import 'src/model/app_info_model.dart';
import 'src/model/model_repo.dart';
import 'src/model/snippet_info_model.dart';
import 'src/nav/nav_mixin.dart';
import 'src/passwordless/passwordless_mixin.dart';
import 'src/snippet/pnode.dart';
import 'src/snippet/snode.dart';
import 'src/snippet/snodes/snippet_root_node.dart';
import 'src/typedefs.dart';

export 'package:cloud_firestore/cloud_firestore.dart';
export 'package:firebase_core/firebase_core.dart';

// re-export callout callout related s.t. apps using this package don't need to include the callouts pkg in pubspec
export 'package:flutter_callouts/src/api/callouts/callout_config.dart';
export 'package:flutter_callouts/src/api/callouts/callout_using_overlayportal.dart';
export 'package:flutter_callouts/src/api/callouts/dotted_decoration.dart';
export 'package:flutter_callouts/src/api/callouts/globalkey_extn.dart';
export 'package:flutter_callouts/src/api/callouts/named_sc.dart';
export 'package:flutter_callouts/src/canvas/canvas_mixin.dart';
export 'package:flutter_callouts/src/debouncer/debouncer.dart';
export 'package:flutter_callouts/src/feature_discovery/discovery_controller.dart';
export 'package:flutter_callouts/src/feature_discovery/featured_widget.dart';
export 'package:flutter_callouts/src/feature_discovery/flat_icon_button_with_callout_player.dart';
export 'package:flutter_callouts/src/gotits_mixin.dart';
export 'package:flutter_callouts/src/measuring/measure_sizebox.dart';
export 'package:flutter_callouts/src/system_mixin.dart';
export 'package:flutter_callouts/src/typedefs.dart';
export 'package:flutter_callouts/src/widget/blink.dart';
export 'package:flutter_callouts/src/widget/constant_scroll_behavior.dart';
export 'package:flutter_callouts/src/widget/error.dart';
export 'package:flutter_callouts/src/widget/widget_helper_mixin.dart';
export 'package:flutter_callouts/src/api/callouts/color_or_gradient.dart';
export 'package:flutter_callouts/src/api/callouts/decoration_shape.dart';
export 'package:flutter_callouts/src/api/callouts/target_pointer_type.dart';

export 'package:flutter_content/src/model/firestore_model_repo.dart';
export 'package:flutter_content/src/model/model_repo.dart';
export 'package:flutter_content/src/snippet/pnodes/groups/container_style_properties.dart';

export 'package:flutter_content/src/api/alignment_extn.dart';

// export 'package:file_picker/src/file_picker.dart';
// export 'package:file_picker/src/file_picker_result.dart';
// export 'package:file_picker/src/platform_file.dart';
export 'package:gap/src/widgets/gap.dart';
export 'package:logger/src/log_event.dart';
export 'package:logger/src/log_filter.dart';
export 'package:logger/src/logger.dart';
export 'package:logger/src/printers/pretty_printer.dart';

// re-export
export 'package:url_launcher/url_launcher.dart';
export 'package:url_launcher/url_launcher_string.dart';

// export 'src/api/routes/dynamic_page_route.dart';
export 'src/api/routes/editable_page_route.dart';
export 'src/api/app/fco_app.dart';
export 'src/api/editable_page/zoomer.dart';
export 'src/api/snippet_builder/snippet_builder.dart';

// export 'src/api/snippet_builder/snippet_templates.dart';
export 'src/api/editable_page/editable_page.dart';

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
export 'src/model/app_info_model.dart';

// export 'src/model/branch_model.dart';
export 'src/model/snippet_info_model.dart';
export 'src/model/target_group_model.dart';
export 'src/model/target_model.dart';
export 'src/nav/nav_mixin.dart';
export 'src/passwordless/passwordless_mixin.dart';
export 'src/snippet/node.dart';
export 'src/snippet/pnode.dart';
export 'src/snippet/pnodes/editors/string_or_number_editor.dart';
export 'src/snippet/pnodes/editors/text_editor_with_autocomplete.dart';
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

// export 'src/snippet/snodes/fs_folder_node.dart';
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
// export 'src/snippet/snodes/named_text_style.dart';

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
export 'src/snippet/snodes/upto6colors.dart';

export 'src/model/alignment_enum_model.dart';
export 'src/model/color_model.dart';
export 'src/model/offset_model.dart';

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
export 'x_flutter_content/button_styles_extn.dart';
export 'x_flutter_content/container_styles_extn.dart';
export 'x_flutter_content/google_font_names_extn.dart';
export 'x_flutter_content/routes_extn.dart';
export 'x_flutter_content/text_styles_extn.dart';
export 'src/snippet/pnodes/groups/text_style_properties.dart';

// global instance singleton
FlutterContentMixins fco = FlutterContentMixins._();

late Logger _logger;
late Logger _loggerNs;

class MyLogFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    return true;
  }
}

// const String SELECTED_OVERLAY_NON_TAPPABLE = 'selected-overlay-non-tappable';
const String CUTOUT_OVERLAY_NON_TAPPABLE = 'cutout-overlay-non-tappable';
// const String SELECTED_NODE_BORDER_CALLOUT = "selected-node-border-callout";
// const String TREENODE_MENU_CALLOUT = "TreeNodeMenu-callout";
// const String NODE_PROPERTY_CALLOUT_BUTTON = "NodePropertyCalloutButton";

/// this is a global container
class FlutterContentMixins
    with
        MeasuringMixin,
        CalloutMixin,
        RootContextMixin,
        SystemMixin,
        KeystrokesMixin,
        LocalStorageMixin,
        WidgetHelperMixin,
        CanvasMixin,
        GotitsMixin,
        PasswordlessMixin,
        NavMixin {
  FlutterContentMixins._() {
    _logger = Logger(
      filter: MyLogFilter(),
      printer: PrettyPrinter(colors: true, printEmojis: false),
    );
    _loggerNs = Logger(
      filter: MyLogFilter(),
      printer: PrettyPrinter(methodCount: 6),
    );
  }

  Logger get logger => _logger;
  Logger get loggerNs => _loggerNs;

  // called by _initApp() to set the late variables
  Future<CAPIBloC> createCAPIBloC({
    required String appName,
    FirebaseOptions? fbOptions,
    bool useEmulator = false,
    bool useFBStorage = false,
    final IModelRepository? testModelRepo,
    // created in tests by a when(mockRepository.getCAPIModel(modelName: modelName...
    final Widget? testWidget,
    // Map<String, void Function(GlobalKey? gk)> namedCallbacks = const {},
    RoutingConfig? routingConfig,
    String? initialRoutePath,
    bool skipAssetPkgName =
        false, // would only use true when pkg dir is actually inside current project
  }) async {
    await initLocalStorage();

    // fco.logger.d('init() ${stopwatch.elapsedMilliseconds}');

    loadGoogleFontNames(googleFontNames);

    this.appName = appName;

    // Bloc.observer = MyGlobalObserver();

    usingFBStorage = useFBStorage;

    // go_router not necc.
    if (routingConfig != null && initialRoutePath != null) {
      initRouter(routingConfig, initialRoutePath);
    }

    // List<String> routePaths = [];
    // logi('starting parseRouteConfig');
    // parseRouteConfig(routePaths, router.configuration.routes);
    // logi('finished parseRouteConfig');

    // logi('RoutingConfig Routes------------');
    // logi(routePaths.toString());
    // logi('--------------------------------');

    if (fbOptions != null) {
      // fco.logger.i('init 1. ${fco.stopwatch.elapsedMilliseconds}');

      modelRepo = FireStoreModelRepository(fbOptions);
      await (modelRepo as FireStoreModelRepository)
          .possiblyInitFireStoreRelatedAPIs(useEmulator: useEmulator);

      // fco.logger.i('init 2. ${fco.stopwatch.elapsedMilliseconds}');

      // fetch model
      AppInfoModel? fbAppInfo = await modelRepo.getAppInfo();
      appInfo = fbAppInfo ?? AppInfoModel();

      // text, button, and container styles get saved in the AppInfo. Combine with the canned (source-coded) ones
      try {
        namedTextStyles.addAll(cannedTextStyles());
        namedTextStyles.addAll(appInfo.userTextStyles);
        namedButtonStyles.addAll(cannedButtonStyles());
        namedButtonStyles.addAll(appInfo.userButtonStyles);
        namedContainerStyles.addAll(cannedContainerStyles());
        namedContainerStyles.addAll(appInfo.userContainerStyles);
      } catch (e) {
        logger.e(e);
      }

      _gcrServerUrl = await modelRepo.getGcrServerUrl();

      // fco.logger.i('init 3. ${fco.stopwatch.elapsedMilliseconds}');

      addDynamicPages();

      // await loadLatestSnippetMap();

      // fco.logger.i('init 4. ${fco.stopwatch.elapsedMilliseconds}');
    }

    // fco.logger.i('init 5. ${fco.stopwatch.elapsedMilliseconds}');
    // await initLocalStorage();
    // fco.logger.i('init 6. ${fco.stopwatch.elapsedMilliseconds}');

    _authenticated = localStorage.read("canEditContent") ?? false;

    if (useFBStorage) {
      // traverse all nodes starting at root
      final fsRootFolderNode = await modelRepo.createAndPopulateFolderTree(
        ref: folderPathRef('/'),
      );

      fsTreeC = TreeController<FSFolderNode>(
        roots: [fsRootFolderNode],
        childrenProvider: (FSFolderNode node) => node.children,
        parentProvider: (FSFolderNode node) =>
            node.getParent() as FSFolderNode?,
      )..expand(fsRootFolderNode);
    }

    // fco.logger.i('init 7. ${fco.stopwatch.elapsedMilliseconds}');

    // FutureBuilder requires this return
    return CAPIBloC(modelRepo: modelRepo);
  }

  late bool logging;

  bool emailIsValid(String theEA) => EmailValidator.validate(theEA);

  late IModelRepository modelRepo;

  // reusable across all PNodes
  TextStyleNameSearchAnchor? textStyleNameAnchor;
  ButtonStyleNameSearchAnchor? buttonStyleNameAnchor;
  ContainerStyleNameSearchAnchor? containerStyleNameAnchor;

  late String appName;

  late bool usingFBStorage;
  late String currFolderPath;
  late TreeController<FSFolderNode> fsTreeC;

  late AppInfoModel appInfo; // must be instantiated in init()
  late String? _gcrServerUrl;

  String? get gcrServerUrl => _gcrServerUrl;

  JsonMap get appInfoAsMap => appInfo.toMap();

  late ValueNotifier<RoutingConfig> routingConfigVN;
  var themeModeNotifier = ValueNotifier<ThemeMode>(ThemeMode.light);

  late bool _authenticated;

  bool canEditContent() {
    String? currentPagePath = fco.currentEditablePagePath;
    bool isGuestPage = fco.appInfo.anonymousUserEditablePages.contains(
      currentPagePath,
    );
    return _authenticated || isGuestPage;
  }

  GlobalKey authIconGK = GlobalKey();

  final snippetTreeTC = TransformationController();

  GoRouter? router;

  List<String> pageList = [];

  late TapGestureRecognizer webLinkF;

  late CAPIBloC capiBloc;

  SnippetBeingEdited? get snippetBeingEdited =>
      capiBloc.state.snippetBeingEdited;

  bool get inSelectWidgetMode => capiBloc.state.inSelectWidgetMode;

  SNode? get selectedNode => snippetBeingEdited?.selectedNode;

  bool get showProperties => snippetBeingEdited?.showProperties ?? false;

  bool get aNodeIsSelected => snippetBeingEdited?.selectedNode != null;

  Future<void> ensureContentSnippetPresent(String contentCId) async =>
      SnippetInfoModel.cachedSnippetInfo(contentCId) ??
      await SnippetRootNode.loadSnippetFromCacheOrFromFBOrCreateFromTemplate(
        snippetName: contentCId,
        templateSnippetRootNode: SnippetRootNode(
          name: contentCId,
          child: CenterNode(
            child: TextNode(
              text: contentCId,
              tsPropGroup: TextStyleProperties(),
            ),
          ),
        ),
        // snippetRootNode: SnippetTemplateEnum.empty.templateSnippet(),
      );

  void setAppInfo(AppInfoModel newModel) => appInfo = newModel;

  // void addVersionId(SnippetName snippetName, VersionId versionId) {
  //   final newVersionIds = Map<SnippetName, List<VersionId>>.of(versionIds);
  //   if (versionIds.containsKey(snippetName)) {
  //     newVersionIds[snippetName]!.insert(0, versionId);

  //   } else {
  //     newVersionIds[snippetName] = [versionId];
  //   }
  //   _appInfo.versionIds = newVersionIds;
  // }

  // List<SnippetName> snippetsBeingReadFromFB = [];

  // Map<SnippetName, List<VersionId>> versionIdCache = {};

  // Map<SnippetName, LinkedList<VersionEntryItem>> versionIdCache = {};
  // List<VersionId> versionIds(SnippetName snippetName) =>
  //     versionIdCache[snippetName] ?? [];

  // versionIdCache[snippetName]?.map((e) => e.versionId).toList() ??[];
  // Map<SnippetName, Map<VersionId, SnippetRootNode>> versionCache = {};

  Future<void> saveNewVersion({required SnippetRootNode? snippet}) async {
    if (snippet?.name == null) {
      return;
    }

    String? snippetName = snippet!.name; //.startsWith('/')
    // ? snippet.name.substring(1)
    // : snippet.name;

    // only does following i.i. a new snippet
    SnippetInfoModel? snippetInfo = SnippetInfoModel.cachedSnippetInfo(
      snippetName,
    );
    if (snippetInfo != null) {
      // remove all subsequent versions following the current version
      // before saving new version
      VersionId currVerId = snippetInfo.currentVersionId() ?? '??!';
      List<VersionId> newIdCache = [];
      List<VersionId> tbd = [];
      for (VersionId v in snippetInfo.versionIds ?? []) {
        try {
          if (int.parse(v.isEmpty ? "0" : v) > int.parse(currVerId)) {
            tbd.add(v);
          } else {
            newIdCache.add(v);
          }
        } catch (e) {
          fco.logger.e('$e');
        }
      }
      if (tbd.isNotEmpty) {
        // delete from FB and also from cache
        for (VersionId vId in tbd) {
          snippetInfo.versionIds?.remove(vId);
          snippetInfo.cachedVersions.remove(vId);
        }
        fco.modelRepo.deleteSnippetVersions(snippetName, tbd);
        // SnippetInfoModel.debug();
      }
    }

    // write new version to FB
    await fco._cacheAndSaveANewSnippetVersion(
      snippetName: snippetName,
      rootNode: snippet,
    );
  }

  // create new snippet version in cache, then write through to FB
  Future<void> _cacheAndSaveANewSnippetVersion({
    required SnippetName snippetName,
    String? pagePath,
    required SnippetRootNode rootNode,
    // bool? publish,
  }) async {
    logger.i('cacheAndSaveANewSnippetVersion($snippetName)');

    // snippet has changed
    VersionId newVersionId = DateTime.now().millisecondsSinceEpoch.toString();

    // update or create SnippetInfo
    SnippetInfoModel? snippetInfo = SnippetInfoModel.cachedSnippetInfo(
      snippetName,
    );

    VersionId currVersionId = snippetInfo?.currentVersionId() ?? '?!';

    // NEW snippet - initial version
    if (snippetInfo == null) {
      // update FB appInfo
      // jsArray issue
      // List<String> newList = appInfo.snippetNames;
      appInfo.snippetNames = [...appInfo.snippetNames, snippetName];
      await modelRepo.saveAppInfo();
      snippetInfo = SnippetInfoModel(
        snippetName,
        editingVersionId: newVersionId,
        publishedVersionId: newVersionId,
        routePath: pagePath,
        autoPublish: appInfo.autoPublishDefault,
        versionIds: [],
      );
      SnippetInfoModel.cacheSnippetInfo(snippetName, snippetInfo);
    } else {
      snippetInfo.editingVersionId = newVersionId;
      if (snippetInfo.autoPublish ?? appInfo.autoPublishDefault) {
        snippetInfo.publishedVersionId = newVersionId;
      }
    }

    snippetInfo.versionIds!.add(newVersionId);
    snippetInfo.cachedVersions[newVersionId] = rootNode;

    // try to write new version to FB
    bool fbSuccess = await modelRepo.saveSnippetVersion(
      snippetName: snippetName,
      newVersionId: newVersionId,
      newVersion: rootNode,
    );

    if (!fbSuccess) {
      logger.i(
        'cacheAndSaveANewSnippetVersion($snippetName) -  not fbSuccess !',
      );
    } else {
      // reset current version to before change
      String? origSnippetJson = snippetBeingEdited?.jsonBeforeAnyChange;
      if (origSnippetJson != null) {
        SnippetRootNode? origSnippet = SnippetRootNodeMapper.fromJson(
          origSnippetJson,
        );
        snippetInfo.cachedVersions[currVersionId] = origSnippet;
        snippetBeingEdited!.jsonBeforeAnyChange = rootNode.toJson();
      }
    }
  }

  bool isEditingVersionPublished(SnippetName name) {
    var snippetInfo = SnippetInfoModel.cachedSnippetInfo(name);
    return snippetInfo?.publishedVersionId == snippetInfo?.editingVersionId;
  }

  /// The package name. `bundleIdentifier` on iOS, `getPackageName` on Android.

  // model that was loaded from firebase when this app started up
  late String? prevSavedModelVersion;
  late String? nextSavedModelVersion;

  /// The build number. `CFBundleVersion` on iOS, `versionCode` on Android.
  /// Note, on iOS if an app has no buildNumber specified this property will return version
  /// Docs about CFBundleVersion: https://developer.apple.com/documentation/bundleresources/information_property_list/cfbundleversion

  final List<String> googleFontNames = [];
  final Map<String, void Function(BuildContext, GlobalKey)> namedCallbacks = {};

  Map<TextStyleName, TextStyleProperties> namedTextStyles = {};
  Map<ButtonStyleName, ButtonStyleProperties> namedButtonStyles = {};
  Map<ContainerStyleName, ContainerStyleProperties> namedContainerStyles = {};

  // used to restore expanded state on pnodes
  Map<PropertyName, PNode> pNodes = {};

  Offset? _devToolsFABPos;

  // ---- callout config tool pos -------------------------
  Offset? _calloutConfigToolbarPos;
  bool calloutConfigToolbarAtTopOfScreen = false;

  // ---- callout config tool pos -------------------------
  // bool skipEditModeEscape =
  //     false; // property editors can set this to prevent exit from EditMode

  // set when user taps a snippet triangle
  // final inEditMode = ValueNotifier<bool>(false);

  void forceRefresh({bool onlyTargetsWrappers = false}) => fco.capiBloc.add(
    CAPIEvent.forceRefresh(onlyTargetsWrappers: onlyTargetsWrappers),
  );

  Future<void> setCanEditContent(bool b) async {
    return await localStorage.write("canEditContent", _authenticated = b);
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

  final Map<HandlerName, void Function(BuildContext)> _handlers = {};

  void Function(BuildContext p1) registerHandler(
    HandlerName name,
    void Function(BuildContext) f,
  ) => _handlers[name] = f;

  void Function(BuildContext)? namedHandler(HandlerName name) =>
      _handlers[name];

  List<HandlerName> handlers() => _handlers.keys.toList();

  String? currentEditablePagePath; // gets set by EditablePage initState()

  // each snippet panel has a gk, a last selected node, and a ur
  // final Map<RouteName, GlobalKey> pageGKs = {};

  // if a page has a scrollable, its offset can be stored in this map to avoid rebuild losing it
  // final Map<String, double> scrollControllerOffsets = {};
  // String? currentRoute;

  // every node's toWidget() creates a (resusable) GK
  // knowing a node's GK you can establish its ScrolController? or TabController?
  final Map<GlobalKey, SNode> nodesByGK = {};

  // removed snippet place naming functionality - use tab bar instead
  // final List<SnippetPlaceName> placeNames = [];
  // final Map<SnippetPlaceName, SnippetName> snippetPlacementMap = {};

  // EditablePageState? get currentPageState {
  //   return currentRoute != null
  //       ? pageGKs[currentRoute]?.currentState as EditablePageState?
  //       : null;
  // }

  // final Map<PanelName, GlobalKey> panelGkMap = {};

  // final Map<SNode, Set<PNode>> expandedNodes = {};

  // bool showingNodeButtons = true;

  // PTreeNodeTreeController? selectedNodePTree;
  // SnippetRootNode? targetSnippetBeingConfigured;

  // void updateSnippetBeingEdited(SnippetRootNode rootNode) {
  //   if (_snippetsBeingEdited.isEmpty) {
  //     _snippetsBeingEdited.addFirst(snippetBloc);
  //
  //   }
  //   logi("snippetBeingEdited is $snippetBeingEdited");
  //   return;
  // }

  /// A FlutterContentPage has a snippet with the same route name
  // void pushPage({required String routeName, required String path}) {}

  Reference folderPathRef(String folderPath) =>
      FirebaseStorage.instance.ref('/${fco.appName}$folderPath');

  final GksByFeature _calloutGkMap = {};

  GlobalKey? getCalloutGk(feature) => _calloutGkMap[feature];

  GlobalKey setCalloutGk(CalloutId feature, GlobalKey gk) {
    _calloutGkMap[feature] = gk;
    return gk;
  }

  final GksByTargetId _targetGK = {};

  GlobalKey? getTargetGk(TargetId targetId) {
    // fco.logger.d('getTargetGk($targetId)');
    return _targetGK[targetId];
  }

  GlobalKey setTargetGk(TargetId targetId, GlobalKey gk) {
    // if (_targetGK.containsKey(targetId) && _targetGK != gk) {
    //   logi('target changed.');
    // }
    // fco.logger.d('setTargetGk($targetId)');
    _targetGK[targetId] = gk;
    return gk;
  }
}
