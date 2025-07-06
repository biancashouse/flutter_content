// ignore_for_file: constant_identifier_names

// library flutter_content;

import 'dart:async';

import 'package:email_validator/email_validator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_callouts/flutter_callouts.dart';
import 'package:flutter_content/button_styles.dart';
import 'package:flutter_content/container_styles.dart';
import 'package:flutter_content/google_font_names.dart';
import 'package:flutter_content/src/can-edit-content.dart';
import 'package:flutter_content/src/model/firestore_model_repo.dart';
import 'package:flutter_content/src/pages.dart';
import 'package:flutter_content/src/route_observer.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/button_style_properties.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/container_style_properties.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/text_style_properties.dart';
import 'package:flutter_content/src/snippet/snodes/center_node.dart';
import 'package:flutter_content/src/snippet/snodes/text_node.dart';
import 'package:flutter_content/src/text_styles/button_style_search_anchor.dart';
import 'package:flutter_content/src/text_styles/container_style_search_anchor.dart';
import 'package:flutter_content/src/text_styles/text_style_search_anchor.dart';
import 'package:flutter_content/text_styles.dart';
import 'package:gap/gap.dart';

// import 'package:flutter_content/src/snippet/snodes/widget/fs_folder_node.dart';
import 'package:go_router/go_router.dart';
// import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'src/api/app/dynamic_page_route.dart';
import 'src/api/app/editable_page.dart';
import 'src/api/app/fc_app.dart';
import 'src/api/snippet_panel/clipboard_view.dart';
import 'src/api/snippet_panel/snippet_panel.dart';
import 'src/api/snippet_panel/snippet_templates.dart';
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

// re-export callout callout related s.t. apps using this package don't need to include the callouts pkg in pubspec
export 'package:flutter_callouts/src/api/callouts/callout_config.dart';
export 'package:flutter_callouts/src/api/callouts/callout_using_overlayportal.dart';
export 'package:flutter_callouts/src/api/callouts/color_values.dart';
export 'package:flutter_callouts/src/api/callouts/dotted_decoration.dart';
export 'package:flutter_callouts/src/api/callouts/globalkey_extn.dart';
export 'package:flutter_callouts/src/api/callouts/model/alignment_enum.dart';
export 'package:flutter_callouts/src/api/callouts/model/arrow_type_enum.dart';
export 'package:flutter_callouts/src/api/callouts/model/color_model.dart';
export 'package:flutter_callouts/src/api/callouts/model/decoration_shape_enum.dart';
export 'package:flutter_callouts/src/api/callouts/model/offset_model.dart';
export 'package:flutter_callouts/src/api/callouts/named_sc.dart';
// import 'src/nav/nav_mixin.dart';

export 'package:flutter_callouts/src/canvas/canvas_mixin.dart';

// re-export
export 'package:url_launcher/url_launcher.dart';
export 'package:url_launcher/url_launcher_string.dart';
export 'package:file_picker/src/file_picker.dart';
export 'package:file_picker/src/file_picker_result.dart';
export 'package:file_picker/src/platform_file.dart';
export 'package:gap/src/widgets/gap.dart';
export 'package:logger/src/logger.dart';
export 'package:logger/src/log_filter.dart';
export 'package:logger/src/log_event.dart';
export 'package:cloud_firestore/cloud_firestore.dart';
export 'package:logger/src/printers/pretty_printer.dart';
export 'package:firebase_core/firebase_core.dart';
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

export 'src/snippet/pnodes/editors/string_or_number_editor.dart';
export 'src/snippet/pnodes/editors/text_editor_with_autocomplete.dart';
export 'src/api/app/callout_content_editable_page.dart';
export 'src/api/app/callout_content_editable_page_route.dart';
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
export 'src/nav/nav_mixin.dart';
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
export 'package:flutter_content/src/model/model_repo.dart';
export 'package:flutter_content/src/model/firestore_model_repo.dart';

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

// global instance singleton
FlutterContentMixins fco = FlutterContentMixins._instance;

const String PINK_OVERLAY_NON_TAPPABLE = 'pink-border-overlay-non-tappable';
const String CUTOUT_OVERLAY_NON_TAPPABLE = 'cutout-overlay-non-tappable';
const String SELECTED_NODE_BORDER_CALLOUT = "selected-node-border-callout";
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
        MQMixin,
        GotitsMixin,
        PasswordlessMixin,
        NavMixin {
  FlutterContentMixins._internal() {
    // Private constructor
    // logi('FlutterContentMixins._internal() private constructor');
  }

  static final FlutterContentMixins _instance = FlutterContentMixins._internal();

  // called by _initApp() to set the late variables
  Future<CAPIBloC> init({
    required String appName,
    required List<String> editorPasswords,
    FirebaseOptions? fbOptions,
    bool useEmulator = false,
    bool useFBStorage = false,
    final IModelRepository? testModelRepo,
    // created in tests by a when(mockRepository.getCAPIModel(modelName: modelName...
    final Widget? testWidget,
    Map<String, void Function(GlobalKey? gk)> namedCallbacks = const {},
    required RoutingConfig routingConfig,
    required String initialRoutePath,
    bool skipAssetPkgName = false, // would only use true when pkg dir is actually inside current project
  }) async {
    await initLocalStorage();

    // fco.logger.d('init() ${stopwatch.elapsedMilliseconds}');

    loadGoogleFontNames(googleFontNames);

    _appName = appName;
    _editorPasswords = editorPasswords;

    // Bloc.observer = MyGlobalObserver();

    usingFBStorage = useFBStorage;

    // Dynamic RoutingConfig - https://pub.dev/documentation/go_router/latest/topics/Configuration-topic.html
    // setPathUrlStrategy();
    routingConfigVN = ValueNotifier<RoutingConfig>(routingConfig);
    router = GoRouter.routingConfig(
      debugLogDiagnostics: false,
      initialLocation: initialRoutePath,
      routingConfig: routingConfigVN,

      // onException: (_, GoRouterState state, GoRouter router) {
      //   router.go('/404', extra: state.uri.toString());
      // },
      errorBuilder: (context, state) {
        String matchedLocation = state.matchedLocation;
        // var param = state.pathParameters;

        if (matchedLocation == '/pages') {
          if (fco.authenticated.isTrue) {
            return Pages();
          } else {
            return AlertDialog(
              title: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(40),
                child: fco.coloredText('Viewing the Page list:\nYou must be signed in as an editor !', color: Colors.red),
              ),
            );
          }
        }
        // may have already been created (incl content callout snippets)

        final snippetNames = appInfo.snippetNames;
        bool dynamicPageExists = snippetNames.contains(matchedLocation);
        // bool contains(list, key) {
        //   for (String s in list) {
        //     print('$s, $key');
        //     if (s == key)
        //       return true;
        //   }
        //   return false;
        // }
        // dynamicPageExists = contains(snippetNames,matchedLocation);
        // may still exists if the matchedLocation is in the form: / + callout content id
        if (!dynamicPageExists) {
          // final possiblyACalloutContentId = matchedLocation.substring(1);
          // final isCID = int.tryParse(possiblyACalloutContentId) != null
          //     || possiblyACalloutContentId.startsWith('T-');
          // if (isCID) {
          //   final cid = possiblyACalloutContentId;
          //   if (snippetNames.contains(cid)) {
          //     return CalloutContentEditablePage(
          //       key: GlobalKey(), // provides access to state later
          //       cid: cid,
          //       child: SnippetPanel.fromSnippet(
          //         panelName: "callout-content-editor-panel",
          //         snippetName: cid,
          //         scName: cid,
          //       ),
          //     );
          //   }
          // }
        }
        if (dynamicPageExists) {
          EditablePage.removeAllNodeWidgetOverlays();
          // fco.dismiss('exit-editMode');
          final snippetName = matchedLocation;
          final rootNode = SnippetTemplateEnum.empty.clone()..name = snippetName;
          SnippetRootNode.loadSnippetFromCacheOrFromFBOrCreateFromTemplate(snippetName: snippetName, templateSnippetRootNode: rootNode);
          final dynamicPage = EditablePage(
            key: GlobalKey(), // provides access to state later
            routePath: matchedLocation,
            child: SnippetPanel.fromSnippet(panelName: "dynamic panel", snippetName: snippetName, scName: null, key: ValueKey<String>(snippetName)),
          );
          return dynamicPage;
        }
        // page doesn't exist yet
        // editor can ask to create it
        if (authenticated.isTrue) {
          return AlertDialog(
            title: Text('Page "${matchedLocation}" does not Exist !'),
            content: SingleChildScrollView(child: ListBody(children: const <Widget>[Text('Want to create it now ?')])),
            actions: <Widget>[
              TextButton(
                child: Text('Yes, Create page ${matchedLocation}'),
                onPressed: () {
                  final String destUrl = matchedLocation;
                  EditablePage.removeAllNodeWidgetOverlays();
                  // fco.dismiss('exit-editMode');
                  // bool userCanEdit = canEditContent.isTrue;
                  final snippetName = destUrl;
                  final rootNode = SnippetTemplateEnum.empty.clone()..name = snippetName;
                  SnippetRootNode.loadSnippetFromCacheOrFromFBOrCreateFromTemplate(snippetName: snippetName, templateSnippetRootNode: rootNode).then((_) {
                    afterNextBuildDo(() {
                      // SnippetInfoModel.snippetInfoCache;
                      router.push(destUrl);
                      // router.go('/');
                    });
                  });
                },
              ),
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  context.go('/');
                },
              ),
            ],
          );
        }

        // a sandbox page has been created
        if (fco.appInfo.sandboxPageNames.contains(matchedLocation)) {
          final String destUrl = matchedLocation;
          EditablePage.removeAllNodeWidgetOverlays();
          // fco.dismiss('exit-editMode');
          // bool userCanEdit = canEditContent.isTrue;
          final snippetName = destUrl;
          final rootNode = SnippetTemplateEnum.empty.clone()..name = snippetName;
          SnippetRootNode.loadSnippetFromCacheOrFromFBOrCreateFromTemplate(snippetName: snippetName, templateSnippetRootNode: rootNode).then((_) {
            afterNextBuildDo(() {
              // SnippetInfoModel.snippetInfoCache;
              router.push(destUrl);
              // router.go('/');
            });
          });
        }

        return AlertDialog(
          title: const Text('Page does not Exist !'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text('You must be signed in as an editor to create this page.'),
                    Gap(10),
                    ElevatedButton(
                      onPressed: () {
                        context.go('/');
                      },
                      child: const Text('ok'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // actions: <Widget>[
          //   TextButton(
          //     child: const Text('ok'),
          //     onPressed: () {
          //       context.go('/');
          //     },
          //   ),
          // ],
        );
      },
      observers: [GoRouterObserver()],
    );

    // extract go routes
    void parseRouteConfig(List<String> names, List<RouteBase> routes) {
      for (var route in routes) {
        if (route is GoRoute && route.name != null) names.add(route.name!);
        parseRouteConfig(names, route.routes);
      }
    }

    List<String> routePaths = [];
    // logi('starting parseRouteConfig');
    parseRouteConfig(routePaths, router.configuration.routes);

    // hard-wired route
    // router.configuration.routes.add(GoRoute(
    //     path: '/callout-content-editor',
    //     builder: (BuildContext context, GoRouterState state) =>
    //         CalloutContentEditablePage(
    //           tcAndFrom: state.extra as (TargetModel, String),
    //           key: GlobalKey(),
    //         )));

    // logi('finished parseRouteConfig');

    // logi('RoutingConfig Routes------------');
    // logi(routePaths.toString());
    // logi('--------------------------------');

    if (fbOptions != null) {
      // fco.logger.i('init 1. ${fco.stopwatch.elapsedMilliseconds}');

      modelRepo = FireStoreModelRepository(fbOptions);
      await (modelRepo as FireStoreModelRepository).possiblyInitFireStoreRelatedAPIs(useEmulator: useEmulator);

      // fco.logger.i('init 2. ${fco.stopwatch.elapsedMilliseconds}');

      // fetch model
      AppInfoModel? fbAppInfo = await modelRepo.getAppInfo();
      _appInfo = fbAppInfo ?? AppInfoModel();

      // text, button, and container styles get saved in the AppInfo. Combine with the canned (source-coded) ones
      try {
        namedTextStyles.addAll(cannedTextStyles());
        namedTextStyles.addAll(_appInfo.userTextStyles);
        namedButtonStyles.addAll(cannedButtonStyles());
        namedButtonStyles.addAll(_appInfo.userButtonStyles);
        namedContainerStyles.addAll(cannedContainerStyles());
        namedContainerStyles.addAll(_appInfo.userContainerStyles);
      } catch (e) {
        logger.e(e);
      }

      _gcrServerUrl = await modelRepo.getGcrServerUrl();

      // fco.logger.i('init 3. ${fco.stopwatch.elapsedMilliseconds}');

      // add more routes from the snippet names to below the "/" route
      // RouteBase home = routingConfig.routes.first;
      for (String snippetName in appInfo.snippetNames) {
        if (snippetName.startsWith('/') && !pageList.contains(snippetName)) {
          addSubRoute(newPath: snippetName, template: SnippetTemplateEnum.empty);
        }
      }

      // await loadLatestSnippetMap();

      // fco.logger.i('init 4. ${fco.stopwatch.elapsedMilliseconds}');
    }

    // fco.logger.i('init 5. ${fco.stopwatch.elapsedMilliseconds}');
    // await initLocalStorage();
    // fco.logger.i('init 6. ${fco.stopwatch.elapsedMilliseconds}');

    bool b = localStorage.read("canEditContent") ?? false;
    authenticated = CanEditContentVN(b);

    // FutureBuilder requires this return
    CAPIBloC capiBloc = CAPIBloC(modelRepo: modelRepo);

    // fco.logger.i('init 7. ${fco.stopwatch.elapsedMilliseconds}');
    return capiBloc;
  }

  late bool logging;

  bool emailIsValid(String theEA) => EmailValidator.validate(theEA);

  late IModelRepository modelRepo;

  // set by .init()
  String get appName => _appName;

  List<String> get editorPasswords => _editorPasswords;

  // reusable across all PNodes
  TextStyleNameSearchAnchor? textStyleNameAnchor;
  ButtonStyleNameSearchAnchor? buttonStyleNameAnchor;
  ContainerStyleNameSearchAnchor? containerStyleNameAnchor;

  late String _appName;
  late bool usingFBStorage;
  late List<String> _editorPasswords;

  late AppInfoModel _appInfo; // must be instantiated in init()
  late String? _gcrServerUrl;

  AppInfoModel get appInfo => _appInfo;

  String? get gcrServerUrl => _gcrServerUrl;

  JsonMap get appInfoAsMap => _appInfo.toMap();

  late ValueNotifier<RoutingConfig> routingConfigVN;

  late CanEditContentVN authenticated;

  GlobalKey authIconGK = GlobalKey();

  final snippetTreeTC = TransformationController();

  late GoRouter router;

  late TapGestureRecognizer webLinkF;

  List<String> get pageList {
    List<RouteBase> allRoutes = [];

    void routes(List<RouteBase> parentRoutes) {
      for (RouteBase route in parentRoutes) {
        allRoutes.add(route);
        if (route.routes.isNotEmpty) {
          routes(route.routes);
        }
      }
    }

    routes(routingConfigVN.value.routes);

    return allRoutes
        .map((route) {
          String path = (route as GoRoute).path;
          return path.startsWith('/') ? path : '/$path';
        })
        .toList()
        .where((routePath) => !appInfo.sandboxPageNames.contains(routePath))
        .toList();
  }

  void addSubRoute({required String newPath, required SnippetTemplateEnum template}) {
    List<RouteBase> subRoutes = routingConfigVN.value.routes;
    if (!newPath.endsWith(' missing')) {
      subRoutes.add(DynamicPageRoute(path: newPath, template: template));
    }
  }

  void deleteSubRoute({required String path}) {
    List<RouteBase> subRoutes = routingConfigVN.value.routes;
    for (RouteBase sr in subRoutes) {
      if (sr is GoRoute && sr.path == path) {
        subRoutes.remove(sr);
      }
    }
  }

  Future<void> ensureContentSnippetPresent(String contentCId) async =>
      SnippetInfoModel.cachedSnippetInfo(contentCId) ??
      await SnippetRootNode.loadSnippetFromCacheOrFromFBOrCreateFromTemplate(
        snippetName: contentCId,
        templateSnippetRootNode: SnippetRootNode(name: contentCId, child: CenterNode(child: TextNode(text: contentCId, tsPropGroup: TextStyleProperties()))),
        // snippetRootNode: SnippetTemplateEnum.empty.templateSnippet(),
      );

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

  SNode? get clipboard => _appInfo.clipboard;

  bool get clipboardIsEmpty => _appInfo.clipboard == null;

  void setClipboard(SNode? newClipboard) => _appInfo.clipboard = newClipboard;

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

    String? snippetName = snippet!.name.startsWith('/') ? snippet.name.substring(1) : snippet.name;

    // only does following i.i. a new snippet
    SnippetInfoModel? snippetInfo = SnippetInfoModel.cachedSnippetInfo(snippetName);
    if (snippetInfo != null) {
      // remove all subsequent versions following the current version
      // before saving new version
      VersionId? currVerId = snippetInfo.currentVersionId();
      if (currVerId != null) {
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
    }

    // write new version to FB
    await fco._cacheAndSaveANewSnippetVersion(snippetName: snippetName, rootNode: snippet);
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
    SnippetInfoModel? snippetInfo = SnippetInfoModel.cachedSnippetInfo(snippetName);

    VersionId? currVersionId = snippetInfo?.currentVersionId();

    // NEW snippet - initial version
    if (snippetInfo == null) {
      snippetInfo = SnippetInfoModel(
        snippetName,
        editingVersionId: newVersionId,
        publishedVersionId: newVersionId,
        routePath: pagePath,
        autoPublish: appInfo.autoPublishDefault,
        versionIds: [],
      );
      SnippetInfoModel.cacheSnippetInfo(snippetName, snippetInfo);
      // update FB appInfo
      if (!appInfo.snippetNames.contains(snippetName)) {
        // jsArray issue
        List<String> newList = appInfo.snippetNames;
        newList.add(snippetName);
        appInfo.snippetNames = newList;
        await modelRepo.saveAppInfo();
      }
    } else {
      snippetInfo.editingVersionId = newVersionId;
      if (snippetInfo.autoPublish ?? appInfo.autoPublishDefault) {
        snippetInfo.publishedVersionId = newVersionId;
      }
    }

    snippetInfo.versionIds!.add(newVersionId);
    snippetInfo.cachedVersions[newVersionId] = rootNode;

    // try to write new version to FB
    bool fbSuccess = await modelRepo.saveSnippetVersion(snippetName: snippetName, newVersionId: newVersionId, newVersion: rootNode);

    if (!fbSuccess) {
      logger.i('cacheAndSaveANewSnippetVersion($snippetName) -  not fbSuccess !');
    } else {
      // reset current version to before change
      if (currVersionId != null) {
        String? origSnippetJson = FlutterContentApp.capiState.snippetBeingEdited?.jsonBeforeAnyChange;
        if (origSnippetJson != null) {
          SnippetRootNode? origSnippet = SnippetRootNodeMapper.fromJson(origSnippetJson);
          snippetInfo.cachedVersions[currVersionId] = origSnippet;
          FlutterContentApp.capiState.snippetBeingEdited!.jsonBeforeAnyChange = rootNode.toJson();
        }
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

  void forceRefresh({bool onlyTargetsWrappers = false}) =>
      FlutterContentApp.capiBloc.add(CAPIEvent.forceRefresh(onlyTargetsWrappers: onlyTargetsWrappers));

  Future<void> setCanEditContent(bool b) async {
    authenticated.value = b;
    return await localStorage.write("canEditContent", b);
  }

  Offset calloutConfigToolbarPos() => _calloutConfigToolbarPos ?? Offset(scrW / 2 - 350, calloutConfigToolbarAtTopOfScreen ? 10 : scrH - 90);

  void setCalloutConfigToolbarPos(Offset newPos) => _calloutConfigToolbarPos = newPos;

  Offset devToolsFABPos(context) => _devToolsFABPos ?? Offset(40, MediaQuery.sizeOf(context).height - 100);

  void setDevToolsFABPos(Offset newPos) => _devToolsFABPos = newPos;

  bool? showingNodeBoundaryOverlays;

  registerHandler(HandlerName name, void Function(BuildContext) f) => _handlers[name] = f;

  void Function(BuildContext)? namedHandler(HandlerName name) => _handlers[name];

  String? currentEditablePagePath; // gets set by EditablePage initState()

  // each snippet panel has a gk, a last selected node, and a ur
  // final Map<RouteName, GlobalKey> pageGKs = {};

  // if a page has a scrollable, its offset can be stored in this map to avoid rebuild losing it
  // final Map<String, double> scrollControllerOffsets = {};
  // String? currentRoute;

  // every node's toWidget() creates a (resusable) GK
  // knowing a node's GK you can establish it ScrolController? or TabController?
  final Map<GlobalKey, SNode> nodesByGK = {};

  // removed snippet place naming functionality - use tab bar instead
  // final List<SnippetPlaceName> placeNames = [];
  // final Map<SnippetPlaceName, SnippetName> snippetPlacementMap = {};

  // EditablePageState? get currentPageState {
  //   return currentRoute != null
  //       ? pageGKs[currentRoute]?.currentState as EditablePageState?
  //       : null;
  // }

  final Map<PanelName, GlobalKey> panelGkMap = {};
  final Map<SNode, Set<PNode>> expandedNodes = {};
  final Map<HandlerName, void Function(BuildContext)> _handlers = {};

  List<HandlerName> handlers() => _handlers.keys.toList();

  bool showingNodeButtons = true;

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
  void pushPage({required String routeName, required String path}) {}

  final GksByFeature _calloutGkMap = {};

  GlobalKey? getCalloutGk(feature) => _calloutGkMap[feature];

  GlobalKey setCalloutGk(CalloutId feature, GlobalKey gk) {
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

  // TargetsWrapperState? parentTW(String twName) =>
  //     targetsWrappers[twName]?.currentState as TargetsWrapperState?;

  // final FeatureList _singleTargetBtnFeatures = [];

  // FeatureList get singleTargetBtnFeatures => _singleTargetBtnFeatures;

  // STreeNode? gkToNode(GlobalKey gk) => gkSTreeNodeMap[gk];

  void hideClipboard() => dismiss("floating-clipboard");

  void showFloatingClipboard({ScrollControllerName? scName}) {
    dismiss("floating-clipboard");
    fco.showOverlay(
      calloutContent: const ClipboardView(),
      calloutConfig: CalloutConfigModel(
        cId: "floating-clipboard",
        initialCalloutW: 300,
        initialCalloutH: 180,
        initialCalloutPos: OffsetModel(scrW - 400, 0),
        fillColor: ColorModel.fromColor(Colors.transparent),
        arrowType: ArrowTypeEnum.NONE,
        borderRadius: 16,
        scrollControllerName: scName,
      ),
    );
  }

  /// inspect the named text styles for a match, and return the name of that matching style
  TextStyleName? findTextStyleName(TextStyleProperties props) {
    for (TextStyleName tsName in _appInfo.userTextStyles.keys) {
      TextStyleProperties namedTSProps = appInfo.userTextStyles[tsName]!;
      if (namedTSProps.color == props.color &&
          namedTSProps.fontWeight == props.fontWeight &&
          namedTSProps.fontSize == props.fontSize &&
          namedTSProps.fontSizeName == props.fontSizeName &&
          namedTSProps.fontFamily == props.fontFamily &&
          namedTSProps.fontStyle == props.fontStyle &&
          namedTSProps.letterSpacing == props.letterSpacing &&
          namedTSProps.lineHeight == props.lineHeight) {
        return tsName;
      }
    }
    return null;
  }

  ButtonStyleName? findButtonStyleName(ButtonStyleProperties props) {
    for (ButtonStyleName bsName in _appInfo.userButtonStyles.keys) {
      ButtonStyleProperties namedBSProps = _appInfo.userButtonStyles[bsName]!;
      if (namedBSProps.bgColor == props.bgColor &&
          namedBSProps.fgColor == props.fgColor &&
          namedBSProps.tsPropGroup == props.tsPropGroup &&
          namedBSProps.elevation == props.elevation &&
          namedBSProps.padding == props.padding &&
          namedBSProps.shape == props.shape &&
          namedBSProps.fixedH == props.fixedH &&
          namedBSProps.fixedW == props.fixedW &&
          namedBSProps.maxH == props.maxH &&
          namedBSProps.maxW == props.maxW &&
          namedBSProps.minH == props.minW &&
          namedBSProps.maxH == props.maxW &&
          namedBSProps.radius == props.radius &&
          namedBSProps.side?.color == props.side?.color &&
          namedBSProps.side?.width == props.side?.width) {
        return bsName;
      }
    }
    return null;
  }

  ContainerStyleName? findContainerStyleName(ContainerStyleProperties props) {
    for (ContainerStyleName csName in _appInfo.userContainerStyles.keys) {
      ContainerStyleProperties namedCSProps = _appInfo.userContainerStyles[csName]!;
      if (namedCSProps == props) {
        return csName;
      }

      if (namedCSProps.outlinedBorderGroup != props.outlinedBorderGroup) {
        break;
      }

      if (namedCSProps.badgeWidth != props.badgeWidth) {
        break;
      }

      if (namedCSProps.badgeText != props.badgeText) {
        break;
      }

      if (namedCSProps.badgeHeight != props.badgeHeight) {
        break;
      }

      if (namedCSProps.badgeCorner != props.badgeCorner) {
        break;
      }

      if (namedCSProps.dash != props.dash) {
        break;
      }

      if (namedCSProps.starPoints != props.starPoints) {
        break;
      }

      if (namedCSProps.borderRadius != props.borderRadius) {
        break;
      }

      if (namedCSProps.borderColors?.color1 != props.borderColors?.color1) {
        break;
      }

      if (namedCSProps.borderColors?.color2 != props.borderColors?.color2) {
        break;
      }

      if (namedCSProps.borderColors?.color3 != props.borderColors?.color3) {
        break;
      }

      if (namedCSProps.borderColors?.color4 != props.borderColors?.color4) {
        break;
      }

      if (namedCSProps.borderColors?.color5 != props.borderColors?.color5) {
        break;
      }

      if (namedCSProps.borderColors?.color6 != props.borderColors?.color6) {
        break;
      }

      if (namedCSProps.borderThickness != props.borderThickness) {
        break;
      }

      if (namedCSProps.decoration != props.decoration) {
        break;
      }

      if (namedCSProps.height != props.height) {
        break;
      }

      if (namedCSProps.width != props.width) {
        break;
      }

      if (namedCSProps.alignment != props.alignment) {
        break;
      }

      if (namedCSProps.padding != props.padding) {
        break;
      }

      if (namedCSProps.margin != props.margin) {
        break;
      }

      if (namedCSProps.fillColors != props.fillColors) {
        break;
      }

      if (namedCSProps.gap != props.gap) {
        return csName;
      }
    }
    return null;
  }

  // // Because snippetNames is a JSArray on web
  // List<String> get snippetNameList {
  //   List<String> list = [];
  //   for (String s in appInfo.snippetNames) {
  //     list.add(s);
  //   }
  //   return list;
  // }

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

  // snippet editing
  //   CalloutConfig snippetTreeCalloutConfig({
  //     required String cId,
  //     required VoidCallback onDismissedF,
  //     ScrollControllerName? scName,
  //   }) {
  //     double width() {
  //       double? w = localStorage.read("snippet-tree-callout-width");
  //       if (w != null) return w.abs();
  //
  //       // if (root?.child == null) return 190;
  //       w = min(FlutterContentApp.capiBloc.state.snippetTreeCalloutW ?? 500, 600);
  //       return w > 0 ? w : 500;
  //     }
  //
  //     double height() {
  //       double? h = localStorage.read("snippet-tree-callout-height");
  //       if (h != null) return h.abs();
  //
  //       // if (root?.child == null) return 60;
  // // int numNodes = root != null ? bloc.state.snippetTreeC.countNodesInTree(root) : 0;
  // // double h = numNodes == 0 ? min(bloc.state.snippetTreeCalloutH ?? 400, 600) : numNodes * 60;
  //       h = min(FlutterContentApp.capiBloc.state.snippetTreeCalloutH ?? 500,
  //           fco.scrH - 50);
  //       return h > 0 ? h : 500;
  //     }
  //
  //     return CalloutConfigModel(
  //       cId: cId,
  //       // frameTarget: true,
  //       arrowType: ArrowTypeEnum.NONE,
  //       barrier: CalloutBarrierConfig(
  //         opacity: .1,
  //         // closeOnTapped: false,
  //         // hideOnTapped: true,
  //       ),
  //       onDismissedF: onDismissedF,
  // // onHiddenF: () {
  // //   STreeNode.unhighlightSelectedNode();
  // //   FCO.capiBloc.add(const CAPIEvent.unhideAllTargetGroups());
  // //   fco.dismiss(TREENODE_MENU_CALLOUT);
  // //   MaterialAppWrapper.showAllPinkSnippetOverlays();
  // //   if (snippetBloc.state.canUndo()) {
  // //     FCO.capiBloc.add(const CAPIEvent.saveModel());
  // //   }
  // // },
  //       initialCalloutW: width(),
  //       initialCalloutH: height(),
  // //calloutH ?? 500,
  // // barrierOpacity: .1,
  // // arrowType: ArrowTypeEnum.POINTY,
  // // color: Colors.purpleAccent.shade100,
  //       borderRadius: 16,
  // // initialCalloutPos: bloc.state.snippetTreeCalloutInitialPos,
  //       finalSeparation: 40,
  // // onBarrierTappedF: () async {
  // //   // also check whether any snippet change
  // //   var newSnippetMap = CAPIBloc.getSnippetJsonsFromTree(bloc.state.snippetTreeC);
  // //   bool changeOccurred = true || !mapEquals(originalSnippetMap, newSnippetMap) || originalClipboardJson != bloc.state.jsonClipboard;
  // //   bloc.add(CAPIEvent.hideSnippetTree(save: changeOccurred));
  // //   removeSnippetTreeCallout(snippetName);
  // //   onClosedF.call();
  // // },
  // // draggable: false,
  //       dragHandleHeight: 40,
  //       resizeableH: true,
  //       resizeableV: true,
  //       onResizeF: (newSize) {
  //         // keep size in localstorage for future use
  //         localStorage.write("snippet-tree-callout-width", newSize.width);
  //         localStorage.write("snippet-tree-callout-height", newSize.height);
  //       },
  //       onDragStartedF: () {
  //         FlutterContentApp.selectedNode?.hidePropertiesWhileDragging = true;
  //       },
  //       onDragEndedF: (_) {
  //         FlutterContentApp.selectedNode?.hidePropertiesWhileDragging = false;
  //       },
  //       scrollControllerName: scName,
  //     );
  //   }

  //   void showSnippetTreeAndPropertiesCallout({
  //     required TargetKeyFunc targetGKF,
  //     ScrollControllerName? scName,
  //     required VoidCallback onDismissedF,
  //     required STreeNode startingAtNode,
  //     required STreeNode selectedNode,
  //     // required STreeNode tappedNode,
  //     bool allowButtonCallouts = false,
  //     TargetModel? targetBeingConfigured,
  //   }) async {
  //     SnippetRootNode? rootNode =
  //         FlutterContentApp.snippetBeingEdited?.getRootNode();
  //     if (rootNode == null) return;
  //
  //     // dismiss any pink border overlays
  //     fco.dismissAll(exceptFeatures: [
  //       rootNode.name,
  //       CalloutConfigToolbar.CID,
  //       targetBeingConfigured?.contentCId ?? 'n/a',
  //     ]);
  //
  //     // if (rootNode == null) return;
  //
  //     // to check for any change
  //     // String? originalTcS = tc != null ? jsonEncode(initialTC?.toJson()) : null;
  //     // EncodedSnippetJson originalSnippetJson = rootNode.toJson();
  //     // String? originalClipboardJson = FlutterContentApp.capiBloc.state.jsonClipboard;
  //     // tree and properties callouts using snippetName.hashCode, and snippetName.hashCode+1 resp.
  //
  //     // CalloutConfig cc = snippetTreeCalloutConfig(
  //     //   cId: FlutterContentApp.snippetBeingEdited!.getRootNode().name,
  //     //   onDismissedF: onDismissedF,
  //     // );
  //     //
  //     // Widget content = SnippetTreeAndPropertiesCalloutContents(
  //     //   scName: scName,
  //     //   allowButtonCallouts: allowButtonCallouts,
  //     // );
  //     //
  //     // fco.showOverlay(
  //     //   calloutConfig: cc,
  //     //   calloutContent: content,
  //     //   targetGkF: targetGKF,
  //     // );
  //
  //     // imm select a node
  //     STreeNode sel = selectedNode;
  //     FlutterContentApp.capiBloc.add(CAPIEvent.selectNode(
  //       node: sel,
  //       //selectedTreeNodeGK: GlobalKey(debugLabel: 'selectedTreeNodeGK'),
  // // imageTC: tc,
  //     ));
  //     fco.afterMsDelayDo(500, () {
  //       selectedNode.showNodeWidgetOverlay(scName: scName);
  //     });
  //   }
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

class WebLinkTapGestureRecognizer extends TapGestureRecognizer {
  // one for each webLink
  static final _recognizers = <String, WebLinkTapGestureRecognizer>{};

  static WebLinkTapGestureRecognizer createWebLinkRecognizer(String webLink) {
    WebLinkTapGestureRecognizer? recognizer = _recognizers[webLink];
    if (recognizer == null) {
      _recognizers[webLink] = recognizer = WebLinkTapGestureRecognizer(webLink);
    }
    return recognizer;
  }

  final String webLink;

  WebLinkTapGestureRecognizer(this.webLink) {
    onTap = () async {
      if (await canLaunchUrlString(webLink)) {
        launchUrlString(webLink);
      }
    };
  }

  static void destroyAll() {
    for (final recognizer in _recognizers.values) {
      recognizer.dispose();
    }
    _recognizers.clear();
  }
}
