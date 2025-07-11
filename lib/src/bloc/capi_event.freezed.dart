// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'capi_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$CAPIEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? panelName) selectPanel,
    required TResult Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )
    overrideTargetGK,
    required TResult Function(bool onlyTargetsWrappers) forceRefresh,
    required TResult Function(
      SNode? newContent,
      String? scName,
      dynamic skipSave,
    )
    updateClipboard,
    required TResult Function(String snippetName, String versionId)
    publishSnippet,
    required TResult Function(String snippetName, String versionId)
    revertSnippet,
    required TResult Function(String pathName) deletePage,
    required TResult Function(String snippetName) toggleAutoPublishingOfSnippet,
    required TResult Function(bool b) autoPublishDefault,
    required TResult Function(bool hide) hideIframes,
    required TResult Function(String snippetName, String panelName)
    setPanelOrPlaceholderSnippet,
    required TResult Function(String snippetName) enterSelectWidgetMode,
    required TResult Function() exitSelectWidgetMode,
    required TResult Function(SnippetRootNode rootNode, SNode? selectedNode)
    pushSnippetEditor,
    required TResult Function(bool save) popSnippetEditor,
    required TResult Function() showDirectoryTree,
    required TResult Function(bool save) removeDirectoryTree,
    required TResult Function(SNode node) selectNode,
    required TResult Function() clearNodeSelection,
    required TResult Function(SNode node, String newSnippetName)
    saveNodeAsSnippet,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    replaceSelectionWith,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    wrapSelectionWith,
    required TResult Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )
    appendChild,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    addSiblingBefore,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    addSiblingAfter,
    required TResult Function(Type? widgetSpanChildType) pasteReplacement,
    required TResult Function(
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )
    pasteChild,
    required TResult Function() pasteSiblingBefore,
    required TResult Function() pasteSiblingAfter,
    required TResult Function() deleteNodeTapped,
    required TResult Function() completeDeletion,
    required TResult Function(SnippetRootNode rootNode)
    copySnippetJsonToClipboard,
    required TResult Function(String? snippetJson) replaceSnippetFromJson,
    required TResult Function(SNode node, String? scName, dynamic skipSave)
    copyNode,
    required TResult Function(SNode node, String? scName, dynamic skipSave)
    cutNode,
    required TResult Function(String snippetName, SNode? selectedNode)
    selectedDirectoryOrNode,
    required TResult Function(Uint8List? newBytes) imageChanged,
    required TResult Function() forceSnippetRefresh,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? panelName)? selectPanel,
    TResult? Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )?
    overrideTargetGK,
    TResult? Function(bool onlyTargetsWrappers)? forceRefresh,
    TResult? Function(SNode? newContent, String? scName, dynamic skipSave)?
    updateClipboard,
    TResult? Function(String snippetName, String versionId)? publishSnippet,
    TResult? Function(String snippetName, String versionId)? revertSnippet,
    TResult? Function(String pathName)? deletePage,
    TResult? Function(String snippetName)? toggleAutoPublishingOfSnippet,
    TResult? Function(bool b)? autoPublishDefault,
    TResult? Function(bool hide)? hideIframes,
    TResult? Function(String snippetName, String panelName)?
    setPanelOrPlaceholderSnippet,
    TResult? Function(String snippetName)? enterSelectWidgetMode,
    TResult? Function()? exitSelectWidgetMode,
    TResult? Function(SnippetRootNode rootNode, SNode? selectedNode)?
    pushSnippetEditor,
    TResult? Function(bool save)? popSnippetEditor,
    TResult? Function()? showDirectoryTree,
    TResult? Function(bool save)? removeDirectoryTree,
    TResult? Function(SNode node)? selectNode,
    TResult? Function()? clearNodeSelection,
    TResult? Function(SNode node, String newSnippetName)? saveNodeAsSnippet,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    replaceSelectionWith,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    wrapSelectionWith,
    TResult? Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    appendChild,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingBefore,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingAfter,
    TResult? Function(Type? widgetSpanChildType)? pasteReplacement,
    TResult? Function(
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    pasteChild,
    TResult? Function()? pasteSiblingBefore,
    TResult? Function()? pasteSiblingAfter,
    TResult? Function()? deleteNodeTapped,
    TResult? Function()? completeDeletion,
    TResult? Function(SnippetRootNode rootNode)? copySnippetJsonToClipboard,
    TResult? Function(String? snippetJson)? replaceSnippetFromJson,
    TResult? Function(SNode node, String? scName, dynamic skipSave)? copyNode,
    TResult? Function(SNode node, String? scName, dynamic skipSave)? cutNode,
    TResult? Function(String snippetName, SNode? selectedNode)?
    selectedDirectoryOrNode,
    TResult? Function(Uint8List? newBytes)? imageChanged,
    TResult? Function()? forceSnippetRefresh,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? panelName)? selectPanel,
    TResult Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )?
    overrideTargetGK,
    TResult Function(bool onlyTargetsWrappers)? forceRefresh,
    TResult Function(SNode? newContent, String? scName, dynamic skipSave)?
    updateClipboard,
    TResult Function(String snippetName, String versionId)? publishSnippet,
    TResult Function(String snippetName, String versionId)? revertSnippet,
    TResult Function(String pathName)? deletePage,
    TResult Function(String snippetName)? toggleAutoPublishingOfSnippet,
    TResult Function(bool b)? autoPublishDefault,
    TResult Function(bool hide)? hideIframes,
    TResult Function(String snippetName, String panelName)?
    setPanelOrPlaceholderSnippet,
    TResult Function(String snippetName)? enterSelectWidgetMode,
    TResult Function()? exitSelectWidgetMode,
    TResult Function(SnippetRootNode rootNode, SNode? selectedNode)?
    pushSnippetEditor,
    TResult Function(bool save)? popSnippetEditor,
    TResult Function()? showDirectoryTree,
    TResult Function(bool save)? removeDirectoryTree,
    TResult Function(SNode node)? selectNode,
    TResult Function()? clearNodeSelection,
    TResult Function(SNode node, String newSnippetName)? saveNodeAsSnippet,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    replaceSelectionWith,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    wrapSelectionWith,
    TResult Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    appendChild,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingBefore,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingAfter,
    TResult Function(Type? widgetSpanChildType)? pasteReplacement,
    TResult Function(Type? widgetSpanChildType, SNode? testWidgetSpanChildNode)?
    pasteChild,
    TResult Function()? pasteSiblingBefore,
    TResult Function()? pasteSiblingAfter,
    TResult Function()? deleteNodeTapped,
    TResult Function()? completeDeletion,
    TResult Function(SnippetRootNode rootNode)? copySnippetJsonToClipboard,
    TResult Function(String? snippetJson)? replaceSnippetFromJson,
    TResult Function(SNode node, String? scName, dynamic skipSave)? copyNode,
    TResult Function(SNode node, String? scName, dynamic skipSave)? cutNode,
    TResult Function(String snippetName, SNode? selectedNode)?
    selectedDirectoryOrNode,
    TResult Function(Uint8List? newBytes)? imageChanged,
    TResult Function()? forceSnippetRefresh,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SelectPanel value) selectPanel,
    required TResult Function(OverrideTargetGK value) overrideTargetGK,
    required TResult Function(ForceRefresh value) forceRefresh,
    required TResult Function(UpdateClipboard value) updateClipboard,
    required TResult Function(PublishSnippet value) publishSnippet,
    required TResult Function(RevertSnippet value) revertSnippet,
    required TResult Function(DeletePage value) deletePage,
    required TResult Function(ToggleAutoPublishingOfSnippet value)
    toggleAutoPublishingOfSnippet,
    required TResult Function(AutoPublishDefault value) autoPublishDefault,
    required TResult Function(HideIframes value) hideIframes,
    required TResult Function(SetPanelSnippet value)
    setPanelOrPlaceholderSnippet,
    required TResult Function(EnterSelectWidgetMode value)
    enterSelectWidgetMode,
    required TResult Function(ExitSelectWidgetMode value) exitSelectWidgetMode,
    required TResult Function(PushSnippetEditor value) pushSnippetEditor,
    required TResult Function(PopSnippetEditor value) popSnippetEditor,
    required TResult Function(ShowDirectoryTree value) showDirectoryTree,
    required TResult Function(RemoveDirectoryTree value) removeDirectoryTree,
    required TResult Function(SelectNode value) selectNode,
    required TResult Function(ClearNodeSelection value) clearNodeSelection,
    required TResult Function(SaveNodeAsSnippet value) saveNodeAsSnippet,
    required TResult Function(ReplaceSelectionWith value) replaceSelectionWith,
    required TResult Function(WrapSelectionWith value) wrapSelectionWith,
    required TResult Function(AppendChild value) appendChild,
    required TResult Function(AddSiblingBefore value) addSiblingBefore,
    required TResult Function(AddSiblingAfter value) addSiblingAfter,
    required TResult Function(PasteReplacement value) pasteReplacement,
    required TResult Function(PasteChild value) pasteChild,
    required TResult Function(PasteSiblingBefore value) pasteSiblingBefore,
    required TResult Function(PasteSiblingAfter value) pasteSiblingAfter,
    required TResult Function(DeleteNodeTapped value) deleteNodeTapped,
    required TResult Function(CompleteDeletion value) completeDeletion,
    required TResult Function(CopySnippetJsonToClipboard value)
    copySnippetJsonToClipboard,
    required TResult Function(ReplaceSnippetFromJson value)
    replaceSnippetFromJson,
    required TResult Function(CopyNode value) copyNode,
    required TResult Function(CutNode value) cutNode,
    required TResult Function(SelectedDirectoryOrNode value)
    selectedDirectoryOrNode,
    required TResult Function(ImageChanged value) imageChanged,
    required TResult Function(ForceSnippetRefresh value) forceSnippetRefresh,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SelectPanel value)? selectPanel,
    TResult? Function(OverrideTargetGK value)? overrideTargetGK,
    TResult? Function(ForceRefresh value)? forceRefresh,
    TResult? Function(UpdateClipboard value)? updateClipboard,
    TResult? Function(PublishSnippet value)? publishSnippet,
    TResult? Function(RevertSnippet value)? revertSnippet,
    TResult? Function(DeletePage value)? deletePage,
    TResult? Function(ToggleAutoPublishingOfSnippet value)?
    toggleAutoPublishingOfSnippet,
    TResult? Function(AutoPublishDefault value)? autoPublishDefault,
    TResult? Function(HideIframes value)? hideIframes,
    TResult? Function(SetPanelSnippet value)? setPanelOrPlaceholderSnippet,
    TResult? Function(EnterSelectWidgetMode value)? enterSelectWidgetMode,
    TResult? Function(ExitSelectWidgetMode value)? exitSelectWidgetMode,
    TResult? Function(PushSnippetEditor value)? pushSnippetEditor,
    TResult? Function(PopSnippetEditor value)? popSnippetEditor,
    TResult? Function(ShowDirectoryTree value)? showDirectoryTree,
    TResult? Function(RemoveDirectoryTree value)? removeDirectoryTree,
    TResult? Function(SelectNode value)? selectNode,
    TResult? Function(ClearNodeSelection value)? clearNodeSelection,
    TResult? Function(SaveNodeAsSnippet value)? saveNodeAsSnippet,
    TResult? Function(ReplaceSelectionWith value)? replaceSelectionWith,
    TResult? Function(WrapSelectionWith value)? wrapSelectionWith,
    TResult? Function(AppendChild value)? appendChild,
    TResult? Function(AddSiblingBefore value)? addSiblingBefore,
    TResult? Function(AddSiblingAfter value)? addSiblingAfter,
    TResult? Function(PasteReplacement value)? pasteReplacement,
    TResult? Function(PasteChild value)? pasteChild,
    TResult? Function(PasteSiblingBefore value)? pasteSiblingBefore,
    TResult? Function(PasteSiblingAfter value)? pasteSiblingAfter,
    TResult? Function(DeleteNodeTapped value)? deleteNodeTapped,
    TResult? Function(CompleteDeletion value)? completeDeletion,
    TResult? Function(CopySnippetJsonToClipboard value)?
    copySnippetJsonToClipboard,
    TResult? Function(ReplaceSnippetFromJson value)? replaceSnippetFromJson,
    TResult? Function(CopyNode value)? copyNode,
    TResult? Function(CutNode value)? cutNode,
    TResult? Function(SelectedDirectoryOrNode value)? selectedDirectoryOrNode,
    TResult? Function(ImageChanged value)? imageChanged,
    TResult? Function(ForceSnippetRefresh value)? forceSnippetRefresh,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SelectPanel value)? selectPanel,
    TResult Function(OverrideTargetGK value)? overrideTargetGK,
    TResult Function(ForceRefresh value)? forceRefresh,
    TResult Function(UpdateClipboard value)? updateClipboard,
    TResult Function(PublishSnippet value)? publishSnippet,
    TResult Function(RevertSnippet value)? revertSnippet,
    TResult Function(DeletePage value)? deletePage,
    TResult Function(ToggleAutoPublishingOfSnippet value)?
    toggleAutoPublishingOfSnippet,
    TResult Function(AutoPublishDefault value)? autoPublishDefault,
    TResult Function(HideIframes value)? hideIframes,
    TResult Function(SetPanelSnippet value)? setPanelOrPlaceholderSnippet,
    TResult Function(EnterSelectWidgetMode value)? enterSelectWidgetMode,
    TResult Function(ExitSelectWidgetMode value)? exitSelectWidgetMode,
    TResult Function(PushSnippetEditor value)? pushSnippetEditor,
    TResult Function(PopSnippetEditor value)? popSnippetEditor,
    TResult Function(ShowDirectoryTree value)? showDirectoryTree,
    TResult Function(RemoveDirectoryTree value)? removeDirectoryTree,
    TResult Function(SelectNode value)? selectNode,
    TResult Function(ClearNodeSelection value)? clearNodeSelection,
    TResult Function(SaveNodeAsSnippet value)? saveNodeAsSnippet,
    TResult Function(ReplaceSelectionWith value)? replaceSelectionWith,
    TResult Function(WrapSelectionWith value)? wrapSelectionWith,
    TResult Function(AppendChild value)? appendChild,
    TResult Function(AddSiblingBefore value)? addSiblingBefore,
    TResult Function(AddSiblingAfter value)? addSiblingAfter,
    TResult Function(PasteReplacement value)? pasteReplacement,
    TResult Function(PasteChild value)? pasteChild,
    TResult Function(PasteSiblingBefore value)? pasteSiblingBefore,
    TResult Function(PasteSiblingAfter value)? pasteSiblingAfter,
    TResult Function(DeleteNodeTapped value)? deleteNodeTapped,
    TResult Function(CompleteDeletion value)? completeDeletion,
    TResult Function(CopySnippetJsonToClipboard value)?
    copySnippetJsonToClipboard,
    TResult Function(ReplaceSnippetFromJson value)? replaceSnippetFromJson,
    TResult Function(CopyNode value)? copyNode,
    TResult Function(CutNode value)? cutNode,
    TResult Function(SelectedDirectoryOrNode value)? selectedDirectoryOrNode,
    TResult Function(ImageChanged value)? imageChanged,
    TResult Function(ForceSnippetRefresh value)? forceSnippetRefresh,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CAPIEventCopyWith<$Res> {
  factory $CAPIEventCopyWith(CAPIEvent value, $Res Function(CAPIEvent) then) =
      _$CAPIEventCopyWithImpl<$Res, CAPIEvent>;
}

/// @nodoc
class _$CAPIEventCopyWithImpl<$Res, $Val extends CAPIEvent>
    implements $CAPIEventCopyWith<$Res> {
  _$CAPIEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SelectPanelImplCopyWith<$Res> {
  factory _$$SelectPanelImplCopyWith(
    _$SelectPanelImpl value,
    $Res Function(_$SelectPanelImpl) then,
  ) = __$$SelectPanelImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? panelName});
}

/// @nodoc
class __$$SelectPanelImplCopyWithImpl<$Res>
    extends _$CAPIEventCopyWithImpl<$Res, _$SelectPanelImpl>
    implements _$$SelectPanelImplCopyWith<$Res> {
  __$$SelectPanelImplCopyWithImpl(
    _$SelectPanelImpl _value,
    $Res Function(_$SelectPanelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? panelName = freezed}) {
    return _then(
      _$SelectPanelImpl(
        panelName:
            freezed == panelName
                ? _value.panelName
                : panelName // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc

class _$SelectPanelImpl with DiagnosticableTreeMixin implements SelectPanel {
  const _$SelectPanelImpl({required this.panelName});

  @override
  final String? panelName;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CAPIEvent.selectPanel(panelName: $panelName)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CAPIEvent.selectPanel'))
      ..add(DiagnosticsProperty('panelName', panelName));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectPanelImpl &&
            (identical(other.panelName, panelName) ||
                other.panelName == panelName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, panelName);

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectPanelImplCopyWith<_$SelectPanelImpl> get copyWith =>
      __$$SelectPanelImplCopyWithImpl<_$SelectPanelImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? panelName) selectPanel,
    required TResult Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )
    overrideTargetGK,
    required TResult Function(bool onlyTargetsWrappers) forceRefresh,
    required TResult Function(
      SNode? newContent,
      String? scName,
      dynamic skipSave,
    )
    updateClipboard,
    required TResult Function(String snippetName, String versionId)
    publishSnippet,
    required TResult Function(String snippetName, String versionId)
    revertSnippet,
    required TResult Function(String pathName) deletePage,
    required TResult Function(String snippetName) toggleAutoPublishingOfSnippet,
    required TResult Function(bool b) autoPublishDefault,
    required TResult Function(bool hide) hideIframes,
    required TResult Function(String snippetName, String panelName)
    setPanelOrPlaceholderSnippet,
    required TResult Function(String snippetName) enterSelectWidgetMode,
    required TResult Function() exitSelectWidgetMode,
    required TResult Function(SnippetRootNode rootNode, SNode? selectedNode)
    pushSnippetEditor,
    required TResult Function(bool save) popSnippetEditor,
    required TResult Function() showDirectoryTree,
    required TResult Function(bool save) removeDirectoryTree,
    required TResult Function(SNode node) selectNode,
    required TResult Function() clearNodeSelection,
    required TResult Function(SNode node, String newSnippetName)
    saveNodeAsSnippet,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    replaceSelectionWith,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    wrapSelectionWith,
    required TResult Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )
    appendChild,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    addSiblingBefore,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    addSiblingAfter,
    required TResult Function(Type? widgetSpanChildType) pasteReplacement,
    required TResult Function(
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )
    pasteChild,
    required TResult Function() pasteSiblingBefore,
    required TResult Function() pasteSiblingAfter,
    required TResult Function() deleteNodeTapped,
    required TResult Function() completeDeletion,
    required TResult Function(SnippetRootNode rootNode)
    copySnippetJsonToClipboard,
    required TResult Function(String? snippetJson) replaceSnippetFromJson,
    required TResult Function(SNode node, String? scName, dynamic skipSave)
    copyNode,
    required TResult Function(SNode node, String? scName, dynamic skipSave)
    cutNode,
    required TResult Function(String snippetName, SNode? selectedNode)
    selectedDirectoryOrNode,
    required TResult Function(Uint8List? newBytes) imageChanged,
    required TResult Function() forceSnippetRefresh,
  }) {
    return selectPanel(panelName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? panelName)? selectPanel,
    TResult? Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )?
    overrideTargetGK,
    TResult? Function(bool onlyTargetsWrappers)? forceRefresh,
    TResult? Function(SNode? newContent, String? scName, dynamic skipSave)?
    updateClipboard,
    TResult? Function(String snippetName, String versionId)? publishSnippet,
    TResult? Function(String snippetName, String versionId)? revertSnippet,
    TResult? Function(String pathName)? deletePage,
    TResult? Function(String snippetName)? toggleAutoPublishingOfSnippet,
    TResult? Function(bool b)? autoPublishDefault,
    TResult? Function(bool hide)? hideIframes,
    TResult? Function(String snippetName, String panelName)?
    setPanelOrPlaceholderSnippet,
    TResult? Function(String snippetName)? enterSelectWidgetMode,
    TResult? Function()? exitSelectWidgetMode,
    TResult? Function(SnippetRootNode rootNode, SNode? selectedNode)?
    pushSnippetEditor,
    TResult? Function(bool save)? popSnippetEditor,
    TResult? Function()? showDirectoryTree,
    TResult? Function(bool save)? removeDirectoryTree,
    TResult? Function(SNode node)? selectNode,
    TResult? Function()? clearNodeSelection,
    TResult? Function(SNode node, String newSnippetName)? saveNodeAsSnippet,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    replaceSelectionWith,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    wrapSelectionWith,
    TResult? Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    appendChild,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingBefore,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingAfter,
    TResult? Function(Type? widgetSpanChildType)? pasteReplacement,
    TResult? Function(
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    pasteChild,
    TResult? Function()? pasteSiblingBefore,
    TResult? Function()? pasteSiblingAfter,
    TResult? Function()? deleteNodeTapped,
    TResult? Function()? completeDeletion,
    TResult? Function(SnippetRootNode rootNode)? copySnippetJsonToClipboard,
    TResult? Function(String? snippetJson)? replaceSnippetFromJson,
    TResult? Function(SNode node, String? scName, dynamic skipSave)? copyNode,
    TResult? Function(SNode node, String? scName, dynamic skipSave)? cutNode,
    TResult? Function(String snippetName, SNode? selectedNode)?
    selectedDirectoryOrNode,
    TResult? Function(Uint8List? newBytes)? imageChanged,
    TResult? Function()? forceSnippetRefresh,
  }) {
    return selectPanel?.call(panelName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? panelName)? selectPanel,
    TResult Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )?
    overrideTargetGK,
    TResult Function(bool onlyTargetsWrappers)? forceRefresh,
    TResult Function(SNode? newContent, String? scName, dynamic skipSave)?
    updateClipboard,
    TResult Function(String snippetName, String versionId)? publishSnippet,
    TResult Function(String snippetName, String versionId)? revertSnippet,
    TResult Function(String pathName)? deletePage,
    TResult Function(String snippetName)? toggleAutoPublishingOfSnippet,
    TResult Function(bool b)? autoPublishDefault,
    TResult Function(bool hide)? hideIframes,
    TResult Function(String snippetName, String panelName)?
    setPanelOrPlaceholderSnippet,
    TResult Function(String snippetName)? enterSelectWidgetMode,
    TResult Function()? exitSelectWidgetMode,
    TResult Function(SnippetRootNode rootNode, SNode? selectedNode)?
    pushSnippetEditor,
    TResult Function(bool save)? popSnippetEditor,
    TResult Function()? showDirectoryTree,
    TResult Function(bool save)? removeDirectoryTree,
    TResult Function(SNode node)? selectNode,
    TResult Function()? clearNodeSelection,
    TResult Function(SNode node, String newSnippetName)? saveNodeAsSnippet,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    replaceSelectionWith,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    wrapSelectionWith,
    TResult Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    appendChild,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingBefore,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingAfter,
    TResult Function(Type? widgetSpanChildType)? pasteReplacement,
    TResult Function(Type? widgetSpanChildType, SNode? testWidgetSpanChildNode)?
    pasteChild,
    TResult Function()? pasteSiblingBefore,
    TResult Function()? pasteSiblingAfter,
    TResult Function()? deleteNodeTapped,
    TResult Function()? completeDeletion,
    TResult Function(SnippetRootNode rootNode)? copySnippetJsonToClipboard,
    TResult Function(String? snippetJson)? replaceSnippetFromJson,
    TResult Function(SNode node, String? scName, dynamic skipSave)? copyNode,
    TResult Function(SNode node, String? scName, dynamic skipSave)? cutNode,
    TResult Function(String snippetName, SNode? selectedNode)?
    selectedDirectoryOrNode,
    TResult Function(Uint8List? newBytes)? imageChanged,
    TResult Function()? forceSnippetRefresh,
    required TResult orElse(),
  }) {
    if (selectPanel != null) {
      return selectPanel(panelName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SelectPanel value) selectPanel,
    required TResult Function(OverrideTargetGK value) overrideTargetGK,
    required TResult Function(ForceRefresh value) forceRefresh,
    required TResult Function(UpdateClipboard value) updateClipboard,
    required TResult Function(PublishSnippet value) publishSnippet,
    required TResult Function(RevertSnippet value) revertSnippet,
    required TResult Function(DeletePage value) deletePage,
    required TResult Function(ToggleAutoPublishingOfSnippet value)
    toggleAutoPublishingOfSnippet,
    required TResult Function(AutoPublishDefault value) autoPublishDefault,
    required TResult Function(HideIframes value) hideIframes,
    required TResult Function(SetPanelSnippet value)
    setPanelOrPlaceholderSnippet,
    required TResult Function(EnterSelectWidgetMode value)
    enterSelectWidgetMode,
    required TResult Function(ExitSelectWidgetMode value) exitSelectWidgetMode,
    required TResult Function(PushSnippetEditor value) pushSnippetEditor,
    required TResult Function(PopSnippetEditor value) popSnippetEditor,
    required TResult Function(ShowDirectoryTree value) showDirectoryTree,
    required TResult Function(RemoveDirectoryTree value) removeDirectoryTree,
    required TResult Function(SelectNode value) selectNode,
    required TResult Function(ClearNodeSelection value) clearNodeSelection,
    required TResult Function(SaveNodeAsSnippet value) saveNodeAsSnippet,
    required TResult Function(ReplaceSelectionWith value) replaceSelectionWith,
    required TResult Function(WrapSelectionWith value) wrapSelectionWith,
    required TResult Function(AppendChild value) appendChild,
    required TResult Function(AddSiblingBefore value) addSiblingBefore,
    required TResult Function(AddSiblingAfter value) addSiblingAfter,
    required TResult Function(PasteReplacement value) pasteReplacement,
    required TResult Function(PasteChild value) pasteChild,
    required TResult Function(PasteSiblingBefore value) pasteSiblingBefore,
    required TResult Function(PasteSiblingAfter value) pasteSiblingAfter,
    required TResult Function(DeleteNodeTapped value) deleteNodeTapped,
    required TResult Function(CompleteDeletion value) completeDeletion,
    required TResult Function(CopySnippetJsonToClipboard value)
    copySnippetJsonToClipboard,
    required TResult Function(ReplaceSnippetFromJson value)
    replaceSnippetFromJson,
    required TResult Function(CopyNode value) copyNode,
    required TResult Function(CutNode value) cutNode,
    required TResult Function(SelectedDirectoryOrNode value)
    selectedDirectoryOrNode,
    required TResult Function(ImageChanged value) imageChanged,
    required TResult Function(ForceSnippetRefresh value) forceSnippetRefresh,
  }) {
    return selectPanel(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SelectPanel value)? selectPanel,
    TResult? Function(OverrideTargetGK value)? overrideTargetGK,
    TResult? Function(ForceRefresh value)? forceRefresh,
    TResult? Function(UpdateClipboard value)? updateClipboard,
    TResult? Function(PublishSnippet value)? publishSnippet,
    TResult? Function(RevertSnippet value)? revertSnippet,
    TResult? Function(DeletePage value)? deletePage,
    TResult? Function(ToggleAutoPublishingOfSnippet value)?
    toggleAutoPublishingOfSnippet,
    TResult? Function(AutoPublishDefault value)? autoPublishDefault,
    TResult? Function(HideIframes value)? hideIframes,
    TResult? Function(SetPanelSnippet value)? setPanelOrPlaceholderSnippet,
    TResult? Function(EnterSelectWidgetMode value)? enterSelectWidgetMode,
    TResult? Function(ExitSelectWidgetMode value)? exitSelectWidgetMode,
    TResult? Function(PushSnippetEditor value)? pushSnippetEditor,
    TResult? Function(PopSnippetEditor value)? popSnippetEditor,
    TResult? Function(ShowDirectoryTree value)? showDirectoryTree,
    TResult? Function(RemoveDirectoryTree value)? removeDirectoryTree,
    TResult? Function(SelectNode value)? selectNode,
    TResult? Function(ClearNodeSelection value)? clearNodeSelection,
    TResult? Function(SaveNodeAsSnippet value)? saveNodeAsSnippet,
    TResult? Function(ReplaceSelectionWith value)? replaceSelectionWith,
    TResult? Function(WrapSelectionWith value)? wrapSelectionWith,
    TResult? Function(AppendChild value)? appendChild,
    TResult? Function(AddSiblingBefore value)? addSiblingBefore,
    TResult? Function(AddSiblingAfter value)? addSiblingAfter,
    TResult? Function(PasteReplacement value)? pasteReplacement,
    TResult? Function(PasteChild value)? pasteChild,
    TResult? Function(PasteSiblingBefore value)? pasteSiblingBefore,
    TResult? Function(PasteSiblingAfter value)? pasteSiblingAfter,
    TResult? Function(DeleteNodeTapped value)? deleteNodeTapped,
    TResult? Function(CompleteDeletion value)? completeDeletion,
    TResult? Function(CopySnippetJsonToClipboard value)?
    copySnippetJsonToClipboard,
    TResult? Function(ReplaceSnippetFromJson value)? replaceSnippetFromJson,
    TResult? Function(CopyNode value)? copyNode,
    TResult? Function(CutNode value)? cutNode,
    TResult? Function(SelectedDirectoryOrNode value)? selectedDirectoryOrNode,
    TResult? Function(ImageChanged value)? imageChanged,
    TResult? Function(ForceSnippetRefresh value)? forceSnippetRefresh,
  }) {
    return selectPanel?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SelectPanel value)? selectPanel,
    TResult Function(OverrideTargetGK value)? overrideTargetGK,
    TResult Function(ForceRefresh value)? forceRefresh,
    TResult Function(UpdateClipboard value)? updateClipboard,
    TResult Function(PublishSnippet value)? publishSnippet,
    TResult Function(RevertSnippet value)? revertSnippet,
    TResult Function(DeletePage value)? deletePage,
    TResult Function(ToggleAutoPublishingOfSnippet value)?
    toggleAutoPublishingOfSnippet,
    TResult Function(AutoPublishDefault value)? autoPublishDefault,
    TResult Function(HideIframes value)? hideIframes,
    TResult Function(SetPanelSnippet value)? setPanelOrPlaceholderSnippet,
    TResult Function(EnterSelectWidgetMode value)? enterSelectWidgetMode,
    TResult Function(ExitSelectWidgetMode value)? exitSelectWidgetMode,
    TResult Function(PushSnippetEditor value)? pushSnippetEditor,
    TResult Function(PopSnippetEditor value)? popSnippetEditor,
    TResult Function(ShowDirectoryTree value)? showDirectoryTree,
    TResult Function(RemoveDirectoryTree value)? removeDirectoryTree,
    TResult Function(SelectNode value)? selectNode,
    TResult Function(ClearNodeSelection value)? clearNodeSelection,
    TResult Function(SaveNodeAsSnippet value)? saveNodeAsSnippet,
    TResult Function(ReplaceSelectionWith value)? replaceSelectionWith,
    TResult Function(WrapSelectionWith value)? wrapSelectionWith,
    TResult Function(AppendChild value)? appendChild,
    TResult Function(AddSiblingBefore value)? addSiblingBefore,
    TResult Function(AddSiblingAfter value)? addSiblingAfter,
    TResult Function(PasteReplacement value)? pasteReplacement,
    TResult Function(PasteChild value)? pasteChild,
    TResult Function(PasteSiblingBefore value)? pasteSiblingBefore,
    TResult Function(PasteSiblingAfter value)? pasteSiblingAfter,
    TResult Function(DeleteNodeTapped value)? deleteNodeTapped,
    TResult Function(CompleteDeletion value)? completeDeletion,
    TResult Function(CopySnippetJsonToClipboard value)?
    copySnippetJsonToClipboard,
    TResult Function(ReplaceSnippetFromJson value)? replaceSnippetFromJson,
    TResult Function(CopyNode value)? copyNode,
    TResult Function(CutNode value)? cutNode,
    TResult Function(SelectedDirectoryOrNode value)? selectedDirectoryOrNode,
    TResult Function(ImageChanged value)? imageChanged,
    TResult Function(ForceSnippetRefresh value)? forceSnippetRefresh,
    required TResult orElse(),
  }) {
    if (selectPanel != null) {
      return selectPanel(this);
    }
    return orElse();
  }
}

abstract class SelectPanel implements CAPIEvent {
  const factory SelectPanel({required final String? panelName}) =
      _$SelectPanelImpl;

  String? get panelName;

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SelectPanelImplCopyWith<_$SelectPanelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OverrideTargetGKImplCopyWith<$Res> {
  factory _$$OverrideTargetGKImplCopyWith(
    _$OverrideTargetGKImpl value,
    $Res Function(_$OverrideTargetGKImpl) then,
  ) = __$$OverrideTargetGKImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String wName, int index, GlobalKey<State<StatefulWidget>> gk});
}

/// @nodoc
class __$$OverrideTargetGKImplCopyWithImpl<$Res>
    extends _$CAPIEventCopyWithImpl<$Res, _$OverrideTargetGKImpl>
    implements _$$OverrideTargetGKImplCopyWith<$Res> {
  __$$OverrideTargetGKImplCopyWithImpl(
    _$OverrideTargetGKImpl _value,
    $Res Function(_$OverrideTargetGKImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? wName = null, Object? index = null, Object? gk = null}) {
    return _then(
      _$OverrideTargetGKImpl(
        wName:
            null == wName
                ? _value.wName
                : wName // ignore: cast_nullable_to_non_nullable
                    as String,
        index:
            null == index
                ? _value.index
                : index // ignore: cast_nullable_to_non_nullable
                    as int,
        gk:
            null == gk
                ? _value.gk
                : gk // ignore: cast_nullable_to_non_nullable
                    as GlobalKey<State<StatefulWidget>>,
      ),
    );
  }
}

/// @nodoc

class _$OverrideTargetGKImpl
    with DiagnosticableTreeMixin
    implements OverrideTargetGK {
  const _$OverrideTargetGKImpl({
    required this.wName,
    required this.index,
    required this.gk,
  });

  @override
  final String wName;
  @override
  final int index;
  @override
  final GlobalKey<State<StatefulWidget>> gk;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CAPIEvent.overrideTargetGK(wName: $wName, index: $index, gk: $gk)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CAPIEvent.overrideTargetGK'))
      ..add(DiagnosticsProperty('wName', wName))
      ..add(DiagnosticsProperty('index', index))
      ..add(DiagnosticsProperty('gk', gk));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OverrideTargetGKImpl &&
            (identical(other.wName, wName) || other.wName == wName) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.gk, gk) || other.gk == gk));
  }

  @override
  int get hashCode => Object.hash(runtimeType, wName, index, gk);

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OverrideTargetGKImplCopyWith<_$OverrideTargetGKImpl> get copyWith =>
      __$$OverrideTargetGKImplCopyWithImpl<_$OverrideTargetGKImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? panelName) selectPanel,
    required TResult Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )
    overrideTargetGK,
    required TResult Function(bool onlyTargetsWrappers) forceRefresh,
    required TResult Function(
      SNode? newContent,
      String? scName,
      dynamic skipSave,
    )
    updateClipboard,
    required TResult Function(String snippetName, String versionId)
    publishSnippet,
    required TResult Function(String snippetName, String versionId)
    revertSnippet,
    required TResult Function(String pathName) deletePage,
    required TResult Function(String snippetName) toggleAutoPublishingOfSnippet,
    required TResult Function(bool b) autoPublishDefault,
    required TResult Function(bool hide) hideIframes,
    required TResult Function(String snippetName, String panelName)
    setPanelOrPlaceholderSnippet,
    required TResult Function(String snippetName) enterSelectWidgetMode,
    required TResult Function() exitSelectWidgetMode,
    required TResult Function(SnippetRootNode rootNode, SNode? selectedNode)
    pushSnippetEditor,
    required TResult Function(bool save) popSnippetEditor,
    required TResult Function() showDirectoryTree,
    required TResult Function(bool save) removeDirectoryTree,
    required TResult Function(SNode node) selectNode,
    required TResult Function() clearNodeSelection,
    required TResult Function(SNode node, String newSnippetName)
    saveNodeAsSnippet,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    replaceSelectionWith,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    wrapSelectionWith,
    required TResult Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )
    appendChild,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    addSiblingBefore,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    addSiblingAfter,
    required TResult Function(Type? widgetSpanChildType) pasteReplacement,
    required TResult Function(
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )
    pasteChild,
    required TResult Function() pasteSiblingBefore,
    required TResult Function() pasteSiblingAfter,
    required TResult Function() deleteNodeTapped,
    required TResult Function() completeDeletion,
    required TResult Function(SnippetRootNode rootNode)
    copySnippetJsonToClipboard,
    required TResult Function(String? snippetJson) replaceSnippetFromJson,
    required TResult Function(SNode node, String? scName, dynamic skipSave)
    copyNode,
    required TResult Function(SNode node, String? scName, dynamic skipSave)
    cutNode,
    required TResult Function(String snippetName, SNode? selectedNode)
    selectedDirectoryOrNode,
    required TResult Function(Uint8List? newBytes) imageChanged,
    required TResult Function() forceSnippetRefresh,
  }) {
    return overrideTargetGK(wName, index, gk);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? panelName)? selectPanel,
    TResult? Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )?
    overrideTargetGK,
    TResult? Function(bool onlyTargetsWrappers)? forceRefresh,
    TResult? Function(SNode? newContent, String? scName, dynamic skipSave)?
    updateClipboard,
    TResult? Function(String snippetName, String versionId)? publishSnippet,
    TResult? Function(String snippetName, String versionId)? revertSnippet,
    TResult? Function(String pathName)? deletePage,
    TResult? Function(String snippetName)? toggleAutoPublishingOfSnippet,
    TResult? Function(bool b)? autoPublishDefault,
    TResult? Function(bool hide)? hideIframes,
    TResult? Function(String snippetName, String panelName)?
    setPanelOrPlaceholderSnippet,
    TResult? Function(String snippetName)? enterSelectWidgetMode,
    TResult? Function()? exitSelectWidgetMode,
    TResult? Function(SnippetRootNode rootNode, SNode? selectedNode)?
    pushSnippetEditor,
    TResult? Function(bool save)? popSnippetEditor,
    TResult? Function()? showDirectoryTree,
    TResult? Function(bool save)? removeDirectoryTree,
    TResult? Function(SNode node)? selectNode,
    TResult? Function()? clearNodeSelection,
    TResult? Function(SNode node, String newSnippetName)? saveNodeAsSnippet,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    replaceSelectionWith,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    wrapSelectionWith,
    TResult? Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    appendChild,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingBefore,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingAfter,
    TResult? Function(Type? widgetSpanChildType)? pasteReplacement,
    TResult? Function(
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    pasteChild,
    TResult? Function()? pasteSiblingBefore,
    TResult? Function()? pasteSiblingAfter,
    TResult? Function()? deleteNodeTapped,
    TResult? Function()? completeDeletion,
    TResult? Function(SnippetRootNode rootNode)? copySnippetJsonToClipboard,
    TResult? Function(String? snippetJson)? replaceSnippetFromJson,
    TResult? Function(SNode node, String? scName, dynamic skipSave)? copyNode,
    TResult? Function(SNode node, String? scName, dynamic skipSave)? cutNode,
    TResult? Function(String snippetName, SNode? selectedNode)?
    selectedDirectoryOrNode,
    TResult? Function(Uint8List? newBytes)? imageChanged,
    TResult? Function()? forceSnippetRefresh,
  }) {
    return overrideTargetGK?.call(wName, index, gk);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? panelName)? selectPanel,
    TResult Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )?
    overrideTargetGK,
    TResult Function(bool onlyTargetsWrappers)? forceRefresh,
    TResult Function(SNode? newContent, String? scName, dynamic skipSave)?
    updateClipboard,
    TResult Function(String snippetName, String versionId)? publishSnippet,
    TResult Function(String snippetName, String versionId)? revertSnippet,
    TResult Function(String pathName)? deletePage,
    TResult Function(String snippetName)? toggleAutoPublishingOfSnippet,
    TResult Function(bool b)? autoPublishDefault,
    TResult Function(bool hide)? hideIframes,
    TResult Function(String snippetName, String panelName)?
    setPanelOrPlaceholderSnippet,
    TResult Function(String snippetName)? enterSelectWidgetMode,
    TResult Function()? exitSelectWidgetMode,
    TResult Function(SnippetRootNode rootNode, SNode? selectedNode)?
    pushSnippetEditor,
    TResult Function(bool save)? popSnippetEditor,
    TResult Function()? showDirectoryTree,
    TResult Function(bool save)? removeDirectoryTree,
    TResult Function(SNode node)? selectNode,
    TResult Function()? clearNodeSelection,
    TResult Function(SNode node, String newSnippetName)? saveNodeAsSnippet,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    replaceSelectionWith,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    wrapSelectionWith,
    TResult Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    appendChild,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingBefore,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingAfter,
    TResult Function(Type? widgetSpanChildType)? pasteReplacement,
    TResult Function(Type? widgetSpanChildType, SNode? testWidgetSpanChildNode)?
    pasteChild,
    TResult Function()? pasteSiblingBefore,
    TResult Function()? pasteSiblingAfter,
    TResult Function()? deleteNodeTapped,
    TResult Function()? completeDeletion,
    TResult Function(SnippetRootNode rootNode)? copySnippetJsonToClipboard,
    TResult Function(String? snippetJson)? replaceSnippetFromJson,
    TResult Function(SNode node, String? scName, dynamic skipSave)? copyNode,
    TResult Function(SNode node, String? scName, dynamic skipSave)? cutNode,
    TResult Function(String snippetName, SNode? selectedNode)?
    selectedDirectoryOrNode,
    TResult Function(Uint8List? newBytes)? imageChanged,
    TResult Function()? forceSnippetRefresh,
    required TResult orElse(),
  }) {
    if (overrideTargetGK != null) {
      return overrideTargetGK(wName, index, gk);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SelectPanel value) selectPanel,
    required TResult Function(OverrideTargetGK value) overrideTargetGK,
    required TResult Function(ForceRefresh value) forceRefresh,
    required TResult Function(UpdateClipboard value) updateClipboard,
    required TResult Function(PublishSnippet value) publishSnippet,
    required TResult Function(RevertSnippet value) revertSnippet,
    required TResult Function(DeletePage value) deletePage,
    required TResult Function(ToggleAutoPublishingOfSnippet value)
    toggleAutoPublishingOfSnippet,
    required TResult Function(AutoPublishDefault value) autoPublishDefault,
    required TResult Function(HideIframes value) hideIframes,
    required TResult Function(SetPanelSnippet value)
    setPanelOrPlaceholderSnippet,
    required TResult Function(EnterSelectWidgetMode value)
    enterSelectWidgetMode,
    required TResult Function(ExitSelectWidgetMode value) exitSelectWidgetMode,
    required TResult Function(PushSnippetEditor value) pushSnippetEditor,
    required TResult Function(PopSnippetEditor value) popSnippetEditor,
    required TResult Function(ShowDirectoryTree value) showDirectoryTree,
    required TResult Function(RemoveDirectoryTree value) removeDirectoryTree,
    required TResult Function(SelectNode value) selectNode,
    required TResult Function(ClearNodeSelection value) clearNodeSelection,
    required TResult Function(SaveNodeAsSnippet value) saveNodeAsSnippet,
    required TResult Function(ReplaceSelectionWith value) replaceSelectionWith,
    required TResult Function(WrapSelectionWith value) wrapSelectionWith,
    required TResult Function(AppendChild value) appendChild,
    required TResult Function(AddSiblingBefore value) addSiblingBefore,
    required TResult Function(AddSiblingAfter value) addSiblingAfter,
    required TResult Function(PasteReplacement value) pasteReplacement,
    required TResult Function(PasteChild value) pasteChild,
    required TResult Function(PasteSiblingBefore value) pasteSiblingBefore,
    required TResult Function(PasteSiblingAfter value) pasteSiblingAfter,
    required TResult Function(DeleteNodeTapped value) deleteNodeTapped,
    required TResult Function(CompleteDeletion value) completeDeletion,
    required TResult Function(CopySnippetJsonToClipboard value)
    copySnippetJsonToClipboard,
    required TResult Function(ReplaceSnippetFromJson value)
    replaceSnippetFromJson,
    required TResult Function(CopyNode value) copyNode,
    required TResult Function(CutNode value) cutNode,
    required TResult Function(SelectedDirectoryOrNode value)
    selectedDirectoryOrNode,
    required TResult Function(ImageChanged value) imageChanged,
    required TResult Function(ForceSnippetRefresh value) forceSnippetRefresh,
  }) {
    return overrideTargetGK(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SelectPanel value)? selectPanel,
    TResult? Function(OverrideTargetGK value)? overrideTargetGK,
    TResult? Function(ForceRefresh value)? forceRefresh,
    TResult? Function(UpdateClipboard value)? updateClipboard,
    TResult? Function(PublishSnippet value)? publishSnippet,
    TResult? Function(RevertSnippet value)? revertSnippet,
    TResult? Function(DeletePage value)? deletePage,
    TResult? Function(ToggleAutoPublishingOfSnippet value)?
    toggleAutoPublishingOfSnippet,
    TResult? Function(AutoPublishDefault value)? autoPublishDefault,
    TResult? Function(HideIframes value)? hideIframes,
    TResult? Function(SetPanelSnippet value)? setPanelOrPlaceholderSnippet,
    TResult? Function(EnterSelectWidgetMode value)? enterSelectWidgetMode,
    TResult? Function(ExitSelectWidgetMode value)? exitSelectWidgetMode,
    TResult? Function(PushSnippetEditor value)? pushSnippetEditor,
    TResult? Function(PopSnippetEditor value)? popSnippetEditor,
    TResult? Function(ShowDirectoryTree value)? showDirectoryTree,
    TResult? Function(RemoveDirectoryTree value)? removeDirectoryTree,
    TResult? Function(SelectNode value)? selectNode,
    TResult? Function(ClearNodeSelection value)? clearNodeSelection,
    TResult? Function(SaveNodeAsSnippet value)? saveNodeAsSnippet,
    TResult? Function(ReplaceSelectionWith value)? replaceSelectionWith,
    TResult? Function(WrapSelectionWith value)? wrapSelectionWith,
    TResult? Function(AppendChild value)? appendChild,
    TResult? Function(AddSiblingBefore value)? addSiblingBefore,
    TResult? Function(AddSiblingAfter value)? addSiblingAfter,
    TResult? Function(PasteReplacement value)? pasteReplacement,
    TResult? Function(PasteChild value)? pasteChild,
    TResult? Function(PasteSiblingBefore value)? pasteSiblingBefore,
    TResult? Function(PasteSiblingAfter value)? pasteSiblingAfter,
    TResult? Function(DeleteNodeTapped value)? deleteNodeTapped,
    TResult? Function(CompleteDeletion value)? completeDeletion,
    TResult? Function(CopySnippetJsonToClipboard value)?
    copySnippetJsonToClipboard,
    TResult? Function(ReplaceSnippetFromJson value)? replaceSnippetFromJson,
    TResult? Function(CopyNode value)? copyNode,
    TResult? Function(CutNode value)? cutNode,
    TResult? Function(SelectedDirectoryOrNode value)? selectedDirectoryOrNode,
    TResult? Function(ImageChanged value)? imageChanged,
    TResult? Function(ForceSnippetRefresh value)? forceSnippetRefresh,
  }) {
    return overrideTargetGK?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SelectPanel value)? selectPanel,
    TResult Function(OverrideTargetGK value)? overrideTargetGK,
    TResult Function(ForceRefresh value)? forceRefresh,
    TResult Function(UpdateClipboard value)? updateClipboard,
    TResult Function(PublishSnippet value)? publishSnippet,
    TResult Function(RevertSnippet value)? revertSnippet,
    TResult Function(DeletePage value)? deletePage,
    TResult Function(ToggleAutoPublishingOfSnippet value)?
    toggleAutoPublishingOfSnippet,
    TResult Function(AutoPublishDefault value)? autoPublishDefault,
    TResult Function(HideIframes value)? hideIframes,
    TResult Function(SetPanelSnippet value)? setPanelOrPlaceholderSnippet,
    TResult Function(EnterSelectWidgetMode value)? enterSelectWidgetMode,
    TResult Function(ExitSelectWidgetMode value)? exitSelectWidgetMode,
    TResult Function(PushSnippetEditor value)? pushSnippetEditor,
    TResult Function(PopSnippetEditor value)? popSnippetEditor,
    TResult Function(ShowDirectoryTree value)? showDirectoryTree,
    TResult Function(RemoveDirectoryTree value)? removeDirectoryTree,
    TResult Function(SelectNode value)? selectNode,
    TResult Function(ClearNodeSelection value)? clearNodeSelection,
    TResult Function(SaveNodeAsSnippet value)? saveNodeAsSnippet,
    TResult Function(ReplaceSelectionWith value)? replaceSelectionWith,
    TResult Function(WrapSelectionWith value)? wrapSelectionWith,
    TResult Function(AppendChild value)? appendChild,
    TResult Function(AddSiblingBefore value)? addSiblingBefore,
    TResult Function(AddSiblingAfter value)? addSiblingAfter,
    TResult Function(PasteReplacement value)? pasteReplacement,
    TResult Function(PasteChild value)? pasteChild,
    TResult Function(PasteSiblingBefore value)? pasteSiblingBefore,
    TResult Function(PasteSiblingAfter value)? pasteSiblingAfter,
    TResult Function(DeleteNodeTapped value)? deleteNodeTapped,
    TResult Function(CompleteDeletion value)? completeDeletion,
    TResult Function(CopySnippetJsonToClipboard value)?
    copySnippetJsonToClipboard,
    TResult Function(ReplaceSnippetFromJson value)? replaceSnippetFromJson,
    TResult Function(CopyNode value)? copyNode,
    TResult Function(CutNode value)? cutNode,
    TResult Function(SelectedDirectoryOrNode value)? selectedDirectoryOrNode,
    TResult Function(ImageChanged value)? imageChanged,
    TResult Function(ForceSnippetRefresh value)? forceSnippetRefresh,
    required TResult orElse(),
  }) {
    if (overrideTargetGK != null) {
      return overrideTargetGK(this);
    }
    return orElse();
  }
}

abstract class OverrideTargetGK implements CAPIEvent {
  const factory OverrideTargetGK({
    required final String wName,
    required final int index,
    required final GlobalKey<State<StatefulWidget>> gk,
  }) = _$OverrideTargetGKImpl;

  String get wName;
  int get index;
  GlobalKey<State<StatefulWidget>> get gk;

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OverrideTargetGKImplCopyWith<_$OverrideTargetGKImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ForceRefreshImplCopyWith<$Res> {
  factory _$$ForceRefreshImplCopyWith(
    _$ForceRefreshImpl value,
    $Res Function(_$ForceRefreshImpl) then,
  ) = __$$ForceRefreshImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool onlyTargetsWrappers});
}

/// @nodoc
class __$$ForceRefreshImplCopyWithImpl<$Res>
    extends _$CAPIEventCopyWithImpl<$Res, _$ForceRefreshImpl>
    implements _$$ForceRefreshImplCopyWith<$Res> {
  __$$ForceRefreshImplCopyWithImpl(
    _$ForceRefreshImpl _value,
    $Res Function(_$ForceRefreshImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? onlyTargetsWrappers = null}) {
    return _then(
      _$ForceRefreshImpl(
        onlyTargetsWrappers:
            null == onlyTargetsWrappers
                ? _value.onlyTargetsWrappers
                : onlyTargetsWrappers // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc

class _$ForceRefreshImpl with DiagnosticableTreeMixin implements ForceRefresh {
  const _$ForceRefreshImpl({this.onlyTargetsWrappers = false});

  @override
  @JsonKey()
  final bool onlyTargetsWrappers;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CAPIEvent.forceRefresh(onlyTargetsWrappers: $onlyTargetsWrappers)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CAPIEvent.forceRefresh'))
      ..add(DiagnosticsProperty('onlyTargetsWrappers', onlyTargetsWrappers));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForceRefreshImpl &&
            (identical(other.onlyTargetsWrappers, onlyTargetsWrappers) ||
                other.onlyTargetsWrappers == onlyTargetsWrappers));
  }

  @override
  int get hashCode => Object.hash(runtimeType, onlyTargetsWrappers);

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ForceRefreshImplCopyWith<_$ForceRefreshImpl> get copyWith =>
      __$$ForceRefreshImplCopyWithImpl<_$ForceRefreshImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? panelName) selectPanel,
    required TResult Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )
    overrideTargetGK,
    required TResult Function(bool onlyTargetsWrappers) forceRefresh,
    required TResult Function(
      SNode? newContent,
      String? scName,
      dynamic skipSave,
    )
    updateClipboard,
    required TResult Function(String snippetName, String versionId)
    publishSnippet,
    required TResult Function(String snippetName, String versionId)
    revertSnippet,
    required TResult Function(String pathName) deletePage,
    required TResult Function(String snippetName) toggleAutoPublishingOfSnippet,
    required TResult Function(bool b) autoPublishDefault,
    required TResult Function(bool hide) hideIframes,
    required TResult Function(String snippetName, String panelName)
    setPanelOrPlaceholderSnippet,
    required TResult Function(String snippetName) enterSelectWidgetMode,
    required TResult Function() exitSelectWidgetMode,
    required TResult Function(SnippetRootNode rootNode, SNode? selectedNode)
    pushSnippetEditor,
    required TResult Function(bool save) popSnippetEditor,
    required TResult Function() showDirectoryTree,
    required TResult Function(bool save) removeDirectoryTree,
    required TResult Function(SNode node) selectNode,
    required TResult Function() clearNodeSelection,
    required TResult Function(SNode node, String newSnippetName)
    saveNodeAsSnippet,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    replaceSelectionWith,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    wrapSelectionWith,
    required TResult Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )
    appendChild,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    addSiblingBefore,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    addSiblingAfter,
    required TResult Function(Type? widgetSpanChildType) pasteReplacement,
    required TResult Function(
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )
    pasteChild,
    required TResult Function() pasteSiblingBefore,
    required TResult Function() pasteSiblingAfter,
    required TResult Function() deleteNodeTapped,
    required TResult Function() completeDeletion,
    required TResult Function(SnippetRootNode rootNode)
    copySnippetJsonToClipboard,
    required TResult Function(String? snippetJson) replaceSnippetFromJson,
    required TResult Function(SNode node, String? scName, dynamic skipSave)
    copyNode,
    required TResult Function(SNode node, String? scName, dynamic skipSave)
    cutNode,
    required TResult Function(String snippetName, SNode? selectedNode)
    selectedDirectoryOrNode,
    required TResult Function(Uint8List? newBytes) imageChanged,
    required TResult Function() forceSnippetRefresh,
  }) {
    return forceRefresh(onlyTargetsWrappers);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? panelName)? selectPanel,
    TResult? Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )?
    overrideTargetGK,
    TResult? Function(bool onlyTargetsWrappers)? forceRefresh,
    TResult? Function(SNode? newContent, String? scName, dynamic skipSave)?
    updateClipboard,
    TResult? Function(String snippetName, String versionId)? publishSnippet,
    TResult? Function(String snippetName, String versionId)? revertSnippet,
    TResult? Function(String pathName)? deletePage,
    TResult? Function(String snippetName)? toggleAutoPublishingOfSnippet,
    TResult? Function(bool b)? autoPublishDefault,
    TResult? Function(bool hide)? hideIframes,
    TResult? Function(String snippetName, String panelName)?
    setPanelOrPlaceholderSnippet,
    TResult? Function(String snippetName)? enterSelectWidgetMode,
    TResult? Function()? exitSelectWidgetMode,
    TResult? Function(SnippetRootNode rootNode, SNode? selectedNode)?
    pushSnippetEditor,
    TResult? Function(bool save)? popSnippetEditor,
    TResult? Function()? showDirectoryTree,
    TResult? Function(bool save)? removeDirectoryTree,
    TResult? Function(SNode node)? selectNode,
    TResult? Function()? clearNodeSelection,
    TResult? Function(SNode node, String newSnippetName)? saveNodeAsSnippet,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    replaceSelectionWith,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    wrapSelectionWith,
    TResult? Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    appendChild,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingBefore,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingAfter,
    TResult? Function(Type? widgetSpanChildType)? pasteReplacement,
    TResult? Function(
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    pasteChild,
    TResult? Function()? pasteSiblingBefore,
    TResult? Function()? pasteSiblingAfter,
    TResult? Function()? deleteNodeTapped,
    TResult? Function()? completeDeletion,
    TResult? Function(SnippetRootNode rootNode)? copySnippetJsonToClipboard,
    TResult? Function(String? snippetJson)? replaceSnippetFromJson,
    TResult? Function(SNode node, String? scName, dynamic skipSave)? copyNode,
    TResult? Function(SNode node, String? scName, dynamic skipSave)? cutNode,
    TResult? Function(String snippetName, SNode? selectedNode)?
    selectedDirectoryOrNode,
    TResult? Function(Uint8List? newBytes)? imageChanged,
    TResult? Function()? forceSnippetRefresh,
  }) {
    return forceRefresh?.call(onlyTargetsWrappers);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? panelName)? selectPanel,
    TResult Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )?
    overrideTargetGK,
    TResult Function(bool onlyTargetsWrappers)? forceRefresh,
    TResult Function(SNode? newContent, String? scName, dynamic skipSave)?
    updateClipboard,
    TResult Function(String snippetName, String versionId)? publishSnippet,
    TResult Function(String snippetName, String versionId)? revertSnippet,
    TResult Function(String pathName)? deletePage,
    TResult Function(String snippetName)? toggleAutoPublishingOfSnippet,
    TResult Function(bool b)? autoPublishDefault,
    TResult Function(bool hide)? hideIframes,
    TResult Function(String snippetName, String panelName)?
    setPanelOrPlaceholderSnippet,
    TResult Function(String snippetName)? enterSelectWidgetMode,
    TResult Function()? exitSelectWidgetMode,
    TResult Function(SnippetRootNode rootNode, SNode? selectedNode)?
    pushSnippetEditor,
    TResult Function(bool save)? popSnippetEditor,
    TResult Function()? showDirectoryTree,
    TResult Function(bool save)? removeDirectoryTree,
    TResult Function(SNode node)? selectNode,
    TResult Function()? clearNodeSelection,
    TResult Function(SNode node, String newSnippetName)? saveNodeAsSnippet,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    replaceSelectionWith,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    wrapSelectionWith,
    TResult Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    appendChild,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingBefore,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingAfter,
    TResult Function(Type? widgetSpanChildType)? pasteReplacement,
    TResult Function(Type? widgetSpanChildType, SNode? testWidgetSpanChildNode)?
    pasteChild,
    TResult Function()? pasteSiblingBefore,
    TResult Function()? pasteSiblingAfter,
    TResult Function()? deleteNodeTapped,
    TResult Function()? completeDeletion,
    TResult Function(SnippetRootNode rootNode)? copySnippetJsonToClipboard,
    TResult Function(String? snippetJson)? replaceSnippetFromJson,
    TResult Function(SNode node, String? scName, dynamic skipSave)? copyNode,
    TResult Function(SNode node, String? scName, dynamic skipSave)? cutNode,
    TResult Function(String snippetName, SNode? selectedNode)?
    selectedDirectoryOrNode,
    TResult Function(Uint8List? newBytes)? imageChanged,
    TResult Function()? forceSnippetRefresh,
    required TResult orElse(),
  }) {
    if (forceRefresh != null) {
      return forceRefresh(onlyTargetsWrappers);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SelectPanel value) selectPanel,
    required TResult Function(OverrideTargetGK value) overrideTargetGK,
    required TResult Function(ForceRefresh value) forceRefresh,
    required TResult Function(UpdateClipboard value) updateClipboard,
    required TResult Function(PublishSnippet value) publishSnippet,
    required TResult Function(RevertSnippet value) revertSnippet,
    required TResult Function(DeletePage value) deletePage,
    required TResult Function(ToggleAutoPublishingOfSnippet value)
    toggleAutoPublishingOfSnippet,
    required TResult Function(AutoPublishDefault value) autoPublishDefault,
    required TResult Function(HideIframes value) hideIframes,
    required TResult Function(SetPanelSnippet value)
    setPanelOrPlaceholderSnippet,
    required TResult Function(EnterSelectWidgetMode value)
    enterSelectWidgetMode,
    required TResult Function(ExitSelectWidgetMode value) exitSelectWidgetMode,
    required TResult Function(PushSnippetEditor value) pushSnippetEditor,
    required TResult Function(PopSnippetEditor value) popSnippetEditor,
    required TResult Function(ShowDirectoryTree value) showDirectoryTree,
    required TResult Function(RemoveDirectoryTree value) removeDirectoryTree,
    required TResult Function(SelectNode value) selectNode,
    required TResult Function(ClearNodeSelection value) clearNodeSelection,
    required TResult Function(SaveNodeAsSnippet value) saveNodeAsSnippet,
    required TResult Function(ReplaceSelectionWith value) replaceSelectionWith,
    required TResult Function(WrapSelectionWith value) wrapSelectionWith,
    required TResult Function(AppendChild value) appendChild,
    required TResult Function(AddSiblingBefore value) addSiblingBefore,
    required TResult Function(AddSiblingAfter value) addSiblingAfter,
    required TResult Function(PasteReplacement value) pasteReplacement,
    required TResult Function(PasteChild value) pasteChild,
    required TResult Function(PasteSiblingBefore value) pasteSiblingBefore,
    required TResult Function(PasteSiblingAfter value) pasteSiblingAfter,
    required TResult Function(DeleteNodeTapped value) deleteNodeTapped,
    required TResult Function(CompleteDeletion value) completeDeletion,
    required TResult Function(CopySnippetJsonToClipboard value)
    copySnippetJsonToClipboard,
    required TResult Function(ReplaceSnippetFromJson value)
    replaceSnippetFromJson,
    required TResult Function(CopyNode value) copyNode,
    required TResult Function(CutNode value) cutNode,
    required TResult Function(SelectedDirectoryOrNode value)
    selectedDirectoryOrNode,
    required TResult Function(ImageChanged value) imageChanged,
    required TResult Function(ForceSnippetRefresh value) forceSnippetRefresh,
  }) {
    return forceRefresh(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SelectPanel value)? selectPanel,
    TResult? Function(OverrideTargetGK value)? overrideTargetGK,
    TResult? Function(ForceRefresh value)? forceRefresh,
    TResult? Function(UpdateClipboard value)? updateClipboard,
    TResult? Function(PublishSnippet value)? publishSnippet,
    TResult? Function(RevertSnippet value)? revertSnippet,
    TResult? Function(DeletePage value)? deletePage,
    TResult? Function(ToggleAutoPublishingOfSnippet value)?
    toggleAutoPublishingOfSnippet,
    TResult? Function(AutoPublishDefault value)? autoPublishDefault,
    TResult? Function(HideIframes value)? hideIframes,
    TResult? Function(SetPanelSnippet value)? setPanelOrPlaceholderSnippet,
    TResult? Function(EnterSelectWidgetMode value)? enterSelectWidgetMode,
    TResult? Function(ExitSelectWidgetMode value)? exitSelectWidgetMode,
    TResult? Function(PushSnippetEditor value)? pushSnippetEditor,
    TResult? Function(PopSnippetEditor value)? popSnippetEditor,
    TResult? Function(ShowDirectoryTree value)? showDirectoryTree,
    TResult? Function(RemoveDirectoryTree value)? removeDirectoryTree,
    TResult? Function(SelectNode value)? selectNode,
    TResult? Function(ClearNodeSelection value)? clearNodeSelection,
    TResult? Function(SaveNodeAsSnippet value)? saveNodeAsSnippet,
    TResult? Function(ReplaceSelectionWith value)? replaceSelectionWith,
    TResult? Function(WrapSelectionWith value)? wrapSelectionWith,
    TResult? Function(AppendChild value)? appendChild,
    TResult? Function(AddSiblingBefore value)? addSiblingBefore,
    TResult? Function(AddSiblingAfter value)? addSiblingAfter,
    TResult? Function(PasteReplacement value)? pasteReplacement,
    TResult? Function(PasteChild value)? pasteChild,
    TResult? Function(PasteSiblingBefore value)? pasteSiblingBefore,
    TResult? Function(PasteSiblingAfter value)? pasteSiblingAfter,
    TResult? Function(DeleteNodeTapped value)? deleteNodeTapped,
    TResult? Function(CompleteDeletion value)? completeDeletion,
    TResult? Function(CopySnippetJsonToClipboard value)?
    copySnippetJsonToClipboard,
    TResult? Function(ReplaceSnippetFromJson value)? replaceSnippetFromJson,
    TResult? Function(CopyNode value)? copyNode,
    TResult? Function(CutNode value)? cutNode,
    TResult? Function(SelectedDirectoryOrNode value)? selectedDirectoryOrNode,
    TResult? Function(ImageChanged value)? imageChanged,
    TResult? Function(ForceSnippetRefresh value)? forceSnippetRefresh,
  }) {
    return forceRefresh?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SelectPanel value)? selectPanel,
    TResult Function(OverrideTargetGK value)? overrideTargetGK,
    TResult Function(ForceRefresh value)? forceRefresh,
    TResult Function(UpdateClipboard value)? updateClipboard,
    TResult Function(PublishSnippet value)? publishSnippet,
    TResult Function(RevertSnippet value)? revertSnippet,
    TResult Function(DeletePage value)? deletePage,
    TResult Function(ToggleAutoPublishingOfSnippet value)?
    toggleAutoPublishingOfSnippet,
    TResult Function(AutoPublishDefault value)? autoPublishDefault,
    TResult Function(HideIframes value)? hideIframes,
    TResult Function(SetPanelSnippet value)? setPanelOrPlaceholderSnippet,
    TResult Function(EnterSelectWidgetMode value)? enterSelectWidgetMode,
    TResult Function(ExitSelectWidgetMode value)? exitSelectWidgetMode,
    TResult Function(PushSnippetEditor value)? pushSnippetEditor,
    TResult Function(PopSnippetEditor value)? popSnippetEditor,
    TResult Function(ShowDirectoryTree value)? showDirectoryTree,
    TResult Function(RemoveDirectoryTree value)? removeDirectoryTree,
    TResult Function(SelectNode value)? selectNode,
    TResult Function(ClearNodeSelection value)? clearNodeSelection,
    TResult Function(SaveNodeAsSnippet value)? saveNodeAsSnippet,
    TResult Function(ReplaceSelectionWith value)? replaceSelectionWith,
    TResult Function(WrapSelectionWith value)? wrapSelectionWith,
    TResult Function(AppendChild value)? appendChild,
    TResult Function(AddSiblingBefore value)? addSiblingBefore,
    TResult Function(AddSiblingAfter value)? addSiblingAfter,
    TResult Function(PasteReplacement value)? pasteReplacement,
    TResult Function(PasteChild value)? pasteChild,
    TResult Function(PasteSiblingBefore value)? pasteSiblingBefore,
    TResult Function(PasteSiblingAfter value)? pasteSiblingAfter,
    TResult Function(DeleteNodeTapped value)? deleteNodeTapped,
    TResult Function(CompleteDeletion value)? completeDeletion,
    TResult Function(CopySnippetJsonToClipboard value)?
    copySnippetJsonToClipboard,
    TResult Function(ReplaceSnippetFromJson value)? replaceSnippetFromJson,
    TResult Function(CopyNode value)? copyNode,
    TResult Function(CutNode value)? cutNode,
    TResult Function(SelectedDirectoryOrNode value)? selectedDirectoryOrNode,
    TResult Function(ImageChanged value)? imageChanged,
    TResult Function(ForceSnippetRefresh value)? forceSnippetRefresh,
    required TResult orElse(),
  }) {
    if (forceRefresh != null) {
      return forceRefresh(this);
    }
    return orElse();
  }
}

abstract class ForceRefresh implements CAPIEvent {
  const factory ForceRefresh({final bool onlyTargetsWrappers}) =
      _$ForceRefreshImpl;

  bool get onlyTargetsWrappers;

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ForceRefreshImplCopyWith<_$ForceRefreshImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateClipboardImplCopyWith<$Res> {
  factory _$$UpdateClipboardImplCopyWith(
    _$UpdateClipboardImpl value,
    $Res Function(_$UpdateClipboardImpl) then,
  ) = __$$UpdateClipboardImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SNode? newContent, String? scName, dynamic skipSave});
}

/// @nodoc
class __$$UpdateClipboardImplCopyWithImpl<$Res>
    extends _$CAPIEventCopyWithImpl<$Res, _$UpdateClipboardImpl>
    implements _$$UpdateClipboardImplCopyWith<$Res> {
  __$$UpdateClipboardImplCopyWithImpl(
    _$UpdateClipboardImpl _value,
    $Res Function(_$UpdateClipboardImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newContent = freezed,
    Object? scName = freezed,
    Object? skipSave = freezed,
  }) {
    return _then(
      _$UpdateClipboardImpl(
        newContent:
            freezed == newContent
                ? _value.newContent
                : newContent // ignore: cast_nullable_to_non_nullable
                    as SNode?,
        scName:
            freezed == scName
                ? _value.scName
                : scName // ignore: cast_nullable_to_non_nullable
                    as String?,
        skipSave: freezed == skipSave ? _value.skipSave! : skipSave,
      ),
    );
  }
}

/// @nodoc

class _$UpdateClipboardImpl
    with DiagnosticableTreeMixin
    implements UpdateClipboard {
  const _$UpdateClipboardImpl({
    required this.newContent,
    required this.scName,
    this.skipSave = false,
  });

  @override
  final SNode? newContent;
  @override
  final String? scName;
  @override
  @JsonKey()
  final dynamic skipSave;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CAPIEvent.updateClipboard(newContent: $newContent, scName: $scName, skipSave: $skipSave)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CAPIEvent.updateClipboard'))
      ..add(DiagnosticsProperty('newContent', newContent))
      ..add(DiagnosticsProperty('scName', scName))
      ..add(DiagnosticsProperty('skipSave', skipSave));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateClipboardImpl &&
            (identical(other.newContent, newContent) ||
                other.newContent == newContent) &&
            (identical(other.scName, scName) || other.scName == scName) &&
            const DeepCollectionEquality().equals(other.skipSave, skipSave));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    newContent,
    scName,
    const DeepCollectionEquality().hash(skipSave),
  );

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateClipboardImplCopyWith<_$UpdateClipboardImpl> get copyWith =>
      __$$UpdateClipboardImplCopyWithImpl<_$UpdateClipboardImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? panelName) selectPanel,
    required TResult Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )
    overrideTargetGK,
    required TResult Function(bool onlyTargetsWrappers) forceRefresh,
    required TResult Function(
      SNode? newContent,
      String? scName,
      dynamic skipSave,
    )
    updateClipboard,
    required TResult Function(String snippetName, String versionId)
    publishSnippet,
    required TResult Function(String snippetName, String versionId)
    revertSnippet,
    required TResult Function(String pathName) deletePage,
    required TResult Function(String snippetName) toggleAutoPublishingOfSnippet,
    required TResult Function(bool b) autoPublishDefault,
    required TResult Function(bool hide) hideIframes,
    required TResult Function(String snippetName, String panelName)
    setPanelOrPlaceholderSnippet,
    required TResult Function(String snippetName) enterSelectWidgetMode,
    required TResult Function() exitSelectWidgetMode,
    required TResult Function(SnippetRootNode rootNode, SNode? selectedNode)
    pushSnippetEditor,
    required TResult Function(bool save) popSnippetEditor,
    required TResult Function() showDirectoryTree,
    required TResult Function(bool save) removeDirectoryTree,
    required TResult Function(SNode node) selectNode,
    required TResult Function() clearNodeSelection,
    required TResult Function(SNode node, String newSnippetName)
    saveNodeAsSnippet,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    replaceSelectionWith,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    wrapSelectionWith,
    required TResult Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )
    appendChild,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    addSiblingBefore,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    addSiblingAfter,
    required TResult Function(Type? widgetSpanChildType) pasteReplacement,
    required TResult Function(
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )
    pasteChild,
    required TResult Function() pasteSiblingBefore,
    required TResult Function() pasteSiblingAfter,
    required TResult Function() deleteNodeTapped,
    required TResult Function() completeDeletion,
    required TResult Function(SnippetRootNode rootNode)
    copySnippetJsonToClipboard,
    required TResult Function(String? snippetJson) replaceSnippetFromJson,
    required TResult Function(SNode node, String? scName, dynamic skipSave)
    copyNode,
    required TResult Function(SNode node, String? scName, dynamic skipSave)
    cutNode,
    required TResult Function(String snippetName, SNode? selectedNode)
    selectedDirectoryOrNode,
    required TResult Function(Uint8List? newBytes) imageChanged,
    required TResult Function() forceSnippetRefresh,
  }) {
    return updateClipboard(newContent, scName, skipSave);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? panelName)? selectPanel,
    TResult? Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )?
    overrideTargetGK,
    TResult? Function(bool onlyTargetsWrappers)? forceRefresh,
    TResult? Function(SNode? newContent, String? scName, dynamic skipSave)?
    updateClipboard,
    TResult? Function(String snippetName, String versionId)? publishSnippet,
    TResult? Function(String snippetName, String versionId)? revertSnippet,
    TResult? Function(String pathName)? deletePage,
    TResult? Function(String snippetName)? toggleAutoPublishingOfSnippet,
    TResult? Function(bool b)? autoPublishDefault,
    TResult? Function(bool hide)? hideIframes,
    TResult? Function(String snippetName, String panelName)?
    setPanelOrPlaceholderSnippet,
    TResult? Function(String snippetName)? enterSelectWidgetMode,
    TResult? Function()? exitSelectWidgetMode,
    TResult? Function(SnippetRootNode rootNode, SNode? selectedNode)?
    pushSnippetEditor,
    TResult? Function(bool save)? popSnippetEditor,
    TResult? Function()? showDirectoryTree,
    TResult? Function(bool save)? removeDirectoryTree,
    TResult? Function(SNode node)? selectNode,
    TResult? Function()? clearNodeSelection,
    TResult? Function(SNode node, String newSnippetName)? saveNodeAsSnippet,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    replaceSelectionWith,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    wrapSelectionWith,
    TResult? Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    appendChild,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingBefore,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingAfter,
    TResult? Function(Type? widgetSpanChildType)? pasteReplacement,
    TResult? Function(
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    pasteChild,
    TResult? Function()? pasteSiblingBefore,
    TResult? Function()? pasteSiblingAfter,
    TResult? Function()? deleteNodeTapped,
    TResult? Function()? completeDeletion,
    TResult? Function(SnippetRootNode rootNode)? copySnippetJsonToClipboard,
    TResult? Function(String? snippetJson)? replaceSnippetFromJson,
    TResult? Function(SNode node, String? scName, dynamic skipSave)? copyNode,
    TResult? Function(SNode node, String? scName, dynamic skipSave)? cutNode,
    TResult? Function(String snippetName, SNode? selectedNode)?
    selectedDirectoryOrNode,
    TResult? Function(Uint8List? newBytes)? imageChanged,
    TResult? Function()? forceSnippetRefresh,
  }) {
    return updateClipboard?.call(newContent, scName, skipSave);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? panelName)? selectPanel,
    TResult Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )?
    overrideTargetGK,
    TResult Function(bool onlyTargetsWrappers)? forceRefresh,
    TResult Function(SNode? newContent, String? scName, dynamic skipSave)?
    updateClipboard,
    TResult Function(String snippetName, String versionId)? publishSnippet,
    TResult Function(String snippetName, String versionId)? revertSnippet,
    TResult Function(String pathName)? deletePage,
    TResult Function(String snippetName)? toggleAutoPublishingOfSnippet,
    TResult Function(bool b)? autoPublishDefault,
    TResult Function(bool hide)? hideIframes,
    TResult Function(String snippetName, String panelName)?
    setPanelOrPlaceholderSnippet,
    TResult Function(String snippetName)? enterSelectWidgetMode,
    TResult Function()? exitSelectWidgetMode,
    TResult Function(SnippetRootNode rootNode, SNode? selectedNode)?
    pushSnippetEditor,
    TResult Function(bool save)? popSnippetEditor,
    TResult Function()? showDirectoryTree,
    TResult Function(bool save)? removeDirectoryTree,
    TResult Function(SNode node)? selectNode,
    TResult Function()? clearNodeSelection,
    TResult Function(SNode node, String newSnippetName)? saveNodeAsSnippet,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    replaceSelectionWith,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    wrapSelectionWith,
    TResult Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    appendChild,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingBefore,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingAfter,
    TResult Function(Type? widgetSpanChildType)? pasteReplacement,
    TResult Function(Type? widgetSpanChildType, SNode? testWidgetSpanChildNode)?
    pasteChild,
    TResult Function()? pasteSiblingBefore,
    TResult Function()? pasteSiblingAfter,
    TResult Function()? deleteNodeTapped,
    TResult Function()? completeDeletion,
    TResult Function(SnippetRootNode rootNode)? copySnippetJsonToClipboard,
    TResult Function(String? snippetJson)? replaceSnippetFromJson,
    TResult Function(SNode node, String? scName, dynamic skipSave)? copyNode,
    TResult Function(SNode node, String? scName, dynamic skipSave)? cutNode,
    TResult Function(String snippetName, SNode? selectedNode)?
    selectedDirectoryOrNode,
    TResult Function(Uint8List? newBytes)? imageChanged,
    TResult Function()? forceSnippetRefresh,
    required TResult orElse(),
  }) {
    if (updateClipboard != null) {
      return updateClipboard(newContent, scName, skipSave);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SelectPanel value) selectPanel,
    required TResult Function(OverrideTargetGK value) overrideTargetGK,
    required TResult Function(ForceRefresh value) forceRefresh,
    required TResult Function(UpdateClipboard value) updateClipboard,
    required TResult Function(PublishSnippet value) publishSnippet,
    required TResult Function(RevertSnippet value) revertSnippet,
    required TResult Function(DeletePage value) deletePage,
    required TResult Function(ToggleAutoPublishingOfSnippet value)
    toggleAutoPublishingOfSnippet,
    required TResult Function(AutoPublishDefault value) autoPublishDefault,
    required TResult Function(HideIframes value) hideIframes,
    required TResult Function(SetPanelSnippet value)
    setPanelOrPlaceholderSnippet,
    required TResult Function(EnterSelectWidgetMode value)
    enterSelectWidgetMode,
    required TResult Function(ExitSelectWidgetMode value) exitSelectWidgetMode,
    required TResult Function(PushSnippetEditor value) pushSnippetEditor,
    required TResult Function(PopSnippetEditor value) popSnippetEditor,
    required TResult Function(ShowDirectoryTree value) showDirectoryTree,
    required TResult Function(RemoveDirectoryTree value) removeDirectoryTree,
    required TResult Function(SelectNode value) selectNode,
    required TResult Function(ClearNodeSelection value) clearNodeSelection,
    required TResult Function(SaveNodeAsSnippet value) saveNodeAsSnippet,
    required TResult Function(ReplaceSelectionWith value) replaceSelectionWith,
    required TResult Function(WrapSelectionWith value) wrapSelectionWith,
    required TResult Function(AppendChild value) appendChild,
    required TResult Function(AddSiblingBefore value) addSiblingBefore,
    required TResult Function(AddSiblingAfter value) addSiblingAfter,
    required TResult Function(PasteReplacement value) pasteReplacement,
    required TResult Function(PasteChild value) pasteChild,
    required TResult Function(PasteSiblingBefore value) pasteSiblingBefore,
    required TResult Function(PasteSiblingAfter value) pasteSiblingAfter,
    required TResult Function(DeleteNodeTapped value) deleteNodeTapped,
    required TResult Function(CompleteDeletion value) completeDeletion,
    required TResult Function(CopySnippetJsonToClipboard value)
    copySnippetJsonToClipboard,
    required TResult Function(ReplaceSnippetFromJson value)
    replaceSnippetFromJson,
    required TResult Function(CopyNode value) copyNode,
    required TResult Function(CutNode value) cutNode,
    required TResult Function(SelectedDirectoryOrNode value)
    selectedDirectoryOrNode,
    required TResult Function(ImageChanged value) imageChanged,
    required TResult Function(ForceSnippetRefresh value) forceSnippetRefresh,
  }) {
    return updateClipboard(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SelectPanel value)? selectPanel,
    TResult? Function(OverrideTargetGK value)? overrideTargetGK,
    TResult? Function(ForceRefresh value)? forceRefresh,
    TResult? Function(UpdateClipboard value)? updateClipboard,
    TResult? Function(PublishSnippet value)? publishSnippet,
    TResult? Function(RevertSnippet value)? revertSnippet,
    TResult? Function(DeletePage value)? deletePage,
    TResult? Function(ToggleAutoPublishingOfSnippet value)?
    toggleAutoPublishingOfSnippet,
    TResult? Function(AutoPublishDefault value)? autoPublishDefault,
    TResult? Function(HideIframes value)? hideIframes,
    TResult? Function(SetPanelSnippet value)? setPanelOrPlaceholderSnippet,
    TResult? Function(EnterSelectWidgetMode value)? enterSelectWidgetMode,
    TResult? Function(ExitSelectWidgetMode value)? exitSelectWidgetMode,
    TResult? Function(PushSnippetEditor value)? pushSnippetEditor,
    TResult? Function(PopSnippetEditor value)? popSnippetEditor,
    TResult? Function(ShowDirectoryTree value)? showDirectoryTree,
    TResult? Function(RemoveDirectoryTree value)? removeDirectoryTree,
    TResult? Function(SelectNode value)? selectNode,
    TResult? Function(ClearNodeSelection value)? clearNodeSelection,
    TResult? Function(SaveNodeAsSnippet value)? saveNodeAsSnippet,
    TResult? Function(ReplaceSelectionWith value)? replaceSelectionWith,
    TResult? Function(WrapSelectionWith value)? wrapSelectionWith,
    TResult? Function(AppendChild value)? appendChild,
    TResult? Function(AddSiblingBefore value)? addSiblingBefore,
    TResult? Function(AddSiblingAfter value)? addSiblingAfter,
    TResult? Function(PasteReplacement value)? pasteReplacement,
    TResult? Function(PasteChild value)? pasteChild,
    TResult? Function(PasteSiblingBefore value)? pasteSiblingBefore,
    TResult? Function(PasteSiblingAfter value)? pasteSiblingAfter,
    TResult? Function(DeleteNodeTapped value)? deleteNodeTapped,
    TResult? Function(CompleteDeletion value)? completeDeletion,
    TResult? Function(CopySnippetJsonToClipboard value)?
    copySnippetJsonToClipboard,
    TResult? Function(ReplaceSnippetFromJson value)? replaceSnippetFromJson,
    TResult? Function(CopyNode value)? copyNode,
    TResult? Function(CutNode value)? cutNode,
    TResult? Function(SelectedDirectoryOrNode value)? selectedDirectoryOrNode,
    TResult? Function(ImageChanged value)? imageChanged,
    TResult? Function(ForceSnippetRefresh value)? forceSnippetRefresh,
  }) {
    return updateClipboard?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SelectPanel value)? selectPanel,
    TResult Function(OverrideTargetGK value)? overrideTargetGK,
    TResult Function(ForceRefresh value)? forceRefresh,
    TResult Function(UpdateClipboard value)? updateClipboard,
    TResult Function(PublishSnippet value)? publishSnippet,
    TResult Function(RevertSnippet value)? revertSnippet,
    TResult Function(DeletePage value)? deletePage,
    TResult Function(ToggleAutoPublishingOfSnippet value)?
    toggleAutoPublishingOfSnippet,
    TResult Function(AutoPublishDefault value)? autoPublishDefault,
    TResult Function(HideIframes value)? hideIframes,
    TResult Function(SetPanelSnippet value)? setPanelOrPlaceholderSnippet,
    TResult Function(EnterSelectWidgetMode value)? enterSelectWidgetMode,
    TResult Function(ExitSelectWidgetMode value)? exitSelectWidgetMode,
    TResult Function(PushSnippetEditor value)? pushSnippetEditor,
    TResult Function(PopSnippetEditor value)? popSnippetEditor,
    TResult Function(ShowDirectoryTree value)? showDirectoryTree,
    TResult Function(RemoveDirectoryTree value)? removeDirectoryTree,
    TResult Function(SelectNode value)? selectNode,
    TResult Function(ClearNodeSelection value)? clearNodeSelection,
    TResult Function(SaveNodeAsSnippet value)? saveNodeAsSnippet,
    TResult Function(ReplaceSelectionWith value)? replaceSelectionWith,
    TResult Function(WrapSelectionWith value)? wrapSelectionWith,
    TResult Function(AppendChild value)? appendChild,
    TResult Function(AddSiblingBefore value)? addSiblingBefore,
    TResult Function(AddSiblingAfter value)? addSiblingAfter,
    TResult Function(PasteReplacement value)? pasteReplacement,
    TResult Function(PasteChild value)? pasteChild,
    TResult Function(PasteSiblingBefore value)? pasteSiblingBefore,
    TResult Function(PasteSiblingAfter value)? pasteSiblingAfter,
    TResult Function(DeleteNodeTapped value)? deleteNodeTapped,
    TResult Function(CompleteDeletion value)? completeDeletion,
    TResult Function(CopySnippetJsonToClipboard value)?
    copySnippetJsonToClipboard,
    TResult Function(ReplaceSnippetFromJson value)? replaceSnippetFromJson,
    TResult Function(CopyNode value)? copyNode,
    TResult Function(CutNode value)? cutNode,
    TResult Function(SelectedDirectoryOrNode value)? selectedDirectoryOrNode,
    TResult Function(ImageChanged value)? imageChanged,
    TResult Function(ForceSnippetRefresh value)? forceSnippetRefresh,
    required TResult orElse(),
  }) {
    if (updateClipboard != null) {
      return updateClipboard(this);
    }
    return orElse();
  }
}

abstract class UpdateClipboard implements CAPIEvent {
  const factory UpdateClipboard({
    required final SNode? newContent,
    required final String? scName,
    final dynamic skipSave,
  }) = _$UpdateClipboardImpl;

  SNode? get newContent;
  String? get scName;
  dynamic get skipSave;

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateClipboardImplCopyWith<_$UpdateClipboardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PublishSnippetImplCopyWith<$Res> {
  factory _$$PublishSnippetImplCopyWith(
    _$PublishSnippetImpl value,
    $Res Function(_$PublishSnippetImpl) then,
  ) = __$$PublishSnippetImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String snippetName, String versionId});
}

/// @nodoc
class __$$PublishSnippetImplCopyWithImpl<$Res>
    extends _$CAPIEventCopyWithImpl<$Res, _$PublishSnippetImpl>
    implements _$$PublishSnippetImplCopyWith<$Res> {
  __$$PublishSnippetImplCopyWithImpl(
    _$PublishSnippetImpl _value,
    $Res Function(_$PublishSnippetImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? snippetName = null, Object? versionId = null}) {
    return _then(
      _$PublishSnippetImpl(
        snippetName:
            null == snippetName
                ? _value.snippetName
                : snippetName // ignore: cast_nullable_to_non_nullable
                    as String,
        versionId:
            null == versionId
                ? _value.versionId
                : versionId // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$PublishSnippetImpl
    with DiagnosticableTreeMixin
    implements PublishSnippet {
  const _$PublishSnippetImpl({
    required this.snippetName,
    required this.versionId,
  });

  @override
  final String snippetName;
  @override
  final String versionId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CAPIEvent.publishSnippet(snippetName: $snippetName, versionId: $versionId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CAPIEvent.publishSnippet'))
      ..add(DiagnosticsProperty('snippetName', snippetName))
      ..add(DiagnosticsProperty('versionId', versionId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PublishSnippetImpl &&
            (identical(other.snippetName, snippetName) ||
                other.snippetName == snippetName) &&
            (identical(other.versionId, versionId) ||
                other.versionId == versionId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, snippetName, versionId);

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PublishSnippetImplCopyWith<_$PublishSnippetImpl> get copyWith =>
      __$$PublishSnippetImplCopyWithImpl<_$PublishSnippetImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? panelName) selectPanel,
    required TResult Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )
    overrideTargetGK,
    required TResult Function(bool onlyTargetsWrappers) forceRefresh,
    required TResult Function(
      SNode? newContent,
      String? scName,
      dynamic skipSave,
    )
    updateClipboard,
    required TResult Function(String snippetName, String versionId)
    publishSnippet,
    required TResult Function(String snippetName, String versionId)
    revertSnippet,
    required TResult Function(String pathName) deletePage,
    required TResult Function(String snippetName) toggleAutoPublishingOfSnippet,
    required TResult Function(bool b) autoPublishDefault,
    required TResult Function(bool hide) hideIframes,
    required TResult Function(String snippetName, String panelName)
    setPanelOrPlaceholderSnippet,
    required TResult Function(String snippetName) enterSelectWidgetMode,
    required TResult Function() exitSelectWidgetMode,
    required TResult Function(SnippetRootNode rootNode, SNode? selectedNode)
    pushSnippetEditor,
    required TResult Function(bool save) popSnippetEditor,
    required TResult Function() showDirectoryTree,
    required TResult Function(bool save) removeDirectoryTree,
    required TResult Function(SNode node) selectNode,
    required TResult Function() clearNodeSelection,
    required TResult Function(SNode node, String newSnippetName)
    saveNodeAsSnippet,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    replaceSelectionWith,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    wrapSelectionWith,
    required TResult Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )
    appendChild,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    addSiblingBefore,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    addSiblingAfter,
    required TResult Function(Type? widgetSpanChildType) pasteReplacement,
    required TResult Function(
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )
    pasteChild,
    required TResult Function() pasteSiblingBefore,
    required TResult Function() pasteSiblingAfter,
    required TResult Function() deleteNodeTapped,
    required TResult Function() completeDeletion,
    required TResult Function(SnippetRootNode rootNode)
    copySnippetJsonToClipboard,
    required TResult Function(String? snippetJson) replaceSnippetFromJson,
    required TResult Function(SNode node, String? scName, dynamic skipSave)
    copyNode,
    required TResult Function(SNode node, String? scName, dynamic skipSave)
    cutNode,
    required TResult Function(String snippetName, SNode? selectedNode)
    selectedDirectoryOrNode,
    required TResult Function(Uint8List? newBytes) imageChanged,
    required TResult Function() forceSnippetRefresh,
  }) {
    return publishSnippet(snippetName, versionId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? panelName)? selectPanel,
    TResult? Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )?
    overrideTargetGK,
    TResult? Function(bool onlyTargetsWrappers)? forceRefresh,
    TResult? Function(SNode? newContent, String? scName, dynamic skipSave)?
    updateClipboard,
    TResult? Function(String snippetName, String versionId)? publishSnippet,
    TResult? Function(String snippetName, String versionId)? revertSnippet,
    TResult? Function(String pathName)? deletePage,
    TResult? Function(String snippetName)? toggleAutoPublishingOfSnippet,
    TResult? Function(bool b)? autoPublishDefault,
    TResult? Function(bool hide)? hideIframes,
    TResult? Function(String snippetName, String panelName)?
    setPanelOrPlaceholderSnippet,
    TResult? Function(String snippetName)? enterSelectWidgetMode,
    TResult? Function()? exitSelectWidgetMode,
    TResult? Function(SnippetRootNode rootNode, SNode? selectedNode)?
    pushSnippetEditor,
    TResult? Function(bool save)? popSnippetEditor,
    TResult? Function()? showDirectoryTree,
    TResult? Function(bool save)? removeDirectoryTree,
    TResult? Function(SNode node)? selectNode,
    TResult? Function()? clearNodeSelection,
    TResult? Function(SNode node, String newSnippetName)? saveNodeAsSnippet,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    replaceSelectionWith,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    wrapSelectionWith,
    TResult? Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    appendChild,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingBefore,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingAfter,
    TResult? Function(Type? widgetSpanChildType)? pasteReplacement,
    TResult? Function(
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    pasteChild,
    TResult? Function()? pasteSiblingBefore,
    TResult? Function()? pasteSiblingAfter,
    TResult? Function()? deleteNodeTapped,
    TResult? Function()? completeDeletion,
    TResult? Function(SnippetRootNode rootNode)? copySnippetJsonToClipboard,
    TResult? Function(String? snippetJson)? replaceSnippetFromJson,
    TResult? Function(SNode node, String? scName, dynamic skipSave)? copyNode,
    TResult? Function(SNode node, String? scName, dynamic skipSave)? cutNode,
    TResult? Function(String snippetName, SNode? selectedNode)?
    selectedDirectoryOrNode,
    TResult? Function(Uint8List? newBytes)? imageChanged,
    TResult? Function()? forceSnippetRefresh,
  }) {
    return publishSnippet?.call(snippetName, versionId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? panelName)? selectPanel,
    TResult Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )?
    overrideTargetGK,
    TResult Function(bool onlyTargetsWrappers)? forceRefresh,
    TResult Function(SNode? newContent, String? scName, dynamic skipSave)?
    updateClipboard,
    TResult Function(String snippetName, String versionId)? publishSnippet,
    TResult Function(String snippetName, String versionId)? revertSnippet,
    TResult Function(String pathName)? deletePage,
    TResult Function(String snippetName)? toggleAutoPublishingOfSnippet,
    TResult Function(bool b)? autoPublishDefault,
    TResult Function(bool hide)? hideIframes,
    TResult Function(String snippetName, String panelName)?
    setPanelOrPlaceholderSnippet,
    TResult Function(String snippetName)? enterSelectWidgetMode,
    TResult Function()? exitSelectWidgetMode,
    TResult Function(SnippetRootNode rootNode, SNode? selectedNode)?
    pushSnippetEditor,
    TResult Function(bool save)? popSnippetEditor,
    TResult Function()? showDirectoryTree,
    TResult Function(bool save)? removeDirectoryTree,
    TResult Function(SNode node)? selectNode,
    TResult Function()? clearNodeSelection,
    TResult Function(SNode node, String newSnippetName)? saveNodeAsSnippet,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    replaceSelectionWith,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    wrapSelectionWith,
    TResult Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    appendChild,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingBefore,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingAfter,
    TResult Function(Type? widgetSpanChildType)? pasteReplacement,
    TResult Function(Type? widgetSpanChildType, SNode? testWidgetSpanChildNode)?
    pasteChild,
    TResult Function()? pasteSiblingBefore,
    TResult Function()? pasteSiblingAfter,
    TResult Function()? deleteNodeTapped,
    TResult Function()? completeDeletion,
    TResult Function(SnippetRootNode rootNode)? copySnippetJsonToClipboard,
    TResult Function(String? snippetJson)? replaceSnippetFromJson,
    TResult Function(SNode node, String? scName, dynamic skipSave)? copyNode,
    TResult Function(SNode node, String? scName, dynamic skipSave)? cutNode,
    TResult Function(String snippetName, SNode? selectedNode)?
    selectedDirectoryOrNode,
    TResult Function(Uint8List? newBytes)? imageChanged,
    TResult Function()? forceSnippetRefresh,
    required TResult orElse(),
  }) {
    if (publishSnippet != null) {
      return publishSnippet(snippetName, versionId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SelectPanel value) selectPanel,
    required TResult Function(OverrideTargetGK value) overrideTargetGK,
    required TResult Function(ForceRefresh value) forceRefresh,
    required TResult Function(UpdateClipboard value) updateClipboard,
    required TResult Function(PublishSnippet value) publishSnippet,
    required TResult Function(RevertSnippet value) revertSnippet,
    required TResult Function(DeletePage value) deletePage,
    required TResult Function(ToggleAutoPublishingOfSnippet value)
    toggleAutoPublishingOfSnippet,
    required TResult Function(AutoPublishDefault value) autoPublishDefault,
    required TResult Function(HideIframes value) hideIframes,
    required TResult Function(SetPanelSnippet value)
    setPanelOrPlaceholderSnippet,
    required TResult Function(EnterSelectWidgetMode value)
    enterSelectWidgetMode,
    required TResult Function(ExitSelectWidgetMode value) exitSelectWidgetMode,
    required TResult Function(PushSnippetEditor value) pushSnippetEditor,
    required TResult Function(PopSnippetEditor value) popSnippetEditor,
    required TResult Function(ShowDirectoryTree value) showDirectoryTree,
    required TResult Function(RemoveDirectoryTree value) removeDirectoryTree,
    required TResult Function(SelectNode value) selectNode,
    required TResult Function(ClearNodeSelection value) clearNodeSelection,
    required TResult Function(SaveNodeAsSnippet value) saveNodeAsSnippet,
    required TResult Function(ReplaceSelectionWith value) replaceSelectionWith,
    required TResult Function(WrapSelectionWith value) wrapSelectionWith,
    required TResult Function(AppendChild value) appendChild,
    required TResult Function(AddSiblingBefore value) addSiblingBefore,
    required TResult Function(AddSiblingAfter value) addSiblingAfter,
    required TResult Function(PasteReplacement value) pasteReplacement,
    required TResult Function(PasteChild value) pasteChild,
    required TResult Function(PasteSiblingBefore value) pasteSiblingBefore,
    required TResult Function(PasteSiblingAfter value) pasteSiblingAfter,
    required TResult Function(DeleteNodeTapped value) deleteNodeTapped,
    required TResult Function(CompleteDeletion value) completeDeletion,
    required TResult Function(CopySnippetJsonToClipboard value)
    copySnippetJsonToClipboard,
    required TResult Function(ReplaceSnippetFromJson value)
    replaceSnippetFromJson,
    required TResult Function(CopyNode value) copyNode,
    required TResult Function(CutNode value) cutNode,
    required TResult Function(SelectedDirectoryOrNode value)
    selectedDirectoryOrNode,
    required TResult Function(ImageChanged value) imageChanged,
    required TResult Function(ForceSnippetRefresh value) forceSnippetRefresh,
  }) {
    return publishSnippet(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SelectPanel value)? selectPanel,
    TResult? Function(OverrideTargetGK value)? overrideTargetGK,
    TResult? Function(ForceRefresh value)? forceRefresh,
    TResult? Function(UpdateClipboard value)? updateClipboard,
    TResult? Function(PublishSnippet value)? publishSnippet,
    TResult? Function(RevertSnippet value)? revertSnippet,
    TResult? Function(DeletePage value)? deletePage,
    TResult? Function(ToggleAutoPublishingOfSnippet value)?
    toggleAutoPublishingOfSnippet,
    TResult? Function(AutoPublishDefault value)? autoPublishDefault,
    TResult? Function(HideIframes value)? hideIframes,
    TResult? Function(SetPanelSnippet value)? setPanelOrPlaceholderSnippet,
    TResult? Function(EnterSelectWidgetMode value)? enterSelectWidgetMode,
    TResult? Function(ExitSelectWidgetMode value)? exitSelectWidgetMode,
    TResult? Function(PushSnippetEditor value)? pushSnippetEditor,
    TResult? Function(PopSnippetEditor value)? popSnippetEditor,
    TResult? Function(ShowDirectoryTree value)? showDirectoryTree,
    TResult? Function(RemoveDirectoryTree value)? removeDirectoryTree,
    TResult? Function(SelectNode value)? selectNode,
    TResult? Function(ClearNodeSelection value)? clearNodeSelection,
    TResult? Function(SaveNodeAsSnippet value)? saveNodeAsSnippet,
    TResult? Function(ReplaceSelectionWith value)? replaceSelectionWith,
    TResult? Function(WrapSelectionWith value)? wrapSelectionWith,
    TResult? Function(AppendChild value)? appendChild,
    TResult? Function(AddSiblingBefore value)? addSiblingBefore,
    TResult? Function(AddSiblingAfter value)? addSiblingAfter,
    TResult? Function(PasteReplacement value)? pasteReplacement,
    TResult? Function(PasteChild value)? pasteChild,
    TResult? Function(PasteSiblingBefore value)? pasteSiblingBefore,
    TResult? Function(PasteSiblingAfter value)? pasteSiblingAfter,
    TResult? Function(DeleteNodeTapped value)? deleteNodeTapped,
    TResult? Function(CompleteDeletion value)? completeDeletion,
    TResult? Function(CopySnippetJsonToClipboard value)?
    copySnippetJsonToClipboard,
    TResult? Function(ReplaceSnippetFromJson value)? replaceSnippetFromJson,
    TResult? Function(CopyNode value)? copyNode,
    TResult? Function(CutNode value)? cutNode,
    TResult? Function(SelectedDirectoryOrNode value)? selectedDirectoryOrNode,
    TResult? Function(ImageChanged value)? imageChanged,
    TResult? Function(ForceSnippetRefresh value)? forceSnippetRefresh,
  }) {
    return publishSnippet?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SelectPanel value)? selectPanel,
    TResult Function(OverrideTargetGK value)? overrideTargetGK,
    TResult Function(ForceRefresh value)? forceRefresh,
    TResult Function(UpdateClipboard value)? updateClipboard,
    TResult Function(PublishSnippet value)? publishSnippet,
    TResult Function(RevertSnippet value)? revertSnippet,
    TResult Function(DeletePage value)? deletePage,
    TResult Function(ToggleAutoPublishingOfSnippet value)?
    toggleAutoPublishingOfSnippet,
    TResult Function(AutoPublishDefault value)? autoPublishDefault,
    TResult Function(HideIframes value)? hideIframes,
    TResult Function(SetPanelSnippet value)? setPanelOrPlaceholderSnippet,
    TResult Function(EnterSelectWidgetMode value)? enterSelectWidgetMode,
    TResult Function(ExitSelectWidgetMode value)? exitSelectWidgetMode,
    TResult Function(PushSnippetEditor value)? pushSnippetEditor,
    TResult Function(PopSnippetEditor value)? popSnippetEditor,
    TResult Function(ShowDirectoryTree value)? showDirectoryTree,
    TResult Function(RemoveDirectoryTree value)? removeDirectoryTree,
    TResult Function(SelectNode value)? selectNode,
    TResult Function(ClearNodeSelection value)? clearNodeSelection,
    TResult Function(SaveNodeAsSnippet value)? saveNodeAsSnippet,
    TResult Function(ReplaceSelectionWith value)? replaceSelectionWith,
    TResult Function(WrapSelectionWith value)? wrapSelectionWith,
    TResult Function(AppendChild value)? appendChild,
    TResult Function(AddSiblingBefore value)? addSiblingBefore,
    TResult Function(AddSiblingAfter value)? addSiblingAfter,
    TResult Function(PasteReplacement value)? pasteReplacement,
    TResult Function(PasteChild value)? pasteChild,
    TResult Function(PasteSiblingBefore value)? pasteSiblingBefore,
    TResult Function(PasteSiblingAfter value)? pasteSiblingAfter,
    TResult Function(DeleteNodeTapped value)? deleteNodeTapped,
    TResult Function(CompleteDeletion value)? completeDeletion,
    TResult Function(CopySnippetJsonToClipboard value)?
    copySnippetJsonToClipboard,
    TResult Function(ReplaceSnippetFromJson value)? replaceSnippetFromJson,
    TResult Function(CopyNode value)? copyNode,
    TResult Function(CutNode value)? cutNode,
    TResult Function(SelectedDirectoryOrNode value)? selectedDirectoryOrNode,
    TResult Function(ImageChanged value)? imageChanged,
    TResult Function(ForceSnippetRefresh value)? forceSnippetRefresh,
    required TResult orElse(),
  }) {
    if (publishSnippet != null) {
      return publishSnippet(this);
    }
    return orElse();
  }
}

abstract class PublishSnippet implements CAPIEvent {
  const factory PublishSnippet({
    required final String snippetName,
    required final String versionId,
  }) = _$PublishSnippetImpl;

  String get snippetName;
  String get versionId;

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PublishSnippetImplCopyWith<_$PublishSnippetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RevertSnippetImplCopyWith<$Res> {
  factory _$$RevertSnippetImplCopyWith(
    _$RevertSnippetImpl value,
    $Res Function(_$RevertSnippetImpl) then,
  ) = __$$RevertSnippetImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String snippetName, String versionId});
}

/// @nodoc
class __$$RevertSnippetImplCopyWithImpl<$Res>
    extends _$CAPIEventCopyWithImpl<$Res, _$RevertSnippetImpl>
    implements _$$RevertSnippetImplCopyWith<$Res> {
  __$$RevertSnippetImplCopyWithImpl(
    _$RevertSnippetImpl _value,
    $Res Function(_$RevertSnippetImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? snippetName = null, Object? versionId = null}) {
    return _then(
      _$RevertSnippetImpl(
        snippetName:
            null == snippetName
                ? _value.snippetName
                : snippetName // ignore: cast_nullable_to_non_nullable
                    as String,
        versionId:
            null == versionId
                ? _value.versionId
                : versionId // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$RevertSnippetImpl
    with DiagnosticableTreeMixin
    implements RevertSnippet {
  const _$RevertSnippetImpl({
    required this.snippetName,
    required this.versionId,
  });

  @override
  final String snippetName;
  @override
  final String versionId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CAPIEvent.revertSnippet(snippetName: $snippetName, versionId: $versionId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CAPIEvent.revertSnippet'))
      ..add(DiagnosticsProperty('snippetName', snippetName))
      ..add(DiagnosticsProperty('versionId', versionId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RevertSnippetImpl &&
            (identical(other.snippetName, snippetName) ||
                other.snippetName == snippetName) &&
            (identical(other.versionId, versionId) ||
                other.versionId == versionId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, snippetName, versionId);

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RevertSnippetImplCopyWith<_$RevertSnippetImpl> get copyWith =>
      __$$RevertSnippetImplCopyWithImpl<_$RevertSnippetImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? panelName) selectPanel,
    required TResult Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )
    overrideTargetGK,
    required TResult Function(bool onlyTargetsWrappers) forceRefresh,
    required TResult Function(
      SNode? newContent,
      String? scName,
      dynamic skipSave,
    )
    updateClipboard,
    required TResult Function(String snippetName, String versionId)
    publishSnippet,
    required TResult Function(String snippetName, String versionId)
    revertSnippet,
    required TResult Function(String pathName) deletePage,
    required TResult Function(String snippetName) toggleAutoPublishingOfSnippet,
    required TResult Function(bool b) autoPublishDefault,
    required TResult Function(bool hide) hideIframes,
    required TResult Function(String snippetName, String panelName)
    setPanelOrPlaceholderSnippet,
    required TResult Function(String snippetName) enterSelectWidgetMode,
    required TResult Function() exitSelectWidgetMode,
    required TResult Function(SnippetRootNode rootNode, SNode? selectedNode)
    pushSnippetEditor,
    required TResult Function(bool save) popSnippetEditor,
    required TResult Function() showDirectoryTree,
    required TResult Function(bool save) removeDirectoryTree,
    required TResult Function(SNode node) selectNode,
    required TResult Function() clearNodeSelection,
    required TResult Function(SNode node, String newSnippetName)
    saveNodeAsSnippet,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    replaceSelectionWith,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    wrapSelectionWith,
    required TResult Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )
    appendChild,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    addSiblingBefore,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    addSiblingAfter,
    required TResult Function(Type? widgetSpanChildType) pasteReplacement,
    required TResult Function(
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )
    pasteChild,
    required TResult Function() pasteSiblingBefore,
    required TResult Function() pasteSiblingAfter,
    required TResult Function() deleteNodeTapped,
    required TResult Function() completeDeletion,
    required TResult Function(SnippetRootNode rootNode)
    copySnippetJsonToClipboard,
    required TResult Function(String? snippetJson) replaceSnippetFromJson,
    required TResult Function(SNode node, String? scName, dynamic skipSave)
    copyNode,
    required TResult Function(SNode node, String? scName, dynamic skipSave)
    cutNode,
    required TResult Function(String snippetName, SNode? selectedNode)
    selectedDirectoryOrNode,
    required TResult Function(Uint8List? newBytes) imageChanged,
    required TResult Function() forceSnippetRefresh,
  }) {
    return revertSnippet(snippetName, versionId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? panelName)? selectPanel,
    TResult? Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )?
    overrideTargetGK,
    TResult? Function(bool onlyTargetsWrappers)? forceRefresh,
    TResult? Function(SNode? newContent, String? scName, dynamic skipSave)?
    updateClipboard,
    TResult? Function(String snippetName, String versionId)? publishSnippet,
    TResult? Function(String snippetName, String versionId)? revertSnippet,
    TResult? Function(String pathName)? deletePage,
    TResult? Function(String snippetName)? toggleAutoPublishingOfSnippet,
    TResult? Function(bool b)? autoPublishDefault,
    TResult? Function(bool hide)? hideIframes,
    TResult? Function(String snippetName, String panelName)?
    setPanelOrPlaceholderSnippet,
    TResult? Function(String snippetName)? enterSelectWidgetMode,
    TResult? Function()? exitSelectWidgetMode,
    TResult? Function(SnippetRootNode rootNode, SNode? selectedNode)?
    pushSnippetEditor,
    TResult? Function(bool save)? popSnippetEditor,
    TResult? Function()? showDirectoryTree,
    TResult? Function(bool save)? removeDirectoryTree,
    TResult? Function(SNode node)? selectNode,
    TResult? Function()? clearNodeSelection,
    TResult? Function(SNode node, String newSnippetName)? saveNodeAsSnippet,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    replaceSelectionWith,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    wrapSelectionWith,
    TResult? Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    appendChild,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingBefore,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingAfter,
    TResult? Function(Type? widgetSpanChildType)? pasteReplacement,
    TResult? Function(
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    pasteChild,
    TResult? Function()? pasteSiblingBefore,
    TResult? Function()? pasteSiblingAfter,
    TResult? Function()? deleteNodeTapped,
    TResult? Function()? completeDeletion,
    TResult? Function(SnippetRootNode rootNode)? copySnippetJsonToClipboard,
    TResult? Function(String? snippetJson)? replaceSnippetFromJson,
    TResult? Function(SNode node, String? scName, dynamic skipSave)? copyNode,
    TResult? Function(SNode node, String? scName, dynamic skipSave)? cutNode,
    TResult? Function(String snippetName, SNode? selectedNode)?
    selectedDirectoryOrNode,
    TResult? Function(Uint8List? newBytes)? imageChanged,
    TResult? Function()? forceSnippetRefresh,
  }) {
    return revertSnippet?.call(snippetName, versionId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? panelName)? selectPanel,
    TResult Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )?
    overrideTargetGK,
    TResult Function(bool onlyTargetsWrappers)? forceRefresh,
    TResult Function(SNode? newContent, String? scName, dynamic skipSave)?
    updateClipboard,
    TResult Function(String snippetName, String versionId)? publishSnippet,
    TResult Function(String snippetName, String versionId)? revertSnippet,
    TResult Function(String pathName)? deletePage,
    TResult Function(String snippetName)? toggleAutoPublishingOfSnippet,
    TResult Function(bool b)? autoPublishDefault,
    TResult Function(bool hide)? hideIframes,
    TResult Function(String snippetName, String panelName)?
    setPanelOrPlaceholderSnippet,
    TResult Function(String snippetName)? enterSelectWidgetMode,
    TResult Function()? exitSelectWidgetMode,
    TResult Function(SnippetRootNode rootNode, SNode? selectedNode)?
    pushSnippetEditor,
    TResult Function(bool save)? popSnippetEditor,
    TResult Function()? showDirectoryTree,
    TResult Function(bool save)? removeDirectoryTree,
    TResult Function(SNode node)? selectNode,
    TResult Function()? clearNodeSelection,
    TResult Function(SNode node, String newSnippetName)? saveNodeAsSnippet,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    replaceSelectionWith,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    wrapSelectionWith,
    TResult Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    appendChild,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingBefore,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingAfter,
    TResult Function(Type? widgetSpanChildType)? pasteReplacement,
    TResult Function(Type? widgetSpanChildType, SNode? testWidgetSpanChildNode)?
    pasteChild,
    TResult Function()? pasteSiblingBefore,
    TResult Function()? pasteSiblingAfter,
    TResult Function()? deleteNodeTapped,
    TResult Function()? completeDeletion,
    TResult Function(SnippetRootNode rootNode)? copySnippetJsonToClipboard,
    TResult Function(String? snippetJson)? replaceSnippetFromJson,
    TResult Function(SNode node, String? scName, dynamic skipSave)? copyNode,
    TResult Function(SNode node, String? scName, dynamic skipSave)? cutNode,
    TResult Function(String snippetName, SNode? selectedNode)?
    selectedDirectoryOrNode,
    TResult Function(Uint8List? newBytes)? imageChanged,
    TResult Function()? forceSnippetRefresh,
    required TResult orElse(),
  }) {
    if (revertSnippet != null) {
      return revertSnippet(snippetName, versionId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SelectPanel value) selectPanel,
    required TResult Function(OverrideTargetGK value) overrideTargetGK,
    required TResult Function(ForceRefresh value) forceRefresh,
    required TResult Function(UpdateClipboard value) updateClipboard,
    required TResult Function(PublishSnippet value) publishSnippet,
    required TResult Function(RevertSnippet value) revertSnippet,
    required TResult Function(DeletePage value) deletePage,
    required TResult Function(ToggleAutoPublishingOfSnippet value)
    toggleAutoPublishingOfSnippet,
    required TResult Function(AutoPublishDefault value) autoPublishDefault,
    required TResult Function(HideIframes value) hideIframes,
    required TResult Function(SetPanelSnippet value)
    setPanelOrPlaceholderSnippet,
    required TResult Function(EnterSelectWidgetMode value)
    enterSelectWidgetMode,
    required TResult Function(ExitSelectWidgetMode value) exitSelectWidgetMode,
    required TResult Function(PushSnippetEditor value) pushSnippetEditor,
    required TResult Function(PopSnippetEditor value) popSnippetEditor,
    required TResult Function(ShowDirectoryTree value) showDirectoryTree,
    required TResult Function(RemoveDirectoryTree value) removeDirectoryTree,
    required TResult Function(SelectNode value) selectNode,
    required TResult Function(ClearNodeSelection value) clearNodeSelection,
    required TResult Function(SaveNodeAsSnippet value) saveNodeAsSnippet,
    required TResult Function(ReplaceSelectionWith value) replaceSelectionWith,
    required TResult Function(WrapSelectionWith value) wrapSelectionWith,
    required TResult Function(AppendChild value) appendChild,
    required TResult Function(AddSiblingBefore value) addSiblingBefore,
    required TResult Function(AddSiblingAfter value) addSiblingAfter,
    required TResult Function(PasteReplacement value) pasteReplacement,
    required TResult Function(PasteChild value) pasteChild,
    required TResult Function(PasteSiblingBefore value) pasteSiblingBefore,
    required TResult Function(PasteSiblingAfter value) pasteSiblingAfter,
    required TResult Function(DeleteNodeTapped value) deleteNodeTapped,
    required TResult Function(CompleteDeletion value) completeDeletion,
    required TResult Function(CopySnippetJsonToClipboard value)
    copySnippetJsonToClipboard,
    required TResult Function(ReplaceSnippetFromJson value)
    replaceSnippetFromJson,
    required TResult Function(CopyNode value) copyNode,
    required TResult Function(CutNode value) cutNode,
    required TResult Function(SelectedDirectoryOrNode value)
    selectedDirectoryOrNode,
    required TResult Function(ImageChanged value) imageChanged,
    required TResult Function(ForceSnippetRefresh value) forceSnippetRefresh,
  }) {
    return revertSnippet(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SelectPanel value)? selectPanel,
    TResult? Function(OverrideTargetGK value)? overrideTargetGK,
    TResult? Function(ForceRefresh value)? forceRefresh,
    TResult? Function(UpdateClipboard value)? updateClipboard,
    TResult? Function(PublishSnippet value)? publishSnippet,
    TResult? Function(RevertSnippet value)? revertSnippet,
    TResult? Function(DeletePage value)? deletePage,
    TResult? Function(ToggleAutoPublishingOfSnippet value)?
    toggleAutoPublishingOfSnippet,
    TResult? Function(AutoPublishDefault value)? autoPublishDefault,
    TResult? Function(HideIframes value)? hideIframes,
    TResult? Function(SetPanelSnippet value)? setPanelOrPlaceholderSnippet,
    TResult? Function(EnterSelectWidgetMode value)? enterSelectWidgetMode,
    TResult? Function(ExitSelectWidgetMode value)? exitSelectWidgetMode,
    TResult? Function(PushSnippetEditor value)? pushSnippetEditor,
    TResult? Function(PopSnippetEditor value)? popSnippetEditor,
    TResult? Function(ShowDirectoryTree value)? showDirectoryTree,
    TResult? Function(RemoveDirectoryTree value)? removeDirectoryTree,
    TResult? Function(SelectNode value)? selectNode,
    TResult? Function(ClearNodeSelection value)? clearNodeSelection,
    TResult? Function(SaveNodeAsSnippet value)? saveNodeAsSnippet,
    TResult? Function(ReplaceSelectionWith value)? replaceSelectionWith,
    TResult? Function(WrapSelectionWith value)? wrapSelectionWith,
    TResult? Function(AppendChild value)? appendChild,
    TResult? Function(AddSiblingBefore value)? addSiblingBefore,
    TResult? Function(AddSiblingAfter value)? addSiblingAfter,
    TResult? Function(PasteReplacement value)? pasteReplacement,
    TResult? Function(PasteChild value)? pasteChild,
    TResult? Function(PasteSiblingBefore value)? pasteSiblingBefore,
    TResult? Function(PasteSiblingAfter value)? pasteSiblingAfter,
    TResult? Function(DeleteNodeTapped value)? deleteNodeTapped,
    TResult? Function(CompleteDeletion value)? completeDeletion,
    TResult? Function(CopySnippetJsonToClipboard value)?
    copySnippetJsonToClipboard,
    TResult? Function(ReplaceSnippetFromJson value)? replaceSnippetFromJson,
    TResult? Function(CopyNode value)? copyNode,
    TResult? Function(CutNode value)? cutNode,
    TResult? Function(SelectedDirectoryOrNode value)? selectedDirectoryOrNode,
    TResult? Function(ImageChanged value)? imageChanged,
    TResult? Function(ForceSnippetRefresh value)? forceSnippetRefresh,
  }) {
    return revertSnippet?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SelectPanel value)? selectPanel,
    TResult Function(OverrideTargetGK value)? overrideTargetGK,
    TResult Function(ForceRefresh value)? forceRefresh,
    TResult Function(UpdateClipboard value)? updateClipboard,
    TResult Function(PublishSnippet value)? publishSnippet,
    TResult Function(RevertSnippet value)? revertSnippet,
    TResult Function(DeletePage value)? deletePage,
    TResult Function(ToggleAutoPublishingOfSnippet value)?
    toggleAutoPublishingOfSnippet,
    TResult Function(AutoPublishDefault value)? autoPublishDefault,
    TResult Function(HideIframes value)? hideIframes,
    TResult Function(SetPanelSnippet value)? setPanelOrPlaceholderSnippet,
    TResult Function(EnterSelectWidgetMode value)? enterSelectWidgetMode,
    TResult Function(ExitSelectWidgetMode value)? exitSelectWidgetMode,
    TResult Function(PushSnippetEditor value)? pushSnippetEditor,
    TResult Function(PopSnippetEditor value)? popSnippetEditor,
    TResult Function(ShowDirectoryTree value)? showDirectoryTree,
    TResult Function(RemoveDirectoryTree value)? removeDirectoryTree,
    TResult Function(SelectNode value)? selectNode,
    TResult Function(ClearNodeSelection value)? clearNodeSelection,
    TResult Function(SaveNodeAsSnippet value)? saveNodeAsSnippet,
    TResult Function(ReplaceSelectionWith value)? replaceSelectionWith,
    TResult Function(WrapSelectionWith value)? wrapSelectionWith,
    TResult Function(AppendChild value)? appendChild,
    TResult Function(AddSiblingBefore value)? addSiblingBefore,
    TResult Function(AddSiblingAfter value)? addSiblingAfter,
    TResult Function(PasteReplacement value)? pasteReplacement,
    TResult Function(PasteChild value)? pasteChild,
    TResult Function(PasteSiblingBefore value)? pasteSiblingBefore,
    TResult Function(PasteSiblingAfter value)? pasteSiblingAfter,
    TResult Function(DeleteNodeTapped value)? deleteNodeTapped,
    TResult Function(CompleteDeletion value)? completeDeletion,
    TResult Function(CopySnippetJsonToClipboard value)?
    copySnippetJsonToClipboard,
    TResult Function(ReplaceSnippetFromJson value)? replaceSnippetFromJson,
    TResult Function(CopyNode value)? copyNode,
    TResult Function(CutNode value)? cutNode,
    TResult Function(SelectedDirectoryOrNode value)? selectedDirectoryOrNode,
    TResult Function(ImageChanged value)? imageChanged,
    TResult Function(ForceSnippetRefresh value)? forceSnippetRefresh,
    required TResult orElse(),
  }) {
    if (revertSnippet != null) {
      return revertSnippet(this);
    }
    return orElse();
  }
}

abstract class RevertSnippet implements CAPIEvent {
  const factory RevertSnippet({
    required final String snippetName,
    required final String versionId,
  }) = _$RevertSnippetImpl;

  String get snippetName;
  String get versionId;

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RevertSnippetImplCopyWith<_$RevertSnippetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeletePageImplCopyWith<$Res> {
  factory _$$DeletePageImplCopyWith(
    _$DeletePageImpl value,
    $Res Function(_$DeletePageImpl) then,
  ) = __$$DeletePageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String pathName});
}

/// @nodoc
class __$$DeletePageImplCopyWithImpl<$Res>
    extends _$CAPIEventCopyWithImpl<$Res, _$DeletePageImpl>
    implements _$$DeletePageImplCopyWith<$Res> {
  __$$DeletePageImplCopyWithImpl(
    _$DeletePageImpl _value,
    $Res Function(_$DeletePageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? pathName = null}) {
    return _then(
      _$DeletePageImpl(
        pathName:
            null == pathName
                ? _value.pathName
                : pathName // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$DeletePageImpl with DiagnosticableTreeMixin implements DeletePage {
  const _$DeletePageImpl({required this.pathName});

  @override
  final String pathName;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CAPIEvent.deletePage(pathName: $pathName)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CAPIEvent.deletePage'))
      ..add(DiagnosticsProperty('pathName', pathName));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeletePageImpl &&
            (identical(other.pathName, pathName) ||
                other.pathName == pathName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pathName);

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeletePageImplCopyWith<_$DeletePageImpl> get copyWith =>
      __$$DeletePageImplCopyWithImpl<_$DeletePageImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? panelName) selectPanel,
    required TResult Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )
    overrideTargetGK,
    required TResult Function(bool onlyTargetsWrappers) forceRefresh,
    required TResult Function(
      SNode? newContent,
      String? scName,
      dynamic skipSave,
    )
    updateClipboard,
    required TResult Function(String snippetName, String versionId)
    publishSnippet,
    required TResult Function(String snippetName, String versionId)
    revertSnippet,
    required TResult Function(String pathName) deletePage,
    required TResult Function(String snippetName) toggleAutoPublishingOfSnippet,
    required TResult Function(bool b) autoPublishDefault,
    required TResult Function(bool hide) hideIframes,
    required TResult Function(String snippetName, String panelName)
    setPanelOrPlaceholderSnippet,
    required TResult Function(String snippetName) enterSelectWidgetMode,
    required TResult Function() exitSelectWidgetMode,
    required TResult Function(SnippetRootNode rootNode, SNode? selectedNode)
    pushSnippetEditor,
    required TResult Function(bool save) popSnippetEditor,
    required TResult Function() showDirectoryTree,
    required TResult Function(bool save) removeDirectoryTree,
    required TResult Function(SNode node) selectNode,
    required TResult Function() clearNodeSelection,
    required TResult Function(SNode node, String newSnippetName)
    saveNodeAsSnippet,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    replaceSelectionWith,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    wrapSelectionWith,
    required TResult Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )
    appendChild,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    addSiblingBefore,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    addSiblingAfter,
    required TResult Function(Type? widgetSpanChildType) pasteReplacement,
    required TResult Function(
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )
    pasteChild,
    required TResult Function() pasteSiblingBefore,
    required TResult Function() pasteSiblingAfter,
    required TResult Function() deleteNodeTapped,
    required TResult Function() completeDeletion,
    required TResult Function(SnippetRootNode rootNode)
    copySnippetJsonToClipboard,
    required TResult Function(String? snippetJson) replaceSnippetFromJson,
    required TResult Function(SNode node, String? scName, dynamic skipSave)
    copyNode,
    required TResult Function(SNode node, String? scName, dynamic skipSave)
    cutNode,
    required TResult Function(String snippetName, SNode? selectedNode)
    selectedDirectoryOrNode,
    required TResult Function(Uint8List? newBytes) imageChanged,
    required TResult Function() forceSnippetRefresh,
  }) {
    return deletePage(pathName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? panelName)? selectPanel,
    TResult? Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )?
    overrideTargetGK,
    TResult? Function(bool onlyTargetsWrappers)? forceRefresh,
    TResult? Function(SNode? newContent, String? scName, dynamic skipSave)?
    updateClipboard,
    TResult? Function(String snippetName, String versionId)? publishSnippet,
    TResult? Function(String snippetName, String versionId)? revertSnippet,
    TResult? Function(String pathName)? deletePage,
    TResult? Function(String snippetName)? toggleAutoPublishingOfSnippet,
    TResult? Function(bool b)? autoPublishDefault,
    TResult? Function(bool hide)? hideIframes,
    TResult? Function(String snippetName, String panelName)?
    setPanelOrPlaceholderSnippet,
    TResult? Function(String snippetName)? enterSelectWidgetMode,
    TResult? Function()? exitSelectWidgetMode,
    TResult? Function(SnippetRootNode rootNode, SNode? selectedNode)?
    pushSnippetEditor,
    TResult? Function(bool save)? popSnippetEditor,
    TResult? Function()? showDirectoryTree,
    TResult? Function(bool save)? removeDirectoryTree,
    TResult? Function(SNode node)? selectNode,
    TResult? Function()? clearNodeSelection,
    TResult? Function(SNode node, String newSnippetName)? saveNodeAsSnippet,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    replaceSelectionWith,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    wrapSelectionWith,
    TResult? Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    appendChild,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingBefore,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingAfter,
    TResult? Function(Type? widgetSpanChildType)? pasteReplacement,
    TResult? Function(
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    pasteChild,
    TResult? Function()? pasteSiblingBefore,
    TResult? Function()? pasteSiblingAfter,
    TResult? Function()? deleteNodeTapped,
    TResult? Function()? completeDeletion,
    TResult? Function(SnippetRootNode rootNode)? copySnippetJsonToClipboard,
    TResult? Function(String? snippetJson)? replaceSnippetFromJson,
    TResult? Function(SNode node, String? scName, dynamic skipSave)? copyNode,
    TResult? Function(SNode node, String? scName, dynamic skipSave)? cutNode,
    TResult? Function(String snippetName, SNode? selectedNode)?
    selectedDirectoryOrNode,
    TResult? Function(Uint8List? newBytes)? imageChanged,
    TResult? Function()? forceSnippetRefresh,
  }) {
    return deletePage?.call(pathName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? panelName)? selectPanel,
    TResult Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )?
    overrideTargetGK,
    TResult Function(bool onlyTargetsWrappers)? forceRefresh,
    TResult Function(SNode? newContent, String? scName, dynamic skipSave)?
    updateClipboard,
    TResult Function(String snippetName, String versionId)? publishSnippet,
    TResult Function(String snippetName, String versionId)? revertSnippet,
    TResult Function(String pathName)? deletePage,
    TResult Function(String snippetName)? toggleAutoPublishingOfSnippet,
    TResult Function(bool b)? autoPublishDefault,
    TResult Function(bool hide)? hideIframes,
    TResult Function(String snippetName, String panelName)?
    setPanelOrPlaceholderSnippet,
    TResult Function(String snippetName)? enterSelectWidgetMode,
    TResult Function()? exitSelectWidgetMode,
    TResult Function(SnippetRootNode rootNode, SNode? selectedNode)?
    pushSnippetEditor,
    TResult Function(bool save)? popSnippetEditor,
    TResult Function()? showDirectoryTree,
    TResult Function(bool save)? removeDirectoryTree,
    TResult Function(SNode node)? selectNode,
    TResult Function()? clearNodeSelection,
    TResult Function(SNode node, String newSnippetName)? saveNodeAsSnippet,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    replaceSelectionWith,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    wrapSelectionWith,
    TResult Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    appendChild,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingBefore,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingAfter,
    TResult Function(Type? widgetSpanChildType)? pasteReplacement,
    TResult Function(Type? widgetSpanChildType, SNode? testWidgetSpanChildNode)?
    pasteChild,
    TResult Function()? pasteSiblingBefore,
    TResult Function()? pasteSiblingAfter,
    TResult Function()? deleteNodeTapped,
    TResult Function()? completeDeletion,
    TResult Function(SnippetRootNode rootNode)? copySnippetJsonToClipboard,
    TResult Function(String? snippetJson)? replaceSnippetFromJson,
    TResult Function(SNode node, String? scName, dynamic skipSave)? copyNode,
    TResult Function(SNode node, String? scName, dynamic skipSave)? cutNode,
    TResult Function(String snippetName, SNode? selectedNode)?
    selectedDirectoryOrNode,
    TResult Function(Uint8List? newBytes)? imageChanged,
    TResult Function()? forceSnippetRefresh,
    required TResult orElse(),
  }) {
    if (deletePage != null) {
      return deletePage(pathName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SelectPanel value) selectPanel,
    required TResult Function(OverrideTargetGK value) overrideTargetGK,
    required TResult Function(ForceRefresh value) forceRefresh,
    required TResult Function(UpdateClipboard value) updateClipboard,
    required TResult Function(PublishSnippet value) publishSnippet,
    required TResult Function(RevertSnippet value) revertSnippet,
    required TResult Function(DeletePage value) deletePage,
    required TResult Function(ToggleAutoPublishingOfSnippet value)
    toggleAutoPublishingOfSnippet,
    required TResult Function(AutoPublishDefault value) autoPublishDefault,
    required TResult Function(HideIframes value) hideIframes,
    required TResult Function(SetPanelSnippet value)
    setPanelOrPlaceholderSnippet,
    required TResult Function(EnterSelectWidgetMode value)
    enterSelectWidgetMode,
    required TResult Function(ExitSelectWidgetMode value) exitSelectWidgetMode,
    required TResult Function(PushSnippetEditor value) pushSnippetEditor,
    required TResult Function(PopSnippetEditor value) popSnippetEditor,
    required TResult Function(ShowDirectoryTree value) showDirectoryTree,
    required TResult Function(RemoveDirectoryTree value) removeDirectoryTree,
    required TResult Function(SelectNode value) selectNode,
    required TResult Function(ClearNodeSelection value) clearNodeSelection,
    required TResult Function(SaveNodeAsSnippet value) saveNodeAsSnippet,
    required TResult Function(ReplaceSelectionWith value) replaceSelectionWith,
    required TResult Function(WrapSelectionWith value) wrapSelectionWith,
    required TResult Function(AppendChild value) appendChild,
    required TResult Function(AddSiblingBefore value) addSiblingBefore,
    required TResult Function(AddSiblingAfter value) addSiblingAfter,
    required TResult Function(PasteReplacement value) pasteReplacement,
    required TResult Function(PasteChild value) pasteChild,
    required TResult Function(PasteSiblingBefore value) pasteSiblingBefore,
    required TResult Function(PasteSiblingAfter value) pasteSiblingAfter,
    required TResult Function(DeleteNodeTapped value) deleteNodeTapped,
    required TResult Function(CompleteDeletion value) completeDeletion,
    required TResult Function(CopySnippetJsonToClipboard value)
    copySnippetJsonToClipboard,
    required TResult Function(ReplaceSnippetFromJson value)
    replaceSnippetFromJson,
    required TResult Function(CopyNode value) copyNode,
    required TResult Function(CutNode value) cutNode,
    required TResult Function(SelectedDirectoryOrNode value)
    selectedDirectoryOrNode,
    required TResult Function(ImageChanged value) imageChanged,
    required TResult Function(ForceSnippetRefresh value) forceSnippetRefresh,
  }) {
    return deletePage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SelectPanel value)? selectPanel,
    TResult? Function(OverrideTargetGK value)? overrideTargetGK,
    TResult? Function(ForceRefresh value)? forceRefresh,
    TResult? Function(UpdateClipboard value)? updateClipboard,
    TResult? Function(PublishSnippet value)? publishSnippet,
    TResult? Function(RevertSnippet value)? revertSnippet,
    TResult? Function(DeletePage value)? deletePage,
    TResult? Function(ToggleAutoPublishingOfSnippet value)?
    toggleAutoPublishingOfSnippet,
    TResult? Function(AutoPublishDefault value)? autoPublishDefault,
    TResult? Function(HideIframes value)? hideIframes,
    TResult? Function(SetPanelSnippet value)? setPanelOrPlaceholderSnippet,
    TResult? Function(EnterSelectWidgetMode value)? enterSelectWidgetMode,
    TResult? Function(ExitSelectWidgetMode value)? exitSelectWidgetMode,
    TResult? Function(PushSnippetEditor value)? pushSnippetEditor,
    TResult? Function(PopSnippetEditor value)? popSnippetEditor,
    TResult? Function(ShowDirectoryTree value)? showDirectoryTree,
    TResult? Function(RemoveDirectoryTree value)? removeDirectoryTree,
    TResult? Function(SelectNode value)? selectNode,
    TResult? Function(ClearNodeSelection value)? clearNodeSelection,
    TResult? Function(SaveNodeAsSnippet value)? saveNodeAsSnippet,
    TResult? Function(ReplaceSelectionWith value)? replaceSelectionWith,
    TResult? Function(WrapSelectionWith value)? wrapSelectionWith,
    TResult? Function(AppendChild value)? appendChild,
    TResult? Function(AddSiblingBefore value)? addSiblingBefore,
    TResult? Function(AddSiblingAfter value)? addSiblingAfter,
    TResult? Function(PasteReplacement value)? pasteReplacement,
    TResult? Function(PasteChild value)? pasteChild,
    TResult? Function(PasteSiblingBefore value)? pasteSiblingBefore,
    TResult? Function(PasteSiblingAfter value)? pasteSiblingAfter,
    TResult? Function(DeleteNodeTapped value)? deleteNodeTapped,
    TResult? Function(CompleteDeletion value)? completeDeletion,
    TResult? Function(CopySnippetJsonToClipboard value)?
    copySnippetJsonToClipboard,
    TResult? Function(ReplaceSnippetFromJson value)? replaceSnippetFromJson,
    TResult? Function(CopyNode value)? copyNode,
    TResult? Function(CutNode value)? cutNode,
    TResult? Function(SelectedDirectoryOrNode value)? selectedDirectoryOrNode,
    TResult? Function(ImageChanged value)? imageChanged,
    TResult? Function(ForceSnippetRefresh value)? forceSnippetRefresh,
  }) {
    return deletePage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SelectPanel value)? selectPanel,
    TResult Function(OverrideTargetGK value)? overrideTargetGK,
    TResult Function(ForceRefresh value)? forceRefresh,
    TResult Function(UpdateClipboard value)? updateClipboard,
    TResult Function(PublishSnippet value)? publishSnippet,
    TResult Function(RevertSnippet value)? revertSnippet,
    TResult Function(DeletePage value)? deletePage,
    TResult Function(ToggleAutoPublishingOfSnippet value)?
    toggleAutoPublishingOfSnippet,
    TResult Function(AutoPublishDefault value)? autoPublishDefault,
    TResult Function(HideIframes value)? hideIframes,
    TResult Function(SetPanelSnippet value)? setPanelOrPlaceholderSnippet,
    TResult Function(EnterSelectWidgetMode value)? enterSelectWidgetMode,
    TResult Function(ExitSelectWidgetMode value)? exitSelectWidgetMode,
    TResult Function(PushSnippetEditor value)? pushSnippetEditor,
    TResult Function(PopSnippetEditor value)? popSnippetEditor,
    TResult Function(ShowDirectoryTree value)? showDirectoryTree,
    TResult Function(RemoveDirectoryTree value)? removeDirectoryTree,
    TResult Function(SelectNode value)? selectNode,
    TResult Function(ClearNodeSelection value)? clearNodeSelection,
    TResult Function(SaveNodeAsSnippet value)? saveNodeAsSnippet,
    TResult Function(ReplaceSelectionWith value)? replaceSelectionWith,
    TResult Function(WrapSelectionWith value)? wrapSelectionWith,
    TResult Function(AppendChild value)? appendChild,
    TResult Function(AddSiblingBefore value)? addSiblingBefore,
    TResult Function(AddSiblingAfter value)? addSiblingAfter,
    TResult Function(PasteReplacement value)? pasteReplacement,
    TResult Function(PasteChild value)? pasteChild,
    TResult Function(PasteSiblingBefore value)? pasteSiblingBefore,
    TResult Function(PasteSiblingAfter value)? pasteSiblingAfter,
    TResult Function(DeleteNodeTapped value)? deleteNodeTapped,
    TResult Function(CompleteDeletion value)? completeDeletion,
    TResult Function(CopySnippetJsonToClipboard value)?
    copySnippetJsonToClipboard,
    TResult Function(ReplaceSnippetFromJson value)? replaceSnippetFromJson,
    TResult Function(CopyNode value)? copyNode,
    TResult Function(CutNode value)? cutNode,
    TResult Function(SelectedDirectoryOrNode value)? selectedDirectoryOrNode,
    TResult Function(ImageChanged value)? imageChanged,
    TResult Function(ForceSnippetRefresh value)? forceSnippetRefresh,
    required TResult orElse(),
  }) {
    if (deletePage != null) {
      return deletePage(this);
    }
    return orElse();
  }
}

abstract class DeletePage implements CAPIEvent {
  const factory DeletePage({required final String pathName}) = _$DeletePageImpl;

  String get pathName;

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeletePageImplCopyWith<_$DeletePageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ToggleAutoPublishingOfSnippetImplCopyWith<$Res> {
  factory _$$ToggleAutoPublishingOfSnippetImplCopyWith(
    _$ToggleAutoPublishingOfSnippetImpl value,
    $Res Function(_$ToggleAutoPublishingOfSnippetImpl) then,
  ) = __$$ToggleAutoPublishingOfSnippetImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String snippetName});
}

/// @nodoc
class __$$ToggleAutoPublishingOfSnippetImplCopyWithImpl<$Res>
    extends _$CAPIEventCopyWithImpl<$Res, _$ToggleAutoPublishingOfSnippetImpl>
    implements _$$ToggleAutoPublishingOfSnippetImplCopyWith<$Res> {
  __$$ToggleAutoPublishingOfSnippetImplCopyWithImpl(
    _$ToggleAutoPublishingOfSnippetImpl _value,
    $Res Function(_$ToggleAutoPublishingOfSnippetImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? snippetName = null}) {
    return _then(
      _$ToggleAutoPublishingOfSnippetImpl(
        snippetName:
            null == snippetName
                ? _value.snippetName
                : snippetName // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$ToggleAutoPublishingOfSnippetImpl
    with DiagnosticableTreeMixin
    implements ToggleAutoPublishingOfSnippet {
  const _$ToggleAutoPublishingOfSnippetImpl({required this.snippetName});

  @override
  final String snippetName;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CAPIEvent.toggleAutoPublishingOfSnippet(snippetName: $snippetName)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        DiagnosticsProperty('type', 'CAPIEvent.toggleAutoPublishingOfSnippet'),
      )
      ..add(DiagnosticsProperty('snippetName', snippetName));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToggleAutoPublishingOfSnippetImpl &&
            (identical(other.snippetName, snippetName) ||
                other.snippetName == snippetName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, snippetName);

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ToggleAutoPublishingOfSnippetImplCopyWith<
    _$ToggleAutoPublishingOfSnippetImpl
  >
  get copyWith => __$$ToggleAutoPublishingOfSnippetImplCopyWithImpl<
    _$ToggleAutoPublishingOfSnippetImpl
  >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? panelName) selectPanel,
    required TResult Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )
    overrideTargetGK,
    required TResult Function(bool onlyTargetsWrappers) forceRefresh,
    required TResult Function(
      SNode? newContent,
      String? scName,
      dynamic skipSave,
    )
    updateClipboard,
    required TResult Function(String snippetName, String versionId)
    publishSnippet,
    required TResult Function(String snippetName, String versionId)
    revertSnippet,
    required TResult Function(String pathName) deletePage,
    required TResult Function(String snippetName) toggleAutoPublishingOfSnippet,
    required TResult Function(bool b) autoPublishDefault,
    required TResult Function(bool hide) hideIframes,
    required TResult Function(String snippetName, String panelName)
    setPanelOrPlaceholderSnippet,
    required TResult Function(String snippetName) enterSelectWidgetMode,
    required TResult Function() exitSelectWidgetMode,
    required TResult Function(SnippetRootNode rootNode, SNode? selectedNode)
    pushSnippetEditor,
    required TResult Function(bool save) popSnippetEditor,
    required TResult Function() showDirectoryTree,
    required TResult Function(bool save) removeDirectoryTree,
    required TResult Function(SNode node) selectNode,
    required TResult Function() clearNodeSelection,
    required TResult Function(SNode node, String newSnippetName)
    saveNodeAsSnippet,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    replaceSelectionWith,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    wrapSelectionWith,
    required TResult Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )
    appendChild,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    addSiblingBefore,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    addSiblingAfter,
    required TResult Function(Type? widgetSpanChildType) pasteReplacement,
    required TResult Function(
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )
    pasteChild,
    required TResult Function() pasteSiblingBefore,
    required TResult Function() pasteSiblingAfter,
    required TResult Function() deleteNodeTapped,
    required TResult Function() completeDeletion,
    required TResult Function(SnippetRootNode rootNode)
    copySnippetJsonToClipboard,
    required TResult Function(String? snippetJson) replaceSnippetFromJson,
    required TResult Function(SNode node, String? scName, dynamic skipSave)
    copyNode,
    required TResult Function(SNode node, String? scName, dynamic skipSave)
    cutNode,
    required TResult Function(String snippetName, SNode? selectedNode)
    selectedDirectoryOrNode,
    required TResult Function(Uint8List? newBytes) imageChanged,
    required TResult Function() forceSnippetRefresh,
  }) {
    return toggleAutoPublishingOfSnippet(snippetName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? panelName)? selectPanel,
    TResult? Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )?
    overrideTargetGK,
    TResult? Function(bool onlyTargetsWrappers)? forceRefresh,
    TResult? Function(SNode? newContent, String? scName, dynamic skipSave)?
    updateClipboard,
    TResult? Function(String snippetName, String versionId)? publishSnippet,
    TResult? Function(String snippetName, String versionId)? revertSnippet,
    TResult? Function(String pathName)? deletePage,
    TResult? Function(String snippetName)? toggleAutoPublishingOfSnippet,
    TResult? Function(bool b)? autoPublishDefault,
    TResult? Function(bool hide)? hideIframes,
    TResult? Function(String snippetName, String panelName)?
    setPanelOrPlaceholderSnippet,
    TResult? Function(String snippetName)? enterSelectWidgetMode,
    TResult? Function()? exitSelectWidgetMode,
    TResult? Function(SnippetRootNode rootNode, SNode? selectedNode)?
    pushSnippetEditor,
    TResult? Function(bool save)? popSnippetEditor,
    TResult? Function()? showDirectoryTree,
    TResult? Function(bool save)? removeDirectoryTree,
    TResult? Function(SNode node)? selectNode,
    TResult? Function()? clearNodeSelection,
    TResult? Function(SNode node, String newSnippetName)? saveNodeAsSnippet,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    replaceSelectionWith,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    wrapSelectionWith,
    TResult? Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    appendChild,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingBefore,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingAfter,
    TResult? Function(Type? widgetSpanChildType)? pasteReplacement,
    TResult? Function(
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    pasteChild,
    TResult? Function()? pasteSiblingBefore,
    TResult? Function()? pasteSiblingAfter,
    TResult? Function()? deleteNodeTapped,
    TResult? Function()? completeDeletion,
    TResult? Function(SnippetRootNode rootNode)? copySnippetJsonToClipboard,
    TResult? Function(String? snippetJson)? replaceSnippetFromJson,
    TResult? Function(SNode node, String? scName, dynamic skipSave)? copyNode,
    TResult? Function(SNode node, String? scName, dynamic skipSave)? cutNode,
    TResult? Function(String snippetName, SNode? selectedNode)?
    selectedDirectoryOrNode,
    TResult? Function(Uint8List? newBytes)? imageChanged,
    TResult? Function()? forceSnippetRefresh,
  }) {
    return toggleAutoPublishingOfSnippet?.call(snippetName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? panelName)? selectPanel,
    TResult Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )?
    overrideTargetGK,
    TResult Function(bool onlyTargetsWrappers)? forceRefresh,
    TResult Function(SNode? newContent, String? scName, dynamic skipSave)?
    updateClipboard,
    TResult Function(String snippetName, String versionId)? publishSnippet,
    TResult Function(String snippetName, String versionId)? revertSnippet,
    TResult Function(String pathName)? deletePage,
    TResult Function(String snippetName)? toggleAutoPublishingOfSnippet,
    TResult Function(bool b)? autoPublishDefault,
    TResult Function(bool hide)? hideIframes,
    TResult Function(String snippetName, String panelName)?
    setPanelOrPlaceholderSnippet,
    TResult Function(String snippetName)? enterSelectWidgetMode,
    TResult Function()? exitSelectWidgetMode,
    TResult Function(SnippetRootNode rootNode, SNode? selectedNode)?
    pushSnippetEditor,
    TResult Function(bool save)? popSnippetEditor,
    TResult Function()? showDirectoryTree,
    TResult Function(bool save)? removeDirectoryTree,
    TResult Function(SNode node)? selectNode,
    TResult Function()? clearNodeSelection,
    TResult Function(SNode node, String newSnippetName)? saveNodeAsSnippet,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    replaceSelectionWith,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    wrapSelectionWith,
    TResult Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    appendChild,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingBefore,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingAfter,
    TResult Function(Type? widgetSpanChildType)? pasteReplacement,
    TResult Function(Type? widgetSpanChildType, SNode? testWidgetSpanChildNode)?
    pasteChild,
    TResult Function()? pasteSiblingBefore,
    TResult Function()? pasteSiblingAfter,
    TResult Function()? deleteNodeTapped,
    TResult Function()? completeDeletion,
    TResult Function(SnippetRootNode rootNode)? copySnippetJsonToClipboard,
    TResult Function(String? snippetJson)? replaceSnippetFromJson,
    TResult Function(SNode node, String? scName, dynamic skipSave)? copyNode,
    TResult Function(SNode node, String? scName, dynamic skipSave)? cutNode,
    TResult Function(String snippetName, SNode? selectedNode)?
    selectedDirectoryOrNode,
    TResult Function(Uint8List? newBytes)? imageChanged,
    TResult Function()? forceSnippetRefresh,
    required TResult orElse(),
  }) {
    if (toggleAutoPublishingOfSnippet != null) {
      return toggleAutoPublishingOfSnippet(snippetName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SelectPanel value) selectPanel,
    required TResult Function(OverrideTargetGK value) overrideTargetGK,
    required TResult Function(ForceRefresh value) forceRefresh,
    required TResult Function(UpdateClipboard value) updateClipboard,
    required TResult Function(PublishSnippet value) publishSnippet,
    required TResult Function(RevertSnippet value) revertSnippet,
    required TResult Function(DeletePage value) deletePage,
    required TResult Function(ToggleAutoPublishingOfSnippet value)
    toggleAutoPublishingOfSnippet,
    required TResult Function(AutoPublishDefault value) autoPublishDefault,
    required TResult Function(HideIframes value) hideIframes,
    required TResult Function(SetPanelSnippet value)
    setPanelOrPlaceholderSnippet,
    required TResult Function(EnterSelectWidgetMode value)
    enterSelectWidgetMode,
    required TResult Function(ExitSelectWidgetMode value) exitSelectWidgetMode,
    required TResult Function(PushSnippetEditor value) pushSnippetEditor,
    required TResult Function(PopSnippetEditor value) popSnippetEditor,
    required TResult Function(ShowDirectoryTree value) showDirectoryTree,
    required TResult Function(RemoveDirectoryTree value) removeDirectoryTree,
    required TResult Function(SelectNode value) selectNode,
    required TResult Function(ClearNodeSelection value) clearNodeSelection,
    required TResult Function(SaveNodeAsSnippet value) saveNodeAsSnippet,
    required TResult Function(ReplaceSelectionWith value) replaceSelectionWith,
    required TResult Function(WrapSelectionWith value) wrapSelectionWith,
    required TResult Function(AppendChild value) appendChild,
    required TResult Function(AddSiblingBefore value) addSiblingBefore,
    required TResult Function(AddSiblingAfter value) addSiblingAfter,
    required TResult Function(PasteReplacement value) pasteReplacement,
    required TResult Function(PasteChild value) pasteChild,
    required TResult Function(PasteSiblingBefore value) pasteSiblingBefore,
    required TResult Function(PasteSiblingAfter value) pasteSiblingAfter,
    required TResult Function(DeleteNodeTapped value) deleteNodeTapped,
    required TResult Function(CompleteDeletion value) completeDeletion,
    required TResult Function(CopySnippetJsonToClipboard value)
    copySnippetJsonToClipboard,
    required TResult Function(ReplaceSnippetFromJson value)
    replaceSnippetFromJson,
    required TResult Function(CopyNode value) copyNode,
    required TResult Function(CutNode value) cutNode,
    required TResult Function(SelectedDirectoryOrNode value)
    selectedDirectoryOrNode,
    required TResult Function(ImageChanged value) imageChanged,
    required TResult Function(ForceSnippetRefresh value) forceSnippetRefresh,
  }) {
    return toggleAutoPublishingOfSnippet(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SelectPanel value)? selectPanel,
    TResult? Function(OverrideTargetGK value)? overrideTargetGK,
    TResult? Function(ForceRefresh value)? forceRefresh,
    TResult? Function(UpdateClipboard value)? updateClipboard,
    TResult? Function(PublishSnippet value)? publishSnippet,
    TResult? Function(RevertSnippet value)? revertSnippet,
    TResult? Function(DeletePage value)? deletePage,
    TResult? Function(ToggleAutoPublishingOfSnippet value)?
    toggleAutoPublishingOfSnippet,
    TResult? Function(AutoPublishDefault value)? autoPublishDefault,
    TResult? Function(HideIframes value)? hideIframes,
    TResult? Function(SetPanelSnippet value)? setPanelOrPlaceholderSnippet,
    TResult? Function(EnterSelectWidgetMode value)? enterSelectWidgetMode,
    TResult? Function(ExitSelectWidgetMode value)? exitSelectWidgetMode,
    TResult? Function(PushSnippetEditor value)? pushSnippetEditor,
    TResult? Function(PopSnippetEditor value)? popSnippetEditor,
    TResult? Function(ShowDirectoryTree value)? showDirectoryTree,
    TResult? Function(RemoveDirectoryTree value)? removeDirectoryTree,
    TResult? Function(SelectNode value)? selectNode,
    TResult? Function(ClearNodeSelection value)? clearNodeSelection,
    TResult? Function(SaveNodeAsSnippet value)? saveNodeAsSnippet,
    TResult? Function(ReplaceSelectionWith value)? replaceSelectionWith,
    TResult? Function(WrapSelectionWith value)? wrapSelectionWith,
    TResult? Function(AppendChild value)? appendChild,
    TResult? Function(AddSiblingBefore value)? addSiblingBefore,
    TResult? Function(AddSiblingAfter value)? addSiblingAfter,
    TResult? Function(PasteReplacement value)? pasteReplacement,
    TResult? Function(PasteChild value)? pasteChild,
    TResult? Function(PasteSiblingBefore value)? pasteSiblingBefore,
    TResult? Function(PasteSiblingAfter value)? pasteSiblingAfter,
    TResult? Function(DeleteNodeTapped value)? deleteNodeTapped,
    TResult? Function(CompleteDeletion value)? completeDeletion,
    TResult? Function(CopySnippetJsonToClipboard value)?
    copySnippetJsonToClipboard,
    TResult? Function(ReplaceSnippetFromJson value)? replaceSnippetFromJson,
    TResult? Function(CopyNode value)? copyNode,
    TResult? Function(CutNode value)? cutNode,
    TResult? Function(SelectedDirectoryOrNode value)? selectedDirectoryOrNode,
    TResult? Function(ImageChanged value)? imageChanged,
    TResult? Function(ForceSnippetRefresh value)? forceSnippetRefresh,
  }) {
    return toggleAutoPublishingOfSnippet?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SelectPanel value)? selectPanel,
    TResult Function(OverrideTargetGK value)? overrideTargetGK,
    TResult Function(ForceRefresh value)? forceRefresh,
    TResult Function(UpdateClipboard value)? updateClipboard,
    TResult Function(PublishSnippet value)? publishSnippet,
    TResult Function(RevertSnippet value)? revertSnippet,
    TResult Function(DeletePage value)? deletePage,
    TResult Function(ToggleAutoPublishingOfSnippet value)?
    toggleAutoPublishingOfSnippet,
    TResult Function(AutoPublishDefault value)? autoPublishDefault,
    TResult Function(HideIframes value)? hideIframes,
    TResult Function(SetPanelSnippet value)? setPanelOrPlaceholderSnippet,
    TResult Function(EnterSelectWidgetMode value)? enterSelectWidgetMode,
    TResult Function(ExitSelectWidgetMode value)? exitSelectWidgetMode,
    TResult Function(PushSnippetEditor value)? pushSnippetEditor,
    TResult Function(PopSnippetEditor value)? popSnippetEditor,
    TResult Function(ShowDirectoryTree value)? showDirectoryTree,
    TResult Function(RemoveDirectoryTree value)? removeDirectoryTree,
    TResult Function(SelectNode value)? selectNode,
    TResult Function(ClearNodeSelection value)? clearNodeSelection,
    TResult Function(SaveNodeAsSnippet value)? saveNodeAsSnippet,
    TResult Function(ReplaceSelectionWith value)? replaceSelectionWith,
    TResult Function(WrapSelectionWith value)? wrapSelectionWith,
    TResult Function(AppendChild value)? appendChild,
    TResult Function(AddSiblingBefore value)? addSiblingBefore,
    TResult Function(AddSiblingAfter value)? addSiblingAfter,
    TResult Function(PasteReplacement value)? pasteReplacement,
    TResult Function(PasteChild value)? pasteChild,
    TResult Function(PasteSiblingBefore value)? pasteSiblingBefore,
    TResult Function(PasteSiblingAfter value)? pasteSiblingAfter,
    TResult Function(DeleteNodeTapped value)? deleteNodeTapped,
    TResult Function(CompleteDeletion value)? completeDeletion,
    TResult Function(CopySnippetJsonToClipboard value)?
    copySnippetJsonToClipboard,
    TResult Function(ReplaceSnippetFromJson value)? replaceSnippetFromJson,
    TResult Function(CopyNode value)? copyNode,
    TResult Function(CutNode value)? cutNode,
    TResult Function(SelectedDirectoryOrNode value)? selectedDirectoryOrNode,
    TResult Function(ImageChanged value)? imageChanged,
    TResult Function(ForceSnippetRefresh value)? forceSnippetRefresh,
    required TResult orElse(),
  }) {
    if (toggleAutoPublishingOfSnippet != null) {
      return toggleAutoPublishingOfSnippet(this);
    }
    return orElse();
  }
}

abstract class ToggleAutoPublishingOfSnippet implements CAPIEvent {
  const factory ToggleAutoPublishingOfSnippet({
    required final String snippetName,
  }) = _$ToggleAutoPublishingOfSnippetImpl;

  String get snippetName;

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ToggleAutoPublishingOfSnippetImplCopyWith<
    _$ToggleAutoPublishingOfSnippetImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AutoPublishDefaultImplCopyWith<$Res> {
  factory _$$AutoPublishDefaultImplCopyWith(
    _$AutoPublishDefaultImpl value,
    $Res Function(_$AutoPublishDefaultImpl) then,
  ) = __$$AutoPublishDefaultImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool b});
}

/// @nodoc
class __$$AutoPublishDefaultImplCopyWithImpl<$Res>
    extends _$CAPIEventCopyWithImpl<$Res, _$AutoPublishDefaultImpl>
    implements _$$AutoPublishDefaultImplCopyWith<$Res> {
  __$$AutoPublishDefaultImplCopyWithImpl(
    _$AutoPublishDefaultImpl _value,
    $Res Function(_$AutoPublishDefaultImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? b = null}) {
    return _then(
      _$AutoPublishDefaultImpl(
        b:
            null == b
                ? _value.b
                : b // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc

class _$AutoPublishDefaultImpl
    with DiagnosticableTreeMixin
    implements AutoPublishDefault {
  const _$AutoPublishDefaultImpl({required this.b});

  @override
  final bool b;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CAPIEvent.autoPublishDefault(b: $b)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CAPIEvent.autoPublishDefault'))
      ..add(DiagnosticsProperty('b', b));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AutoPublishDefaultImpl &&
            (identical(other.b, b) || other.b == b));
  }

  @override
  int get hashCode => Object.hash(runtimeType, b);

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AutoPublishDefaultImplCopyWith<_$AutoPublishDefaultImpl> get copyWith =>
      __$$AutoPublishDefaultImplCopyWithImpl<_$AutoPublishDefaultImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? panelName) selectPanel,
    required TResult Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )
    overrideTargetGK,
    required TResult Function(bool onlyTargetsWrappers) forceRefresh,
    required TResult Function(
      SNode? newContent,
      String? scName,
      dynamic skipSave,
    )
    updateClipboard,
    required TResult Function(String snippetName, String versionId)
    publishSnippet,
    required TResult Function(String snippetName, String versionId)
    revertSnippet,
    required TResult Function(String pathName) deletePage,
    required TResult Function(String snippetName) toggleAutoPublishingOfSnippet,
    required TResult Function(bool b) autoPublishDefault,
    required TResult Function(bool hide) hideIframes,
    required TResult Function(String snippetName, String panelName)
    setPanelOrPlaceholderSnippet,
    required TResult Function(String snippetName) enterSelectWidgetMode,
    required TResult Function() exitSelectWidgetMode,
    required TResult Function(SnippetRootNode rootNode, SNode? selectedNode)
    pushSnippetEditor,
    required TResult Function(bool save) popSnippetEditor,
    required TResult Function() showDirectoryTree,
    required TResult Function(bool save) removeDirectoryTree,
    required TResult Function(SNode node) selectNode,
    required TResult Function() clearNodeSelection,
    required TResult Function(SNode node, String newSnippetName)
    saveNodeAsSnippet,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    replaceSelectionWith,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    wrapSelectionWith,
    required TResult Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )
    appendChild,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    addSiblingBefore,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    addSiblingAfter,
    required TResult Function(Type? widgetSpanChildType) pasteReplacement,
    required TResult Function(
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )
    pasteChild,
    required TResult Function() pasteSiblingBefore,
    required TResult Function() pasteSiblingAfter,
    required TResult Function() deleteNodeTapped,
    required TResult Function() completeDeletion,
    required TResult Function(SnippetRootNode rootNode)
    copySnippetJsonToClipboard,
    required TResult Function(String? snippetJson) replaceSnippetFromJson,
    required TResult Function(SNode node, String? scName, dynamic skipSave)
    copyNode,
    required TResult Function(SNode node, String? scName, dynamic skipSave)
    cutNode,
    required TResult Function(String snippetName, SNode? selectedNode)
    selectedDirectoryOrNode,
    required TResult Function(Uint8List? newBytes) imageChanged,
    required TResult Function() forceSnippetRefresh,
  }) {
    return autoPublishDefault(b);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? panelName)? selectPanel,
    TResult? Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )?
    overrideTargetGK,
    TResult? Function(bool onlyTargetsWrappers)? forceRefresh,
    TResult? Function(SNode? newContent, String? scName, dynamic skipSave)?
    updateClipboard,
    TResult? Function(String snippetName, String versionId)? publishSnippet,
    TResult? Function(String snippetName, String versionId)? revertSnippet,
    TResult? Function(String pathName)? deletePage,
    TResult? Function(String snippetName)? toggleAutoPublishingOfSnippet,
    TResult? Function(bool b)? autoPublishDefault,
    TResult? Function(bool hide)? hideIframes,
    TResult? Function(String snippetName, String panelName)?
    setPanelOrPlaceholderSnippet,
    TResult? Function(String snippetName)? enterSelectWidgetMode,
    TResult? Function()? exitSelectWidgetMode,
    TResult? Function(SnippetRootNode rootNode, SNode? selectedNode)?
    pushSnippetEditor,
    TResult? Function(bool save)? popSnippetEditor,
    TResult? Function()? showDirectoryTree,
    TResult? Function(bool save)? removeDirectoryTree,
    TResult? Function(SNode node)? selectNode,
    TResult? Function()? clearNodeSelection,
    TResult? Function(SNode node, String newSnippetName)? saveNodeAsSnippet,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    replaceSelectionWith,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    wrapSelectionWith,
    TResult? Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    appendChild,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingBefore,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingAfter,
    TResult? Function(Type? widgetSpanChildType)? pasteReplacement,
    TResult? Function(
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    pasteChild,
    TResult? Function()? pasteSiblingBefore,
    TResult? Function()? pasteSiblingAfter,
    TResult? Function()? deleteNodeTapped,
    TResult? Function()? completeDeletion,
    TResult? Function(SnippetRootNode rootNode)? copySnippetJsonToClipboard,
    TResult? Function(String? snippetJson)? replaceSnippetFromJson,
    TResult? Function(SNode node, String? scName, dynamic skipSave)? copyNode,
    TResult? Function(SNode node, String? scName, dynamic skipSave)? cutNode,
    TResult? Function(String snippetName, SNode? selectedNode)?
    selectedDirectoryOrNode,
    TResult? Function(Uint8List? newBytes)? imageChanged,
    TResult? Function()? forceSnippetRefresh,
  }) {
    return autoPublishDefault?.call(b);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? panelName)? selectPanel,
    TResult Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )?
    overrideTargetGK,
    TResult Function(bool onlyTargetsWrappers)? forceRefresh,
    TResult Function(SNode? newContent, String? scName, dynamic skipSave)?
    updateClipboard,
    TResult Function(String snippetName, String versionId)? publishSnippet,
    TResult Function(String snippetName, String versionId)? revertSnippet,
    TResult Function(String pathName)? deletePage,
    TResult Function(String snippetName)? toggleAutoPublishingOfSnippet,
    TResult Function(bool b)? autoPublishDefault,
    TResult Function(bool hide)? hideIframes,
    TResult Function(String snippetName, String panelName)?
    setPanelOrPlaceholderSnippet,
    TResult Function(String snippetName)? enterSelectWidgetMode,
    TResult Function()? exitSelectWidgetMode,
    TResult Function(SnippetRootNode rootNode, SNode? selectedNode)?
    pushSnippetEditor,
    TResult Function(bool save)? popSnippetEditor,
    TResult Function()? showDirectoryTree,
    TResult Function(bool save)? removeDirectoryTree,
    TResult Function(SNode node)? selectNode,
    TResult Function()? clearNodeSelection,
    TResult Function(SNode node, String newSnippetName)? saveNodeAsSnippet,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    replaceSelectionWith,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    wrapSelectionWith,
    TResult Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    appendChild,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingBefore,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingAfter,
    TResult Function(Type? widgetSpanChildType)? pasteReplacement,
    TResult Function(Type? widgetSpanChildType, SNode? testWidgetSpanChildNode)?
    pasteChild,
    TResult Function()? pasteSiblingBefore,
    TResult Function()? pasteSiblingAfter,
    TResult Function()? deleteNodeTapped,
    TResult Function()? completeDeletion,
    TResult Function(SnippetRootNode rootNode)? copySnippetJsonToClipboard,
    TResult Function(String? snippetJson)? replaceSnippetFromJson,
    TResult Function(SNode node, String? scName, dynamic skipSave)? copyNode,
    TResult Function(SNode node, String? scName, dynamic skipSave)? cutNode,
    TResult Function(String snippetName, SNode? selectedNode)?
    selectedDirectoryOrNode,
    TResult Function(Uint8List? newBytes)? imageChanged,
    TResult Function()? forceSnippetRefresh,
    required TResult orElse(),
  }) {
    if (autoPublishDefault != null) {
      return autoPublishDefault(b);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SelectPanel value) selectPanel,
    required TResult Function(OverrideTargetGK value) overrideTargetGK,
    required TResult Function(ForceRefresh value) forceRefresh,
    required TResult Function(UpdateClipboard value) updateClipboard,
    required TResult Function(PublishSnippet value) publishSnippet,
    required TResult Function(RevertSnippet value) revertSnippet,
    required TResult Function(DeletePage value) deletePage,
    required TResult Function(ToggleAutoPublishingOfSnippet value)
    toggleAutoPublishingOfSnippet,
    required TResult Function(AutoPublishDefault value) autoPublishDefault,
    required TResult Function(HideIframes value) hideIframes,
    required TResult Function(SetPanelSnippet value)
    setPanelOrPlaceholderSnippet,
    required TResult Function(EnterSelectWidgetMode value)
    enterSelectWidgetMode,
    required TResult Function(ExitSelectWidgetMode value) exitSelectWidgetMode,
    required TResult Function(PushSnippetEditor value) pushSnippetEditor,
    required TResult Function(PopSnippetEditor value) popSnippetEditor,
    required TResult Function(ShowDirectoryTree value) showDirectoryTree,
    required TResult Function(RemoveDirectoryTree value) removeDirectoryTree,
    required TResult Function(SelectNode value) selectNode,
    required TResult Function(ClearNodeSelection value) clearNodeSelection,
    required TResult Function(SaveNodeAsSnippet value) saveNodeAsSnippet,
    required TResult Function(ReplaceSelectionWith value) replaceSelectionWith,
    required TResult Function(WrapSelectionWith value) wrapSelectionWith,
    required TResult Function(AppendChild value) appendChild,
    required TResult Function(AddSiblingBefore value) addSiblingBefore,
    required TResult Function(AddSiblingAfter value) addSiblingAfter,
    required TResult Function(PasteReplacement value) pasteReplacement,
    required TResult Function(PasteChild value) pasteChild,
    required TResult Function(PasteSiblingBefore value) pasteSiblingBefore,
    required TResult Function(PasteSiblingAfter value) pasteSiblingAfter,
    required TResult Function(DeleteNodeTapped value) deleteNodeTapped,
    required TResult Function(CompleteDeletion value) completeDeletion,
    required TResult Function(CopySnippetJsonToClipboard value)
    copySnippetJsonToClipboard,
    required TResult Function(ReplaceSnippetFromJson value)
    replaceSnippetFromJson,
    required TResult Function(CopyNode value) copyNode,
    required TResult Function(CutNode value) cutNode,
    required TResult Function(SelectedDirectoryOrNode value)
    selectedDirectoryOrNode,
    required TResult Function(ImageChanged value) imageChanged,
    required TResult Function(ForceSnippetRefresh value) forceSnippetRefresh,
  }) {
    return autoPublishDefault(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SelectPanel value)? selectPanel,
    TResult? Function(OverrideTargetGK value)? overrideTargetGK,
    TResult? Function(ForceRefresh value)? forceRefresh,
    TResult? Function(UpdateClipboard value)? updateClipboard,
    TResult? Function(PublishSnippet value)? publishSnippet,
    TResult? Function(RevertSnippet value)? revertSnippet,
    TResult? Function(DeletePage value)? deletePage,
    TResult? Function(ToggleAutoPublishingOfSnippet value)?
    toggleAutoPublishingOfSnippet,
    TResult? Function(AutoPublishDefault value)? autoPublishDefault,
    TResult? Function(HideIframes value)? hideIframes,
    TResult? Function(SetPanelSnippet value)? setPanelOrPlaceholderSnippet,
    TResult? Function(EnterSelectWidgetMode value)? enterSelectWidgetMode,
    TResult? Function(ExitSelectWidgetMode value)? exitSelectWidgetMode,
    TResult? Function(PushSnippetEditor value)? pushSnippetEditor,
    TResult? Function(PopSnippetEditor value)? popSnippetEditor,
    TResult? Function(ShowDirectoryTree value)? showDirectoryTree,
    TResult? Function(RemoveDirectoryTree value)? removeDirectoryTree,
    TResult? Function(SelectNode value)? selectNode,
    TResult? Function(ClearNodeSelection value)? clearNodeSelection,
    TResult? Function(SaveNodeAsSnippet value)? saveNodeAsSnippet,
    TResult? Function(ReplaceSelectionWith value)? replaceSelectionWith,
    TResult? Function(WrapSelectionWith value)? wrapSelectionWith,
    TResult? Function(AppendChild value)? appendChild,
    TResult? Function(AddSiblingBefore value)? addSiblingBefore,
    TResult? Function(AddSiblingAfter value)? addSiblingAfter,
    TResult? Function(PasteReplacement value)? pasteReplacement,
    TResult? Function(PasteChild value)? pasteChild,
    TResult? Function(PasteSiblingBefore value)? pasteSiblingBefore,
    TResult? Function(PasteSiblingAfter value)? pasteSiblingAfter,
    TResult? Function(DeleteNodeTapped value)? deleteNodeTapped,
    TResult? Function(CompleteDeletion value)? completeDeletion,
    TResult? Function(CopySnippetJsonToClipboard value)?
    copySnippetJsonToClipboard,
    TResult? Function(ReplaceSnippetFromJson value)? replaceSnippetFromJson,
    TResult? Function(CopyNode value)? copyNode,
    TResult? Function(CutNode value)? cutNode,
    TResult? Function(SelectedDirectoryOrNode value)? selectedDirectoryOrNode,
    TResult? Function(ImageChanged value)? imageChanged,
    TResult? Function(ForceSnippetRefresh value)? forceSnippetRefresh,
  }) {
    return autoPublishDefault?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SelectPanel value)? selectPanel,
    TResult Function(OverrideTargetGK value)? overrideTargetGK,
    TResult Function(ForceRefresh value)? forceRefresh,
    TResult Function(UpdateClipboard value)? updateClipboard,
    TResult Function(PublishSnippet value)? publishSnippet,
    TResult Function(RevertSnippet value)? revertSnippet,
    TResult Function(DeletePage value)? deletePage,
    TResult Function(ToggleAutoPublishingOfSnippet value)?
    toggleAutoPublishingOfSnippet,
    TResult Function(AutoPublishDefault value)? autoPublishDefault,
    TResult Function(HideIframes value)? hideIframes,
    TResult Function(SetPanelSnippet value)? setPanelOrPlaceholderSnippet,
    TResult Function(EnterSelectWidgetMode value)? enterSelectWidgetMode,
    TResult Function(ExitSelectWidgetMode value)? exitSelectWidgetMode,
    TResult Function(PushSnippetEditor value)? pushSnippetEditor,
    TResult Function(PopSnippetEditor value)? popSnippetEditor,
    TResult Function(ShowDirectoryTree value)? showDirectoryTree,
    TResult Function(RemoveDirectoryTree value)? removeDirectoryTree,
    TResult Function(SelectNode value)? selectNode,
    TResult Function(ClearNodeSelection value)? clearNodeSelection,
    TResult Function(SaveNodeAsSnippet value)? saveNodeAsSnippet,
    TResult Function(ReplaceSelectionWith value)? replaceSelectionWith,
    TResult Function(WrapSelectionWith value)? wrapSelectionWith,
    TResult Function(AppendChild value)? appendChild,
    TResult Function(AddSiblingBefore value)? addSiblingBefore,
    TResult Function(AddSiblingAfter value)? addSiblingAfter,
    TResult Function(PasteReplacement value)? pasteReplacement,
    TResult Function(PasteChild value)? pasteChild,
    TResult Function(PasteSiblingBefore value)? pasteSiblingBefore,
    TResult Function(PasteSiblingAfter value)? pasteSiblingAfter,
    TResult Function(DeleteNodeTapped value)? deleteNodeTapped,
    TResult Function(CompleteDeletion value)? completeDeletion,
    TResult Function(CopySnippetJsonToClipboard value)?
    copySnippetJsonToClipboard,
    TResult Function(ReplaceSnippetFromJson value)? replaceSnippetFromJson,
    TResult Function(CopyNode value)? copyNode,
    TResult Function(CutNode value)? cutNode,
    TResult Function(SelectedDirectoryOrNode value)? selectedDirectoryOrNode,
    TResult Function(ImageChanged value)? imageChanged,
    TResult Function(ForceSnippetRefresh value)? forceSnippetRefresh,
    required TResult orElse(),
  }) {
    if (autoPublishDefault != null) {
      return autoPublishDefault(this);
    }
    return orElse();
  }
}

abstract class AutoPublishDefault implements CAPIEvent {
  const factory AutoPublishDefault({required final bool b}) =
      _$AutoPublishDefaultImpl;

  bool get b;

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AutoPublishDefaultImplCopyWith<_$AutoPublishDefaultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HideIframesImplCopyWith<$Res> {
  factory _$$HideIframesImplCopyWith(
    _$HideIframesImpl value,
    $Res Function(_$HideIframesImpl) then,
  ) = __$$HideIframesImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool hide});
}

/// @nodoc
class __$$HideIframesImplCopyWithImpl<$Res>
    extends _$CAPIEventCopyWithImpl<$Res, _$HideIframesImpl>
    implements _$$HideIframesImplCopyWith<$Res> {
  __$$HideIframesImplCopyWithImpl(
    _$HideIframesImpl _value,
    $Res Function(_$HideIframesImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? hide = null}) {
    return _then(
      _$HideIframesImpl(
        hide:
            null == hide
                ? _value.hide
                : hide // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc

class _$HideIframesImpl with DiagnosticableTreeMixin implements HideIframes {
  const _$HideIframesImpl({required this.hide});

  @override
  final bool hide;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CAPIEvent.hideIframes(hide: $hide)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CAPIEvent.hideIframes'))
      ..add(DiagnosticsProperty('hide', hide));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HideIframesImpl &&
            (identical(other.hide, hide) || other.hide == hide));
  }

  @override
  int get hashCode => Object.hash(runtimeType, hide);

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HideIframesImplCopyWith<_$HideIframesImpl> get copyWith =>
      __$$HideIframesImplCopyWithImpl<_$HideIframesImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? panelName) selectPanel,
    required TResult Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )
    overrideTargetGK,
    required TResult Function(bool onlyTargetsWrappers) forceRefresh,
    required TResult Function(
      SNode? newContent,
      String? scName,
      dynamic skipSave,
    )
    updateClipboard,
    required TResult Function(String snippetName, String versionId)
    publishSnippet,
    required TResult Function(String snippetName, String versionId)
    revertSnippet,
    required TResult Function(String pathName) deletePage,
    required TResult Function(String snippetName) toggleAutoPublishingOfSnippet,
    required TResult Function(bool b) autoPublishDefault,
    required TResult Function(bool hide) hideIframes,
    required TResult Function(String snippetName, String panelName)
    setPanelOrPlaceholderSnippet,
    required TResult Function(String snippetName) enterSelectWidgetMode,
    required TResult Function() exitSelectWidgetMode,
    required TResult Function(SnippetRootNode rootNode, SNode? selectedNode)
    pushSnippetEditor,
    required TResult Function(bool save) popSnippetEditor,
    required TResult Function() showDirectoryTree,
    required TResult Function(bool save) removeDirectoryTree,
    required TResult Function(SNode node) selectNode,
    required TResult Function() clearNodeSelection,
    required TResult Function(SNode node, String newSnippetName)
    saveNodeAsSnippet,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    replaceSelectionWith,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    wrapSelectionWith,
    required TResult Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )
    appendChild,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    addSiblingBefore,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    addSiblingAfter,
    required TResult Function(Type? widgetSpanChildType) pasteReplacement,
    required TResult Function(
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )
    pasteChild,
    required TResult Function() pasteSiblingBefore,
    required TResult Function() pasteSiblingAfter,
    required TResult Function() deleteNodeTapped,
    required TResult Function() completeDeletion,
    required TResult Function(SnippetRootNode rootNode)
    copySnippetJsonToClipboard,
    required TResult Function(String? snippetJson) replaceSnippetFromJson,
    required TResult Function(SNode node, String? scName, dynamic skipSave)
    copyNode,
    required TResult Function(SNode node, String? scName, dynamic skipSave)
    cutNode,
    required TResult Function(String snippetName, SNode? selectedNode)
    selectedDirectoryOrNode,
    required TResult Function(Uint8List? newBytes) imageChanged,
    required TResult Function() forceSnippetRefresh,
  }) {
    return hideIframes(hide);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? panelName)? selectPanel,
    TResult? Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )?
    overrideTargetGK,
    TResult? Function(bool onlyTargetsWrappers)? forceRefresh,
    TResult? Function(SNode? newContent, String? scName, dynamic skipSave)?
    updateClipboard,
    TResult? Function(String snippetName, String versionId)? publishSnippet,
    TResult? Function(String snippetName, String versionId)? revertSnippet,
    TResult? Function(String pathName)? deletePage,
    TResult? Function(String snippetName)? toggleAutoPublishingOfSnippet,
    TResult? Function(bool b)? autoPublishDefault,
    TResult? Function(bool hide)? hideIframes,
    TResult? Function(String snippetName, String panelName)?
    setPanelOrPlaceholderSnippet,
    TResult? Function(String snippetName)? enterSelectWidgetMode,
    TResult? Function()? exitSelectWidgetMode,
    TResult? Function(SnippetRootNode rootNode, SNode? selectedNode)?
    pushSnippetEditor,
    TResult? Function(bool save)? popSnippetEditor,
    TResult? Function()? showDirectoryTree,
    TResult? Function(bool save)? removeDirectoryTree,
    TResult? Function(SNode node)? selectNode,
    TResult? Function()? clearNodeSelection,
    TResult? Function(SNode node, String newSnippetName)? saveNodeAsSnippet,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    replaceSelectionWith,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    wrapSelectionWith,
    TResult? Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    appendChild,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingBefore,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingAfter,
    TResult? Function(Type? widgetSpanChildType)? pasteReplacement,
    TResult? Function(
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    pasteChild,
    TResult? Function()? pasteSiblingBefore,
    TResult? Function()? pasteSiblingAfter,
    TResult? Function()? deleteNodeTapped,
    TResult? Function()? completeDeletion,
    TResult? Function(SnippetRootNode rootNode)? copySnippetJsonToClipboard,
    TResult? Function(String? snippetJson)? replaceSnippetFromJson,
    TResult? Function(SNode node, String? scName, dynamic skipSave)? copyNode,
    TResult? Function(SNode node, String? scName, dynamic skipSave)? cutNode,
    TResult? Function(String snippetName, SNode? selectedNode)?
    selectedDirectoryOrNode,
    TResult? Function(Uint8List? newBytes)? imageChanged,
    TResult? Function()? forceSnippetRefresh,
  }) {
    return hideIframes?.call(hide);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? panelName)? selectPanel,
    TResult Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )?
    overrideTargetGK,
    TResult Function(bool onlyTargetsWrappers)? forceRefresh,
    TResult Function(SNode? newContent, String? scName, dynamic skipSave)?
    updateClipboard,
    TResult Function(String snippetName, String versionId)? publishSnippet,
    TResult Function(String snippetName, String versionId)? revertSnippet,
    TResult Function(String pathName)? deletePage,
    TResult Function(String snippetName)? toggleAutoPublishingOfSnippet,
    TResult Function(bool b)? autoPublishDefault,
    TResult Function(bool hide)? hideIframes,
    TResult Function(String snippetName, String panelName)?
    setPanelOrPlaceholderSnippet,
    TResult Function(String snippetName)? enterSelectWidgetMode,
    TResult Function()? exitSelectWidgetMode,
    TResult Function(SnippetRootNode rootNode, SNode? selectedNode)?
    pushSnippetEditor,
    TResult Function(bool save)? popSnippetEditor,
    TResult Function()? showDirectoryTree,
    TResult Function(bool save)? removeDirectoryTree,
    TResult Function(SNode node)? selectNode,
    TResult Function()? clearNodeSelection,
    TResult Function(SNode node, String newSnippetName)? saveNodeAsSnippet,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    replaceSelectionWith,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    wrapSelectionWith,
    TResult Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    appendChild,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingBefore,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingAfter,
    TResult Function(Type? widgetSpanChildType)? pasteReplacement,
    TResult Function(Type? widgetSpanChildType, SNode? testWidgetSpanChildNode)?
    pasteChild,
    TResult Function()? pasteSiblingBefore,
    TResult Function()? pasteSiblingAfter,
    TResult Function()? deleteNodeTapped,
    TResult Function()? completeDeletion,
    TResult Function(SnippetRootNode rootNode)? copySnippetJsonToClipboard,
    TResult Function(String? snippetJson)? replaceSnippetFromJson,
    TResult Function(SNode node, String? scName, dynamic skipSave)? copyNode,
    TResult Function(SNode node, String? scName, dynamic skipSave)? cutNode,
    TResult Function(String snippetName, SNode? selectedNode)?
    selectedDirectoryOrNode,
    TResult Function(Uint8List? newBytes)? imageChanged,
    TResult Function()? forceSnippetRefresh,
    required TResult orElse(),
  }) {
    if (hideIframes != null) {
      return hideIframes(hide);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SelectPanel value) selectPanel,
    required TResult Function(OverrideTargetGK value) overrideTargetGK,
    required TResult Function(ForceRefresh value) forceRefresh,
    required TResult Function(UpdateClipboard value) updateClipboard,
    required TResult Function(PublishSnippet value) publishSnippet,
    required TResult Function(RevertSnippet value) revertSnippet,
    required TResult Function(DeletePage value) deletePage,
    required TResult Function(ToggleAutoPublishingOfSnippet value)
    toggleAutoPublishingOfSnippet,
    required TResult Function(AutoPublishDefault value) autoPublishDefault,
    required TResult Function(HideIframes value) hideIframes,
    required TResult Function(SetPanelSnippet value)
    setPanelOrPlaceholderSnippet,
    required TResult Function(EnterSelectWidgetMode value)
    enterSelectWidgetMode,
    required TResult Function(ExitSelectWidgetMode value) exitSelectWidgetMode,
    required TResult Function(PushSnippetEditor value) pushSnippetEditor,
    required TResult Function(PopSnippetEditor value) popSnippetEditor,
    required TResult Function(ShowDirectoryTree value) showDirectoryTree,
    required TResult Function(RemoveDirectoryTree value) removeDirectoryTree,
    required TResult Function(SelectNode value) selectNode,
    required TResult Function(ClearNodeSelection value) clearNodeSelection,
    required TResult Function(SaveNodeAsSnippet value) saveNodeAsSnippet,
    required TResult Function(ReplaceSelectionWith value) replaceSelectionWith,
    required TResult Function(WrapSelectionWith value) wrapSelectionWith,
    required TResult Function(AppendChild value) appendChild,
    required TResult Function(AddSiblingBefore value) addSiblingBefore,
    required TResult Function(AddSiblingAfter value) addSiblingAfter,
    required TResult Function(PasteReplacement value) pasteReplacement,
    required TResult Function(PasteChild value) pasteChild,
    required TResult Function(PasteSiblingBefore value) pasteSiblingBefore,
    required TResult Function(PasteSiblingAfter value) pasteSiblingAfter,
    required TResult Function(DeleteNodeTapped value) deleteNodeTapped,
    required TResult Function(CompleteDeletion value) completeDeletion,
    required TResult Function(CopySnippetJsonToClipboard value)
    copySnippetJsonToClipboard,
    required TResult Function(ReplaceSnippetFromJson value)
    replaceSnippetFromJson,
    required TResult Function(CopyNode value) copyNode,
    required TResult Function(CutNode value) cutNode,
    required TResult Function(SelectedDirectoryOrNode value)
    selectedDirectoryOrNode,
    required TResult Function(ImageChanged value) imageChanged,
    required TResult Function(ForceSnippetRefresh value) forceSnippetRefresh,
  }) {
    return hideIframes(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SelectPanel value)? selectPanel,
    TResult? Function(OverrideTargetGK value)? overrideTargetGK,
    TResult? Function(ForceRefresh value)? forceRefresh,
    TResult? Function(UpdateClipboard value)? updateClipboard,
    TResult? Function(PublishSnippet value)? publishSnippet,
    TResult? Function(RevertSnippet value)? revertSnippet,
    TResult? Function(DeletePage value)? deletePage,
    TResult? Function(ToggleAutoPublishingOfSnippet value)?
    toggleAutoPublishingOfSnippet,
    TResult? Function(AutoPublishDefault value)? autoPublishDefault,
    TResult? Function(HideIframes value)? hideIframes,
    TResult? Function(SetPanelSnippet value)? setPanelOrPlaceholderSnippet,
    TResult? Function(EnterSelectWidgetMode value)? enterSelectWidgetMode,
    TResult? Function(ExitSelectWidgetMode value)? exitSelectWidgetMode,
    TResult? Function(PushSnippetEditor value)? pushSnippetEditor,
    TResult? Function(PopSnippetEditor value)? popSnippetEditor,
    TResult? Function(ShowDirectoryTree value)? showDirectoryTree,
    TResult? Function(RemoveDirectoryTree value)? removeDirectoryTree,
    TResult? Function(SelectNode value)? selectNode,
    TResult? Function(ClearNodeSelection value)? clearNodeSelection,
    TResult? Function(SaveNodeAsSnippet value)? saveNodeAsSnippet,
    TResult? Function(ReplaceSelectionWith value)? replaceSelectionWith,
    TResult? Function(WrapSelectionWith value)? wrapSelectionWith,
    TResult? Function(AppendChild value)? appendChild,
    TResult? Function(AddSiblingBefore value)? addSiblingBefore,
    TResult? Function(AddSiblingAfter value)? addSiblingAfter,
    TResult? Function(PasteReplacement value)? pasteReplacement,
    TResult? Function(PasteChild value)? pasteChild,
    TResult? Function(PasteSiblingBefore value)? pasteSiblingBefore,
    TResult? Function(PasteSiblingAfter value)? pasteSiblingAfter,
    TResult? Function(DeleteNodeTapped value)? deleteNodeTapped,
    TResult? Function(CompleteDeletion value)? completeDeletion,
    TResult? Function(CopySnippetJsonToClipboard value)?
    copySnippetJsonToClipboard,
    TResult? Function(ReplaceSnippetFromJson value)? replaceSnippetFromJson,
    TResult? Function(CopyNode value)? copyNode,
    TResult? Function(CutNode value)? cutNode,
    TResult? Function(SelectedDirectoryOrNode value)? selectedDirectoryOrNode,
    TResult? Function(ImageChanged value)? imageChanged,
    TResult? Function(ForceSnippetRefresh value)? forceSnippetRefresh,
  }) {
    return hideIframes?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SelectPanel value)? selectPanel,
    TResult Function(OverrideTargetGK value)? overrideTargetGK,
    TResult Function(ForceRefresh value)? forceRefresh,
    TResult Function(UpdateClipboard value)? updateClipboard,
    TResult Function(PublishSnippet value)? publishSnippet,
    TResult Function(RevertSnippet value)? revertSnippet,
    TResult Function(DeletePage value)? deletePage,
    TResult Function(ToggleAutoPublishingOfSnippet value)?
    toggleAutoPublishingOfSnippet,
    TResult Function(AutoPublishDefault value)? autoPublishDefault,
    TResult Function(HideIframes value)? hideIframes,
    TResult Function(SetPanelSnippet value)? setPanelOrPlaceholderSnippet,
    TResult Function(EnterSelectWidgetMode value)? enterSelectWidgetMode,
    TResult Function(ExitSelectWidgetMode value)? exitSelectWidgetMode,
    TResult Function(PushSnippetEditor value)? pushSnippetEditor,
    TResult Function(PopSnippetEditor value)? popSnippetEditor,
    TResult Function(ShowDirectoryTree value)? showDirectoryTree,
    TResult Function(RemoveDirectoryTree value)? removeDirectoryTree,
    TResult Function(SelectNode value)? selectNode,
    TResult Function(ClearNodeSelection value)? clearNodeSelection,
    TResult Function(SaveNodeAsSnippet value)? saveNodeAsSnippet,
    TResult Function(ReplaceSelectionWith value)? replaceSelectionWith,
    TResult Function(WrapSelectionWith value)? wrapSelectionWith,
    TResult Function(AppendChild value)? appendChild,
    TResult Function(AddSiblingBefore value)? addSiblingBefore,
    TResult Function(AddSiblingAfter value)? addSiblingAfter,
    TResult Function(PasteReplacement value)? pasteReplacement,
    TResult Function(PasteChild value)? pasteChild,
    TResult Function(PasteSiblingBefore value)? pasteSiblingBefore,
    TResult Function(PasteSiblingAfter value)? pasteSiblingAfter,
    TResult Function(DeleteNodeTapped value)? deleteNodeTapped,
    TResult Function(CompleteDeletion value)? completeDeletion,
    TResult Function(CopySnippetJsonToClipboard value)?
    copySnippetJsonToClipboard,
    TResult Function(ReplaceSnippetFromJson value)? replaceSnippetFromJson,
    TResult Function(CopyNode value)? copyNode,
    TResult Function(CutNode value)? cutNode,
    TResult Function(SelectedDirectoryOrNode value)? selectedDirectoryOrNode,
    TResult Function(ImageChanged value)? imageChanged,
    TResult Function(ForceSnippetRefresh value)? forceSnippetRefresh,
    required TResult orElse(),
  }) {
    if (hideIframes != null) {
      return hideIframes(this);
    }
    return orElse();
  }
}

abstract class HideIframes implements CAPIEvent {
  const factory HideIframes({required final bool hide}) = _$HideIframesImpl;

  bool get hide;

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HideIframesImplCopyWith<_$HideIframesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetPanelSnippetImplCopyWith<$Res> {
  factory _$$SetPanelSnippetImplCopyWith(
    _$SetPanelSnippetImpl value,
    $Res Function(_$SetPanelSnippetImpl) then,
  ) = __$$SetPanelSnippetImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String snippetName, String panelName});
}

/// @nodoc
class __$$SetPanelSnippetImplCopyWithImpl<$Res>
    extends _$CAPIEventCopyWithImpl<$Res, _$SetPanelSnippetImpl>
    implements _$$SetPanelSnippetImplCopyWith<$Res> {
  __$$SetPanelSnippetImplCopyWithImpl(
    _$SetPanelSnippetImpl _value,
    $Res Function(_$SetPanelSnippetImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? snippetName = null, Object? panelName = null}) {
    return _then(
      _$SetPanelSnippetImpl(
        snippetName:
            null == snippetName
                ? _value.snippetName
                : snippetName // ignore: cast_nullable_to_non_nullable
                    as String,
        panelName:
            null == panelName
                ? _value.panelName
                : panelName // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$SetPanelSnippetImpl
    with DiagnosticableTreeMixin
    implements SetPanelSnippet {
  const _$SetPanelSnippetImpl({
    required this.snippetName,
    required this.panelName,
  });

  @override
  final String snippetName;
  @override
  final String panelName;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CAPIEvent.setPanelOrPlaceholderSnippet(snippetName: $snippetName, panelName: $panelName)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        DiagnosticsProperty('type', 'CAPIEvent.setPanelOrPlaceholderSnippet'),
      )
      ..add(DiagnosticsProperty('snippetName', snippetName))
      ..add(DiagnosticsProperty('panelName', panelName));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetPanelSnippetImpl &&
            (identical(other.snippetName, snippetName) ||
                other.snippetName == snippetName) &&
            (identical(other.panelName, panelName) ||
                other.panelName == panelName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, snippetName, panelName);

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SetPanelSnippetImplCopyWith<_$SetPanelSnippetImpl> get copyWith =>
      __$$SetPanelSnippetImplCopyWithImpl<_$SetPanelSnippetImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? panelName) selectPanel,
    required TResult Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )
    overrideTargetGK,
    required TResult Function(bool onlyTargetsWrappers) forceRefresh,
    required TResult Function(
      SNode? newContent,
      String? scName,
      dynamic skipSave,
    )
    updateClipboard,
    required TResult Function(String snippetName, String versionId)
    publishSnippet,
    required TResult Function(String snippetName, String versionId)
    revertSnippet,
    required TResult Function(String pathName) deletePage,
    required TResult Function(String snippetName) toggleAutoPublishingOfSnippet,
    required TResult Function(bool b) autoPublishDefault,
    required TResult Function(bool hide) hideIframes,
    required TResult Function(String snippetName, String panelName)
    setPanelOrPlaceholderSnippet,
    required TResult Function(String snippetName) enterSelectWidgetMode,
    required TResult Function() exitSelectWidgetMode,
    required TResult Function(SnippetRootNode rootNode, SNode? selectedNode)
    pushSnippetEditor,
    required TResult Function(bool save) popSnippetEditor,
    required TResult Function() showDirectoryTree,
    required TResult Function(bool save) removeDirectoryTree,
    required TResult Function(SNode node) selectNode,
    required TResult Function() clearNodeSelection,
    required TResult Function(SNode node, String newSnippetName)
    saveNodeAsSnippet,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    replaceSelectionWith,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    wrapSelectionWith,
    required TResult Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )
    appendChild,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    addSiblingBefore,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    addSiblingAfter,
    required TResult Function(Type? widgetSpanChildType) pasteReplacement,
    required TResult Function(
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )
    pasteChild,
    required TResult Function() pasteSiblingBefore,
    required TResult Function() pasteSiblingAfter,
    required TResult Function() deleteNodeTapped,
    required TResult Function() completeDeletion,
    required TResult Function(SnippetRootNode rootNode)
    copySnippetJsonToClipboard,
    required TResult Function(String? snippetJson) replaceSnippetFromJson,
    required TResult Function(SNode node, String? scName, dynamic skipSave)
    copyNode,
    required TResult Function(SNode node, String? scName, dynamic skipSave)
    cutNode,
    required TResult Function(String snippetName, SNode? selectedNode)
    selectedDirectoryOrNode,
    required TResult Function(Uint8List? newBytes) imageChanged,
    required TResult Function() forceSnippetRefresh,
  }) {
    return setPanelOrPlaceholderSnippet(snippetName, panelName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? panelName)? selectPanel,
    TResult? Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )?
    overrideTargetGK,
    TResult? Function(bool onlyTargetsWrappers)? forceRefresh,
    TResult? Function(SNode? newContent, String? scName, dynamic skipSave)?
    updateClipboard,
    TResult? Function(String snippetName, String versionId)? publishSnippet,
    TResult? Function(String snippetName, String versionId)? revertSnippet,
    TResult? Function(String pathName)? deletePage,
    TResult? Function(String snippetName)? toggleAutoPublishingOfSnippet,
    TResult? Function(bool b)? autoPublishDefault,
    TResult? Function(bool hide)? hideIframes,
    TResult? Function(String snippetName, String panelName)?
    setPanelOrPlaceholderSnippet,
    TResult? Function(String snippetName)? enterSelectWidgetMode,
    TResult? Function()? exitSelectWidgetMode,
    TResult? Function(SnippetRootNode rootNode, SNode? selectedNode)?
    pushSnippetEditor,
    TResult? Function(bool save)? popSnippetEditor,
    TResult? Function()? showDirectoryTree,
    TResult? Function(bool save)? removeDirectoryTree,
    TResult? Function(SNode node)? selectNode,
    TResult? Function()? clearNodeSelection,
    TResult? Function(SNode node, String newSnippetName)? saveNodeAsSnippet,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    replaceSelectionWith,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    wrapSelectionWith,
    TResult? Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    appendChild,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingBefore,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingAfter,
    TResult? Function(Type? widgetSpanChildType)? pasteReplacement,
    TResult? Function(
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    pasteChild,
    TResult? Function()? pasteSiblingBefore,
    TResult? Function()? pasteSiblingAfter,
    TResult? Function()? deleteNodeTapped,
    TResult? Function()? completeDeletion,
    TResult? Function(SnippetRootNode rootNode)? copySnippetJsonToClipboard,
    TResult? Function(String? snippetJson)? replaceSnippetFromJson,
    TResult? Function(SNode node, String? scName, dynamic skipSave)? copyNode,
    TResult? Function(SNode node, String? scName, dynamic skipSave)? cutNode,
    TResult? Function(String snippetName, SNode? selectedNode)?
    selectedDirectoryOrNode,
    TResult? Function(Uint8List? newBytes)? imageChanged,
    TResult? Function()? forceSnippetRefresh,
  }) {
    return setPanelOrPlaceholderSnippet?.call(snippetName, panelName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? panelName)? selectPanel,
    TResult Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )?
    overrideTargetGK,
    TResult Function(bool onlyTargetsWrappers)? forceRefresh,
    TResult Function(SNode? newContent, String? scName, dynamic skipSave)?
    updateClipboard,
    TResult Function(String snippetName, String versionId)? publishSnippet,
    TResult Function(String snippetName, String versionId)? revertSnippet,
    TResult Function(String pathName)? deletePage,
    TResult Function(String snippetName)? toggleAutoPublishingOfSnippet,
    TResult Function(bool b)? autoPublishDefault,
    TResult Function(bool hide)? hideIframes,
    TResult Function(String snippetName, String panelName)?
    setPanelOrPlaceholderSnippet,
    TResult Function(String snippetName)? enterSelectWidgetMode,
    TResult Function()? exitSelectWidgetMode,
    TResult Function(SnippetRootNode rootNode, SNode? selectedNode)?
    pushSnippetEditor,
    TResult Function(bool save)? popSnippetEditor,
    TResult Function()? showDirectoryTree,
    TResult Function(bool save)? removeDirectoryTree,
    TResult Function(SNode node)? selectNode,
    TResult Function()? clearNodeSelection,
    TResult Function(SNode node, String newSnippetName)? saveNodeAsSnippet,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    replaceSelectionWith,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    wrapSelectionWith,
    TResult Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    appendChild,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingBefore,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingAfter,
    TResult Function(Type? widgetSpanChildType)? pasteReplacement,
    TResult Function(Type? widgetSpanChildType, SNode? testWidgetSpanChildNode)?
    pasteChild,
    TResult Function()? pasteSiblingBefore,
    TResult Function()? pasteSiblingAfter,
    TResult Function()? deleteNodeTapped,
    TResult Function()? completeDeletion,
    TResult Function(SnippetRootNode rootNode)? copySnippetJsonToClipboard,
    TResult Function(String? snippetJson)? replaceSnippetFromJson,
    TResult Function(SNode node, String? scName, dynamic skipSave)? copyNode,
    TResult Function(SNode node, String? scName, dynamic skipSave)? cutNode,
    TResult Function(String snippetName, SNode? selectedNode)?
    selectedDirectoryOrNode,
    TResult Function(Uint8List? newBytes)? imageChanged,
    TResult Function()? forceSnippetRefresh,
    required TResult orElse(),
  }) {
    if (setPanelOrPlaceholderSnippet != null) {
      return setPanelOrPlaceholderSnippet(snippetName, panelName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SelectPanel value) selectPanel,
    required TResult Function(OverrideTargetGK value) overrideTargetGK,
    required TResult Function(ForceRefresh value) forceRefresh,
    required TResult Function(UpdateClipboard value) updateClipboard,
    required TResult Function(PublishSnippet value) publishSnippet,
    required TResult Function(RevertSnippet value) revertSnippet,
    required TResult Function(DeletePage value) deletePage,
    required TResult Function(ToggleAutoPublishingOfSnippet value)
    toggleAutoPublishingOfSnippet,
    required TResult Function(AutoPublishDefault value) autoPublishDefault,
    required TResult Function(HideIframes value) hideIframes,
    required TResult Function(SetPanelSnippet value)
    setPanelOrPlaceholderSnippet,
    required TResult Function(EnterSelectWidgetMode value)
    enterSelectWidgetMode,
    required TResult Function(ExitSelectWidgetMode value) exitSelectWidgetMode,
    required TResult Function(PushSnippetEditor value) pushSnippetEditor,
    required TResult Function(PopSnippetEditor value) popSnippetEditor,
    required TResult Function(ShowDirectoryTree value) showDirectoryTree,
    required TResult Function(RemoveDirectoryTree value) removeDirectoryTree,
    required TResult Function(SelectNode value) selectNode,
    required TResult Function(ClearNodeSelection value) clearNodeSelection,
    required TResult Function(SaveNodeAsSnippet value) saveNodeAsSnippet,
    required TResult Function(ReplaceSelectionWith value) replaceSelectionWith,
    required TResult Function(WrapSelectionWith value) wrapSelectionWith,
    required TResult Function(AppendChild value) appendChild,
    required TResult Function(AddSiblingBefore value) addSiblingBefore,
    required TResult Function(AddSiblingAfter value) addSiblingAfter,
    required TResult Function(PasteReplacement value) pasteReplacement,
    required TResult Function(PasteChild value) pasteChild,
    required TResult Function(PasteSiblingBefore value) pasteSiblingBefore,
    required TResult Function(PasteSiblingAfter value) pasteSiblingAfter,
    required TResult Function(DeleteNodeTapped value) deleteNodeTapped,
    required TResult Function(CompleteDeletion value) completeDeletion,
    required TResult Function(CopySnippetJsonToClipboard value)
    copySnippetJsonToClipboard,
    required TResult Function(ReplaceSnippetFromJson value)
    replaceSnippetFromJson,
    required TResult Function(CopyNode value) copyNode,
    required TResult Function(CutNode value) cutNode,
    required TResult Function(SelectedDirectoryOrNode value)
    selectedDirectoryOrNode,
    required TResult Function(ImageChanged value) imageChanged,
    required TResult Function(ForceSnippetRefresh value) forceSnippetRefresh,
  }) {
    return setPanelOrPlaceholderSnippet(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SelectPanel value)? selectPanel,
    TResult? Function(OverrideTargetGK value)? overrideTargetGK,
    TResult? Function(ForceRefresh value)? forceRefresh,
    TResult? Function(UpdateClipboard value)? updateClipboard,
    TResult? Function(PublishSnippet value)? publishSnippet,
    TResult? Function(RevertSnippet value)? revertSnippet,
    TResult? Function(DeletePage value)? deletePage,
    TResult? Function(ToggleAutoPublishingOfSnippet value)?
    toggleAutoPublishingOfSnippet,
    TResult? Function(AutoPublishDefault value)? autoPublishDefault,
    TResult? Function(HideIframes value)? hideIframes,
    TResult? Function(SetPanelSnippet value)? setPanelOrPlaceholderSnippet,
    TResult? Function(EnterSelectWidgetMode value)? enterSelectWidgetMode,
    TResult? Function(ExitSelectWidgetMode value)? exitSelectWidgetMode,
    TResult? Function(PushSnippetEditor value)? pushSnippetEditor,
    TResult? Function(PopSnippetEditor value)? popSnippetEditor,
    TResult? Function(ShowDirectoryTree value)? showDirectoryTree,
    TResult? Function(RemoveDirectoryTree value)? removeDirectoryTree,
    TResult? Function(SelectNode value)? selectNode,
    TResult? Function(ClearNodeSelection value)? clearNodeSelection,
    TResult? Function(SaveNodeAsSnippet value)? saveNodeAsSnippet,
    TResult? Function(ReplaceSelectionWith value)? replaceSelectionWith,
    TResult? Function(WrapSelectionWith value)? wrapSelectionWith,
    TResult? Function(AppendChild value)? appendChild,
    TResult? Function(AddSiblingBefore value)? addSiblingBefore,
    TResult? Function(AddSiblingAfter value)? addSiblingAfter,
    TResult? Function(PasteReplacement value)? pasteReplacement,
    TResult? Function(PasteChild value)? pasteChild,
    TResult? Function(PasteSiblingBefore value)? pasteSiblingBefore,
    TResult? Function(PasteSiblingAfter value)? pasteSiblingAfter,
    TResult? Function(DeleteNodeTapped value)? deleteNodeTapped,
    TResult? Function(CompleteDeletion value)? completeDeletion,
    TResult? Function(CopySnippetJsonToClipboard value)?
    copySnippetJsonToClipboard,
    TResult? Function(ReplaceSnippetFromJson value)? replaceSnippetFromJson,
    TResult? Function(CopyNode value)? copyNode,
    TResult? Function(CutNode value)? cutNode,
    TResult? Function(SelectedDirectoryOrNode value)? selectedDirectoryOrNode,
    TResult? Function(ImageChanged value)? imageChanged,
    TResult? Function(ForceSnippetRefresh value)? forceSnippetRefresh,
  }) {
    return setPanelOrPlaceholderSnippet?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SelectPanel value)? selectPanel,
    TResult Function(OverrideTargetGK value)? overrideTargetGK,
    TResult Function(ForceRefresh value)? forceRefresh,
    TResult Function(UpdateClipboard value)? updateClipboard,
    TResult Function(PublishSnippet value)? publishSnippet,
    TResult Function(RevertSnippet value)? revertSnippet,
    TResult Function(DeletePage value)? deletePage,
    TResult Function(ToggleAutoPublishingOfSnippet value)?
    toggleAutoPublishingOfSnippet,
    TResult Function(AutoPublishDefault value)? autoPublishDefault,
    TResult Function(HideIframes value)? hideIframes,
    TResult Function(SetPanelSnippet value)? setPanelOrPlaceholderSnippet,
    TResult Function(EnterSelectWidgetMode value)? enterSelectWidgetMode,
    TResult Function(ExitSelectWidgetMode value)? exitSelectWidgetMode,
    TResult Function(PushSnippetEditor value)? pushSnippetEditor,
    TResult Function(PopSnippetEditor value)? popSnippetEditor,
    TResult Function(ShowDirectoryTree value)? showDirectoryTree,
    TResult Function(RemoveDirectoryTree value)? removeDirectoryTree,
    TResult Function(SelectNode value)? selectNode,
    TResult Function(ClearNodeSelection value)? clearNodeSelection,
    TResult Function(SaveNodeAsSnippet value)? saveNodeAsSnippet,
    TResult Function(ReplaceSelectionWith value)? replaceSelectionWith,
    TResult Function(WrapSelectionWith value)? wrapSelectionWith,
    TResult Function(AppendChild value)? appendChild,
    TResult Function(AddSiblingBefore value)? addSiblingBefore,
    TResult Function(AddSiblingAfter value)? addSiblingAfter,
    TResult Function(PasteReplacement value)? pasteReplacement,
    TResult Function(PasteChild value)? pasteChild,
    TResult Function(PasteSiblingBefore value)? pasteSiblingBefore,
    TResult Function(PasteSiblingAfter value)? pasteSiblingAfter,
    TResult Function(DeleteNodeTapped value)? deleteNodeTapped,
    TResult Function(CompleteDeletion value)? completeDeletion,
    TResult Function(CopySnippetJsonToClipboard value)?
    copySnippetJsonToClipboard,
    TResult Function(ReplaceSnippetFromJson value)? replaceSnippetFromJson,
    TResult Function(CopyNode value)? copyNode,
    TResult Function(CutNode value)? cutNode,
    TResult Function(SelectedDirectoryOrNode value)? selectedDirectoryOrNode,
    TResult Function(ImageChanged value)? imageChanged,
    TResult Function(ForceSnippetRefresh value)? forceSnippetRefresh,
    required TResult orElse(),
  }) {
    if (setPanelOrPlaceholderSnippet != null) {
      return setPanelOrPlaceholderSnippet(this);
    }
    return orElse();
  }
}

abstract class SetPanelSnippet implements CAPIEvent {
  const factory SetPanelSnippet({
    required final String snippetName,
    required final String panelName,
  }) = _$SetPanelSnippetImpl;

  String get snippetName;
  String get panelName;

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SetPanelSnippetImplCopyWith<_$SetPanelSnippetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EnterSelectWidgetModeImplCopyWith<$Res> {
  factory _$$EnterSelectWidgetModeImplCopyWith(
    _$EnterSelectWidgetModeImpl value,
    $Res Function(_$EnterSelectWidgetModeImpl) then,
  ) = __$$EnterSelectWidgetModeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String snippetName});
}

/// @nodoc
class __$$EnterSelectWidgetModeImplCopyWithImpl<$Res>
    extends _$CAPIEventCopyWithImpl<$Res, _$EnterSelectWidgetModeImpl>
    implements _$$EnterSelectWidgetModeImplCopyWith<$Res> {
  __$$EnterSelectWidgetModeImplCopyWithImpl(
    _$EnterSelectWidgetModeImpl _value,
    $Res Function(_$EnterSelectWidgetModeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? snippetName = null}) {
    return _then(
      _$EnterSelectWidgetModeImpl(
        snippetName:
            null == snippetName
                ? _value.snippetName
                : snippetName // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$EnterSelectWidgetModeImpl
    with DiagnosticableTreeMixin
    implements EnterSelectWidgetMode {
  const _$EnterSelectWidgetModeImpl({required this.snippetName});

  @override
  final String snippetName;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CAPIEvent.enterSelectWidgetMode(snippetName: $snippetName)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CAPIEvent.enterSelectWidgetMode'))
      ..add(DiagnosticsProperty('snippetName', snippetName));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EnterSelectWidgetModeImpl &&
            (identical(other.snippetName, snippetName) ||
                other.snippetName == snippetName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, snippetName);

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EnterSelectWidgetModeImplCopyWith<_$EnterSelectWidgetModeImpl>
  get copyWith =>
      __$$EnterSelectWidgetModeImplCopyWithImpl<_$EnterSelectWidgetModeImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? panelName) selectPanel,
    required TResult Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )
    overrideTargetGK,
    required TResult Function(bool onlyTargetsWrappers) forceRefresh,
    required TResult Function(
      SNode? newContent,
      String? scName,
      dynamic skipSave,
    )
    updateClipboard,
    required TResult Function(String snippetName, String versionId)
    publishSnippet,
    required TResult Function(String snippetName, String versionId)
    revertSnippet,
    required TResult Function(String pathName) deletePage,
    required TResult Function(String snippetName) toggleAutoPublishingOfSnippet,
    required TResult Function(bool b) autoPublishDefault,
    required TResult Function(bool hide) hideIframes,
    required TResult Function(String snippetName, String panelName)
    setPanelOrPlaceholderSnippet,
    required TResult Function(String snippetName) enterSelectWidgetMode,
    required TResult Function() exitSelectWidgetMode,
    required TResult Function(SnippetRootNode rootNode, SNode? selectedNode)
    pushSnippetEditor,
    required TResult Function(bool save) popSnippetEditor,
    required TResult Function() showDirectoryTree,
    required TResult Function(bool save) removeDirectoryTree,
    required TResult Function(SNode node) selectNode,
    required TResult Function() clearNodeSelection,
    required TResult Function(SNode node, String newSnippetName)
    saveNodeAsSnippet,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    replaceSelectionWith,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    wrapSelectionWith,
    required TResult Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )
    appendChild,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    addSiblingBefore,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    addSiblingAfter,
    required TResult Function(Type? widgetSpanChildType) pasteReplacement,
    required TResult Function(
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )
    pasteChild,
    required TResult Function() pasteSiblingBefore,
    required TResult Function() pasteSiblingAfter,
    required TResult Function() deleteNodeTapped,
    required TResult Function() completeDeletion,
    required TResult Function(SnippetRootNode rootNode)
    copySnippetJsonToClipboard,
    required TResult Function(String? snippetJson) replaceSnippetFromJson,
    required TResult Function(SNode node, String? scName, dynamic skipSave)
    copyNode,
    required TResult Function(SNode node, String? scName, dynamic skipSave)
    cutNode,
    required TResult Function(String snippetName, SNode? selectedNode)
    selectedDirectoryOrNode,
    required TResult Function(Uint8List? newBytes) imageChanged,
    required TResult Function() forceSnippetRefresh,
  }) {
    return enterSelectWidgetMode(snippetName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? panelName)? selectPanel,
    TResult? Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )?
    overrideTargetGK,
    TResult? Function(bool onlyTargetsWrappers)? forceRefresh,
    TResult? Function(SNode? newContent, String? scName, dynamic skipSave)?
    updateClipboard,
    TResult? Function(String snippetName, String versionId)? publishSnippet,
    TResult? Function(String snippetName, String versionId)? revertSnippet,
    TResult? Function(String pathName)? deletePage,
    TResult? Function(String snippetName)? toggleAutoPublishingOfSnippet,
    TResult? Function(bool b)? autoPublishDefault,
    TResult? Function(bool hide)? hideIframes,
    TResult? Function(String snippetName, String panelName)?
    setPanelOrPlaceholderSnippet,
    TResult? Function(String snippetName)? enterSelectWidgetMode,
    TResult? Function()? exitSelectWidgetMode,
    TResult? Function(SnippetRootNode rootNode, SNode? selectedNode)?
    pushSnippetEditor,
    TResult? Function(bool save)? popSnippetEditor,
    TResult? Function()? showDirectoryTree,
    TResult? Function(bool save)? removeDirectoryTree,
    TResult? Function(SNode node)? selectNode,
    TResult? Function()? clearNodeSelection,
    TResult? Function(SNode node, String newSnippetName)? saveNodeAsSnippet,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    replaceSelectionWith,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    wrapSelectionWith,
    TResult? Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    appendChild,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingBefore,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingAfter,
    TResult? Function(Type? widgetSpanChildType)? pasteReplacement,
    TResult? Function(
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    pasteChild,
    TResult? Function()? pasteSiblingBefore,
    TResult? Function()? pasteSiblingAfter,
    TResult? Function()? deleteNodeTapped,
    TResult? Function()? completeDeletion,
    TResult? Function(SnippetRootNode rootNode)? copySnippetJsonToClipboard,
    TResult? Function(String? snippetJson)? replaceSnippetFromJson,
    TResult? Function(SNode node, String? scName, dynamic skipSave)? copyNode,
    TResult? Function(SNode node, String? scName, dynamic skipSave)? cutNode,
    TResult? Function(String snippetName, SNode? selectedNode)?
    selectedDirectoryOrNode,
    TResult? Function(Uint8List? newBytes)? imageChanged,
    TResult? Function()? forceSnippetRefresh,
  }) {
    return enterSelectWidgetMode?.call(snippetName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? panelName)? selectPanel,
    TResult Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )?
    overrideTargetGK,
    TResult Function(bool onlyTargetsWrappers)? forceRefresh,
    TResult Function(SNode? newContent, String? scName, dynamic skipSave)?
    updateClipboard,
    TResult Function(String snippetName, String versionId)? publishSnippet,
    TResult Function(String snippetName, String versionId)? revertSnippet,
    TResult Function(String pathName)? deletePage,
    TResult Function(String snippetName)? toggleAutoPublishingOfSnippet,
    TResult Function(bool b)? autoPublishDefault,
    TResult Function(bool hide)? hideIframes,
    TResult Function(String snippetName, String panelName)?
    setPanelOrPlaceholderSnippet,
    TResult Function(String snippetName)? enterSelectWidgetMode,
    TResult Function()? exitSelectWidgetMode,
    TResult Function(SnippetRootNode rootNode, SNode? selectedNode)?
    pushSnippetEditor,
    TResult Function(bool save)? popSnippetEditor,
    TResult Function()? showDirectoryTree,
    TResult Function(bool save)? removeDirectoryTree,
    TResult Function(SNode node)? selectNode,
    TResult Function()? clearNodeSelection,
    TResult Function(SNode node, String newSnippetName)? saveNodeAsSnippet,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    replaceSelectionWith,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    wrapSelectionWith,
    TResult Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    appendChild,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingBefore,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingAfter,
    TResult Function(Type? widgetSpanChildType)? pasteReplacement,
    TResult Function(Type? widgetSpanChildType, SNode? testWidgetSpanChildNode)?
    pasteChild,
    TResult Function()? pasteSiblingBefore,
    TResult Function()? pasteSiblingAfter,
    TResult Function()? deleteNodeTapped,
    TResult Function()? completeDeletion,
    TResult Function(SnippetRootNode rootNode)? copySnippetJsonToClipboard,
    TResult Function(String? snippetJson)? replaceSnippetFromJson,
    TResult Function(SNode node, String? scName, dynamic skipSave)? copyNode,
    TResult Function(SNode node, String? scName, dynamic skipSave)? cutNode,
    TResult Function(String snippetName, SNode? selectedNode)?
    selectedDirectoryOrNode,
    TResult Function(Uint8List? newBytes)? imageChanged,
    TResult Function()? forceSnippetRefresh,
    required TResult orElse(),
  }) {
    if (enterSelectWidgetMode != null) {
      return enterSelectWidgetMode(snippetName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SelectPanel value) selectPanel,
    required TResult Function(OverrideTargetGK value) overrideTargetGK,
    required TResult Function(ForceRefresh value) forceRefresh,
    required TResult Function(UpdateClipboard value) updateClipboard,
    required TResult Function(PublishSnippet value) publishSnippet,
    required TResult Function(RevertSnippet value) revertSnippet,
    required TResult Function(DeletePage value) deletePage,
    required TResult Function(ToggleAutoPublishingOfSnippet value)
    toggleAutoPublishingOfSnippet,
    required TResult Function(AutoPublishDefault value) autoPublishDefault,
    required TResult Function(HideIframes value) hideIframes,
    required TResult Function(SetPanelSnippet value)
    setPanelOrPlaceholderSnippet,
    required TResult Function(EnterSelectWidgetMode value)
    enterSelectWidgetMode,
    required TResult Function(ExitSelectWidgetMode value) exitSelectWidgetMode,
    required TResult Function(PushSnippetEditor value) pushSnippetEditor,
    required TResult Function(PopSnippetEditor value) popSnippetEditor,
    required TResult Function(ShowDirectoryTree value) showDirectoryTree,
    required TResult Function(RemoveDirectoryTree value) removeDirectoryTree,
    required TResult Function(SelectNode value) selectNode,
    required TResult Function(ClearNodeSelection value) clearNodeSelection,
    required TResult Function(SaveNodeAsSnippet value) saveNodeAsSnippet,
    required TResult Function(ReplaceSelectionWith value) replaceSelectionWith,
    required TResult Function(WrapSelectionWith value) wrapSelectionWith,
    required TResult Function(AppendChild value) appendChild,
    required TResult Function(AddSiblingBefore value) addSiblingBefore,
    required TResult Function(AddSiblingAfter value) addSiblingAfter,
    required TResult Function(PasteReplacement value) pasteReplacement,
    required TResult Function(PasteChild value) pasteChild,
    required TResult Function(PasteSiblingBefore value) pasteSiblingBefore,
    required TResult Function(PasteSiblingAfter value) pasteSiblingAfter,
    required TResult Function(DeleteNodeTapped value) deleteNodeTapped,
    required TResult Function(CompleteDeletion value) completeDeletion,
    required TResult Function(CopySnippetJsonToClipboard value)
    copySnippetJsonToClipboard,
    required TResult Function(ReplaceSnippetFromJson value)
    replaceSnippetFromJson,
    required TResult Function(CopyNode value) copyNode,
    required TResult Function(CutNode value) cutNode,
    required TResult Function(SelectedDirectoryOrNode value)
    selectedDirectoryOrNode,
    required TResult Function(ImageChanged value) imageChanged,
    required TResult Function(ForceSnippetRefresh value) forceSnippetRefresh,
  }) {
    return enterSelectWidgetMode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SelectPanel value)? selectPanel,
    TResult? Function(OverrideTargetGK value)? overrideTargetGK,
    TResult? Function(ForceRefresh value)? forceRefresh,
    TResult? Function(UpdateClipboard value)? updateClipboard,
    TResult? Function(PublishSnippet value)? publishSnippet,
    TResult? Function(RevertSnippet value)? revertSnippet,
    TResult? Function(DeletePage value)? deletePage,
    TResult? Function(ToggleAutoPublishingOfSnippet value)?
    toggleAutoPublishingOfSnippet,
    TResult? Function(AutoPublishDefault value)? autoPublishDefault,
    TResult? Function(HideIframes value)? hideIframes,
    TResult? Function(SetPanelSnippet value)? setPanelOrPlaceholderSnippet,
    TResult? Function(EnterSelectWidgetMode value)? enterSelectWidgetMode,
    TResult? Function(ExitSelectWidgetMode value)? exitSelectWidgetMode,
    TResult? Function(PushSnippetEditor value)? pushSnippetEditor,
    TResult? Function(PopSnippetEditor value)? popSnippetEditor,
    TResult? Function(ShowDirectoryTree value)? showDirectoryTree,
    TResult? Function(RemoveDirectoryTree value)? removeDirectoryTree,
    TResult? Function(SelectNode value)? selectNode,
    TResult? Function(ClearNodeSelection value)? clearNodeSelection,
    TResult? Function(SaveNodeAsSnippet value)? saveNodeAsSnippet,
    TResult? Function(ReplaceSelectionWith value)? replaceSelectionWith,
    TResult? Function(WrapSelectionWith value)? wrapSelectionWith,
    TResult? Function(AppendChild value)? appendChild,
    TResult? Function(AddSiblingBefore value)? addSiblingBefore,
    TResult? Function(AddSiblingAfter value)? addSiblingAfter,
    TResult? Function(PasteReplacement value)? pasteReplacement,
    TResult? Function(PasteChild value)? pasteChild,
    TResult? Function(PasteSiblingBefore value)? pasteSiblingBefore,
    TResult? Function(PasteSiblingAfter value)? pasteSiblingAfter,
    TResult? Function(DeleteNodeTapped value)? deleteNodeTapped,
    TResult? Function(CompleteDeletion value)? completeDeletion,
    TResult? Function(CopySnippetJsonToClipboard value)?
    copySnippetJsonToClipboard,
    TResult? Function(ReplaceSnippetFromJson value)? replaceSnippetFromJson,
    TResult? Function(CopyNode value)? copyNode,
    TResult? Function(CutNode value)? cutNode,
    TResult? Function(SelectedDirectoryOrNode value)? selectedDirectoryOrNode,
    TResult? Function(ImageChanged value)? imageChanged,
    TResult? Function(ForceSnippetRefresh value)? forceSnippetRefresh,
  }) {
    return enterSelectWidgetMode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SelectPanel value)? selectPanel,
    TResult Function(OverrideTargetGK value)? overrideTargetGK,
    TResult Function(ForceRefresh value)? forceRefresh,
    TResult Function(UpdateClipboard value)? updateClipboard,
    TResult Function(PublishSnippet value)? publishSnippet,
    TResult Function(RevertSnippet value)? revertSnippet,
    TResult Function(DeletePage value)? deletePage,
    TResult Function(ToggleAutoPublishingOfSnippet value)?
    toggleAutoPublishingOfSnippet,
    TResult Function(AutoPublishDefault value)? autoPublishDefault,
    TResult Function(HideIframes value)? hideIframes,
    TResult Function(SetPanelSnippet value)? setPanelOrPlaceholderSnippet,
    TResult Function(EnterSelectWidgetMode value)? enterSelectWidgetMode,
    TResult Function(ExitSelectWidgetMode value)? exitSelectWidgetMode,
    TResult Function(PushSnippetEditor value)? pushSnippetEditor,
    TResult Function(PopSnippetEditor value)? popSnippetEditor,
    TResult Function(ShowDirectoryTree value)? showDirectoryTree,
    TResult Function(RemoveDirectoryTree value)? removeDirectoryTree,
    TResult Function(SelectNode value)? selectNode,
    TResult Function(ClearNodeSelection value)? clearNodeSelection,
    TResult Function(SaveNodeAsSnippet value)? saveNodeAsSnippet,
    TResult Function(ReplaceSelectionWith value)? replaceSelectionWith,
    TResult Function(WrapSelectionWith value)? wrapSelectionWith,
    TResult Function(AppendChild value)? appendChild,
    TResult Function(AddSiblingBefore value)? addSiblingBefore,
    TResult Function(AddSiblingAfter value)? addSiblingAfter,
    TResult Function(PasteReplacement value)? pasteReplacement,
    TResult Function(PasteChild value)? pasteChild,
    TResult Function(PasteSiblingBefore value)? pasteSiblingBefore,
    TResult Function(PasteSiblingAfter value)? pasteSiblingAfter,
    TResult Function(DeleteNodeTapped value)? deleteNodeTapped,
    TResult Function(CompleteDeletion value)? completeDeletion,
    TResult Function(CopySnippetJsonToClipboard value)?
    copySnippetJsonToClipboard,
    TResult Function(ReplaceSnippetFromJson value)? replaceSnippetFromJson,
    TResult Function(CopyNode value)? copyNode,
    TResult Function(CutNode value)? cutNode,
    TResult Function(SelectedDirectoryOrNode value)? selectedDirectoryOrNode,
    TResult Function(ImageChanged value)? imageChanged,
    TResult Function(ForceSnippetRefresh value)? forceSnippetRefresh,
    required TResult orElse(),
  }) {
    if (enterSelectWidgetMode != null) {
      return enterSelectWidgetMode(this);
    }
    return orElse();
  }
}

abstract class EnterSelectWidgetMode implements CAPIEvent {
  const factory EnterSelectWidgetMode({required final String snippetName}) =
      _$EnterSelectWidgetModeImpl;

  String get snippetName;

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EnterSelectWidgetModeImplCopyWith<_$EnterSelectWidgetModeImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ExitSelectWidgetModeImplCopyWith<$Res> {
  factory _$$ExitSelectWidgetModeImplCopyWith(
    _$ExitSelectWidgetModeImpl value,
    $Res Function(_$ExitSelectWidgetModeImpl) then,
  ) = __$$ExitSelectWidgetModeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ExitSelectWidgetModeImplCopyWithImpl<$Res>
    extends _$CAPIEventCopyWithImpl<$Res, _$ExitSelectWidgetModeImpl>
    implements _$$ExitSelectWidgetModeImplCopyWith<$Res> {
  __$$ExitSelectWidgetModeImplCopyWithImpl(
    _$ExitSelectWidgetModeImpl _value,
    $Res Function(_$ExitSelectWidgetModeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ExitSelectWidgetModeImpl
    with DiagnosticableTreeMixin
    implements ExitSelectWidgetMode {
  const _$ExitSelectWidgetModeImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CAPIEvent.exitSelectWidgetMode()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CAPIEvent.exitSelectWidgetMode'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExitSelectWidgetModeImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? panelName) selectPanel,
    required TResult Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )
    overrideTargetGK,
    required TResult Function(bool onlyTargetsWrappers) forceRefresh,
    required TResult Function(
      SNode? newContent,
      String? scName,
      dynamic skipSave,
    )
    updateClipboard,
    required TResult Function(String snippetName, String versionId)
    publishSnippet,
    required TResult Function(String snippetName, String versionId)
    revertSnippet,
    required TResult Function(String pathName) deletePage,
    required TResult Function(String snippetName) toggleAutoPublishingOfSnippet,
    required TResult Function(bool b) autoPublishDefault,
    required TResult Function(bool hide) hideIframes,
    required TResult Function(String snippetName, String panelName)
    setPanelOrPlaceholderSnippet,
    required TResult Function(String snippetName) enterSelectWidgetMode,
    required TResult Function() exitSelectWidgetMode,
    required TResult Function(SnippetRootNode rootNode, SNode? selectedNode)
    pushSnippetEditor,
    required TResult Function(bool save) popSnippetEditor,
    required TResult Function() showDirectoryTree,
    required TResult Function(bool save) removeDirectoryTree,
    required TResult Function(SNode node) selectNode,
    required TResult Function() clearNodeSelection,
    required TResult Function(SNode node, String newSnippetName)
    saveNodeAsSnippet,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    replaceSelectionWith,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    wrapSelectionWith,
    required TResult Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )
    appendChild,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    addSiblingBefore,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    addSiblingAfter,
    required TResult Function(Type? widgetSpanChildType) pasteReplacement,
    required TResult Function(
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )
    pasteChild,
    required TResult Function() pasteSiblingBefore,
    required TResult Function() pasteSiblingAfter,
    required TResult Function() deleteNodeTapped,
    required TResult Function() completeDeletion,
    required TResult Function(SnippetRootNode rootNode)
    copySnippetJsonToClipboard,
    required TResult Function(String? snippetJson) replaceSnippetFromJson,
    required TResult Function(SNode node, String? scName, dynamic skipSave)
    copyNode,
    required TResult Function(SNode node, String? scName, dynamic skipSave)
    cutNode,
    required TResult Function(String snippetName, SNode? selectedNode)
    selectedDirectoryOrNode,
    required TResult Function(Uint8List? newBytes) imageChanged,
    required TResult Function() forceSnippetRefresh,
  }) {
    return exitSelectWidgetMode();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? panelName)? selectPanel,
    TResult? Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )?
    overrideTargetGK,
    TResult? Function(bool onlyTargetsWrappers)? forceRefresh,
    TResult? Function(SNode? newContent, String? scName, dynamic skipSave)?
    updateClipboard,
    TResult? Function(String snippetName, String versionId)? publishSnippet,
    TResult? Function(String snippetName, String versionId)? revertSnippet,
    TResult? Function(String pathName)? deletePage,
    TResult? Function(String snippetName)? toggleAutoPublishingOfSnippet,
    TResult? Function(bool b)? autoPublishDefault,
    TResult? Function(bool hide)? hideIframes,
    TResult? Function(String snippetName, String panelName)?
    setPanelOrPlaceholderSnippet,
    TResult? Function(String snippetName)? enterSelectWidgetMode,
    TResult? Function()? exitSelectWidgetMode,
    TResult? Function(SnippetRootNode rootNode, SNode? selectedNode)?
    pushSnippetEditor,
    TResult? Function(bool save)? popSnippetEditor,
    TResult? Function()? showDirectoryTree,
    TResult? Function(bool save)? removeDirectoryTree,
    TResult? Function(SNode node)? selectNode,
    TResult? Function()? clearNodeSelection,
    TResult? Function(SNode node, String newSnippetName)? saveNodeAsSnippet,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    replaceSelectionWith,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    wrapSelectionWith,
    TResult? Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    appendChild,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingBefore,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingAfter,
    TResult? Function(Type? widgetSpanChildType)? pasteReplacement,
    TResult? Function(
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    pasteChild,
    TResult? Function()? pasteSiblingBefore,
    TResult? Function()? pasteSiblingAfter,
    TResult? Function()? deleteNodeTapped,
    TResult? Function()? completeDeletion,
    TResult? Function(SnippetRootNode rootNode)? copySnippetJsonToClipboard,
    TResult? Function(String? snippetJson)? replaceSnippetFromJson,
    TResult? Function(SNode node, String? scName, dynamic skipSave)? copyNode,
    TResult? Function(SNode node, String? scName, dynamic skipSave)? cutNode,
    TResult? Function(String snippetName, SNode? selectedNode)?
    selectedDirectoryOrNode,
    TResult? Function(Uint8List? newBytes)? imageChanged,
    TResult? Function()? forceSnippetRefresh,
  }) {
    return exitSelectWidgetMode?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? panelName)? selectPanel,
    TResult Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )?
    overrideTargetGK,
    TResult Function(bool onlyTargetsWrappers)? forceRefresh,
    TResult Function(SNode? newContent, String? scName, dynamic skipSave)?
    updateClipboard,
    TResult Function(String snippetName, String versionId)? publishSnippet,
    TResult Function(String snippetName, String versionId)? revertSnippet,
    TResult Function(String pathName)? deletePage,
    TResult Function(String snippetName)? toggleAutoPublishingOfSnippet,
    TResult Function(bool b)? autoPublishDefault,
    TResult Function(bool hide)? hideIframes,
    TResult Function(String snippetName, String panelName)?
    setPanelOrPlaceholderSnippet,
    TResult Function(String snippetName)? enterSelectWidgetMode,
    TResult Function()? exitSelectWidgetMode,
    TResult Function(SnippetRootNode rootNode, SNode? selectedNode)?
    pushSnippetEditor,
    TResult Function(bool save)? popSnippetEditor,
    TResult Function()? showDirectoryTree,
    TResult Function(bool save)? removeDirectoryTree,
    TResult Function(SNode node)? selectNode,
    TResult Function()? clearNodeSelection,
    TResult Function(SNode node, String newSnippetName)? saveNodeAsSnippet,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    replaceSelectionWith,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    wrapSelectionWith,
    TResult Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    appendChild,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingBefore,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingAfter,
    TResult Function(Type? widgetSpanChildType)? pasteReplacement,
    TResult Function(Type? widgetSpanChildType, SNode? testWidgetSpanChildNode)?
    pasteChild,
    TResult Function()? pasteSiblingBefore,
    TResult Function()? pasteSiblingAfter,
    TResult Function()? deleteNodeTapped,
    TResult Function()? completeDeletion,
    TResult Function(SnippetRootNode rootNode)? copySnippetJsonToClipboard,
    TResult Function(String? snippetJson)? replaceSnippetFromJson,
    TResult Function(SNode node, String? scName, dynamic skipSave)? copyNode,
    TResult Function(SNode node, String? scName, dynamic skipSave)? cutNode,
    TResult Function(String snippetName, SNode? selectedNode)?
    selectedDirectoryOrNode,
    TResult Function(Uint8List? newBytes)? imageChanged,
    TResult Function()? forceSnippetRefresh,
    required TResult orElse(),
  }) {
    if (exitSelectWidgetMode != null) {
      return exitSelectWidgetMode();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SelectPanel value) selectPanel,
    required TResult Function(OverrideTargetGK value) overrideTargetGK,
    required TResult Function(ForceRefresh value) forceRefresh,
    required TResult Function(UpdateClipboard value) updateClipboard,
    required TResult Function(PublishSnippet value) publishSnippet,
    required TResult Function(RevertSnippet value) revertSnippet,
    required TResult Function(DeletePage value) deletePage,
    required TResult Function(ToggleAutoPublishingOfSnippet value)
    toggleAutoPublishingOfSnippet,
    required TResult Function(AutoPublishDefault value) autoPublishDefault,
    required TResult Function(HideIframes value) hideIframes,
    required TResult Function(SetPanelSnippet value)
    setPanelOrPlaceholderSnippet,
    required TResult Function(EnterSelectWidgetMode value)
    enterSelectWidgetMode,
    required TResult Function(ExitSelectWidgetMode value) exitSelectWidgetMode,
    required TResult Function(PushSnippetEditor value) pushSnippetEditor,
    required TResult Function(PopSnippetEditor value) popSnippetEditor,
    required TResult Function(ShowDirectoryTree value) showDirectoryTree,
    required TResult Function(RemoveDirectoryTree value) removeDirectoryTree,
    required TResult Function(SelectNode value) selectNode,
    required TResult Function(ClearNodeSelection value) clearNodeSelection,
    required TResult Function(SaveNodeAsSnippet value) saveNodeAsSnippet,
    required TResult Function(ReplaceSelectionWith value) replaceSelectionWith,
    required TResult Function(WrapSelectionWith value) wrapSelectionWith,
    required TResult Function(AppendChild value) appendChild,
    required TResult Function(AddSiblingBefore value) addSiblingBefore,
    required TResult Function(AddSiblingAfter value) addSiblingAfter,
    required TResult Function(PasteReplacement value) pasteReplacement,
    required TResult Function(PasteChild value) pasteChild,
    required TResult Function(PasteSiblingBefore value) pasteSiblingBefore,
    required TResult Function(PasteSiblingAfter value) pasteSiblingAfter,
    required TResult Function(DeleteNodeTapped value) deleteNodeTapped,
    required TResult Function(CompleteDeletion value) completeDeletion,
    required TResult Function(CopySnippetJsonToClipboard value)
    copySnippetJsonToClipboard,
    required TResult Function(ReplaceSnippetFromJson value)
    replaceSnippetFromJson,
    required TResult Function(CopyNode value) copyNode,
    required TResult Function(CutNode value) cutNode,
    required TResult Function(SelectedDirectoryOrNode value)
    selectedDirectoryOrNode,
    required TResult Function(ImageChanged value) imageChanged,
    required TResult Function(ForceSnippetRefresh value) forceSnippetRefresh,
  }) {
    return exitSelectWidgetMode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SelectPanel value)? selectPanel,
    TResult? Function(OverrideTargetGK value)? overrideTargetGK,
    TResult? Function(ForceRefresh value)? forceRefresh,
    TResult? Function(UpdateClipboard value)? updateClipboard,
    TResult? Function(PublishSnippet value)? publishSnippet,
    TResult? Function(RevertSnippet value)? revertSnippet,
    TResult? Function(DeletePage value)? deletePage,
    TResult? Function(ToggleAutoPublishingOfSnippet value)?
    toggleAutoPublishingOfSnippet,
    TResult? Function(AutoPublishDefault value)? autoPublishDefault,
    TResult? Function(HideIframes value)? hideIframes,
    TResult? Function(SetPanelSnippet value)? setPanelOrPlaceholderSnippet,
    TResult? Function(EnterSelectWidgetMode value)? enterSelectWidgetMode,
    TResult? Function(ExitSelectWidgetMode value)? exitSelectWidgetMode,
    TResult? Function(PushSnippetEditor value)? pushSnippetEditor,
    TResult? Function(PopSnippetEditor value)? popSnippetEditor,
    TResult? Function(ShowDirectoryTree value)? showDirectoryTree,
    TResult? Function(RemoveDirectoryTree value)? removeDirectoryTree,
    TResult? Function(SelectNode value)? selectNode,
    TResult? Function(ClearNodeSelection value)? clearNodeSelection,
    TResult? Function(SaveNodeAsSnippet value)? saveNodeAsSnippet,
    TResult? Function(ReplaceSelectionWith value)? replaceSelectionWith,
    TResult? Function(WrapSelectionWith value)? wrapSelectionWith,
    TResult? Function(AppendChild value)? appendChild,
    TResult? Function(AddSiblingBefore value)? addSiblingBefore,
    TResult? Function(AddSiblingAfter value)? addSiblingAfter,
    TResult? Function(PasteReplacement value)? pasteReplacement,
    TResult? Function(PasteChild value)? pasteChild,
    TResult? Function(PasteSiblingBefore value)? pasteSiblingBefore,
    TResult? Function(PasteSiblingAfter value)? pasteSiblingAfter,
    TResult? Function(DeleteNodeTapped value)? deleteNodeTapped,
    TResult? Function(CompleteDeletion value)? completeDeletion,
    TResult? Function(CopySnippetJsonToClipboard value)?
    copySnippetJsonToClipboard,
    TResult? Function(ReplaceSnippetFromJson value)? replaceSnippetFromJson,
    TResult? Function(CopyNode value)? copyNode,
    TResult? Function(CutNode value)? cutNode,
    TResult? Function(SelectedDirectoryOrNode value)? selectedDirectoryOrNode,
    TResult? Function(ImageChanged value)? imageChanged,
    TResult? Function(ForceSnippetRefresh value)? forceSnippetRefresh,
  }) {
    return exitSelectWidgetMode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SelectPanel value)? selectPanel,
    TResult Function(OverrideTargetGK value)? overrideTargetGK,
    TResult Function(ForceRefresh value)? forceRefresh,
    TResult Function(UpdateClipboard value)? updateClipboard,
    TResult Function(PublishSnippet value)? publishSnippet,
    TResult Function(RevertSnippet value)? revertSnippet,
    TResult Function(DeletePage value)? deletePage,
    TResult Function(ToggleAutoPublishingOfSnippet value)?
    toggleAutoPublishingOfSnippet,
    TResult Function(AutoPublishDefault value)? autoPublishDefault,
    TResult Function(HideIframes value)? hideIframes,
    TResult Function(SetPanelSnippet value)? setPanelOrPlaceholderSnippet,
    TResult Function(EnterSelectWidgetMode value)? enterSelectWidgetMode,
    TResult Function(ExitSelectWidgetMode value)? exitSelectWidgetMode,
    TResult Function(PushSnippetEditor value)? pushSnippetEditor,
    TResult Function(PopSnippetEditor value)? popSnippetEditor,
    TResult Function(ShowDirectoryTree value)? showDirectoryTree,
    TResult Function(RemoveDirectoryTree value)? removeDirectoryTree,
    TResult Function(SelectNode value)? selectNode,
    TResult Function(ClearNodeSelection value)? clearNodeSelection,
    TResult Function(SaveNodeAsSnippet value)? saveNodeAsSnippet,
    TResult Function(ReplaceSelectionWith value)? replaceSelectionWith,
    TResult Function(WrapSelectionWith value)? wrapSelectionWith,
    TResult Function(AppendChild value)? appendChild,
    TResult Function(AddSiblingBefore value)? addSiblingBefore,
    TResult Function(AddSiblingAfter value)? addSiblingAfter,
    TResult Function(PasteReplacement value)? pasteReplacement,
    TResult Function(PasteChild value)? pasteChild,
    TResult Function(PasteSiblingBefore value)? pasteSiblingBefore,
    TResult Function(PasteSiblingAfter value)? pasteSiblingAfter,
    TResult Function(DeleteNodeTapped value)? deleteNodeTapped,
    TResult Function(CompleteDeletion value)? completeDeletion,
    TResult Function(CopySnippetJsonToClipboard value)?
    copySnippetJsonToClipboard,
    TResult Function(ReplaceSnippetFromJson value)? replaceSnippetFromJson,
    TResult Function(CopyNode value)? copyNode,
    TResult Function(CutNode value)? cutNode,
    TResult Function(SelectedDirectoryOrNode value)? selectedDirectoryOrNode,
    TResult Function(ImageChanged value)? imageChanged,
    TResult Function(ForceSnippetRefresh value)? forceSnippetRefresh,
    required TResult orElse(),
  }) {
    if (exitSelectWidgetMode != null) {
      return exitSelectWidgetMode(this);
    }
    return orElse();
  }
}

abstract class ExitSelectWidgetMode implements CAPIEvent {
  const factory ExitSelectWidgetMode() = _$ExitSelectWidgetModeImpl;
}

/// @nodoc
abstract class _$$PushSnippetEditorImplCopyWith<$Res> {
  factory _$$PushSnippetEditorImplCopyWith(
    _$PushSnippetEditorImpl value,
    $Res Function(_$PushSnippetEditorImpl) then,
  ) = __$$PushSnippetEditorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SnippetRootNode rootNode, SNode? selectedNode});
}

/// @nodoc
class __$$PushSnippetEditorImplCopyWithImpl<$Res>
    extends _$CAPIEventCopyWithImpl<$Res, _$PushSnippetEditorImpl>
    implements _$$PushSnippetEditorImplCopyWith<$Res> {
  __$$PushSnippetEditorImplCopyWithImpl(
    _$PushSnippetEditorImpl _value,
    $Res Function(_$PushSnippetEditorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? rootNode = null, Object? selectedNode = freezed}) {
    return _then(
      _$PushSnippetEditorImpl(
        rootNode:
            null == rootNode
                ? _value.rootNode
                : rootNode // ignore: cast_nullable_to_non_nullable
                    as SnippetRootNode,
        selectedNode:
            freezed == selectedNode
                ? _value.selectedNode
                : selectedNode // ignore: cast_nullable_to_non_nullable
                    as SNode?,
      ),
    );
  }
}

/// @nodoc

class _$PushSnippetEditorImpl
    with DiagnosticableTreeMixin
    implements PushSnippetEditor {
  const _$PushSnippetEditorImpl({required this.rootNode, this.selectedNode});

  @override
  final SnippetRootNode rootNode;
  @override
  final SNode? selectedNode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CAPIEvent.pushSnippetEditor(rootNode: $rootNode, selectedNode: $selectedNode)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CAPIEvent.pushSnippetEditor'))
      ..add(DiagnosticsProperty('rootNode', rootNode))
      ..add(DiagnosticsProperty('selectedNode', selectedNode));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PushSnippetEditorImpl &&
            (identical(other.rootNode, rootNode) ||
                other.rootNode == rootNode) &&
            (identical(other.selectedNode, selectedNode) ||
                other.selectedNode == selectedNode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, rootNode, selectedNode);

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PushSnippetEditorImplCopyWith<_$PushSnippetEditorImpl> get copyWith =>
      __$$PushSnippetEditorImplCopyWithImpl<_$PushSnippetEditorImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? panelName) selectPanel,
    required TResult Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )
    overrideTargetGK,
    required TResult Function(bool onlyTargetsWrappers) forceRefresh,
    required TResult Function(
      SNode? newContent,
      String? scName,
      dynamic skipSave,
    )
    updateClipboard,
    required TResult Function(String snippetName, String versionId)
    publishSnippet,
    required TResult Function(String snippetName, String versionId)
    revertSnippet,
    required TResult Function(String pathName) deletePage,
    required TResult Function(String snippetName) toggleAutoPublishingOfSnippet,
    required TResult Function(bool b) autoPublishDefault,
    required TResult Function(bool hide) hideIframes,
    required TResult Function(String snippetName, String panelName)
    setPanelOrPlaceholderSnippet,
    required TResult Function(String snippetName) enterSelectWidgetMode,
    required TResult Function() exitSelectWidgetMode,
    required TResult Function(SnippetRootNode rootNode, SNode? selectedNode)
    pushSnippetEditor,
    required TResult Function(bool save) popSnippetEditor,
    required TResult Function() showDirectoryTree,
    required TResult Function(bool save) removeDirectoryTree,
    required TResult Function(SNode node) selectNode,
    required TResult Function() clearNodeSelection,
    required TResult Function(SNode node, String newSnippetName)
    saveNodeAsSnippet,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    replaceSelectionWith,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    wrapSelectionWith,
    required TResult Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )
    appendChild,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    addSiblingBefore,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    addSiblingAfter,
    required TResult Function(Type? widgetSpanChildType) pasteReplacement,
    required TResult Function(
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )
    pasteChild,
    required TResult Function() pasteSiblingBefore,
    required TResult Function() pasteSiblingAfter,
    required TResult Function() deleteNodeTapped,
    required TResult Function() completeDeletion,
    required TResult Function(SnippetRootNode rootNode)
    copySnippetJsonToClipboard,
    required TResult Function(String? snippetJson) replaceSnippetFromJson,
    required TResult Function(SNode node, String? scName, dynamic skipSave)
    copyNode,
    required TResult Function(SNode node, String? scName, dynamic skipSave)
    cutNode,
    required TResult Function(String snippetName, SNode? selectedNode)
    selectedDirectoryOrNode,
    required TResult Function(Uint8List? newBytes) imageChanged,
    required TResult Function() forceSnippetRefresh,
  }) {
    return pushSnippetEditor(rootNode, selectedNode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? panelName)? selectPanel,
    TResult? Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )?
    overrideTargetGK,
    TResult? Function(bool onlyTargetsWrappers)? forceRefresh,
    TResult? Function(SNode? newContent, String? scName, dynamic skipSave)?
    updateClipboard,
    TResult? Function(String snippetName, String versionId)? publishSnippet,
    TResult? Function(String snippetName, String versionId)? revertSnippet,
    TResult? Function(String pathName)? deletePage,
    TResult? Function(String snippetName)? toggleAutoPublishingOfSnippet,
    TResult? Function(bool b)? autoPublishDefault,
    TResult? Function(bool hide)? hideIframes,
    TResult? Function(String snippetName, String panelName)?
    setPanelOrPlaceholderSnippet,
    TResult? Function(String snippetName)? enterSelectWidgetMode,
    TResult? Function()? exitSelectWidgetMode,
    TResult? Function(SnippetRootNode rootNode, SNode? selectedNode)?
    pushSnippetEditor,
    TResult? Function(bool save)? popSnippetEditor,
    TResult? Function()? showDirectoryTree,
    TResult? Function(bool save)? removeDirectoryTree,
    TResult? Function(SNode node)? selectNode,
    TResult? Function()? clearNodeSelection,
    TResult? Function(SNode node, String newSnippetName)? saveNodeAsSnippet,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    replaceSelectionWith,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    wrapSelectionWith,
    TResult? Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    appendChild,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingBefore,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingAfter,
    TResult? Function(Type? widgetSpanChildType)? pasteReplacement,
    TResult? Function(
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    pasteChild,
    TResult? Function()? pasteSiblingBefore,
    TResult? Function()? pasteSiblingAfter,
    TResult? Function()? deleteNodeTapped,
    TResult? Function()? completeDeletion,
    TResult? Function(SnippetRootNode rootNode)? copySnippetJsonToClipboard,
    TResult? Function(String? snippetJson)? replaceSnippetFromJson,
    TResult? Function(SNode node, String? scName, dynamic skipSave)? copyNode,
    TResult? Function(SNode node, String? scName, dynamic skipSave)? cutNode,
    TResult? Function(String snippetName, SNode? selectedNode)?
    selectedDirectoryOrNode,
    TResult? Function(Uint8List? newBytes)? imageChanged,
    TResult? Function()? forceSnippetRefresh,
  }) {
    return pushSnippetEditor?.call(rootNode, selectedNode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? panelName)? selectPanel,
    TResult Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )?
    overrideTargetGK,
    TResult Function(bool onlyTargetsWrappers)? forceRefresh,
    TResult Function(SNode? newContent, String? scName, dynamic skipSave)?
    updateClipboard,
    TResult Function(String snippetName, String versionId)? publishSnippet,
    TResult Function(String snippetName, String versionId)? revertSnippet,
    TResult Function(String pathName)? deletePage,
    TResult Function(String snippetName)? toggleAutoPublishingOfSnippet,
    TResult Function(bool b)? autoPublishDefault,
    TResult Function(bool hide)? hideIframes,
    TResult Function(String snippetName, String panelName)?
    setPanelOrPlaceholderSnippet,
    TResult Function(String snippetName)? enterSelectWidgetMode,
    TResult Function()? exitSelectWidgetMode,
    TResult Function(SnippetRootNode rootNode, SNode? selectedNode)?
    pushSnippetEditor,
    TResult Function(bool save)? popSnippetEditor,
    TResult Function()? showDirectoryTree,
    TResult Function(bool save)? removeDirectoryTree,
    TResult Function(SNode node)? selectNode,
    TResult Function()? clearNodeSelection,
    TResult Function(SNode node, String newSnippetName)? saveNodeAsSnippet,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    replaceSelectionWith,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    wrapSelectionWith,
    TResult Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    appendChild,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingBefore,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingAfter,
    TResult Function(Type? widgetSpanChildType)? pasteReplacement,
    TResult Function(Type? widgetSpanChildType, SNode? testWidgetSpanChildNode)?
    pasteChild,
    TResult Function()? pasteSiblingBefore,
    TResult Function()? pasteSiblingAfter,
    TResult Function()? deleteNodeTapped,
    TResult Function()? completeDeletion,
    TResult Function(SnippetRootNode rootNode)? copySnippetJsonToClipboard,
    TResult Function(String? snippetJson)? replaceSnippetFromJson,
    TResult Function(SNode node, String? scName, dynamic skipSave)? copyNode,
    TResult Function(SNode node, String? scName, dynamic skipSave)? cutNode,
    TResult Function(String snippetName, SNode? selectedNode)?
    selectedDirectoryOrNode,
    TResult Function(Uint8List? newBytes)? imageChanged,
    TResult Function()? forceSnippetRefresh,
    required TResult orElse(),
  }) {
    if (pushSnippetEditor != null) {
      return pushSnippetEditor(rootNode, selectedNode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SelectPanel value) selectPanel,
    required TResult Function(OverrideTargetGK value) overrideTargetGK,
    required TResult Function(ForceRefresh value) forceRefresh,
    required TResult Function(UpdateClipboard value) updateClipboard,
    required TResult Function(PublishSnippet value) publishSnippet,
    required TResult Function(RevertSnippet value) revertSnippet,
    required TResult Function(DeletePage value) deletePage,
    required TResult Function(ToggleAutoPublishingOfSnippet value)
    toggleAutoPublishingOfSnippet,
    required TResult Function(AutoPublishDefault value) autoPublishDefault,
    required TResult Function(HideIframes value) hideIframes,
    required TResult Function(SetPanelSnippet value)
    setPanelOrPlaceholderSnippet,
    required TResult Function(EnterSelectWidgetMode value)
    enterSelectWidgetMode,
    required TResult Function(ExitSelectWidgetMode value) exitSelectWidgetMode,
    required TResult Function(PushSnippetEditor value) pushSnippetEditor,
    required TResult Function(PopSnippetEditor value) popSnippetEditor,
    required TResult Function(ShowDirectoryTree value) showDirectoryTree,
    required TResult Function(RemoveDirectoryTree value) removeDirectoryTree,
    required TResult Function(SelectNode value) selectNode,
    required TResult Function(ClearNodeSelection value) clearNodeSelection,
    required TResult Function(SaveNodeAsSnippet value) saveNodeAsSnippet,
    required TResult Function(ReplaceSelectionWith value) replaceSelectionWith,
    required TResult Function(WrapSelectionWith value) wrapSelectionWith,
    required TResult Function(AppendChild value) appendChild,
    required TResult Function(AddSiblingBefore value) addSiblingBefore,
    required TResult Function(AddSiblingAfter value) addSiblingAfter,
    required TResult Function(PasteReplacement value) pasteReplacement,
    required TResult Function(PasteChild value) pasteChild,
    required TResult Function(PasteSiblingBefore value) pasteSiblingBefore,
    required TResult Function(PasteSiblingAfter value) pasteSiblingAfter,
    required TResult Function(DeleteNodeTapped value) deleteNodeTapped,
    required TResult Function(CompleteDeletion value) completeDeletion,
    required TResult Function(CopySnippetJsonToClipboard value)
    copySnippetJsonToClipboard,
    required TResult Function(ReplaceSnippetFromJson value)
    replaceSnippetFromJson,
    required TResult Function(CopyNode value) copyNode,
    required TResult Function(CutNode value) cutNode,
    required TResult Function(SelectedDirectoryOrNode value)
    selectedDirectoryOrNode,
    required TResult Function(ImageChanged value) imageChanged,
    required TResult Function(ForceSnippetRefresh value) forceSnippetRefresh,
  }) {
    return pushSnippetEditor(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SelectPanel value)? selectPanel,
    TResult? Function(OverrideTargetGK value)? overrideTargetGK,
    TResult? Function(ForceRefresh value)? forceRefresh,
    TResult? Function(UpdateClipboard value)? updateClipboard,
    TResult? Function(PublishSnippet value)? publishSnippet,
    TResult? Function(RevertSnippet value)? revertSnippet,
    TResult? Function(DeletePage value)? deletePage,
    TResult? Function(ToggleAutoPublishingOfSnippet value)?
    toggleAutoPublishingOfSnippet,
    TResult? Function(AutoPublishDefault value)? autoPublishDefault,
    TResult? Function(HideIframes value)? hideIframes,
    TResult? Function(SetPanelSnippet value)? setPanelOrPlaceholderSnippet,
    TResult? Function(EnterSelectWidgetMode value)? enterSelectWidgetMode,
    TResult? Function(ExitSelectWidgetMode value)? exitSelectWidgetMode,
    TResult? Function(PushSnippetEditor value)? pushSnippetEditor,
    TResult? Function(PopSnippetEditor value)? popSnippetEditor,
    TResult? Function(ShowDirectoryTree value)? showDirectoryTree,
    TResult? Function(RemoveDirectoryTree value)? removeDirectoryTree,
    TResult? Function(SelectNode value)? selectNode,
    TResult? Function(ClearNodeSelection value)? clearNodeSelection,
    TResult? Function(SaveNodeAsSnippet value)? saveNodeAsSnippet,
    TResult? Function(ReplaceSelectionWith value)? replaceSelectionWith,
    TResult? Function(WrapSelectionWith value)? wrapSelectionWith,
    TResult? Function(AppendChild value)? appendChild,
    TResult? Function(AddSiblingBefore value)? addSiblingBefore,
    TResult? Function(AddSiblingAfter value)? addSiblingAfter,
    TResult? Function(PasteReplacement value)? pasteReplacement,
    TResult? Function(PasteChild value)? pasteChild,
    TResult? Function(PasteSiblingBefore value)? pasteSiblingBefore,
    TResult? Function(PasteSiblingAfter value)? pasteSiblingAfter,
    TResult? Function(DeleteNodeTapped value)? deleteNodeTapped,
    TResult? Function(CompleteDeletion value)? completeDeletion,
    TResult? Function(CopySnippetJsonToClipboard value)?
    copySnippetJsonToClipboard,
    TResult? Function(ReplaceSnippetFromJson value)? replaceSnippetFromJson,
    TResult? Function(CopyNode value)? copyNode,
    TResult? Function(CutNode value)? cutNode,
    TResult? Function(SelectedDirectoryOrNode value)? selectedDirectoryOrNode,
    TResult? Function(ImageChanged value)? imageChanged,
    TResult? Function(ForceSnippetRefresh value)? forceSnippetRefresh,
  }) {
    return pushSnippetEditor?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SelectPanel value)? selectPanel,
    TResult Function(OverrideTargetGK value)? overrideTargetGK,
    TResult Function(ForceRefresh value)? forceRefresh,
    TResult Function(UpdateClipboard value)? updateClipboard,
    TResult Function(PublishSnippet value)? publishSnippet,
    TResult Function(RevertSnippet value)? revertSnippet,
    TResult Function(DeletePage value)? deletePage,
    TResult Function(ToggleAutoPublishingOfSnippet value)?
    toggleAutoPublishingOfSnippet,
    TResult Function(AutoPublishDefault value)? autoPublishDefault,
    TResult Function(HideIframes value)? hideIframes,
    TResult Function(SetPanelSnippet value)? setPanelOrPlaceholderSnippet,
    TResult Function(EnterSelectWidgetMode value)? enterSelectWidgetMode,
    TResult Function(ExitSelectWidgetMode value)? exitSelectWidgetMode,
    TResult Function(PushSnippetEditor value)? pushSnippetEditor,
    TResult Function(PopSnippetEditor value)? popSnippetEditor,
    TResult Function(ShowDirectoryTree value)? showDirectoryTree,
    TResult Function(RemoveDirectoryTree value)? removeDirectoryTree,
    TResult Function(SelectNode value)? selectNode,
    TResult Function(ClearNodeSelection value)? clearNodeSelection,
    TResult Function(SaveNodeAsSnippet value)? saveNodeAsSnippet,
    TResult Function(ReplaceSelectionWith value)? replaceSelectionWith,
    TResult Function(WrapSelectionWith value)? wrapSelectionWith,
    TResult Function(AppendChild value)? appendChild,
    TResult Function(AddSiblingBefore value)? addSiblingBefore,
    TResult Function(AddSiblingAfter value)? addSiblingAfter,
    TResult Function(PasteReplacement value)? pasteReplacement,
    TResult Function(PasteChild value)? pasteChild,
    TResult Function(PasteSiblingBefore value)? pasteSiblingBefore,
    TResult Function(PasteSiblingAfter value)? pasteSiblingAfter,
    TResult Function(DeleteNodeTapped value)? deleteNodeTapped,
    TResult Function(CompleteDeletion value)? completeDeletion,
    TResult Function(CopySnippetJsonToClipboard value)?
    copySnippetJsonToClipboard,
    TResult Function(ReplaceSnippetFromJson value)? replaceSnippetFromJson,
    TResult Function(CopyNode value)? copyNode,
    TResult Function(CutNode value)? cutNode,
    TResult Function(SelectedDirectoryOrNode value)? selectedDirectoryOrNode,
    TResult Function(ImageChanged value)? imageChanged,
    TResult Function(ForceSnippetRefresh value)? forceSnippetRefresh,
    required TResult orElse(),
  }) {
    if (pushSnippetEditor != null) {
      return pushSnippetEditor(this);
    }
    return orElse();
  }
}

abstract class PushSnippetEditor implements CAPIEvent {
  const factory PushSnippetEditor({
    required final SnippetRootNode rootNode,
    final SNode? selectedNode,
  }) = _$PushSnippetEditorImpl;

  SnippetRootNode get rootNode;
  SNode? get selectedNode;

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PushSnippetEditorImplCopyWith<_$PushSnippetEditorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PopSnippetEditorImplCopyWith<$Res> {
  factory _$$PopSnippetEditorImplCopyWith(
    _$PopSnippetEditorImpl value,
    $Res Function(_$PopSnippetEditorImpl) then,
  ) = __$$PopSnippetEditorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool save});
}

/// @nodoc
class __$$PopSnippetEditorImplCopyWithImpl<$Res>
    extends _$CAPIEventCopyWithImpl<$Res, _$PopSnippetEditorImpl>
    implements _$$PopSnippetEditorImplCopyWith<$Res> {
  __$$PopSnippetEditorImplCopyWithImpl(
    _$PopSnippetEditorImpl _value,
    $Res Function(_$PopSnippetEditorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? save = null}) {
    return _then(
      _$PopSnippetEditorImpl(
        save:
            null == save
                ? _value.save
                : save // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc

class _$PopSnippetEditorImpl
    with DiagnosticableTreeMixin
    implements PopSnippetEditor {
  const _$PopSnippetEditorImpl({this.save = false});

  @override
  @JsonKey()
  final bool save;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CAPIEvent.popSnippetEditor(save: $save)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CAPIEvent.popSnippetEditor'))
      ..add(DiagnosticsProperty('save', save));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PopSnippetEditorImpl &&
            (identical(other.save, save) || other.save == save));
  }

  @override
  int get hashCode => Object.hash(runtimeType, save);

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PopSnippetEditorImplCopyWith<_$PopSnippetEditorImpl> get copyWith =>
      __$$PopSnippetEditorImplCopyWithImpl<_$PopSnippetEditorImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? panelName) selectPanel,
    required TResult Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )
    overrideTargetGK,
    required TResult Function(bool onlyTargetsWrappers) forceRefresh,
    required TResult Function(
      SNode? newContent,
      String? scName,
      dynamic skipSave,
    )
    updateClipboard,
    required TResult Function(String snippetName, String versionId)
    publishSnippet,
    required TResult Function(String snippetName, String versionId)
    revertSnippet,
    required TResult Function(String pathName) deletePage,
    required TResult Function(String snippetName) toggleAutoPublishingOfSnippet,
    required TResult Function(bool b) autoPublishDefault,
    required TResult Function(bool hide) hideIframes,
    required TResult Function(String snippetName, String panelName)
    setPanelOrPlaceholderSnippet,
    required TResult Function(String snippetName) enterSelectWidgetMode,
    required TResult Function() exitSelectWidgetMode,
    required TResult Function(SnippetRootNode rootNode, SNode? selectedNode)
    pushSnippetEditor,
    required TResult Function(bool save) popSnippetEditor,
    required TResult Function() showDirectoryTree,
    required TResult Function(bool save) removeDirectoryTree,
    required TResult Function(SNode node) selectNode,
    required TResult Function() clearNodeSelection,
    required TResult Function(SNode node, String newSnippetName)
    saveNodeAsSnippet,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    replaceSelectionWith,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    wrapSelectionWith,
    required TResult Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )
    appendChild,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    addSiblingBefore,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    addSiblingAfter,
    required TResult Function(Type? widgetSpanChildType) pasteReplacement,
    required TResult Function(
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )
    pasteChild,
    required TResult Function() pasteSiblingBefore,
    required TResult Function() pasteSiblingAfter,
    required TResult Function() deleteNodeTapped,
    required TResult Function() completeDeletion,
    required TResult Function(SnippetRootNode rootNode)
    copySnippetJsonToClipboard,
    required TResult Function(String? snippetJson) replaceSnippetFromJson,
    required TResult Function(SNode node, String? scName, dynamic skipSave)
    copyNode,
    required TResult Function(SNode node, String? scName, dynamic skipSave)
    cutNode,
    required TResult Function(String snippetName, SNode? selectedNode)
    selectedDirectoryOrNode,
    required TResult Function(Uint8List? newBytes) imageChanged,
    required TResult Function() forceSnippetRefresh,
  }) {
    return popSnippetEditor(save);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? panelName)? selectPanel,
    TResult? Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )?
    overrideTargetGK,
    TResult? Function(bool onlyTargetsWrappers)? forceRefresh,
    TResult? Function(SNode? newContent, String? scName, dynamic skipSave)?
    updateClipboard,
    TResult? Function(String snippetName, String versionId)? publishSnippet,
    TResult? Function(String snippetName, String versionId)? revertSnippet,
    TResult? Function(String pathName)? deletePage,
    TResult? Function(String snippetName)? toggleAutoPublishingOfSnippet,
    TResult? Function(bool b)? autoPublishDefault,
    TResult? Function(bool hide)? hideIframes,
    TResult? Function(String snippetName, String panelName)?
    setPanelOrPlaceholderSnippet,
    TResult? Function(String snippetName)? enterSelectWidgetMode,
    TResult? Function()? exitSelectWidgetMode,
    TResult? Function(SnippetRootNode rootNode, SNode? selectedNode)?
    pushSnippetEditor,
    TResult? Function(bool save)? popSnippetEditor,
    TResult? Function()? showDirectoryTree,
    TResult? Function(bool save)? removeDirectoryTree,
    TResult? Function(SNode node)? selectNode,
    TResult? Function()? clearNodeSelection,
    TResult? Function(SNode node, String newSnippetName)? saveNodeAsSnippet,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    replaceSelectionWith,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    wrapSelectionWith,
    TResult? Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    appendChild,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingBefore,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingAfter,
    TResult? Function(Type? widgetSpanChildType)? pasteReplacement,
    TResult? Function(
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    pasteChild,
    TResult? Function()? pasteSiblingBefore,
    TResult? Function()? pasteSiblingAfter,
    TResult? Function()? deleteNodeTapped,
    TResult? Function()? completeDeletion,
    TResult? Function(SnippetRootNode rootNode)? copySnippetJsonToClipboard,
    TResult? Function(String? snippetJson)? replaceSnippetFromJson,
    TResult? Function(SNode node, String? scName, dynamic skipSave)? copyNode,
    TResult? Function(SNode node, String? scName, dynamic skipSave)? cutNode,
    TResult? Function(String snippetName, SNode? selectedNode)?
    selectedDirectoryOrNode,
    TResult? Function(Uint8List? newBytes)? imageChanged,
    TResult? Function()? forceSnippetRefresh,
  }) {
    return popSnippetEditor?.call(save);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? panelName)? selectPanel,
    TResult Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )?
    overrideTargetGK,
    TResult Function(bool onlyTargetsWrappers)? forceRefresh,
    TResult Function(SNode? newContent, String? scName, dynamic skipSave)?
    updateClipboard,
    TResult Function(String snippetName, String versionId)? publishSnippet,
    TResult Function(String snippetName, String versionId)? revertSnippet,
    TResult Function(String pathName)? deletePage,
    TResult Function(String snippetName)? toggleAutoPublishingOfSnippet,
    TResult Function(bool b)? autoPublishDefault,
    TResult Function(bool hide)? hideIframes,
    TResult Function(String snippetName, String panelName)?
    setPanelOrPlaceholderSnippet,
    TResult Function(String snippetName)? enterSelectWidgetMode,
    TResult Function()? exitSelectWidgetMode,
    TResult Function(SnippetRootNode rootNode, SNode? selectedNode)?
    pushSnippetEditor,
    TResult Function(bool save)? popSnippetEditor,
    TResult Function()? showDirectoryTree,
    TResult Function(bool save)? removeDirectoryTree,
    TResult Function(SNode node)? selectNode,
    TResult Function()? clearNodeSelection,
    TResult Function(SNode node, String newSnippetName)? saveNodeAsSnippet,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    replaceSelectionWith,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    wrapSelectionWith,
    TResult Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    appendChild,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingBefore,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingAfter,
    TResult Function(Type? widgetSpanChildType)? pasteReplacement,
    TResult Function(Type? widgetSpanChildType, SNode? testWidgetSpanChildNode)?
    pasteChild,
    TResult Function()? pasteSiblingBefore,
    TResult Function()? pasteSiblingAfter,
    TResult Function()? deleteNodeTapped,
    TResult Function()? completeDeletion,
    TResult Function(SnippetRootNode rootNode)? copySnippetJsonToClipboard,
    TResult Function(String? snippetJson)? replaceSnippetFromJson,
    TResult Function(SNode node, String? scName, dynamic skipSave)? copyNode,
    TResult Function(SNode node, String? scName, dynamic skipSave)? cutNode,
    TResult Function(String snippetName, SNode? selectedNode)?
    selectedDirectoryOrNode,
    TResult Function(Uint8List? newBytes)? imageChanged,
    TResult Function()? forceSnippetRefresh,
    required TResult orElse(),
  }) {
    if (popSnippetEditor != null) {
      return popSnippetEditor(save);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SelectPanel value) selectPanel,
    required TResult Function(OverrideTargetGK value) overrideTargetGK,
    required TResult Function(ForceRefresh value) forceRefresh,
    required TResult Function(UpdateClipboard value) updateClipboard,
    required TResult Function(PublishSnippet value) publishSnippet,
    required TResult Function(RevertSnippet value) revertSnippet,
    required TResult Function(DeletePage value) deletePage,
    required TResult Function(ToggleAutoPublishingOfSnippet value)
    toggleAutoPublishingOfSnippet,
    required TResult Function(AutoPublishDefault value) autoPublishDefault,
    required TResult Function(HideIframes value) hideIframes,
    required TResult Function(SetPanelSnippet value)
    setPanelOrPlaceholderSnippet,
    required TResult Function(EnterSelectWidgetMode value)
    enterSelectWidgetMode,
    required TResult Function(ExitSelectWidgetMode value) exitSelectWidgetMode,
    required TResult Function(PushSnippetEditor value) pushSnippetEditor,
    required TResult Function(PopSnippetEditor value) popSnippetEditor,
    required TResult Function(ShowDirectoryTree value) showDirectoryTree,
    required TResult Function(RemoveDirectoryTree value) removeDirectoryTree,
    required TResult Function(SelectNode value) selectNode,
    required TResult Function(ClearNodeSelection value) clearNodeSelection,
    required TResult Function(SaveNodeAsSnippet value) saveNodeAsSnippet,
    required TResult Function(ReplaceSelectionWith value) replaceSelectionWith,
    required TResult Function(WrapSelectionWith value) wrapSelectionWith,
    required TResult Function(AppendChild value) appendChild,
    required TResult Function(AddSiblingBefore value) addSiblingBefore,
    required TResult Function(AddSiblingAfter value) addSiblingAfter,
    required TResult Function(PasteReplacement value) pasteReplacement,
    required TResult Function(PasteChild value) pasteChild,
    required TResult Function(PasteSiblingBefore value) pasteSiblingBefore,
    required TResult Function(PasteSiblingAfter value) pasteSiblingAfter,
    required TResult Function(DeleteNodeTapped value) deleteNodeTapped,
    required TResult Function(CompleteDeletion value) completeDeletion,
    required TResult Function(CopySnippetJsonToClipboard value)
    copySnippetJsonToClipboard,
    required TResult Function(ReplaceSnippetFromJson value)
    replaceSnippetFromJson,
    required TResult Function(CopyNode value) copyNode,
    required TResult Function(CutNode value) cutNode,
    required TResult Function(SelectedDirectoryOrNode value)
    selectedDirectoryOrNode,
    required TResult Function(ImageChanged value) imageChanged,
    required TResult Function(ForceSnippetRefresh value) forceSnippetRefresh,
  }) {
    return popSnippetEditor(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SelectPanel value)? selectPanel,
    TResult? Function(OverrideTargetGK value)? overrideTargetGK,
    TResult? Function(ForceRefresh value)? forceRefresh,
    TResult? Function(UpdateClipboard value)? updateClipboard,
    TResult? Function(PublishSnippet value)? publishSnippet,
    TResult? Function(RevertSnippet value)? revertSnippet,
    TResult? Function(DeletePage value)? deletePage,
    TResult? Function(ToggleAutoPublishingOfSnippet value)?
    toggleAutoPublishingOfSnippet,
    TResult? Function(AutoPublishDefault value)? autoPublishDefault,
    TResult? Function(HideIframes value)? hideIframes,
    TResult? Function(SetPanelSnippet value)? setPanelOrPlaceholderSnippet,
    TResult? Function(EnterSelectWidgetMode value)? enterSelectWidgetMode,
    TResult? Function(ExitSelectWidgetMode value)? exitSelectWidgetMode,
    TResult? Function(PushSnippetEditor value)? pushSnippetEditor,
    TResult? Function(PopSnippetEditor value)? popSnippetEditor,
    TResult? Function(ShowDirectoryTree value)? showDirectoryTree,
    TResult? Function(RemoveDirectoryTree value)? removeDirectoryTree,
    TResult? Function(SelectNode value)? selectNode,
    TResult? Function(ClearNodeSelection value)? clearNodeSelection,
    TResult? Function(SaveNodeAsSnippet value)? saveNodeAsSnippet,
    TResult? Function(ReplaceSelectionWith value)? replaceSelectionWith,
    TResult? Function(WrapSelectionWith value)? wrapSelectionWith,
    TResult? Function(AppendChild value)? appendChild,
    TResult? Function(AddSiblingBefore value)? addSiblingBefore,
    TResult? Function(AddSiblingAfter value)? addSiblingAfter,
    TResult? Function(PasteReplacement value)? pasteReplacement,
    TResult? Function(PasteChild value)? pasteChild,
    TResult? Function(PasteSiblingBefore value)? pasteSiblingBefore,
    TResult? Function(PasteSiblingAfter value)? pasteSiblingAfter,
    TResult? Function(DeleteNodeTapped value)? deleteNodeTapped,
    TResult? Function(CompleteDeletion value)? completeDeletion,
    TResult? Function(CopySnippetJsonToClipboard value)?
    copySnippetJsonToClipboard,
    TResult? Function(ReplaceSnippetFromJson value)? replaceSnippetFromJson,
    TResult? Function(CopyNode value)? copyNode,
    TResult? Function(CutNode value)? cutNode,
    TResult? Function(SelectedDirectoryOrNode value)? selectedDirectoryOrNode,
    TResult? Function(ImageChanged value)? imageChanged,
    TResult? Function(ForceSnippetRefresh value)? forceSnippetRefresh,
  }) {
    return popSnippetEditor?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SelectPanel value)? selectPanel,
    TResult Function(OverrideTargetGK value)? overrideTargetGK,
    TResult Function(ForceRefresh value)? forceRefresh,
    TResult Function(UpdateClipboard value)? updateClipboard,
    TResult Function(PublishSnippet value)? publishSnippet,
    TResult Function(RevertSnippet value)? revertSnippet,
    TResult Function(DeletePage value)? deletePage,
    TResult Function(ToggleAutoPublishingOfSnippet value)?
    toggleAutoPublishingOfSnippet,
    TResult Function(AutoPublishDefault value)? autoPublishDefault,
    TResult Function(HideIframes value)? hideIframes,
    TResult Function(SetPanelSnippet value)? setPanelOrPlaceholderSnippet,
    TResult Function(EnterSelectWidgetMode value)? enterSelectWidgetMode,
    TResult Function(ExitSelectWidgetMode value)? exitSelectWidgetMode,
    TResult Function(PushSnippetEditor value)? pushSnippetEditor,
    TResult Function(PopSnippetEditor value)? popSnippetEditor,
    TResult Function(ShowDirectoryTree value)? showDirectoryTree,
    TResult Function(RemoveDirectoryTree value)? removeDirectoryTree,
    TResult Function(SelectNode value)? selectNode,
    TResult Function(ClearNodeSelection value)? clearNodeSelection,
    TResult Function(SaveNodeAsSnippet value)? saveNodeAsSnippet,
    TResult Function(ReplaceSelectionWith value)? replaceSelectionWith,
    TResult Function(WrapSelectionWith value)? wrapSelectionWith,
    TResult Function(AppendChild value)? appendChild,
    TResult Function(AddSiblingBefore value)? addSiblingBefore,
    TResult Function(AddSiblingAfter value)? addSiblingAfter,
    TResult Function(PasteReplacement value)? pasteReplacement,
    TResult Function(PasteChild value)? pasteChild,
    TResult Function(PasteSiblingBefore value)? pasteSiblingBefore,
    TResult Function(PasteSiblingAfter value)? pasteSiblingAfter,
    TResult Function(DeleteNodeTapped value)? deleteNodeTapped,
    TResult Function(CompleteDeletion value)? completeDeletion,
    TResult Function(CopySnippetJsonToClipboard value)?
    copySnippetJsonToClipboard,
    TResult Function(ReplaceSnippetFromJson value)? replaceSnippetFromJson,
    TResult Function(CopyNode value)? copyNode,
    TResult Function(CutNode value)? cutNode,
    TResult Function(SelectedDirectoryOrNode value)? selectedDirectoryOrNode,
    TResult Function(ImageChanged value)? imageChanged,
    TResult Function(ForceSnippetRefresh value)? forceSnippetRefresh,
    required TResult orElse(),
  }) {
    if (popSnippetEditor != null) {
      return popSnippetEditor(this);
    }
    return orElse();
  }
}

abstract class PopSnippetEditor implements CAPIEvent {
  const factory PopSnippetEditor({final bool save}) = _$PopSnippetEditorImpl;

  bool get save;

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PopSnippetEditorImplCopyWith<_$PopSnippetEditorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ShowDirectoryTreeImplCopyWith<$Res> {
  factory _$$ShowDirectoryTreeImplCopyWith(
    _$ShowDirectoryTreeImpl value,
    $Res Function(_$ShowDirectoryTreeImpl) then,
  ) = __$$ShowDirectoryTreeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ShowDirectoryTreeImplCopyWithImpl<$Res>
    extends _$CAPIEventCopyWithImpl<$Res, _$ShowDirectoryTreeImpl>
    implements _$$ShowDirectoryTreeImplCopyWith<$Res> {
  __$$ShowDirectoryTreeImplCopyWithImpl(
    _$ShowDirectoryTreeImpl _value,
    $Res Function(_$ShowDirectoryTreeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ShowDirectoryTreeImpl
    with DiagnosticableTreeMixin
    implements ShowDirectoryTree {
  const _$ShowDirectoryTreeImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CAPIEvent.showDirectoryTree()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'CAPIEvent.showDirectoryTree'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ShowDirectoryTreeImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? panelName) selectPanel,
    required TResult Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )
    overrideTargetGK,
    required TResult Function(bool onlyTargetsWrappers) forceRefresh,
    required TResult Function(
      SNode? newContent,
      String? scName,
      dynamic skipSave,
    )
    updateClipboard,
    required TResult Function(String snippetName, String versionId)
    publishSnippet,
    required TResult Function(String snippetName, String versionId)
    revertSnippet,
    required TResult Function(String pathName) deletePage,
    required TResult Function(String snippetName) toggleAutoPublishingOfSnippet,
    required TResult Function(bool b) autoPublishDefault,
    required TResult Function(bool hide) hideIframes,
    required TResult Function(String snippetName, String panelName)
    setPanelOrPlaceholderSnippet,
    required TResult Function(String snippetName) enterSelectWidgetMode,
    required TResult Function() exitSelectWidgetMode,
    required TResult Function(SnippetRootNode rootNode, SNode? selectedNode)
    pushSnippetEditor,
    required TResult Function(bool save) popSnippetEditor,
    required TResult Function() showDirectoryTree,
    required TResult Function(bool save) removeDirectoryTree,
    required TResult Function(SNode node) selectNode,
    required TResult Function() clearNodeSelection,
    required TResult Function(SNode node, String newSnippetName)
    saveNodeAsSnippet,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    replaceSelectionWith,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    wrapSelectionWith,
    required TResult Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )
    appendChild,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    addSiblingBefore,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    addSiblingAfter,
    required TResult Function(Type? widgetSpanChildType) pasteReplacement,
    required TResult Function(
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )
    pasteChild,
    required TResult Function() pasteSiblingBefore,
    required TResult Function() pasteSiblingAfter,
    required TResult Function() deleteNodeTapped,
    required TResult Function() completeDeletion,
    required TResult Function(SnippetRootNode rootNode)
    copySnippetJsonToClipboard,
    required TResult Function(String? snippetJson) replaceSnippetFromJson,
    required TResult Function(SNode node, String? scName, dynamic skipSave)
    copyNode,
    required TResult Function(SNode node, String? scName, dynamic skipSave)
    cutNode,
    required TResult Function(String snippetName, SNode? selectedNode)
    selectedDirectoryOrNode,
    required TResult Function(Uint8List? newBytes) imageChanged,
    required TResult Function() forceSnippetRefresh,
  }) {
    return showDirectoryTree();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? panelName)? selectPanel,
    TResult? Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )?
    overrideTargetGK,
    TResult? Function(bool onlyTargetsWrappers)? forceRefresh,
    TResult? Function(SNode? newContent, String? scName, dynamic skipSave)?
    updateClipboard,
    TResult? Function(String snippetName, String versionId)? publishSnippet,
    TResult? Function(String snippetName, String versionId)? revertSnippet,
    TResult? Function(String pathName)? deletePage,
    TResult? Function(String snippetName)? toggleAutoPublishingOfSnippet,
    TResult? Function(bool b)? autoPublishDefault,
    TResult? Function(bool hide)? hideIframes,
    TResult? Function(String snippetName, String panelName)?
    setPanelOrPlaceholderSnippet,
    TResult? Function(String snippetName)? enterSelectWidgetMode,
    TResult? Function()? exitSelectWidgetMode,
    TResult? Function(SnippetRootNode rootNode, SNode? selectedNode)?
    pushSnippetEditor,
    TResult? Function(bool save)? popSnippetEditor,
    TResult? Function()? showDirectoryTree,
    TResult? Function(bool save)? removeDirectoryTree,
    TResult? Function(SNode node)? selectNode,
    TResult? Function()? clearNodeSelection,
    TResult? Function(SNode node, String newSnippetName)? saveNodeAsSnippet,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    replaceSelectionWith,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    wrapSelectionWith,
    TResult? Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    appendChild,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingBefore,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingAfter,
    TResult? Function(Type? widgetSpanChildType)? pasteReplacement,
    TResult? Function(
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    pasteChild,
    TResult? Function()? pasteSiblingBefore,
    TResult? Function()? pasteSiblingAfter,
    TResult? Function()? deleteNodeTapped,
    TResult? Function()? completeDeletion,
    TResult? Function(SnippetRootNode rootNode)? copySnippetJsonToClipboard,
    TResult? Function(String? snippetJson)? replaceSnippetFromJson,
    TResult? Function(SNode node, String? scName, dynamic skipSave)? copyNode,
    TResult? Function(SNode node, String? scName, dynamic skipSave)? cutNode,
    TResult? Function(String snippetName, SNode? selectedNode)?
    selectedDirectoryOrNode,
    TResult? Function(Uint8List? newBytes)? imageChanged,
    TResult? Function()? forceSnippetRefresh,
  }) {
    return showDirectoryTree?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? panelName)? selectPanel,
    TResult Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )?
    overrideTargetGK,
    TResult Function(bool onlyTargetsWrappers)? forceRefresh,
    TResult Function(SNode? newContent, String? scName, dynamic skipSave)?
    updateClipboard,
    TResult Function(String snippetName, String versionId)? publishSnippet,
    TResult Function(String snippetName, String versionId)? revertSnippet,
    TResult Function(String pathName)? deletePage,
    TResult Function(String snippetName)? toggleAutoPublishingOfSnippet,
    TResult Function(bool b)? autoPublishDefault,
    TResult Function(bool hide)? hideIframes,
    TResult Function(String snippetName, String panelName)?
    setPanelOrPlaceholderSnippet,
    TResult Function(String snippetName)? enterSelectWidgetMode,
    TResult Function()? exitSelectWidgetMode,
    TResult Function(SnippetRootNode rootNode, SNode? selectedNode)?
    pushSnippetEditor,
    TResult Function(bool save)? popSnippetEditor,
    TResult Function()? showDirectoryTree,
    TResult Function(bool save)? removeDirectoryTree,
    TResult Function(SNode node)? selectNode,
    TResult Function()? clearNodeSelection,
    TResult Function(SNode node, String newSnippetName)? saveNodeAsSnippet,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    replaceSelectionWith,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    wrapSelectionWith,
    TResult Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    appendChild,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingBefore,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingAfter,
    TResult Function(Type? widgetSpanChildType)? pasteReplacement,
    TResult Function(Type? widgetSpanChildType, SNode? testWidgetSpanChildNode)?
    pasteChild,
    TResult Function()? pasteSiblingBefore,
    TResult Function()? pasteSiblingAfter,
    TResult Function()? deleteNodeTapped,
    TResult Function()? completeDeletion,
    TResult Function(SnippetRootNode rootNode)? copySnippetJsonToClipboard,
    TResult Function(String? snippetJson)? replaceSnippetFromJson,
    TResult Function(SNode node, String? scName, dynamic skipSave)? copyNode,
    TResult Function(SNode node, String? scName, dynamic skipSave)? cutNode,
    TResult Function(String snippetName, SNode? selectedNode)?
    selectedDirectoryOrNode,
    TResult Function(Uint8List? newBytes)? imageChanged,
    TResult Function()? forceSnippetRefresh,
    required TResult orElse(),
  }) {
    if (showDirectoryTree != null) {
      return showDirectoryTree();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SelectPanel value) selectPanel,
    required TResult Function(OverrideTargetGK value) overrideTargetGK,
    required TResult Function(ForceRefresh value) forceRefresh,
    required TResult Function(UpdateClipboard value) updateClipboard,
    required TResult Function(PublishSnippet value) publishSnippet,
    required TResult Function(RevertSnippet value) revertSnippet,
    required TResult Function(DeletePage value) deletePage,
    required TResult Function(ToggleAutoPublishingOfSnippet value)
    toggleAutoPublishingOfSnippet,
    required TResult Function(AutoPublishDefault value) autoPublishDefault,
    required TResult Function(HideIframes value) hideIframes,
    required TResult Function(SetPanelSnippet value)
    setPanelOrPlaceholderSnippet,
    required TResult Function(EnterSelectWidgetMode value)
    enterSelectWidgetMode,
    required TResult Function(ExitSelectWidgetMode value) exitSelectWidgetMode,
    required TResult Function(PushSnippetEditor value) pushSnippetEditor,
    required TResult Function(PopSnippetEditor value) popSnippetEditor,
    required TResult Function(ShowDirectoryTree value) showDirectoryTree,
    required TResult Function(RemoveDirectoryTree value) removeDirectoryTree,
    required TResult Function(SelectNode value) selectNode,
    required TResult Function(ClearNodeSelection value) clearNodeSelection,
    required TResult Function(SaveNodeAsSnippet value) saveNodeAsSnippet,
    required TResult Function(ReplaceSelectionWith value) replaceSelectionWith,
    required TResult Function(WrapSelectionWith value) wrapSelectionWith,
    required TResult Function(AppendChild value) appendChild,
    required TResult Function(AddSiblingBefore value) addSiblingBefore,
    required TResult Function(AddSiblingAfter value) addSiblingAfter,
    required TResult Function(PasteReplacement value) pasteReplacement,
    required TResult Function(PasteChild value) pasteChild,
    required TResult Function(PasteSiblingBefore value) pasteSiblingBefore,
    required TResult Function(PasteSiblingAfter value) pasteSiblingAfter,
    required TResult Function(DeleteNodeTapped value) deleteNodeTapped,
    required TResult Function(CompleteDeletion value) completeDeletion,
    required TResult Function(CopySnippetJsonToClipboard value)
    copySnippetJsonToClipboard,
    required TResult Function(ReplaceSnippetFromJson value)
    replaceSnippetFromJson,
    required TResult Function(CopyNode value) copyNode,
    required TResult Function(CutNode value) cutNode,
    required TResult Function(SelectedDirectoryOrNode value)
    selectedDirectoryOrNode,
    required TResult Function(ImageChanged value) imageChanged,
    required TResult Function(ForceSnippetRefresh value) forceSnippetRefresh,
  }) {
    return showDirectoryTree(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SelectPanel value)? selectPanel,
    TResult? Function(OverrideTargetGK value)? overrideTargetGK,
    TResult? Function(ForceRefresh value)? forceRefresh,
    TResult? Function(UpdateClipboard value)? updateClipboard,
    TResult? Function(PublishSnippet value)? publishSnippet,
    TResult? Function(RevertSnippet value)? revertSnippet,
    TResult? Function(DeletePage value)? deletePage,
    TResult? Function(ToggleAutoPublishingOfSnippet value)?
    toggleAutoPublishingOfSnippet,
    TResult? Function(AutoPublishDefault value)? autoPublishDefault,
    TResult? Function(HideIframes value)? hideIframes,
    TResult? Function(SetPanelSnippet value)? setPanelOrPlaceholderSnippet,
    TResult? Function(EnterSelectWidgetMode value)? enterSelectWidgetMode,
    TResult? Function(ExitSelectWidgetMode value)? exitSelectWidgetMode,
    TResult? Function(PushSnippetEditor value)? pushSnippetEditor,
    TResult? Function(PopSnippetEditor value)? popSnippetEditor,
    TResult? Function(ShowDirectoryTree value)? showDirectoryTree,
    TResult? Function(RemoveDirectoryTree value)? removeDirectoryTree,
    TResult? Function(SelectNode value)? selectNode,
    TResult? Function(ClearNodeSelection value)? clearNodeSelection,
    TResult? Function(SaveNodeAsSnippet value)? saveNodeAsSnippet,
    TResult? Function(ReplaceSelectionWith value)? replaceSelectionWith,
    TResult? Function(WrapSelectionWith value)? wrapSelectionWith,
    TResult? Function(AppendChild value)? appendChild,
    TResult? Function(AddSiblingBefore value)? addSiblingBefore,
    TResult? Function(AddSiblingAfter value)? addSiblingAfter,
    TResult? Function(PasteReplacement value)? pasteReplacement,
    TResult? Function(PasteChild value)? pasteChild,
    TResult? Function(PasteSiblingBefore value)? pasteSiblingBefore,
    TResult? Function(PasteSiblingAfter value)? pasteSiblingAfter,
    TResult? Function(DeleteNodeTapped value)? deleteNodeTapped,
    TResult? Function(CompleteDeletion value)? completeDeletion,
    TResult? Function(CopySnippetJsonToClipboard value)?
    copySnippetJsonToClipboard,
    TResult? Function(ReplaceSnippetFromJson value)? replaceSnippetFromJson,
    TResult? Function(CopyNode value)? copyNode,
    TResult? Function(CutNode value)? cutNode,
    TResult? Function(SelectedDirectoryOrNode value)? selectedDirectoryOrNode,
    TResult? Function(ImageChanged value)? imageChanged,
    TResult? Function(ForceSnippetRefresh value)? forceSnippetRefresh,
  }) {
    return showDirectoryTree?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SelectPanel value)? selectPanel,
    TResult Function(OverrideTargetGK value)? overrideTargetGK,
    TResult Function(ForceRefresh value)? forceRefresh,
    TResult Function(UpdateClipboard value)? updateClipboard,
    TResult Function(PublishSnippet value)? publishSnippet,
    TResult Function(RevertSnippet value)? revertSnippet,
    TResult Function(DeletePage value)? deletePage,
    TResult Function(ToggleAutoPublishingOfSnippet value)?
    toggleAutoPublishingOfSnippet,
    TResult Function(AutoPublishDefault value)? autoPublishDefault,
    TResult Function(HideIframes value)? hideIframes,
    TResult Function(SetPanelSnippet value)? setPanelOrPlaceholderSnippet,
    TResult Function(EnterSelectWidgetMode value)? enterSelectWidgetMode,
    TResult Function(ExitSelectWidgetMode value)? exitSelectWidgetMode,
    TResult Function(PushSnippetEditor value)? pushSnippetEditor,
    TResult Function(PopSnippetEditor value)? popSnippetEditor,
    TResult Function(ShowDirectoryTree value)? showDirectoryTree,
    TResult Function(RemoveDirectoryTree value)? removeDirectoryTree,
    TResult Function(SelectNode value)? selectNode,
    TResult Function(ClearNodeSelection value)? clearNodeSelection,
    TResult Function(SaveNodeAsSnippet value)? saveNodeAsSnippet,
    TResult Function(ReplaceSelectionWith value)? replaceSelectionWith,
    TResult Function(WrapSelectionWith value)? wrapSelectionWith,
    TResult Function(AppendChild value)? appendChild,
    TResult Function(AddSiblingBefore value)? addSiblingBefore,
    TResult Function(AddSiblingAfter value)? addSiblingAfter,
    TResult Function(PasteReplacement value)? pasteReplacement,
    TResult Function(PasteChild value)? pasteChild,
    TResult Function(PasteSiblingBefore value)? pasteSiblingBefore,
    TResult Function(PasteSiblingAfter value)? pasteSiblingAfter,
    TResult Function(DeleteNodeTapped value)? deleteNodeTapped,
    TResult Function(CompleteDeletion value)? completeDeletion,
    TResult Function(CopySnippetJsonToClipboard value)?
    copySnippetJsonToClipboard,
    TResult Function(ReplaceSnippetFromJson value)? replaceSnippetFromJson,
    TResult Function(CopyNode value)? copyNode,
    TResult Function(CutNode value)? cutNode,
    TResult Function(SelectedDirectoryOrNode value)? selectedDirectoryOrNode,
    TResult Function(ImageChanged value)? imageChanged,
    TResult Function(ForceSnippetRefresh value)? forceSnippetRefresh,
    required TResult orElse(),
  }) {
    if (showDirectoryTree != null) {
      return showDirectoryTree(this);
    }
    return orElse();
  }
}

abstract class ShowDirectoryTree implements CAPIEvent {
  const factory ShowDirectoryTree() = _$ShowDirectoryTreeImpl;
}

/// @nodoc
abstract class _$$RemoveDirectoryTreeImplCopyWith<$Res> {
  factory _$$RemoveDirectoryTreeImplCopyWith(
    _$RemoveDirectoryTreeImpl value,
    $Res Function(_$RemoveDirectoryTreeImpl) then,
  ) = __$$RemoveDirectoryTreeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool save});
}

/// @nodoc
class __$$RemoveDirectoryTreeImplCopyWithImpl<$Res>
    extends _$CAPIEventCopyWithImpl<$Res, _$RemoveDirectoryTreeImpl>
    implements _$$RemoveDirectoryTreeImplCopyWith<$Res> {
  __$$RemoveDirectoryTreeImplCopyWithImpl(
    _$RemoveDirectoryTreeImpl _value,
    $Res Function(_$RemoveDirectoryTreeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? save = null}) {
    return _then(
      _$RemoveDirectoryTreeImpl(
        save:
            null == save
                ? _value.save
                : save // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc

class _$RemoveDirectoryTreeImpl
    with DiagnosticableTreeMixin
    implements RemoveDirectoryTree {
  const _$RemoveDirectoryTreeImpl({this.save = false});

  @override
  @JsonKey()
  final bool save;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CAPIEvent.removeDirectoryTree(save: $save)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CAPIEvent.removeDirectoryTree'))
      ..add(DiagnosticsProperty('save', save));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveDirectoryTreeImpl &&
            (identical(other.save, save) || other.save == save));
  }

  @override
  int get hashCode => Object.hash(runtimeType, save);

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveDirectoryTreeImplCopyWith<_$RemoveDirectoryTreeImpl> get copyWith =>
      __$$RemoveDirectoryTreeImplCopyWithImpl<_$RemoveDirectoryTreeImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? panelName) selectPanel,
    required TResult Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )
    overrideTargetGK,
    required TResult Function(bool onlyTargetsWrappers) forceRefresh,
    required TResult Function(
      SNode? newContent,
      String? scName,
      dynamic skipSave,
    )
    updateClipboard,
    required TResult Function(String snippetName, String versionId)
    publishSnippet,
    required TResult Function(String snippetName, String versionId)
    revertSnippet,
    required TResult Function(String pathName) deletePage,
    required TResult Function(String snippetName) toggleAutoPublishingOfSnippet,
    required TResult Function(bool b) autoPublishDefault,
    required TResult Function(bool hide) hideIframes,
    required TResult Function(String snippetName, String panelName)
    setPanelOrPlaceholderSnippet,
    required TResult Function(String snippetName) enterSelectWidgetMode,
    required TResult Function() exitSelectWidgetMode,
    required TResult Function(SnippetRootNode rootNode, SNode? selectedNode)
    pushSnippetEditor,
    required TResult Function(bool save) popSnippetEditor,
    required TResult Function() showDirectoryTree,
    required TResult Function(bool save) removeDirectoryTree,
    required TResult Function(SNode node) selectNode,
    required TResult Function() clearNodeSelection,
    required TResult Function(SNode node, String newSnippetName)
    saveNodeAsSnippet,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    replaceSelectionWith,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    wrapSelectionWith,
    required TResult Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )
    appendChild,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    addSiblingBefore,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    addSiblingAfter,
    required TResult Function(Type? widgetSpanChildType) pasteReplacement,
    required TResult Function(
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )
    pasteChild,
    required TResult Function() pasteSiblingBefore,
    required TResult Function() pasteSiblingAfter,
    required TResult Function() deleteNodeTapped,
    required TResult Function() completeDeletion,
    required TResult Function(SnippetRootNode rootNode)
    copySnippetJsonToClipboard,
    required TResult Function(String? snippetJson) replaceSnippetFromJson,
    required TResult Function(SNode node, String? scName, dynamic skipSave)
    copyNode,
    required TResult Function(SNode node, String? scName, dynamic skipSave)
    cutNode,
    required TResult Function(String snippetName, SNode? selectedNode)
    selectedDirectoryOrNode,
    required TResult Function(Uint8List? newBytes) imageChanged,
    required TResult Function() forceSnippetRefresh,
  }) {
    return removeDirectoryTree(save);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? panelName)? selectPanel,
    TResult? Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )?
    overrideTargetGK,
    TResult? Function(bool onlyTargetsWrappers)? forceRefresh,
    TResult? Function(SNode? newContent, String? scName, dynamic skipSave)?
    updateClipboard,
    TResult? Function(String snippetName, String versionId)? publishSnippet,
    TResult? Function(String snippetName, String versionId)? revertSnippet,
    TResult? Function(String pathName)? deletePage,
    TResult? Function(String snippetName)? toggleAutoPublishingOfSnippet,
    TResult? Function(bool b)? autoPublishDefault,
    TResult? Function(bool hide)? hideIframes,
    TResult? Function(String snippetName, String panelName)?
    setPanelOrPlaceholderSnippet,
    TResult? Function(String snippetName)? enterSelectWidgetMode,
    TResult? Function()? exitSelectWidgetMode,
    TResult? Function(SnippetRootNode rootNode, SNode? selectedNode)?
    pushSnippetEditor,
    TResult? Function(bool save)? popSnippetEditor,
    TResult? Function()? showDirectoryTree,
    TResult? Function(bool save)? removeDirectoryTree,
    TResult? Function(SNode node)? selectNode,
    TResult? Function()? clearNodeSelection,
    TResult? Function(SNode node, String newSnippetName)? saveNodeAsSnippet,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    replaceSelectionWith,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    wrapSelectionWith,
    TResult? Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    appendChild,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingBefore,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingAfter,
    TResult? Function(Type? widgetSpanChildType)? pasteReplacement,
    TResult? Function(
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    pasteChild,
    TResult? Function()? pasteSiblingBefore,
    TResult? Function()? pasteSiblingAfter,
    TResult? Function()? deleteNodeTapped,
    TResult? Function()? completeDeletion,
    TResult? Function(SnippetRootNode rootNode)? copySnippetJsonToClipboard,
    TResult? Function(String? snippetJson)? replaceSnippetFromJson,
    TResult? Function(SNode node, String? scName, dynamic skipSave)? copyNode,
    TResult? Function(SNode node, String? scName, dynamic skipSave)? cutNode,
    TResult? Function(String snippetName, SNode? selectedNode)?
    selectedDirectoryOrNode,
    TResult? Function(Uint8List? newBytes)? imageChanged,
    TResult? Function()? forceSnippetRefresh,
  }) {
    return removeDirectoryTree?.call(save);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? panelName)? selectPanel,
    TResult Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )?
    overrideTargetGK,
    TResult Function(bool onlyTargetsWrappers)? forceRefresh,
    TResult Function(SNode? newContent, String? scName, dynamic skipSave)?
    updateClipboard,
    TResult Function(String snippetName, String versionId)? publishSnippet,
    TResult Function(String snippetName, String versionId)? revertSnippet,
    TResult Function(String pathName)? deletePage,
    TResult Function(String snippetName)? toggleAutoPublishingOfSnippet,
    TResult Function(bool b)? autoPublishDefault,
    TResult Function(bool hide)? hideIframes,
    TResult Function(String snippetName, String panelName)?
    setPanelOrPlaceholderSnippet,
    TResult Function(String snippetName)? enterSelectWidgetMode,
    TResult Function()? exitSelectWidgetMode,
    TResult Function(SnippetRootNode rootNode, SNode? selectedNode)?
    pushSnippetEditor,
    TResult Function(bool save)? popSnippetEditor,
    TResult Function()? showDirectoryTree,
    TResult Function(bool save)? removeDirectoryTree,
    TResult Function(SNode node)? selectNode,
    TResult Function()? clearNodeSelection,
    TResult Function(SNode node, String newSnippetName)? saveNodeAsSnippet,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    replaceSelectionWith,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    wrapSelectionWith,
    TResult Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    appendChild,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingBefore,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingAfter,
    TResult Function(Type? widgetSpanChildType)? pasteReplacement,
    TResult Function(Type? widgetSpanChildType, SNode? testWidgetSpanChildNode)?
    pasteChild,
    TResult Function()? pasteSiblingBefore,
    TResult Function()? pasteSiblingAfter,
    TResult Function()? deleteNodeTapped,
    TResult Function()? completeDeletion,
    TResult Function(SnippetRootNode rootNode)? copySnippetJsonToClipboard,
    TResult Function(String? snippetJson)? replaceSnippetFromJson,
    TResult Function(SNode node, String? scName, dynamic skipSave)? copyNode,
    TResult Function(SNode node, String? scName, dynamic skipSave)? cutNode,
    TResult Function(String snippetName, SNode? selectedNode)?
    selectedDirectoryOrNode,
    TResult Function(Uint8List? newBytes)? imageChanged,
    TResult Function()? forceSnippetRefresh,
    required TResult orElse(),
  }) {
    if (removeDirectoryTree != null) {
      return removeDirectoryTree(save);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SelectPanel value) selectPanel,
    required TResult Function(OverrideTargetGK value) overrideTargetGK,
    required TResult Function(ForceRefresh value) forceRefresh,
    required TResult Function(UpdateClipboard value) updateClipboard,
    required TResult Function(PublishSnippet value) publishSnippet,
    required TResult Function(RevertSnippet value) revertSnippet,
    required TResult Function(DeletePage value) deletePage,
    required TResult Function(ToggleAutoPublishingOfSnippet value)
    toggleAutoPublishingOfSnippet,
    required TResult Function(AutoPublishDefault value) autoPublishDefault,
    required TResult Function(HideIframes value) hideIframes,
    required TResult Function(SetPanelSnippet value)
    setPanelOrPlaceholderSnippet,
    required TResult Function(EnterSelectWidgetMode value)
    enterSelectWidgetMode,
    required TResult Function(ExitSelectWidgetMode value) exitSelectWidgetMode,
    required TResult Function(PushSnippetEditor value) pushSnippetEditor,
    required TResult Function(PopSnippetEditor value) popSnippetEditor,
    required TResult Function(ShowDirectoryTree value) showDirectoryTree,
    required TResult Function(RemoveDirectoryTree value) removeDirectoryTree,
    required TResult Function(SelectNode value) selectNode,
    required TResult Function(ClearNodeSelection value) clearNodeSelection,
    required TResult Function(SaveNodeAsSnippet value) saveNodeAsSnippet,
    required TResult Function(ReplaceSelectionWith value) replaceSelectionWith,
    required TResult Function(WrapSelectionWith value) wrapSelectionWith,
    required TResult Function(AppendChild value) appendChild,
    required TResult Function(AddSiblingBefore value) addSiblingBefore,
    required TResult Function(AddSiblingAfter value) addSiblingAfter,
    required TResult Function(PasteReplacement value) pasteReplacement,
    required TResult Function(PasteChild value) pasteChild,
    required TResult Function(PasteSiblingBefore value) pasteSiblingBefore,
    required TResult Function(PasteSiblingAfter value) pasteSiblingAfter,
    required TResult Function(DeleteNodeTapped value) deleteNodeTapped,
    required TResult Function(CompleteDeletion value) completeDeletion,
    required TResult Function(CopySnippetJsonToClipboard value)
    copySnippetJsonToClipboard,
    required TResult Function(ReplaceSnippetFromJson value)
    replaceSnippetFromJson,
    required TResult Function(CopyNode value) copyNode,
    required TResult Function(CutNode value) cutNode,
    required TResult Function(SelectedDirectoryOrNode value)
    selectedDirectoryOrNode,
    required TResult Function(ImageChanged value) imageChanged,
    required TResult Function(ForceSnippetRefresh value) forceSnippetRefresh,
  }) {
    return removeDirectoryTree(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SelectPanel value)? selectPanel,
    TResult? Function(OverrideTargetGK value)? overrideTargetGK,
    TResult? Function(ForceRefresh value)? forceRefresh,
    TResult? Function(UpdateClipboard value)? updateClipboard,
    TResult? Function(PublishSnippet value)? publishSnippet,
    TResult? Function(RevertSnippet value)? revertSnippet,
    TResult? Function(DeletePage value)? deletePage,
    TResult? Function(ToggleAutoPublishingOfSnippet value)?
    toggleAutoPublishingOfSnippet,
    TResult? Function(AutoPublishDefault value)? autoPublishDefault,
    TResult? Function(HideIframes value)? hideIframes,
    TResult? Function(SetPanelSnippet value)? setPanelOrPlaceholderSnippet,
    TResult? Function(EnterSelectWidgetMode value)? enterSelectWidgetMode,
    TResult? Function(ExitSelectWidgetMode value)? exitSelectWidgetMode,
    TResult? Function(PushSnippetEditor value)? pushSnippetEditor,
    TResult? Function(PopSnippetEditor value)? popSnippetEditor,
    TResult? Function(ShowDirectoryTree value)? showDirectoryTree,
    TResult? Function(RemoveDirectoryTree value)? removeDirectoryTree,
    TResult? Function(SelectNode value)? selectNode,
    TResult? Function(ClearNodeSelection value)? clearNodeSelection,
    TResult? Function(SaveNodeAsSnippet value)? saveNodeAsSnippet,
    TResult? Function(ReplaceSelectionWith value)? replaceSelectionWith,
    TResult? Function(WrapSelectionWith value)? wrapSelectionWith,
    TResult? Function(AppendChild value)? appendChild,
    TResult? Function(AddSiblingBefore value)? addSiblingBefore,
    TResult? Function(AddSiblingAfter value)? addSiblingAfter,
    TResult? Function(PasteReplacement value)? pasteReplacement,
    TResult? Function(PasteChild value)? pasteChild,
    TResult? Function(PasteSiblingBefore value)? pasteSiblingBefore,
    TResult? Function(PasteSiblingAfter value)? pasteSiblingAfter,
    TResult? Function(DeleteNodeTapped value)? deleteNodeTapped,
    TResult? Function(CompleteDeletion value)? completeDeletion,
    TResult? Function(CopySnippetJsonToClipboard value)?
    copySnippetJsonToClipboard,
    TResult? Function(ReplaceSnippetFromJson value)? replaceSnippetFromJson,
    TResult? Function(CopyNode value)? copyNode,
    TResult? Function(CutNode value)? cutNode,
    TResult? Function(SelectedDirectoryOrNode value)? selectedDirectoryOrNode,
    TResult? Function(ImageChanged value)? imageChanged,
    TResult? Function(ForceSnippetRefresh value)? forceSnippetRefresh,
  }) {
    return removeDirectoryTree?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SelectPanel value)? selectPanel,
    TResult Function(OverrideTargetGK value)? overrideTargetGK,
    TResult Function(ForceRefresh value)? forceRefresh,
    TResult Function(UpdateClipboard value)? updateClipboard,
    TResult Function(PublishSnippet value)? publishSnippet,
    TResult Function(RevertSnippet value)? revertSnippet,
    TResult Function(DeletePage value)? deletePage,
    TResult Function(ToggleAutoPublishingOfSnippet value)?
    toggleAutoPublishingOfSnippet,
    TResult Function(AutoPublishDefault value)? autoPublishDefault,
    TResult Function(HideIframes value)? hideIframes,
    TResult Function(SetPanelSnippet value)? setPanelOrPlaceholderSnippet,
    TResult Function(EnterSelectWidgetMode value)? enterSelectWidgetMode,
    TResult Function(ExitSelectWidgetMode value)? exitSelectWidgetMode,
    TResult Function(PushSnippetEditor value)? pushSnippetEditor,
    TResult Function(PopSnippetEditor value)? popSnippetEditor,
    TResult Function(ShowDirectoryTree value)? showDirectoryTree,
    TResult Function(RemoveDirectoryTree value)? removeDirectoryTree,
    TResult Function(SelectNode value)? selectNode,
    TResult Function(ClearNodeSelection value)? clearNodeSelection,
    TResult Function(SaveNodeAsSnippet value)? saveNodeAsSnippet,
    TResult Function(ReplaceSelectionWith value)? replaceSelectionWith,
    TResult Function(WrapSelectionWith value)? wrapSelectionWith,
    TResult Function(AppendChild value)? appendChild,
    TResult Function(AddSiblingBefore value)? addSiblingBefore,
    TResult Function(AddSiblingAfter value)? addSiblingAfter,
    TResult Function(PasteReplacement value)? pasteReplacement,
    TResult Function(PasteChild value)? pasteChild,
    TResult Function(PasteSiblingBefore value)? pasteSiblingBefore,
    TResult Function(PasteSiblingAfter value)? pasteSiblingAfter,
    TResult Function(DeleteNodeTapped value)? deleteNodeTapped,
    TResult Function(CompleteDeletion value)? completeDeletion,
    TResult Function(CopySnippetJsonToClipboard value)?
    copySnippetJsonToClipboard,
    TResult Function(ReplaceSnippetFromJson value)? replaceSnippetFromJson,
    TResult Function(CopyNode value)? copyNode,
    TResult Function(CutNode value)? cutNode,
    TResult Function(SelectedDirectoryOrNode value)? selectedDirectoryOrNode,
    TResult Function(ImageChanged value)? imageChanged,
    TResult Function(ForceSnippetRefresh value)? forceSnippetRefresh,
    required TResult orElse(),
  }) {
    if (removeDirectoryTree != null) {
      return removeDirectoryTree(this);
    }
    return orElse();
  }
}

abstract class RemoveDirectoryTree implements CAPIEvent {
  const factory RemoveDirectoryTree({final bool save}) =
      _$RemoveDirectoryTreeImpl;

  bool get save;

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RemoveDirectoryTreeImplCopyWith<_$RemoveDirectoryTreeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectNodeImplCopyWith<$Res> {
  factory _$$SelectNodeImplCopyWith(
    _$SelectNodeImpl value,
    $Res Function(_$SelectNodeImpl) then,
  ) = __$$SelectNodeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SNode node});
}

/// @nodoc
class __$$SelectNodeImplCopyWithImpl<$Res>
    extends _$CAPIEventCopyWithImpl<$Res, _$SelectNodeImpl>
    implements _$$SelectNodeImplCopyWith<$Res> {
  __$$SelectNodeImplCopyWithImpl(
    _$SelectNodeImpl _value,
    $Res Function(_$SelectNodeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? node = null}) {
    return _then(
      _$SelectNodeImpl(
        node:
            null == node
                ? _value.node
                : node // ignore: cast_nullable_to_non_nullable
                    as SNode,
      ),
    );
  }
}

/// @nodoc

class _$SelectNodeImpl with DiagnosticableTreeMixin implements SelectNode {
  const _$SelectNodeImpl({required this.node});

  @override
  final SNode node;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CAPIEvent.selectNode(node: $node)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CAPIEvent.selectNode'))
      ..add(DiagnosticsProperty('node', node));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectNodeImpl &&
            (identical(other.node, node) || other.node == node));
  }

  @override
  int get hashCode => Object.hash(runtimeType, node);

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectNodeImplCopyWith<_$SelectNodeImpl> get copyWith =>
      __$$SelectNodeImplCopyWithImpl<_$SelectNodeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? panelName) selectPanel,
    required TResult Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )
    overrideTargetGK,
    required TResult Function(bool onlyTargetsWrappers) forceRefresh,
    required TResult Function(
      SNode? newContent,
      String? scName,
      dynamic skipSave,
    )
    updateClipboard,
    required TResult Function(String snippetName, String versionId)
    publishSnippet,
    required TResult Function(String snippetName, String versionId)
    revertSnippet,
    required TResult Function(String pathName) deletePage,
    required TResult Function(String snippetName) toggleAutoPublishingOfSnippet,
    required TResult Function(bool b) autoPublishDefault,
    required TResult Function(bool hide) hideIframes,
    required TResult Function(String snippetName, String panelName)
    setPanelOrPlaceholderSnippet,
    required TResult Function(String snippetName) enterSelectWidgetMode,
    required TResult Function() exitSelectWidgetMode,
    required TResult Function(SnippetRootNode rootNode, SNode? selectedNode)
    pushSnippetEditor,
    required TResult Function(bool save) popSnippetEditor,
    required TResult Function() showDirectoryTree,
    required TResult Function(bool save) removeDirectoryTree,
    required TResult Function(SNode node) selectNode,
    required TResult Function() clearNodeSelection,
    required TResult Function(SNode node, String newSnippetName)
    saveNodeAsSnippet,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    replaceSelectionWith,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    wrapSelectionWith,
    required TResult Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )
    appendChild,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    addSiblingBefore,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    addSiblingAfter,
    required TResult Function(Type? widgetSpanChildType) pasteReplacement,
    required TResult Function(
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )
    pasteChild,
    required TResult Function() pasteSiblingBefore,
    required TResult Function() pasteSiblingAfter,
    required TResult Function() deleteNodeTapped,
    required TResult Function() completeDeletion,
    required TResult Function(SnippetRootNode rootNode)
    copySnippetJsonToClipboard,
    required TResult Function(String? snippetJson) replaceSnippetFromJson,
    required TResult Function(SNode node, String? scName, dynamic skipSave)
    copyNode,
    required TResult Function(SNode node, String? scName, dynamic skipSave)
    cutNode,
    required TResult Function(String snippetName, SNode? selectedNode)
    selectedDirectoryOrNode,
    required TResult Function(Uint8List? newBytes) imageChanged,
    required TResult Function() forceSnippetRefresh,
  }) {
    return selectNode(node);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? panelName)? selectPanel,
    TResult? Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )?
    overrideTargetGK,
    TResult? Function(bool onlyTargetsWrappers)? forceRefresh,
    TResult? Function(SNode? newContent, String? scName, dynamic skipSave)?
    updateClipboard,
    TResult? Function(String snippetName, String versionId)? publishSnippet,
    TResult? Function(String snippetName, String versionId)? revertSnippet,
    TResult? Function(String pathName)? deletePage,
    TResult? Function(String snippetName)? toggleAutoPublishingOfSnippet,
    TResult? Function(bool b)? autoPublishDefault,
    TResult? Function(bool hide)? hideIframes,
    TResult? Function(String snippetName, String panelName)?
    setPanelOrPlaceholderSnippet,
    TResult? Function(String snippetName)? enterSelectWidgetMode,
    TResult? Function()? exitSelectWidgetMode,
    TResult? Function(SnippetRootNode rootNode, SNode? selectedNode)?
    pushSnippetEditor,
    TResult? Function(bool save)? popSnippetEditor,
    TResult? Function()? showDirectoryTree,
    TResult? Function(bool save)? removeDirectoryTree,
    TResult? Function(SNode node)? selectNode,
    TResult? Function()? clearNodeSelection,
    TResult? Function(SNode node, String newSnippetName)? saveNodeAsSnippet,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    replaceSelectionWith,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    wrapSelectionWith,
    TResult? Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    appendChild,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingBefore,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingAfter,
    TResult? Function(Type? widgetSpanChildType)? pasteReplacement,
    TResult? Function(
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    pasteChild,
    TResult? Function()? pasteSiblingBefore,
    TResult? Function()? pasteSiblingAfter,
    TResult? Function()? deleteNodeTapped,
    TResult? Function()? completeDeletion,
    TResult? Function(SnippetRootNode rootNode)? copySnippetJsonToClipboard,
    TResult? Function(String? snippetJson)? replaceSnippetFromJson,
    TResult? Function(SNode node, String? scName, dynamic skipSave)? copyNode,
    TResult? Function(SNode node, String? scName, dynamic skipSave)? cutNode,
    TResult? Function(String snippetName, SNode? selectedNode)?
    selectedDirectoryOrNode,
    TResult? Function(Uint8List? newBytes)? imageChanged,
    TResult? Function()? forceSnippetRefresh,
  }) {
    return selectNode?.call(node);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? panelName)? selectPanel,
    TResult Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )?
    overrideTargetGK,
    TResult Function(bool onlyTargetsWrappers)? forceRefresh,
    TResult Function(SNode? newContent, String? scName, dynamic skipSave)?
    updateClipboard,
    TResult Function(String snippetName, String versionId)? publishSnippet,
    TResult Function(String snippetName, String versionId)? revertSnippet,
    TResult Function(String pathName)? deletePage,
    TResult Function(String snippetName)? toggleAutoPublishingOfSnippet,
    TResult Function(bool b)? autoPublishDefault,
    TResult Function(bool hide)? hideIframes,
    TResult Function(String snippetName, String panelName)?
    setPanelOrPlaceholderSnippet,
    TResult Function(String snippetName)? enterSelectWidgetMode,
    TResult Function()? exitSelectWidgetMode,
    TResult Function(SnippetRootNode rootNode, SNode? selectedNode)?
    pushSnippetEditor,
    TResult Function(bool save)? popSnippetEditor,
    TResult Function()? showDirectoryTree,
    TResult Function(bool save)? removeDirectoryTree,
    TResult Function(SNode node)? selectNode,
    TResult Function()? clearNodeSelection,
    TResult Function(SNode node, String newSnippetName)? saveNodeAsSnippet,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    replaceSelectionWith,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    wrapSelectionWith,
    TResult Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    appendChild,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingBefore,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingAfter,
    TResult Function(Type? widgetSpanChildType)? pasteReplacement,
    TResult Function(Type? widgetSpanChildType, SNode? testWidgetSpanChildNode)?
    pasteChild,
    TResult Function()? pasteSiblingBefore,
    TResult Function()? pasteSiblingAfter,
    TResult Function()? deleteNodeTapped,
    TResult Function()? completeDeletion,
    TResult Function(SnippetRootNode rootNode)? copySnippetJsonToClipboard,
    TResult Function(String? snippetJson)? replaceSnippetFromJson,
    TResult Function(SNode node, String? scName, dynamic skipSave)? copyNode,
    TResult Function(SNode node, String? scName, dynamic skipSave)? cutNode,
    TResult Function(String snippetName, SNode? selectedNode)?
    selectedDirectoryOrNode,
    TResult Function(Uint8List? newBytes)? imageChanged,
    TResult Function()? forceSnippetRefresh,
    required TResult orElse(),
  }) {
    if (selectNode != null) {
      return selectNode(node);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SelectPanel value) selectPanel,
    required TResult Function(OverrideTargetGK value) overrideTargetGK,
    required TResult Function(ForceRefresh value) forceRefresh,
    required TResult Function(UpdateClipboard value) updateClipboard,
    required TResult Function(PublishSnippet value) publishSnippet,
    required TResult Function(RevertSnippet value) revertSnippet,
    required TResult Function(DeletePage value) deletePage,
    required TResult Function(ToggleAutoPublishingOfSnippet value)
    toggleAutoPublishingOfSnippet,
    required TResult Function(AutoPublishDefault value) autoPublishDefault,
    required TResult Function(HideIframes value) hideIframes,
    required TResult Function(SetPanelSnippet value)
    setPanelOrPlaceholderSnippet,
    required TResult Function(EnterSelectWidgetMode value)
    enterSelectWidgetMode,
    required TResult Function(ExitSelectWidgetMode value) exitSelectWidgetMode,
    required TResult Function(PushSnippetEditor value) pushSnippetEditor,
    required TResult Function(PopSnippetEditor value) popSnippetEditor,
    required TResult Function(ShowDirectoryTree value) showDirectoryTree,
    required TResult Function(RemoveDirectoryTree value) removeDirectoryTree,
    required TResult Function(SelectNode value) selectNode,
    required TResult Function(ClearNodeSelection value) clearNodeSelection,
    required TResult Function(SaveNodeAsSnippet value) saveNodeAsSnippet,
    required TResult Function(ReplaceSelectionWith value) replaceSelectionWith,
    required TResult Function(WrapSelectionWith value) wrapSelectionWith,
    required TResult Function(AppendChild value) appendChild,
    required TResult Function(AddSiblingBefore value) addSiblingBefore,
    required TResult Function(AddSiblingAfter value) addSiblingAfter,
    required TResult Function(PasteReplacement value) pasteReplacement,
    required TResult Function(PasteChild value) pasteChild,
    required TResult Function(PasteSiblingBefore value) pasteSiblingBefore,
    required TResult Function(PasteSiblingAfter value) pasteSiblingAfter,
    required TResult Function(DeleteNodeTapped value) deleteNodeTapped,
    required TResult Function(CompleteDeletion value) completeDeletion,
    required TResult Function(CopySnippetJsonToClipboard value)
    copySnippetJsonToClipboard,
    required TResult Function(ReplaceSnippetFromJson value)
    replaceSnippetFromJson,
    required TResult Function(CopyNode value) copyNode,
    required TResult Function(CutNode value) cutNode,
    required TResult Function(SelectedDirectoryOrNode value)
    selectedDirectoryOrNode,
    required TResult Function(ImageChanged value) imageChanged,
    required TResult Function(ForceSnippetRefresh value) forceSnippetRefresh,
  }) {
    return selectNode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SelectPanel value)? selectPanel,
    TResult? Function(OverrideTargetGK value)? overrideTargetGK,
    TResult? Function(ForceRefresh value)? forceRefresh,
    TResult? Function(UpdateClipboard value)? updateClipboard,
    TResult? Function(PublishSnippet value)? publishSnippet,
    TResult? Function(RevertSnippet value)? revertSnippet,
    TResult? Function(DeletePage value)? deletePage,
    TResult? Function(ToggleAutoPublishingOfSnippet value)?
    toggleAutoPublishingOfSnippet,
    TResult? Function(AutoPublishDefault value)? autoPublishDefault,
    TResult? Function(HideIframes value)? hideIframes,
    TResult? Function(SetPanelSnippet value)? setPanelOrPlaceholderSnippet,
    TResult? Function(EnterSelectWidgetMode value)? enterSelectWidgetMode,
    TResult? Function(ExitSelectWidgetMode value)? exitSelectWidgetMode,
    TResult? Function(PushSnippetEditor value)? pushSnippetEditor,
    TResult? Function(PopSnippetEditor value)? popSnippetEditor,
    TResult? Function(ShowDirectoryTree value)? showDirectoryTree,
    TResult? Function(RemoveDirectoryTree value)? removeDirectoryTree,
    TResult? Function(SelectNode value)? selectNode,
    TResult? Function(ClearNodeSelection value)? clearNodeSelection,
    TResult? Function(SaveNodeAsSnippet value)? saveNodeAsSnippet,
    TResult? Function(ReplaceSelectionWith value)? replaceSelectionWith,
    TResult? Function(WrapSelectionWith value)? wrapSelectionWith,
    TResult? Function(AppendChild value)? appendChild,
    TResult? Function(AddSiblingBefore value)? addSiblingBefore,
    TResult? Function(AddSiblingAfter value)? addSiblingAfter,
    TResult? Function(PasteReplacement value)? pasteReplacement,
    TResult? Function(PasteChild value)? pasteChild,
    TResult? Function(PasteSiblingBefore value)? pasteSiblingBefore,
    TResult? Function(PasteSiblingAfter value)? pasteSiblingAfter,
    TResult? Function(DeleteNodeTapped value)? deleteNodeTapped,
    TResult? Function(CompleteDeletion value)? completeDeletion,
    TResult? Function(CopySnippetJsonToClipboard value)?
    copySnippetJsonToClipboard,
    TResult? Function(ReplaceSnippetFromJson value)? replaceSnippetFromJson,
    TResult? Function(CopyNode value)? copyNode,
    TResult? Function(CutNode value)? cutNode,
    TResult? Function(SelectedDirectoryOrNode value)? selectedDirectoryOrNode,
    TResult? Function(ImageChanged value)? imageChanged,
    TResult? Function(ForceSnippetRefresh value)? forceSnippetRefresh,
  }) {
    return selectNode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SelectPanel value)? selectPanel,
    TResult Function(OverrideTargetGK value)? overrideTargetGK,
    TResult Function(ForceRefresh value)? forceRefresh,
    TResult Function(UpdateClipboard value)? updateClipboard,
    TResult Function(PublishSnippet value)? publishSnippet,
    TResult Function(RevertSnippet value)? revertSnippet,
    TResult Function(DeletePage value)? deletePage,
    TResult Function(ToggleAutoPublishingOfSnippet value)?
    toggleAutoPublishingOfSnippet,
    TResult Function(AutoPublishDefault value)? autoPublishDefault,
    TResult Function(HideIframes value)? hideIframes,
    TResult Function(SetPanelSnippet value)? setPanelOrPlaceholderSnippet,
    TResult Function(EnterSelectWidgetMode value)? enterSelectWidgetMode,
    TResult Function(ExitSelectWidgetMode value)? exitSelectWidgetMode,
    TResult Function(PushSnippetEditor value)? pushSnippetEditor,
    TResult Function(PopSnippetEditor value)? popSnippetEditor,
    TResult Function(ShowDirectoryTree value)? showDirectoryTree,
    TResult Function(RemoveDirectoryTree value)? removeDirectoryTree,
    TResult Function(SelectNode value)? selectNode,
    TResult Function(ClearNodeSelection value)? clearNodeSelection,
    TResult Function(SaveNodeAsSnippet value)? saveNodeAsSnippet,
    TResult Function(ReplaceSelectionWith value)? replaceSelectionWith,
    TResult Function(WrapSelectionWith value)? wrapSelectionWith,
    TResult Function(AppendChild value)? appendChild,
    TResult Function(AddSiblingBefore value)? addSiblingBefore,
    TResult Function(AddSiblingAfter value)? addSiblingAfter,
    TResult Function(PasteReplacement value)? pasteReplacement,
    TResult Function(PasteChild value)? pasteChild,
    TResult Function(PasteSiblingBefore value)? pasteSiblingBefore,
    TResult Function(PasteSiblingAfter value)? pasteSiblingAfter,
    TResult Function(DeleteNodeTapped value)? deleteNodeTapped,
    TResult Function(CompleteDeletion value)? completeDeletion,
    TResult Function(CopySnippetJsonToClipboard value)?
    copySnippetJsonToClipboard,
    TResult Function(ReplaceSnippetFromJson value)? replaceSnippetFromJson,
    TResult Function(CopyNode value)? copyNode,
    TResult Function(CutNode value)? cutNode,
    TResult Function(SelectedDirectoryOrNode value)? selectedDirectoryOrNode,
    TResult Function(ImageChanged value)? imageChanged,
    TResult Function(ForceSnippetRefresh value)? forceSnippetRefresh,
    required TResult orElse(),
  }) {
    if (selectNode != null) {
      return selectNode(this);
    }
    return orElse();
  }
}

abstract class SelectNode implements CAPIEvent {
  const factory SelectNode({required final SNode node}) = _$SelectNodeImpl;

  SNode get node;

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SelectNodeImplCopyWith<_$SelectNodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClearNodeSelectionImplCopyWith<$Res> {
  factory _$$ClearNodeSelectionImplCopyWith(
    _$ClearNodeSelectionImpl value,
    $Res Function(_$ClearNodeSelectionImpl) then,
  ) = __$$ClearNodeSelectionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearNodeSelectionImplCopyWithImpl<$Res>
    extends _$CAPIEventCopyWithImpl<$Res, _$ClearNodeSelectionImpl>
    implements _$$ClearNodeSelectionImplCopyWith<$Res> {
  __$$ClearNodeSelectionImplCopyWithImpl(
    _$ClearNodeSelectionImpl _value,
    $Res Function(_$ClearNodeSelectionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ClearNodeSelectionImpl
    with DiagnosticableTreeMixin
    implements ClearNodeSelection {
  const _$ClearNodeSelectionImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CAPIEvent.clearNodeSelection()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CAPIEvent.clearNodeSelection'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearNodeSelectionImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? panelName) selectPanel,
    required TResult Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )
    overrideTargetGK,
    required TResult Function(bool onlyTargetsWrappers) forceRefresh,
    required TResult Function(
      SNode? newContent,
      String? scName,
      dynamic skipSave,
    )
    updateClipboard,
    required TResult Function(String snippetName, String versionId)
    publishSnippet,
    required TResult Function(String snippetName, String versionId)
    revertSnippet,
    required TResult Function(String pathName) deletePage,
    required TResult Function(String snippetName) toggleAutoPublishingOfSnippet,
    required TResult Function(bool b) autoPublishDefault,
    required TResult Function(bool hide) hideIframes,
    required TResult Function(String snippetName, String panelName)
    setPanelOrPlaceholderSnippet,
    required TResult Function(String snippetName) enterSelectWidgetMode,
    required TResult Function() exitSelectWidgetMode,
    required TResult Function(SnippetRootNode rootNode, SNode? selectedNode)
    pushSnippetEditor,
    required TResult Function(bool save) popSnippetEditor,
    required TResult Function() showDirectoryTree,
    required TResult Function(bool save) removeDirectoryTree,
    required TResult Function(SNode node) selectNode,
    required TResult Function() clearNodeSelection,
    required TResult Function(SNode node, String newSnippetName)
    saveNodeAsSnippet,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    replaceSelectionWith,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    wrapSelectionWith,
    required TResult Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )
    appendChild,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    addSiblingBefore,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    addSiblingAfter,
    required TResult Function(Type? widgetSpanChildType) pasteReplacement,
    required TResult Function(
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )
    pasteChild,
    required TResult Function() pasteSiblingBefore,
    required TResult Function() pasteSiblingAfter,
    required TResult Function() deleteNodeTapped,
    required TResult Function() completeDeletion,
    required TResult Function(SnippetRootNode rootNode)
    copySnippetJsonToClipboard,
    required TResult Function(String? snippetJson) replaceSnippetFromJson,
    required TResult Function(SNode node, String? scName, dynamic skipSave)
    copyNode,
    required TResult Function(SNode node, String? scName, dynamic skipSave)
    cutNode,
    required TResult Function(String snippetName, SNode? selectedNode)
    selectedDirectoryOrNode,
    required TResult Function(Uint8List? newBytes) imageChanged,
    required TResult Function() forceSnippetRefresh,
  }) {
    return clearNodeSelection();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? panelName)? selectPanel,
    TResult? Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )?
    overrideTargetGK,
    TResult? Function(bool onlyTargetsWrappers)? forceRefresh,
    TResult? Function(SNode? newContent, String? scName, dynamic skipSave)?
    updateClipboard,
    TResult? Function(String snippetName, String versionId)? publishSnippet,
    TResult? Function(String snippetName, String versionId)? revertSnippet,
    TResult? Function(String pathName)? deletePage,
    TResult? Function(String snippetName)? toggleAutoPublishingOfSnippet,
    TResult? Function(bool b)? autoPublishDefault,
    TResult? Function(bool hide)? hideIframes,
    TResult? Function(String snippetName, String panelName)?
    setPanelOrPlaceholderSnippet,
    TResult? Function(String snippetName)? enterSelectWidgetMode,
    TResult? Function()? exitSelectWidgetMode,
    TResult? Function(SnippetRootNode rootNode, SNode? selectedNode)?
    pushSnippetEditor,
    TResult? Function(bool save)? popSnippetEditor,
    TResult? Function()? showDirectoryTree,
    TResult? Function(bool save)? removeDirectoryTree,
    TResult? Function(SNode node)? selectNode,
    TResult? Function()? clearNodeSelection,
    TResult? Function(SNode node, String newSnippetName)? saveNodeAsSnippet,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    replaceSelectionWith,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    wrapSelectionWith,
    TResult? Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    appendChild,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingBefore,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingAfter,
    TResult? Function(Type? widgetSpanChildType)? pasteReplacement,
    TResult? Function(
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    pasteChild,
    TResult? Function()? pasteSiblingBefore,
    TResult? Function()? pasteSiblingAfter,
    TResult? Function()? deleteNodeTapped,
    TResult? Function()? completeDeletion,
    TResult? Function(SnippetRootNode rootNode)? copySnippetJsonToClipboard,
    TResult? Function(String? snippetJson)? replaceSnippetFromJson,
    TResult? Function(SNode node, String? scName, dynamic skipSave)? copyNode,
    TResult? Function(SNode node, String? scName, dynamic skipSave)? cutNode,
    TResult? Function(String snippetName, SNode? selectedNode)?
    selectedDirectoryOrNode,
    TResult? Function(Uint8List? newBytes)? imageChanged,
    TResult? Function()? forceSnippetRefresh,
  }) {
    return clearNodeSelection?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? panelName)? selectPanel,
    TResult Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )?
    overrideTargetGK,
    TResult Function(bool onlyTargetsWrappers)? forceRefresh,
    TResult Function(SNode? newContent, String? scName, dynamic skipSave)?
    updateClipboard,
    TResult Function(String snippetName, String versionId)? publishSnippet,
    TResult Function(String snippetName, String versionId)? revertSnippet,
    TResult Function(String pathName)? deletePage,
    TResult Function(String snippetName)? toggleAutoPublishingOfSnippet,
    TResult Function(bool b)? autoPublishDefault,
    TResult Function(bool hide)? hideIframes,
    TResult Function(String snippetName, String panelName)?
    setPanelOrPlaceholderSnippet,
    TResult Function(String snippetName)? enterSelectWidgetMode,
    TResult Function()? exitSelectWidgetMode,
    TResult Function(SnippetRootNode rootNode, SNode? selectedNode)?
    pushSnippetEditor,
    TResult Function(bool save)? popSnippetEditor,
    TResult Function()? showDirectoryTree,
    TResult Function(bool save)? removeDirectoryTree,
    TResult Function(SNode node)? selectNode,
    TResult Function()? clearNodeSelection,
    TResult Function(SNode node, String newSnippetName)? saveNodeAsSnippet,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    replaceSelectionWith,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    wrapSelectionWith,
    TResult Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    appendChild,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingBefore,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingAfter,
    TResult Function(Type? widgetSpanChildType)? pasteReplacement,
    TResult Function(Type? widgetSpanChildType, SNode? testWidgetSpanChildNode)?
    pasteChild,
    TResult Function()? pasteSiblingBefore,
    TResult Function()? pasteSiblingAfter,
    TResult Function()? deleteNodeTapped,
    TResult Function()? completeDeletion,
    TResult Function(SnippetRootNode rootNode)? copySnippetJsonToClipboard,
    TResult Function(String? snippetJson)? replaceSnippetFromJson,
    TResult Function(SNode node, String? scName, dynamic skipSave)? copyNode,
    TResult Function(SNode node, String? scName, dynamic skipSave)? cutNode,
    TResult Function(String snippetName, SNode? selectedNode)?
    selectedDirectoryOrNode,
    TResult Function(Uint8List? newBytes)? imageChanged,
    TResult Function()? forceSnippetRefresh,
    required TResult orElse(),
  }) {
    if (clearNodeSelection != null) {
      return clearNodeSelection();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SelectPanel value) selectPanel,
    required TResult Function(OverrideTargetGK value) overrideTargetGK,
    required TResult Function(ForceRefresh value) forceRefresh,
    required TResult Function(UpdateClipboard value) updateClipboard,
    required TResult Function(PublishSnippet value) publishSnippet,
    required TResult Function(RevertSnippet value) revertSnippet,
    required TResult Function(DeletePage value) deletePage,
    required TResult Function(ToggleAutoPublishingOfSnippet value)
    toggleAutoPublishingOfSnippet,
    required TResult Function(AutoPublishDefault value) autoPublishDefault,
    required TResult Function(HideIframes value) hideIframes,
    required TResult Function(SetPanelSnippet value)
    setPanelOrPlaceholderSnippet,
    required TResult Function(EnterSelectWidgetMode value)
    enterSelectWidgetMode,
    required TResult Function(ExitSelectWidgetMode value) exitSelectWidgetMode,
    required TResult Function(PushSnippetEditor value) pushSnippetEditor,
    required TResult Function(PopSnippetEditor value) popSnippetEditor,
    required TResult Function(ShowDirectoryTree value) showDirectoryTree,
    required TResult Function(RemoveDirectoryTree value) removeDirectoryTree,
    required TResult Function(SelectNode value) selectNode,
    required TResult Function(ClearNodeSelection value) clearNodeSelection,
    required TResult Function(SaveNodeAsSnippet value) saveNodeAsSnippet,
    required TResult Function(ReplaceSelectionWith value) replaceSelectionWith,
    required TResult Function(WrapSelectionWith value) wrapSelectionWith,
    required TResult Function(AppendChild value) appendChild,
    required TResult Function(AddSiblingBefore value) addSiblingBefore,
    required TResult Function(AddSiblingAfter value) addSiblingAfter,
    required TResult Function(PasteReplacement value) pasteReplacement,
    required TResult Function(PasteChild value) pasteChild,
    required TResult Function(PasteSiblingBefore value) pasteSiblingBefore,
    required TResult Function(PasteSiblingAfter value) pasteSiblingAfter,
    required TResult Function(DeleteNodeTapped value) deleteNodeTapped,
    required TResult Function(CompleteDeletion value) completeDeletion,
    required TResult Function(CopySnippetJsonToClipboard value)
    copySnippetJsonToClipboard,
    required TResult Function(ReplaceSnippetFromJson value)
    replaceSnippetFromJson,
    required TResult Function(CopyNode value) copyNode,
    required TResult Function(CutNode value) cutNode,
    required TResult Function(SelectedDirectoryOrNode value)
    selectedDirectoryOrNode,
    required TResult Function(ImageChanged value) imageChanged,
    required TResult Function(ForceSnippetRefresh value) forceSnippetRefresh,
  }) {
    return clearNodeSelection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SelectPanel value)? selectPanel,
    TResult? Function(OverrideTargetGK value)? overrideTargetGK,
    TResult? Function(ForceRefresh value)? forceRefresh,
    TResult? Function(UpdateClipboard value)? updateClipboard,
    TResult? Function(PublishSnippet value)? publishSnippet,
    TResult? Function(RevertSnippet value)? revertSnippet,
    TResult? Function(DeletePage value)? deletePage,
    TResult? Function(ToggleAutoPublishingOfSnippet value)?
    toggleAutoPublishingOfSnippet,
    TResult? Function(AutoPublishDefault value)? autoPublishDefault,
    TResult? Function(HideIframes value)? hideIframes,
    TResult? Function(SetPanelSnippet value)? setPanelOrPlaceholderSnippet,
    TResult? Function(EnterSelectWidgetMode value)? enterSelectWidgetMode,
    TResult? Function(ExitSelectWidgetMode value)? exitSelectWidgetMode,
    TResult? Function(PushSnippetEditor value)? pushSnippetEditor,
    TResult? Function(PopSnippetEditor value)? popSnippetEditor,
    TResult? Function(ShowDirectoryTree value)? showDirectoryTree,
    TResult? Function(RemoveDirectoryTree value)? removeDirectoryTree,
    TResult? Function(SelectNode value)? selectNode,
    TResult? Function(ClearNodeSelection value)? clearNodeSelection,
    TResult? Function(SaveNodeAsSnippet value)? saveNodeAsSnippet,
    TResult? Function(ReplaceSelectionWith value)? replaceSelectionWith,
    TResult? Function(WrapSelectionWith value)? wrapSelectionWith,
    TResult? Function(AppendChild value)? appendChild,
    TResult? Function(AddSiblingBefore value)? addSiblingBefore,
    TResult? Function(AddSiblingAfter value)? addSiblingAfter,
    TResult? Function(PasteReplacement value)? pasteReplacement,
    TResult? Function(PasteChild value)? pasteChild,
    TResult? Function(PasteSiblingBefore value)? pasteSiblingBefore,
    TResult? Function(PasteSiblingAfter value)? pasteSiblingAfter,
    TResult? Function(DeleteNodeTapped value)? deleteNodeTapped,
    TResult? Function(CompleteDeletion value)? completeDeletion,
    TResult? Function(CopySnippetJsonToClipboard value)?
    copySnippetJsonToClipboard,
    TResult? Function(ReplaceSnippetFromJson value)? replaceSnippetFromJson,
    TResult? Function(CopyNode value)? copyNode,
    TResult? Function(CutNode value)? cutNode,
    TResult? Function(SelectedDirectoryOrNode value)? selectedDirectoryOrNode,
    TResult? Function(ImageChanged value)? imageChanged,
    TResult? Function(ForceSnippetRefresh value)? forceSnippetRefresh,
  }) {
    return clearNodeSelection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SelectPanel value)? selectPanel,
    TResult Function(OverrideTargetGK value)? overrideTargetGK,
    TResult Function(ForceRefresh value)? forceRefresh,
    TResult Function(UpdateClipboard value)? updateClipboard,
    TResult Function(PublishSnippet value)? publishSnippet,
    TResult Function(RevertSnippet value)? revertSnippet,
    TResult Function(DeletePage value)? deletePage,
    TResult Function(ToggleAutoPublishingOfSnippet value)?
    toggleAutoPublishingOfSnippet,
    TResult Function(AutoPublishDefault value)? autoPublishDefault,
    TResult Function(HideIframes value)? hideIframes,
    TResult Function(SetPanelSnippet value)? setPanelOrPlaceholderSnippet,
    TResult Function(EnterSelectWidgetMode value)? enterSelectWidgetMode,
    TResult Function(ExitSelectWidgetMode value)? exitSelectWidgetMode,
    TResult Function(PushSnippetEditor value)? pushSnippetEditor,
    TResult Function(PopSnippetEditor value)? popSnippetEditor,
    TResult Function(ShowDirectoryTree value)? showDirectoryTree,
    TResult Function(RemoveDirectoryTree value)? removeDirectoryTree,
    TResult Function(SelectNode value)? selectNode,
    TResult Function(ClearNodeSelection value)? clearNodeSelection,
    TResult Function(SaveNodeAsSnippet value)? saveNodeAsSnippet,
    TResult Function(ReplaceSelectionWith value)? replaceSelectionWith,
    TResult Function(WrapSelectionWith value)? wrapSelectionWith,
    TResult Function(AppendChild value)? appendChild,
    TResult Function(AddSiblingBefore value)? addSiblingBefore,
    TResult Function(AddSiblingAfter value)? addSiblingAfter,
    TResult Function(PasteReplacement value)? pasteReplacement,
    TResult Function(PasteChild value)? pasteChild,
    TResult Function(PasteSiblingBefore value)? pasteSiblingBefore,
    TResult Function(PasteSiblingAfter value)? pasteSiblingAfter,
    TResult Function(DeleteNodeTapped value)? deleteNodeTapped,
    TResult Function(CompleteDeletion value)? completeDeletion,
    TResult Function(CopySnippetJsonToClipboard value)?
    copySnippetJsonToClipboard,
    TResult Function(ReplaceSnippetFromJson value)? replaceSnippetFromJson,
    TResult Function(CopyNode value)? copyNode,
    TResult Function(CutNode value)? cutNode,
    TResult Function(SelectedDirectoryOrNode value)? selectedDirectoryOrNode,
    TResult Function(ImageChanged value)? imageChanged,
    TResult Function(ForceSnippetRefresh value)? forceSnippetRefresh,
    required TResult orElse(),
  }) {
    if (clearNodeSelection != null) {
      return clearNodeSelection(this);
    }
    return orElse();
  }
}

abstract class ClearNodeSelection implements CAPIEvent {
  const factory ClearNodeSelection() = _$ClearNodeSelectionImpl;
}

/// @nodoc
abstract class _$$SaveNodeAsSnippetImplCopyWith<$Res> {
  factory _$$SaveNodeAsSnippetImplCopyWith(
    _$SaveNodeAsSnippetImpl value,
    $Res Function(_$SaveNodeAsSnippetImpl) then,
  ) = __$$SaveNodeAsSnippetImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SNode node, String newSnippetName});
}

/// @nodoc
class __$$SaveNodeAsSnippetImplCopyWithImpl<$Res>
    extends _$CAPIEventCopyWithImpl<$Res, _$SaveNodeAsSnippetImpl>
    implements _$$SaveNodeAsSnippetImplCopyWith<$Res> {
  __$$SaveNodeAsSnippetImplCopyWithImpl(
    _$SaveNodeAsSnippetImpl _value,
    $Res Function(_$SaveNodeAsSnippetImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? node = null, Object? newSnippetName = null}) {
    return _then(
      _$SaveNodeAsSnippetImpl(
        node:
            null == node
                ? _value.node
                : node // ignore: cast_nullable_to_non_nullable
                    as SNode,
        newSnippetName:
            null == newSnippetName
                ? _value.newSnippetName
                : newSnippetName // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$SaveNodeAsSnippetImpl
    with DiagnosticableTreeMixin
    implements SaveNodeAsSnippet {
  const _$SaveNodeAsSnippetImpl({
    required this.node,
    required this.newSnippetName,
  });

  @override
  final SNode node;
  @override
  final String newSnippetName;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CAPIEvent.saveNodeAsSnippet(node: $node, newSnippetName: $newSnippetName)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CAPIEvent.saveNodeAsSnippet'))
      ..add(DiagnosticsProperty('node', node))
      ..add(DiagnosticsProperty('newSnippetName', newSnippetName));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaveNodeAsSnippetImpl &&
            (identical(other.node, node) || other.node == node) &&
            (identical(other.newSnippetName, newSnippetName) ||
                other.newSnippetName == newSnippetName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, node, newSnippetName);

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SaveNodeAsSnippetImplCopyWith<_$SaveNodeAsSnippetImpl> get copyWith =>
      __$$SaveNodeAsSnippetImplCopyWithImpl<_$SaveNodeAsSnippetImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? panelName) selectPanel,
    required TResult Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )
    overrideTargetGK,
    required TResult Function(bool onlyTargetsWrappers) forceRefresh,
    required TResult Function(
      SNode? newContent,
      String? scName,
      dynamic skipSave,
    )
    updateClipboard,
    required TResult Function(String snippetName, String versionId)
    publishSnippet,
    required TResult Function(String snippetName, String versionId)
    revertSnippet,
    required TResult Function(String pathName) deletePage,
    required TResult Function(String snippetName) toggleAutoPublishingOfSnippet,
    required TResult Function(bool b) autoPublishDefault,
    required TResult Function(bool hide) hideIframes,
    required TResult Function(String snippetName, String panelName)
    setPanelOrPlaceholderSnippet,
    required TResult Function(String snippetName) enterSelectWidgetMode,
    required TResult Function() exitSelectWidgetMode,
    required TResult Function(SnippetRootNode rootNode, SNode? selectedNode)
    pushSnippetEditor,
    required TResult Function(bool save) popSnippetEditor,
    required TResult Function() showDirectoryTree,
    required TResult Function(bool save) removeDirectoryTree,
    required TResult Function(SNode node) selectNode,
    required TResult Function() clearNodeSelection,
    required TResult Function(SNode node, String newSnippetName)
    saveNodeAsSnippet,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    replaceSelectionWith,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    wrapSelectionWith,
    required TResult Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )
    appendChild,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    addSiblingBefore,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    addSiblingAfter,
    required TResult Function(Type? widgetSpanChildType) pasteReplacement,
    required TResult Function(
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )
    pasteChild,
    required TResult Function() pasteSiblingBefore,
    required TResult Function() pasteSiblingAfter,
    required TResult Function() deleteNodeTapped,
    required TResult Function() completeDeletion,
    required TResult Function(SnippetRootNode rootNode)
    copySnippetJsonToClipboard,
    required TResult Function(String? snippetJson) replaceSnippetFromJson,
    required TResult Function(SNode node, String? scName, dynamic skipSave)
    copyNode,
    required TResult Function(SNode node, String? scName, dynamic skipSave)
    cutNode,
    required TResult Function(String snippetName, SNode? selectedNode)
    selectedDirectoryOrNode,
    required TResult Function(Uint8List? newBytes) imageChanged,
    required TResult Function() forceSnippetRefresh,
  }) {
    return saveNodeAsSnippet(node, newSnippetName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? panelName)? selectPanel,
    TResult? Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )?
    overrideTargetGK,
    TResult? Function(bool onlyTargetsWrappers)? forceRefresh,
    TResult? Function(SNode? newContent, String? scName, dynamic skipSave)?
    updateClipboard,
    TResult? Function(String snippetName, String versionId)? publishSnippet,
    TResult? Function(String snippetName, String versionId)? revertSnippet,
    TResult? Function(String pathName)? deletePage,
    TResult? Function(String snippetName)? toggleAutoPublishingOfSnippet,
    TResult? Function(bool b)? autoPublishDefault,
    TResult? Function(bool hide)? hideIframes,
    TResult? Function(String snippetName, String panelName)?
    setPanelOrPlaceholderSnippet,
    TResult? Function(String snippetName)? enterSelectWidgetMode,
    TResult? Function()? exitSelectWidgetMode,
    TResult? Function(SnippetRootNode rootNode, SNode? selectedNode)?
    pushSnippetEditor,
    TResult? Function(bool save)? popSnippetEditor,
    TResult? Function()? showDirectoryTree,
    TResult? Function(bool save)? removeDirectoryTree,
    TResult? Function(SNode node)? selectNode,
    TResult? Function()? clearNodeSelection,
    TResult? Function(SNode node, String newSnippetName)? saveNodeAsSnippet,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    replaceSelectionWith,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    wrapSelectionWith,
    TResult? Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    appendChild,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingBefore,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingAfter,
    TResult? Function(Type? widgetSpanChildType)? pasteReplacement,
    TResult? Function(
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    pasteChild,
    TResult? Function()? pasteSiblingBefore,
    TResult? Function()? pasteSiblingAfter,
    TResult? Function()? deleteNodeTapped,
    TResult? Function()? completeDeletion,
    TResult? Function(SnippetRootNode rootNode)? copySnippetJsonToClipboard,
    TResult? Function(String? snippetJson)? replaceSnippetFromJson,
    TResult? Function(SNode node, String? scName, dynamic skipSave)? copyNode,
    TResult? Function(SNode node, String? scName, dynamic skipSave)? cutNode,
    TResult? Function(String snippetName, SNode? selectedNode)?
    selectedDirectoryOrNode,
    TResult? Function(Uint8List? newBytes)? imageChanged,
    TResult? Function()? forceSnippetRefresh,
  }) {
    return saveNodeAsSnippet?.call(node, newSnippetName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? panelName)? selectPanel,
    TResult Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )?
    overrideTargetGK,
    TResult Function(bool onlyTargetsWrappers)? forceRefresh,
    TResult Function(SNode? newContent, String? scName, dynamic skipSave)?
    updateClipboard,
    TResult Function(String snippetName, String versionId)? publishSnippet,
    TResult Function(String snippetName, String versionId)? revertSnippet,
    TResult Function(String pathName)? deletePage,
    TResult Function(String snippetName)? toggleAutoPublishingOfSnippet,
    TResult Function(bool b)? autoPublishDefault,
    TResult Function(bool hide)? hideIframes,
    TResult Function(String snippetName, String panelName)?
    setPanelOrPlaceholderSnippet,
    TResult Function(String snippetName)? enterSelectWidgetMode,
    TResult Function()? exitSelectWidgetMode,
    TResult Function(SnippetRootNode rootNode, SNode? selectedNode)?
    pushSnippetEditor,
    TResult Function(bool save)? popSnippetEditor,
    TResult Function()? showDirectoryTree,
    TResult Function(bool save)? removeDirectoryTree,
    TResult Function(SNode node)? selectNode,
    TResult Function()? clearNodeSelection,
    TResult Function(SNode node, String newSnippetName)? saveNodeAsSnippet,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    replaceSelectionWith,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    wrapSelectionWith,
    TResult Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    appendChild,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingBefore,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingAfter,
    TResult Function(Type? widgetSpanChildType)? pasteReplacement,
    TResult Function(Type? widgetSpanChildType, SNode? testWidgetSpanChildNode)?
    pasteChild,
    TResult Function()? pasteSiblingBefore,
    TResult Function()? pasteSiblingAfter,
    TResult Function()? deleteNodeTapped,
    TResult Function()? completeDeletion,
    TResult Function(SnippetRootNode rootNode)? copySnippetJsonToClipboard,
    TResult Function(String? snippetJson)? replaceSnippetFromJson,
    TResult Function(SNode node, String? scName, dynamic skipSave)? copyNode,
    TResult Function(SNode node, String? scName, dynamic skipSave)? cutNode,
    TResult Function(String snippetName, SNode? selectedNode)?
    selectedDirectoryOrNode,
    TResult Function(Uint8List? newBytes)? imageChanged,
    TResult Function()? forceSnippetRefresh,
    required TResult orElse(),
  }) {
    if (saveNodeAsSnippet != null) {
      return saveNodeAsSnippet(node, newSnippetName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SelectPanel value) selectPanel,
    required TResult Function(OverrideTargetGK value) overrideTargetGK,
    required TResult Function(ForceRefresh value) forceRefresh,
    required TResult Function(UpdateClipboard value) updateClipboard,
    required TResult Function(PublishSnippet value) publishSnippet,
    required TResult Function(RevertSnippet value) revertSnippet,
    required TResult Function(DeletePage value) deletePage,
    required TResult Function(ToggleAutoPublishingOfSnippet value)
    toggleAutoPublishingOfSnippet,
    required TResult Function(AutoPublishDefault value) autoPublishDefault,
    required TResult Function(HideIframes value) hideIframes,
    required TResult Function(SetPanelSnippet value)
    setPanelOrPlaceholderSnippet,
    required TResult Function(EnterSelectWidgetMode value)
    enterSelectWidgetMode,
    required TResult Function(ExitSelectWidgetMode value) exitSelectWidgetMode,
    required TResult Function(PushSnippetEditor value) pushSnippetEditor,
    required TResult Function(PopSnippetEditor value) popSnippetEditor,
    required TResult Function(ShowDirectoryTree value) showDirectoryTree,
    required TResult Function(RemoveDirectoryTree value) removeDirectoryTree,
    required TResult Function(SelectNode value) selectNode,
    required TResult Function(ClearNodeSelection value) clearNodeSelection,
    required TResult Function(SaveNodeAsSnippet value) saveNodeAsSnippet,
    required TResult Function(ReplaceSelectionWith value) replaceSelectionWith,
    required TResult Function(WrapSelectionWith value) wrapSelectionWith,
    required TResult Function(AppendChild value) appendChild,
    required TResult Function(AddSiblingBefore value) addSiblingBefore,
    required TResult Function(AddSiblingAfter value) addSiblingAfter,
    required TResult Function(PasteReplacement value) pasteReplacement,
    required TResult Function(PasteChild value) pasteChild,
    required TResult Function(PasteSiblingBefore value) pasteSiblingBefore,
    required TResult Function(PasteSiblingAfter value) pasteSiblingAfter,
    required TResult Function(DeleteNodeTapped value) deleteNodeTapped,
    required TResult Function(CompleteDeletion value) completeDeletion,
    required TResult Function(CopySnippetJsonToClipboard value)
    copySnippetJsonToClipboard,
    required TResult Function(ReplaceSnippetFromJson value)
    replaceSnippetFromJson,
    required TResult Function(CopyNode value) copyNode,
    required TResult Function(CutNode value) cutNode,
    required TResult Function(SelectedDirectoryOrNode value)
    selectedDirectoryOrNode,
    required TResult Function(ImageChanged value) imageChanged,
    required TResult Function(ForceSnippetRefresh value) forceSnippetRefresh,
  }) {
    return saveNodeAsSnippet(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SelectPanel value)? selectPanel,
    TResult? Function(OverrideTargetGK value)? overrideTargetGK,
    TResult? Function(ForceRefresh value)? forceRefresh,
    TResult? Function(UpdateClipboard value)? updateClipboard,
    TResult? Function(PublishSnippet value)? publishSnippet,
    TResult? Function(RevertSnippet value)? revertSnippet,
    TResult? Function(DeletePage value)? deletePage,
    TResult? Function(ToggleAutoPublishingOfSnippet value)?
    toggleAutoPublishingOfSnippet,
    TResult? Function(AutoPublishDefault value)? autoPublishDefault,
    TResult? Function(HideIframes value)? hideIframes,
    TResult? Function(SetPanelSnippet value)? setPanelOrPlaceholderSnippet,
    TResult? Function(EnterSelectWidgetMode value)? enterSelectWidgetMode,
    TResult? Function(ExitSelectWidgetMode value)? exitSelectWidgetMode,
    TResult? Function(PushSnippetEditor value)? pushSnippetEditor,
    TResult? Function(PopSnippetEditor value)? popSnippetEditor,
    TResult? Function(ShowDirectoryTree value)? showDirectoryTree,
    TResult? Function(RemoveDirectoryTree value)? removeDirectoryTree,
    TResult? Function(SelectNode value)? selectNode,
    TResult? Function(ClearNodeSelection value)? clearNodeSelection,
    TResult? Function(SaveNodeAsSnippet value)? saveNodeAsSnippet,
    TResult? Function(ReplaceSelectionWith value)? replaceSelectionWith,
    TResult? Function(WrapSelectionWith value)? wrapSelectionWith,
    TResult? Function(AppendChild value)? appendChild,
    TResult? Function(AddSiblingBefore value)? addSiblingBefore,
    TResult? Function(AddSiblingAfter value)? addSiblingAfter,
    TResult? Function(PasteReplacement value)? pasteReplacement,
    TResult? Function(PasteChild value)? pasteChild,
    TResult? Function(PasteSiblingBefore value)? pasteSiblingBefore,
    TResult? Function(PasteSiblingAfter value)? pasteSiblingAfter,
    TResult? Function(DeleteNodeTapped value)? deleteNodeTapped,
    TResult? Function(CompleteDeletion value)? completeDeletion,
    TResult? Function(CopySnippetJsonToClipboard value)?
    copySnippetJsonToClipboard,
    TResult? Function(ReplaceSnippetFromJson value)? replaceSnippetFromJson,
    TResult? Function(CopyNode value)? copyNode,
    TResult? Function(CutNode value)? cutNode,
    TResult? Function(SelectedDirectoryOrNode value)? selectedDirectoryOrNode,
    TResult? Function(ImageChanged value)? imageChanged,
    TResult? Function(ForceSnippetRefresh value)? forceSnippetRefresh,
  }) {
    return saveNodeAsSnippet?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SelectPanel value)? selectPanel,
    TResult Function(OverrideTargetGK value)? overrideTargetGK,
    TResult Function(ForceRefresh value)? forceRefresh,
    TResult Function(UpdateClipboard value)? updateClipboard,
    TResult Function(PublishSnippet value)? publishSnippet,
    TResult Function(RevertSnippet value)? revertSnippet,
    TResult Function(DeletePage value)? deletePage,
    TResult Function(ToggleAutoPublishingOfSnippet value)?
    toggleAutoPublishingOfSnippet,
    TResult Function(AutoPublishDefault value)? autoPublishDefault,
    TResult Function(HideIframes value)? hideIframes,
    TResult Function(SetPanelSnippet value)? setPanelOrPlaceholderSnippet,
    TResult Function(EnterSelectWidgetMode value)? enterSelectWidgetMode,
    TResult Function(ExitSelectWidgetMode value)? exitSelectWidgetMode,
    TResult Function(PushSnippetEditor value)? pushSnippetEditor,
    TResult Function(PopSnippetEditor value)? popSnippetEditor,
    TResult Function(ShowDirectoryTree value)? showDirectoryTree,
    TResult Function(RemoveDirectoryTree value)? removeDirectoryTree,
    TResult Function(SelectNode value)? selectNode,
    TResult Function(ClearNodeSelection value)? clearNodeSelection,
    TResult Function(SaveNodeAsSnippet value)? saveNodeAsSnippet,
    TResult Function(ReplaceSelectionWith value)? replaceSelectionWith,
    TResult Function(WrapSelectionWith value)? wrapSelectionWith,
    TResult Function(AppendChild value)? appendChild,
    TResult Function(AddSiblingBefore value)? addSiblingBefore,
    TResult Function(AddSiblingAfter value)? addSiblingAfter,
    TResult Function(PasteReplacement value)? pasteReplacement,
    TResult Function(PasteChild value)? pasteChild,
    TResult Function(PasteSiblingBefore value)? pasteSiblingBefore,
    TResult Function(PasteSiblingAfter value)? pasteSiblingAfter,
    TResult Function(DeleteNodeTapped value)? deleteNodeTapped,
    TResult Function(CompleteDeletion value)? completeDeletion,
    TResult Function(CopySnippetJsonToClipboard value)?
    copySnippetJsonToClipboard,
    TResult Function(ReplaceSnippetFromJson value)? replaceSnippetFromJson,
    TResult Function(CopyNode value)? copyNode,
    TResult Function(CutNode value)? cutNode,
    TResult Function(SelectedDirectoryOrNode value)? selectedDirectoryOrNode,
    TResult Function(ImageChanged value)? imageChanged,
    TResult Function(ForceSnippetRefresh value)? forceSnippetRefresh,
    required TResult orElse(),
  }) {
    if (saveNodeAsSnippet != null) {
      return saveNodeAsSnippet(this);
    }
    return orElse();
  }
}

abstract class SaveNodeAsSnippet implements CAPIEvent {
  const factory SaveNodeAsSnippet({
    required final SNode node,
    required final String newSnippetName,
  }) = _$SaveNodeAsSnippetImpl;

  SNode get node;
  String get newSnippetName;

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SaveNodeAsSnippetImplCopyWith<_$SaveNodeAsSnippetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ReplaceSelectionWithImplCopyWith<$Res> {
  factory _$$ReplaceSelectionWithImplCopyWith(
    _$ReplaceSelectionWithImpl value,
    $Res Function(_$ReplaceSelectionWithImpl) then,
  ) = __$$ReplaceSelectionWithImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Type? type, String? snippetName, SNode? testNode});
}

/// @nodoc
class __$$ReplaceSelectionWithImplCopyWithImpl<$Res>
    extends _$CAPIEventCopyWithImpl<$Res, _$ReplaceSelectionWithImpl>
    implements _$$ReplaceSelectionWithImplCopyWith<$Res> {
  __$$ReplaceSelectionWithImplCopyWithImpl(
    _$ReplaceSelectionWithImpl _value,
    $Res Function(_$ReplaceSelectionWithImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? snippetName = freezed,
    Object? testNode = freezed,
  }) {
    return _then(
      _$ReplaceSelectionWithImpl(
        type:
            freezed == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                    as Type?,
        snippetName:
            freezed == snippetName
                ? _value.snippetName
                : snippetName // ignore: cast_nullable_to_non_nullable
                    as String?,
        testNode:
            freezed == testNode
                ? _value.testNode
                : testNode // ignore: cast_nullable_to_non_nullable
                    as SNode?,
      ),
    );
  }
}

/// @nodoc

class _$ReplaceSelectionWithImpl
    with DiagnosticableTreeMixin
    implements ReplaceSelectionWith {
  const _$ReplaceSelectionWithImpl({
    this.type,
    this.snippetName,
    this.testNode,
  });

  @override
  final Type? type;
  @override
  final String? snippetName;
  // only used when type is SnippetRefNode
  @override
  final SNode? testNode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CAPIEvent.replaceSelectionWith(type: $type, snippetName: $snippetName, testNode: $testNode)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CAPIEvent.replaceSelectionWith'))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('snippetName', snippetName))
      ..add(DiagnosticsProperty('testNode', testNode));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReplaceSelectionWithImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.snippetName, snippetName) ||
                other.snippetName == snippetName) &&
            (identical(other.testNode, testNode) ||
                other.testNode == testNode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type, snippetName, testNode);

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReplaceSelectionWithImplCopyWith<_$ReplaceSelectionWithImpl>
  get copyWith =>
      __$$ReplaceSelectionWithImplCopyWithImpl<_$ReplaceSelectionWithImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? panelName) selectPanel,
    required TResult Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )
    overrideTargetGK,
    required TResult Function(bool onlyTargetsWrappers) forceRefresh,
    required TResult Function(
      SNode? newContent,
      String? scName,
      dynamic skipSave,
    )
    updateClipboard,
    required TResult Function(String snippetName, String versionId)
    publishSnippet,
    required TResult Function(String snippetName, String versionId)
    revertSnippet,
    required TResult Function(String pathName) deletePage,
    required TResult Function(String snippetName) toggleAutoPublishingOfSnippet,
    required TResult Function(bool b) autoPublishDefault,
    required TResult Function(bool hide) hideIframes,
    required TResult Function(String snippetName, String panelName)
    setPanelOrPlaceholderSnippet,
    required TResult Function(String snippetName) enterSelectWidgetMode,
    required TResult Function() exitSelectWidgetMode,
    required TResult Function(SnippetRootNode rootNode, SNode? selectedNode)
    pushSnippetEditor,
    required TResult Function(bool save) popSnippetEditor,
    required TResult Function() showDirectoryTree,
    required TResult Function(bool save) removeDirectoryTree,
    required TResult Function(SNode node) selectNode,
    required TResult Function() clearNodeSelection,
    required TResult Function(SNode node, String newSnippetName)
    saveNodeAsSnippet,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    replaceSelectionWith,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    wrapSelectionWith,
    required TResult Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )
    appendChild,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    addSiblingBefore,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    addSiblingAfter,
    required TResult Function(Type? widgetSpanChildType) pasteReplacement,
    required TResult Function(
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )
    pasteChild,
    required TResult Function() pasteSiblingBefore,
    required TResult Function() pasteSiblingAfter,
    required TResult Function() deleteNodeTapped,
    required TResult Function() completeDeletion,
    required TResult Function(SnippetRootNode rootNode)
    copySnippetJsonToClipboard,
    required TResult Function(String? snippetJson) replaceSnippetFromJson,
    required TResult Function(SNode node, String? scName, dynamic skipSave)
    copyNode,
    required TResult Function(SNode node, String? scName, dynamic skipSave)
    cutNode,
    required TResult Function(String snippetName, SNode? selectedNode)
    selectedDirectoryOrNode,
    required TResult Function(Uint8List? newBytes) imageChanged,
    required TResult Function() forceSnippetRefresh,
  }) {
    return replaceSelectionWith(type, snippetName, testNode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? panelName)? selectPanel,
    TResult? Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )?
    overrideTargetGK,
    TResult? Function(bool onlyTargetsWrappers)? forceRefresh,
    TResult? Function(SNode? newContent, String? scName, dynamic skipSave)?
    updateClipboard,
    TResult? Function(String snippetName, String versionId)? publishSnippet,
    TResult? Function(String snippetName, String versionId)? revertSnippet,
    TResult? Function(String pathName)? deletePage,
    TResult? Function(String snippetName)? toggleAutoPublishingOfSnippet,
    TResult? Function(bool b)? autoPublishDefault,
    TResult? Function(bool hide)? hideIframes,
    TResult? Function(String snippetName, String panelName)?
    setPanelOrPlaceholderSnippet,
    TResult? Function(String snippetName)? enterSelectWidgetMode,
    TResult? Function()? exitSelectWidgetMode,
    TResult? Function(SnippetRootNode rootNode, SNode? selectedNode)?
    pushSnippetEditor,
    TResult? Function(bool save)? popSnippetEditor,
    TResult? Function()? showDirectoryTree,
    TResult? Function(bool save)? removeDirectoryTree,
    TResult? Function(SNode node)? selectNode,
    TResult? Function()? clearNodeSelection,
    TResult? Function(SNode node, String newSnippetName)? saveNodeAsSnippet,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    replaceSelectionWith,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    wrapSelectionWith,
    TResult? Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    appendChild,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingBefore,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingAfter,
    TResult? Function(Type? widgetSpanChildType)? pasteReplacement,
    TResult? Function(
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    pasteChild,
    TResult? Function()? pasteSiblingBefore,
    TResult? Function()? pasteSiblingAfter,
    TResult? Function()? deleteNodeTapped,
    TResult? Function()? completeDeletion,
    TResult? Function(SnippetRootNode rootNode)? copySnippetJsonToClipboard,
    TResult? Function(String? snippetJson)? replaceSnippetFromJson,
    TResult? Function(SNode node, String? scName, dynamic skipSave)? copyNode,
    TResult? Function(SNode node, String? scName, dynamic skipSave)? cutNode,
    TResult? Function(String snippetName, SNode? selectedNode)?
    selectedDirectoryOrNode,
    TResult? Function(Uint8List? newBytes)? imageChanged,
    TResult? Function()? forceSnippetRefresh,
  }) {
    return replaceSelectionWith?.call(type, snippetName, testNode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? panelName)? selectPanel,
    TResult Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )?
    overrideTargetGK,
    TResult Function(bool onlyTargetsWrappers)? forceRefresh,
    TResult Function(SNode? newContent, String? scName, dynamic skipSave)?
    updateClipboard,
    TResult Function(String snippetName, String versionId)? publishSnippet,
    TResult Function(String snippetName, String versionId)? revertSnippet,
    TResult Function(String pathName)? deletePage,
    TResult Function(String snippetName)? toggleAutoPublishingOfSnippet,
    TResult Function(bool b)? autoPublishDefault,
    TResult Function(bool hide)? hideIframes,
    TResult Function(String snippetName, String panelName)?
    setPanelOrPlaceholderSnippet,
    TResult Function(String snippetName)? enterSelectWidgetMode,
    TResult Function()? exitSelectWidgetMode,
    TResult Function(SnippetRootNode rootNode, SNode? selectedNode)?
    pushSnippetEditor,
    TResult Function(bool save)? popSnippetEditor,
    TResult Function()? showDirectoryTree,
    TResult Function(bool save)? removeDirectoryTree,
    TResult Function(SNode node)? selectNode,
    TResult Function()? clearNodeSelection,
    TResult Function(SNode node, String newSnippetName)? saveNodeAsSnippet,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    replaceSelectionWith,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    wrapSelectionWith,
    TResult Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    appendChild,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingBefore,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingAfter,
    TResult Function(Type? widgetSpanChildType)? pasteReplacement,
    TResult Function(Type? widgetSpanChildType, SNode? testWidgetSpanChildNode)?
    pasteChild,
    TResult Function()? pasteSiblingBefore,
    TResult Function()? pasteSiblingAfter,
    TResult Function()? deleteNodeTapped,
    TResult Function()? completeDeletion,
    TResult Function(SnippetRootNode rootNode)? copySnippetJsonToClipboard,
    TResult Function(String? snippetJson)? replaceSnippetFromJson,
    TResult Function(SNode node, String? scName, dynamic skipSave)? copyNode,
    TResult Function(SNode node, String? scName, dynamic skipSave)? cutNode,
    TResult Function(String snippetName, SNode? selectedNode)?
    selectedDirectoryOrNode,
    TResult Function(Uint8List? newBytes)? imageChanged,
    TResult Function()? forceSnippetRefresh,
    required TResult orElse(),
  }) {
    if (replaceSelectionWith != null) {
      return replaceSelectionWith(type, snippetName, testNode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SelectPanel value) selectPanel,
    required TResult Function(OverrideTargetGK value) overrideTargetGK,
    required TResult Function(ForceRefresh value) forceRefresh,
    required TResult Function(UpdateClipboard value) updateClipboard,
    required TResult Function(PublishSnippet value) publishSnippet,
    required TResult Function(RevertSnippet value) revertSnippet,
    required TResult Function(DeletePage value) deletePage,
    required TResult Function(ToggleAutoPublishingOfSnippet value)
    toggleAutoPublishingOfSnippet,
    required TResult Function(AutoPublishDefault value) autoPublishDefault,
    required TResult Function(HideIframes value) hideIframes,
    required TResult Function(SetPanelSnippet value)
    setPanelOrPlaceholderSnippet,
    required TResult Function(EnterSelectWidgetMode value)
    enterSelectWidgetMode,
    required TResult Function(ExitSelectWidgetMode value) exitSelectWidgetMode,
    required TResult Function(PushSnippetEditor value) pushSnippetEditor,
    required TResult Function(PopSnippetEditor value) popSnippetEditor,
    required TResult Function(ShowDirectoryTree value) showDirectoryTree,
    required TResult Function(RemoveDirectoryTree value) removeDirectoryTree,
    required TResult Function(SelectNode value) selectNode,
    required TResult Function(ClearNodeSelection value) clearNodeSelection,
    required TResult Function(SaveNodeAsSnippet value) saveNodeAsSnippet,
    required TResult Function(ReplaceSelectionWith value) replaceSelectionWith,
    required TResult Function(WrapSelectionWith value) wrapSelectionWith,
    required TResult Function(AppendChild value) appendChild,
    required TResult Function(AddSiblingBefore value) addSiblingBefore,
    required TResult Function(AddSiblingAfter value) addSiblingAfter,
    required TResult Function(PasteReplacement value) pasteReplacement,
    required TResult Function(PasteChild value) pasteChild,
    required TResult Function(PasteSiblingBefore value) pasteSiblingBefore,
    required TResult Function(PasteSiblingAfter value) pasteSiblingAfter,
    required TResult Function(DeleteNodeTapped value) deleteNodeTapped,
    required TResult Function(CompleteDeletion value) completeDeletion,
    required TResult Function(CopySnippetJsonToClipboard value)
    copySnippetJsonToClipboard,
    required TResult Function(ReplaceSnippetFromJson value)
    replaceSnippetFromJson,
    required TResult Function(CopyNode value) copyNode,
    required TResult Function(CutNode value) cutNode,
    required TResult Function(SelectedDirectoryOrNode value)
    selectedDirectoryOrNode,
    required TResult Function(ImageChanged value) imageChanged,
    required TResult Function(ForceSnippetRefresh value) forceSnippetRefresh,
  }) {
    return replaceSelectionWith(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SelectPanel value)? selectPanel,
    TResult? Function(OverrideTargetGK value)? overrideTargetGK,
    TResult? Function(ForceRefresh value)? forceRefresh,
    TResult? Function(UpdateClipboard value)? updateClipboard,
    TResult? Function(PublishSnippet value)? publishSnippet,
    TResult? Function(RevertSnippet value)? revertSnippet,
    TResult? Function(DeletePage value)? deletePage,
    TResult? Function(ToggleAutoPublishingOfSnippet value)?
    toggleAutoPublishingOfSnippet,
    TResult? Function(AutoPublishDefault value)? autoPublishDefault,
    TResult? Function(HideIframes value)? hideIframes,
    TResult? Function(SetPanelSnippet value)? setPanelOrPlaceholderSnippet,
    TResult? Function(EnterSelectWidgetMode value)? enterSelectWidgetMode,
    TResult? Function(ExitSelectWidgetMode value)? exitSelectWidgetMode,
    TResult? Function(PushSnippetEditor value)? pushSnippetEditor,
    TResult? Function(PopSnippetEditor value)? popSnippetEditor,
    TResult? Function(ShowDirectoryTree value)? showDirectoryTree,
    TResult? Function(RemoveDirectoryTree value)? removeDirectoryTree,
    TResult? Function(SelectNode value)? selectNode,
    TResult? Function(ClearNodeSelection value)? clearNodeSelection,
    TResult? Function(SaveNodeAsSnippet value)? saveNodeAsSnippet,
    TResult? Function(ReplaceSelectionWith value)? replaceSelectionWith,
    TResult? Function(WrapSelectionWith value)? wrapSelectionWith,
    TResult? Function(AppendChild value)? appendChild,
    TResult? Function(AddSiblingBefore value)? addSiblingBefore,
    TResult? Function(AddSiblingAfter value)? addSiblingAfter,
    TResult? Function(PasteReplacement value)? pasteReplacement,
    TResult? Function(PasteChild value)? pasteChild,
    TResult? Function(PasteSiblingBefore value)? pasteSiblingBefore,
    TResult? Function(PasteSiblingAfter value)? pasteSiblingAfter,
    TResult? Function(DeleteNodeTapped value)? deleteNodeTapped,
    TResult? Function(CompleteDeletion value)? completeDeletion,
    TResult? Function(CopySnippetJsonToClipboard value)?
    copySnippetJsonToClipboard,
    TResult? Function(ReplaceSnippetFromJson value)? replaceSnippetFromJson,
    TResult? Function(CopyNode value)? copyNode,
    TResult? Function(CutNode value)? cutNode,
    TResult? Function(SelectedDirectoryOrNode value)? selectedDirectoryOrNode,
    TResult? Function(ImageChanged value)? imageChanged,
    TResult? Function(ForceSnippetRefresh value)? forceSnippetRefresh,
  }) {
    return replaceSelectionWith?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SelectPanel value)? selectPanel,
    TResult Function(OverrideTargetGK value)? overrideTargetGK,
    TResult Function(ForceRefresh value)? forceRefresh,
    TResult Function(UpdateClipboard value)? updateClipboard,
    TResult Function(PublishSnippet value)? publishSnippet,
    TResult Function(RevertSnippet value)? revertSnippet,
    TResult Function(DeletePage value)? deletePage,
    TResult Function(ToggleAutoPublishingOfSnippet value)?
    toggleAutoPublishingOfSnippet,
    TResult Function(AutoPublishDefault value)? autoPublishDefault,
    TResult Function(HideIframes value)? hideIframes,
    TResult Function(SetPanelSnippet value)? setPanelOrPlaceholderSnippet,
    TResult Function(EnterSelectWidgetMode value)? enterSelectWidgetMode,
    TResult Function(ExitSelectWidgetMode value)? exitSelectWidgetMode,
    TResult Function(PushSnippetEditor value)? pushSnippetEditor,
    TResult Function(PopSnippetEditor value)? popSnippetEditor,
    TResult Function(ShowDirectoryTree value)? showDirectoryTree,
    TResult Function(RemoveDirectoryTree value)? removeDirectoryTree,
    TResult Function(SelectNode value)? selectNode,
    TResult Function(ClearNodeSelection value)? clearNodeSelection,
    TResult Function(SaveNodeAsSnippet value)? saveNodeAsSnippet,
    TResult Function(ReplaceSelectionWith value)? replaceSelectionWith,
    TResult Function(WrapSelectionWith value)? wrapSelectionWith,
    TResult Function(AppendChild value)? appendChild,
    TResult Function(AddSiblingBefore value)? addSiblingBefore,
    TResult Function(AddSiblingAfter value)? addSiblingAfter,
    TResult Function(PasteReplacement value)? pasteReplacement,
    TResult Function(PasteChild value)? pasteChild,
    TResult Function(PasteSiblingBefore value)? pasteSiblingBefore,
    TResult Function(PasteSiblingAfter value)? pasteSiblingAfter,
    TResult Function(DeleteNodeTapped value)? deleteNodeTapped,
    TResult Function(CompleteDeletion value)? completeDeletion,
    TResult Function(CopySnippetJsonToClipboard value)?
    copySnippetJsonToClipboard,
    TResult Function(ReplaceSnippetFromJson value)? replaceSnippetFromJson,
    TResult Function(CopyNode value)? copyNode,
    TResult Function(CutNode value)? cutNode,
    TResult Function(SelectedDirectoryOrNode value)? selectedDirectoryOrNode,
    TResult Function(ImageChanged value)? imageChanged,
    TResult Function(ForceSnippetRefresh value)? forceSnippetRefresh,
    required TResult orElse(),
  }) {
    if (replaceSelectionWith != null) {
      return replaceSelectionWith(this);
    }
    return orElse();
  }
}

abstract class ReplaceSelectionWith implements CAPIEvent {
  const factory ReplaceSelectionWith({
    final Type? type,
    final String? snippetName,
    final SNode? testNode,
  }) = _$ReplaceSelectionWithImpl;

  Type? get type;
  String? get snippetName; // only used when type is SnippetRefNode
  SNode? get testNode;

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReplaceSelectionWithImplCopyWith<_$ReplaceSelectionWithImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WrapSelectionWithImplCopyWith<$Res> {
  factory _$$WrapSelectionWithImplCopyWith(
    _$WrapSelectionWithImpl value,
    $Res Function(_$WrapSelectionWithImpl) then,
  ) = __$$WrapSelectionWithImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Type? type, String? snippetName, SNode? testNode});
}

/// @nodoc
class __$$WrapSelectionWithImplCopyWithImpl<$Res>
    extends _$CAPIEventCopyWithImpl<$Res, _$WrapSelectionWithImpl>
    implements _$$WrapSelectionWithImplCopyWith<$Res> {
  __$$WrapSelectionWithImplCopyWithImpl(
    _$WrapSelectionWithImpl _value,
    $Res Function(_$WrapSelectionWithImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? snippetName = freezed,
    Object? testNode = freezed,
  }) {
    return _then(
      _$WrapSelectionWithImpl(
        type:
            freezed == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                    as Type?,
        snippetName:
            freezed == snippetName
                ? _value.snippetName
                : snippetName // ignore: cast_nullable_to_non_nullable
                    as String?,
        testNode:
            freezed == testNode
                ? _value.testNode
                : testNode // ignore: cast_nullable_to_non_nullable
                    as SNode?,
      ),
    );
  }
}

/// @nodoc

class _$WrapSelectionWithImpl
    with DiagnosticableTreeMixin
    implements WrapSelectionWith {
  const _$WrapSelectionWithImpl({this.type, this.snippetName, this.testNode});

  @override
  final Type? type;
  @override
  final String? snippetName;
  // only used when type is SnippetRefNode
  @override
  final SNode? testNode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CAPIEvent.wrapSelectionWith(type: $type, snippetName: $snippetName, testNode: $testNode)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CAPIEvent.wrapSelectionWith'))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('snippetName', snippetName))
      ..add(DiagnosticsProperty('testNode', testNode));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WrapSelectionWithImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.snippetName, snippetName) ||
                other.snippetName == snippetName) &&
            (identical(other.testNode, testNode) ||
                other.testNode == testNode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type, snippetName, testNode);

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WrapSelectionWithImplCopyWith<_$WrapSelectionWithImpl> get copyWith =>
      __$$WrapSelectionWithImplCopyWithImpl<_$WrapSelectionWithImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? panelName) selectPanel,
    required TResult Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )
    overrideTargetGK,
    required TResult Function(bool onlyTargetsWrappers) forceRefresh,
    required TResult Function(
      SNode? newContent,
      String? scName,
      dynamic skipSave,
    )
    updateClipboard,
    required TResult Function(String snippetName, String versionId)
    publishSnippet,
    required TResult Function(String snippetName, String versionId)
    revertSnippet,
    required TResult Function(String pathName) deletePage,
    required TResult Function(String snippetName) toggleAutoPublishingOfSnippet,
    required TResult Function(bool b) autoPublishDefault,
    required TResult Function(bool hide) hideIframes,
    required TResult Function(String snippetName, String panelName)
    setPanelOrPlaceholderSnippet,
    required TResult Function(String snippetName) enterSelectWidgetMode,
    required TResult Function() exitSelectWidgetMode,
    required TResult Function(SnippetRootNode rootNode, SNode? selectedNode)
    pushSnippetEditor,
    required TResult Function(bool save) popSnippetEditor,
    required TResult Function() showDirectoryTree,
    required TResult Function(bool save) removeDirectoryTree,
    required TResult Function(SNode node) selectNode,
    required TResult Function() clearNodeSelection,
    required TResult Function(SNode node, String newSnippetName)
    saveNodeAsSnippet,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    replaceSelectionWith,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    wrapSelectionWith,
    required TResult Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )
    appendChild,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    addSiblingBefore,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    addSiblingAfter,
    required TResult Function(Type? widgetSpanChildType) pasteReplacement,
    required TResult Function(
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )
    pasteChild,
    required TResult Function() pasteSiblingBefore,
    required TResult Function() pasteSiblingAfter,
    required TResult Function() deleteNodeTapped,
    required TResult Function() completeDeletion,
    required TResult Function(SnippetRootNode rootNode)
    copySnippetJsonToClipboard,
    required TResult Function(String? snippetJson) replaceSnippetFromJson,
    required TResult Function(SNode node, String? scName, dynamic skipSave)
    copyNode,
    required TResult Function(SNode node, String? scName, dynamic skipSave)
    cutNode,
    required TResult Function(String snippetName, SNode? selectedNode)
    selectedDirectoryOrNode,
    required TResult Function(Uint8List? newBytes) imageChanged,
    required TResult Function() forceSnippetRefresh,
  }) {
    return wrapSelectionWith(type, snippetName, testNode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? panelName)? selectPanel,
    TResult? Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )?
    overrideTargetGK,
    TResult? Function(bool onlyTargetsWrappers)? forceRefresh,
    TResult? Function(SNode? newContent, String? scName, dynamic skipSave)?
    updateClipboard,
    TResult? Function(String snippetName, String versionId)? publishSnippet,
    TResult? Function(String snippetName, String versionId)? revertSnippet,
    TResult? Function(String pathName)? deletePage,
    TResult? Function(String snippetName)? toggleAutoPublishingOfSnippet,
    TResult? Function(bool b)? autoPublishDefault,
    TResult? Function(bool hide)? hideIframes,
    TResult? Function(String snippetName, String panelName)?
    setPanelOrPlaceholderSnippet,
    TResult? Function(String snippetName)? enterSelectWidgetMode,
    TResult? Function()? exitSelectWidgetMode,
    TResult? Function(SnippetRootNode rootNode, SNode? selectedNode)?
    pushSnippetEditor,
    TResult? Function(bool save)? popSnippetEditor,
    TResult? Function()? showDirectoryTree,
    TResult? Function(bool save)? removeDirectoryTree,
    TResult? Function(SNode node)? selectNode,
    TResult? Function()? clearNodeSelection,
    TResult? Function(SNode node, String newSnippetName)? saveNodeAsSnippet,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    replaceSelectionWith,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    wrapSelectionWith,
    TResult? Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    appendChild,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingBefore,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingAfter,
    TResult? Function(Type? widgetSpanChildType)? pasteReplacement,
    TResult? Function(
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    pasteChild,
    TResult? Function()? pasteSiblingBefore,
    TResult? Function()? pasteSiblingAfter,
    TResult? Function()? deleteNodeTapped,
    TResult? Function()? completeDeletion,
    TResult? Function(SnippetRootNode rootNode)? copySnippetJsonToClipboard,
    TResult? Function(String? snippetJson)? replaceSnippetFromJson,
    TResult? Function(SNode node, String? scName, dynamic skipSave)? copyNode,
    TResult? Function(SNode node, String? scName, dynamic skipSave)? cutNode,
    TResult? Function(String snippetName, SNode? selectedNode)?
    selectedDirectoryOrNode,
    TResult? Function(Uint8List? newBytes)? imageChanged,
    TResult? Function()? forceSnippetRefresh,
  }) {
    return wrapSelectionWith?.call(type, snippetName, testNode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? panelName)? selectPanel,
    TResult Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )?
    overrideTargetGK,
    TResult Function(bool onlyTargetsWrappers)? forceRefresh,
    TResult Function(SNode? newContent, String? scName, dynamic skipSave)?
    updateClipboard,
    TResult Function(String snippetName, String versionId)? publishSnippet,
    TResult Function(String snippetName, String versionId)? revertSnippet,
    TResult Function(String pathName)? deletePage,
    TResult Function(String snippetName)? toggleAutoPublishingOfSnippet,
    TResult Function(bool b)? autoPublishDefault,
    TResult Function(bool hide)? hideIframes,
    TResult Function(String snippetName, String panelName)?
    setPanelOrPlaceholderSnippet,
    TResult Function(String snippetName)? enterSelectWidgetMode,
    TResult Function()? exitSelectWidgetMode,
    TResult Function(SnippetRootNode rootNode, SNode? selectedNode)?
    pushSnippetEditor,
    TResult Function(bool save)? popSnippetEditor,
    TResult Function()? showDirectoryTree,
    TResult Function(bool save)? removeDirectoryTree,
    TResult Function(SNode node)? selectNode,
    TResult Function()? clearNodeSelection,
    TResult Function(SNode node, String newSnippetName)? saveNodeAsSnippet,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    replaceSelectionWith,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    wrapSelectionWith,
    TResult Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    appendChild,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingBefore,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingAfter,
    TResult Function(Type? widgetSpanChildType)? pasteReplacement,
    TResult Function(Type? widgetSpanChildType, SNode? testWidgetSpanChildNode)?
    pasteChild,
    TResult Function()? pasteSiblingBefore,
    TResult Function()? pasteSiblingAfter,
    TResult Function()? deleteNodeTapped,
    TResult Function()? completeDeletion,
    TResult Function(SnippetRootNode rootNode)? copySnippetJsonToClipboard,
    TResult Function(String? snippetJson)? replaceSnippetFromJson,
    TResult Function(SNode node, String? scName, dynamic skipSave)? copyNode,
    TResult Function(SNode node, String? scName, dynamic skipSave)? cutNode,
    TResult Function(String snippetName, SNode? selectedNode)?
    selectedDirectoryOrNode,
    TResult Function(Uint8List? newBytes)? imageChanged,
    TResult Function()? forceSnippetRefresh,
    required TResult orElse(),
  }) {
    if (wrapSelectionWith != null) {
      return wrapSelectionWith(type, snippetName, testNode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SelectPanel value) selectPanel,
    required TResult Function(OverrideTargetGK value) overrideTargetGK,
    required TResult Function(ForceRefresh value) forceRefresh,
    required TResult Function(UpdateClipboard value) updateClipboard,
    required TResult Function(PublishSnippet value) publishSnippet,
    required TResult Function(RevertSnippet value) revertSnippet,
    required TResult Function(DeletePage value) deletePage,
    required TResult Function(ToggleAutoPublishingOfSnippet value)
    toggleAutoPublishingOfSnippet,
    required TResult Function(AutoPublishDefault value) autoPublishDefault,
    required TResult Function(HideIframes value) hideIframes,
    required TResult Function(SetPanelSnippet value)
    setPanelOrPlaceholderSnippet,
    required TResult Function(EnterSelectWidgetMode value)
    enterSelectWidgetMode,
    required TResult Function(ExitSelectWidgetMode value) exitSelectWidgetMode,
    required TResult Function(PushSnippetEditor value) pushSnippetEditor,
    required TResult Function(PopSnippetEditor value) popSnippetEditor,
    required TResult Function(ShowDirectoryTree value) showDirectoryTree,
    required TResult Function(RemoveDirectoryTree value) removeDirectoryTree,
    required TResult Function(SelectNode value) selectNode,
    required TResult Function(ClearNodeSelection value) clearNodeSelection,
    required TResult Function(SaveNodeAsSnippet value) saveNodeAsSnippet,
    required TResult Function(ReplaceSelectionWith value) replaceSelectionWith,
    required TResult Function(WrapSelectionWith value) wrapSelectionWith,
    required TResult Function(AppendChild value) appendChild,
    required TResult Function(AddSiblingBefore value) addSiblingBefore,
    required TResult Function(AddSiblingAfter value) addSiblingAfter,
    required TResult Function(PasteReplacement value) pasteReplacement,
    required TResult Function(PasteChild value) pasteChild,
    required TResult Function(PasteSiblingBefore value) pasteSiblingBefore,
    required TResult Function(PasteSiblingAfter value) pasteSiblingAfter,
    required TResult Function(DeleteNodeTapped value) deleteNodeTapped,
    required TResult Function(CompleteDeletion value) completeDeletion,
    required TResult Function(CopySnippetJsonToClipboard value)
    copySnippetJsonToClipboard,
    required TResult Function(ReplaceSnippetFromJson value)
    replaceSnippetFromJson,
    required TResult Function(CopyNode value) copyNode,
    required TResult Function(CutNode value) cutNode,
    required TResult Function(SelectedDirectoryOrNode value)
    selectedDirectoryOrNode,
    required TResult Function(ImageChanged value) imageChanged,
    required TResult Function(ForceSnippetRefresh value) forceSnippetRefresh,
  }) {
    return wrapSelectionWith(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SelectPanel value)? selectPanel,
    TResult? Function(OverrideTargetGK value)? overrideTargetGK,
    TResult? Function(ForceRefresh value)? forceRefresh,
    TResult? Function(UpdateClipboard value)? updateClipboard,
    TResult? Function(PublishSnippet value)? publishSnippet,
    TResult? Function(RevertSnippet value)? revertSnippet,
    TResult? Function(DeletePage value)? deletePage,
    TResult? Function(ToggleAutoPublishingOfSnippet value)?
    toggleAutoPublishingOfSnippet,
    TResult? Function(AutoPublishDefault value)? autoPublishDefault,
    TResult? Function(HideIframes value)? hideIframes,
    TResult? Function(SetPanelSnippet value)? setPanelOrPlaceholderSnippet,
    TResult? Function(EnterSelectWidgetMode value)? enterSelectWidgetMode,
    TResult? Function(ExitSelectWidgetMode value)? exitSelectWidgetMode,
    TResult? Function(PushSnippetEditor value)? pushSnippetEditor,
    TResult? Function(PopSnippetEditor value)? popSnippetEditor,
    TResult? Function(ShowDirectoryTree value)? showDirectoryTree,
    TResult? Function(RemoveDirectoryTree value)? removeDirectoryTree,
    TResult? Function(SelectNode value)? selectNode,
    TResult? Function(ClearNodeSelection value)? clearNodeSelection,
    TResult? Function(SaveNodeAsSnippet value)? saveNodeAsSnippet,
    TResult? Function(ReplaceSelectionWith value)? replaceSelectionWith,
    TResult? Function(WrapSelectionWith value)? wrapSelectionWith,
    TResult? Function(AppendChild value)? appendChild,
    TResult? Function(AddSiblingBefore value)? addSiblingBefore,
    TResult? Function(AddSiblingAfter value)? addSiblingAfter,
    TResult? Function(PasteReplacement value)? pasteReplacement,
    TResult? Function(PasteChild value)? pasteChild,
    TResult? Function(PasteSiblingBefore value)? pasteSiblingBefore,
    TResult? Function(PasteSiblingAfter value)? pasteSiblingAfter,
    TResult? Function(DeleteNodeTapped value)? deleteNodeTapped,
    TResult? Function(CompleteDeletion value)? completeDeletion,
    TResult? Function(CopySnippetJsonToClipboard value)?
    copySnippetJsonToClipboard,
    TResult? Function(ReplaceSnippetFromJson value)? replaceSnippetFromJson,
    TResult? Function(CopyNode value)? copyNode,
    TResult? Function(CutNode value)? cutNode,
    TResult? Function(SelectedDirectoryOrNode value)? selectedDirectoryOrNode,
    TResult? Function(ImageChanged value)? imageChanged,
    TResult? Function(ForceSnippetRefresh value)? forceSnippetRefresh,
  }) {
    return wrapSelectionWith?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SelectPanel value)? selectPanel,
    TResult Function(OverrideTargetGK value)? overrideTargetGK,
    TResult Function(ForceRefresh value)? forceRefresh,
    TResult Function(UpdateClipboard value)? updateClipboard,
    TResult Function(PublishSnippet value)? publishSnippet,
    TResult Function(RevertSnippet value)? revertSnippet,
    TResult Function(DeletePage value)? deletePage,
    TResult Function(ToggleAutoPublishingOfSnippet value)?
    toggleAutoPublishingOfSnippet,
    TResult Function(AutoPublishDefault value)? autoPublishDefault,
    TResult Function(HideIframes value)? hideIframes,
    TResult Function(SetPanelSnippet value)? setPanelOrPlaceholderSnippet,
    TResult Function(EnterSelectWidgetMode value)? enterSelectWidgetMode,
    TResult Function(ExitSelectWidgetMode value)? exitSelectWidgetMode,
    TResult Function(PushSnippetEditor value)? pushSnippetEditor,
    TResult Function(PopSnippetEditor value)? popSnippetEditor,
    TResult Function(ShowDirectoryTree value)? showDirectoryTree,
    TResult Function(RemoveDirectoryTree value)? removeDirectoryTree,
    TResult Function(SelectNode value)? selectNode,
    TResult Function(ClearNodeSelection value)? clearNodeSelection,
    TResult Function(SaveNodeAsSnippet value)? saveNodeAsSnippet,
    TResult Function(ReplaceSelectionWith value)? replaceSelectionWith,
    TResult Function(WrapSelectionWith value)? wrapSelectionWith,
    TResult Function(AppendChild value)? appendChild,
    TResult Function(AddSiblingBefore value)? addSiblingBefore,
    TResult Function(AddSiblingAfter value)? addSiblingAfter,
    TResult Function(PasteReplacement value)? pasteReplacement,
    TResult Function(PasteChild value)? pasteChild,
    TResult Function(PasteSiblingBefore value)? pasteSiblingBefore,
    TResult Function(PasteSiblingAfter value)? pasteSiblingAfter,
    TResult Function(DeleteNodeTapped value)? deleteNodeTapped,
    TResult Function(CompleteDeletion value)? completeDeletion,
    TResult Function(CopySnippetJsonToClipboard value)?
    copySnippetJsonToClipboard,
    TResult Function(ReplaceSnippetFromJson value)? replaceSnippetFromJson,
    TResult Function(CopyNode value)? copyNode,
    TResult Function(CutNode value)? cutNode,
    TResult Function(SelectedDirectoryOrNode value)? selectedDirectoryOrNode,
    TResult Function(ImageChanged value)? imageChanged,
    TResult Function(ForceSnippetRefresh value)? forceSnippetRefresh,
    required TResult orElse(),
  }) {
    if (wrapSelectionWith != null) {
      return wrapSelectionWith(this);
    }
    return orElse();
  }
}

abstract class WrapSelectionWith implements CAPIEvent {
  const factory WrapSelectionWith({
    final Type? type,
    final String? snippetName,
    final SNode? testNode,
  }) = _$WrapSelectionWithImpl;

  Type? get type;
  String? get snippetName; // only used when type is SnippetRefNode
  SNode? get testNode;

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WrapSelectionWithImplCopyWith<_$WrapSelectionWithImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AppendChildImplCopyWith<$Res> {
  factory _$$AppendChildImplCopyWith(
    _$AppendChildImpl value,
    $Res Function(_$AppendChildImpl) then,
  ) = __$$AppendChildImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    Type? type,
    SNode? testNode,
    String? snippetName,
    Type? widgetSpanChildType,
    SNode? testWidgetSpanChildNode,
  });
}

/// @nodoc
class __$$AppendChildImplCopyWithImpl<$Res>
    extends _$CAPIEventCopyWithImpl<$Res, _$AppendChildImpl>
    implements _$$AppendChildImplCopyWith<$Res> {
  __$$AppendChildImplCopyWithImpl(
    _$AppendChildImpl _value,
    $Res Function(_$AppendChildImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? testNode = freezed,
    Object? snippetName = freezed,
    Object? widgetSpanChildType = freezed,
    Object? testWidgetSpanChildNode = freezed,
  }) {
    return _then(
      _$AppendChildImpl(
        type:
            freezed == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                    as Type?,
        testNode:
            freezed == testNode
                ? _value.testNode
                : testNode // ignore: cast_nullable_to_non_nullable
                    as SNode?,
        snippetName:
            freezed == snippetName
                ? _value.snippetName
                : snippetName // ignore: cast_nullable_to_non_nullable
                    as String?,
        widgetSpanChildType:
            freezed == widgetSpanChildType
                ? _value.widgetSpanChildType
                : widgetSpanChildType // ignore: cast_nullable_to_non_nullable
                    as Type?,
        testWidgetSpanChildNode:
            freezed == testWidgetSpanChildNode
                ? _value.testWidgetSpanChildNode
                : testWidgetSpanChildNode // ignore: cast_nullable_to_non_nullable
                    as SNode?,
      ),
    );
  }
}

/// @nodoc

class _$AppendChildImpl with DiagnosticableTreeMixin implements AppendChild {
  const _$AppendChildImpl({
    this.type,
    this.testNode,
    this.snippetName,
    this.widgetSpanChildType,
    this.testWidgetSpanChildNode,
  });

  @override
  final Type? type;
  @override
  final SNode? testNode;
  @override
  final String? snippetName;
  // only used when type is SnippetRefNode
  @override
  final Type? widgetSpanChildType;
  @override
  final SNode? testWidgetSpanChildNode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CAPIEvent.appendChild(type: $type, testNode: $testNode, snippetName: $snippetName, widgetSpanChildType: $widgetSpanChildType, testWidgetSpanChildNode: $testWidgetSpanChildNode)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CAPIEvent.appendChild'))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('testNode', testNode))
      ..add(DiagnosticsProperty('snippetName', snippetName))
      ..add(DiagnosticsProperty('widgetSpanChildType', widgetSpanChildType))
      ..add(
        DiagnosticsProperty('testWidgetSpanChildNode', testWidgetSpanChildNode),
      );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppendChildImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.testNode, testNode) ||
                other.testNode == testNode) &&
            (identical(other.snippetName, snippetName) ||
                other.snippetName == snippetName) &&
            (identical(other.widgetSpanChildType, widgetSpanChildType) ||
                other.widgetSpanChildType == widgetSpanChildType) &&
            (identical(
                  other.testWidgetSpanChildNode,
                  testWidgetSpanChildNode,
                ) ||
                other.testWidgetSpanChildNode == testWidgetSpanChildNode));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    type,
    testNode,
    snippetName,
    widgetSpanChildType,
    testWidgetSpanChildNode,
  );

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppendChildImplCopyWith<_$AppendChildImpl> get copyWith =>
      __$$AppendChildImplCopyWithImpl<_$AppendChildImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? panelName) selectPanel,
    required TResult Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )
    overrideTargetGK,
    required TResult Function(bool onlyTargetsWrappers) forceRefresh,
    required TResult Function(
      SNode? newContent,
      String? scName,
      dynamic skipSave,
    )
    updateClipboard,
    required TResult Function(String snippetName, String versionId)
    publishSnippet,
    required TResult Function(String snippetName, String versionId)
    revertSnippet,
    required TResult Function(String pathName) deletePage,
    required TResult Function(String snippetName) toggleAutoPublishingOfSnippet,
    required TResult Function(bool b) autoPublishDefault,
    required TResult Function(bool hide) hideIframes,
    required TResult Function(String snippetName, String panelName)
    setPanelOrPlaceholderSnippet,
    required TResult Function(String snippetName) enterSelectWidgetMode,
    required TResult Function() exitSelectWidgetMode,
    required TResult Function(SnippetRootNode rootNode, SNode? selectedNode)
    pushSnippetEditor,
    required TResult Function(bool save) popSnippetEditor,
    required TResult Function() showDirectoryTree,
    required TResult Function(bool save) removeDirectoryTree,
    required TResult Function(SNode node) selectNode,
    required TResult Function() clearNodeSelection,
    required TResult Function(SNode node, String newSnippetName)
    saveNodeAsSnippet,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    replaceSelectionWith,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    wrapSelectionWith,
    required TResult Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )
    appendChild,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    addSiblingBefore,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    addSiblingAfter,
    required TResult Function(Type? widgetSpanChildType) pasteReplacement,
    required TResult Function(
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )
    pasteChild,
    required TResult Function() pasteSiblingBefore,
    required TResult Function() pasteSiblingAfter,
    required TResult Function() deleteNodeTapped,
    required TResult Function() completeDeletion,
    required TResult Function(SnippetRootNode rootNode)
    copySnippetJsonToClipboard,
    required TResult Function(String? snippetJson) replaceSnippetFromJson,
    required TResult Function(SNode node, String? scName, dynamic skipSave)
    copyNode,
    required TResult Function(SNode node, String? scName, dynamic skipSave)
    cutNode,
    required TResult Function(String snippetName, SNode? selectedNode)
    selectedDirectoryOrNode,
    required TResult Function(Uint8List? newBytes) imageChanged,
    required TResult Function() forceSnippetRefresh,
  }) {
    return appendChild(
      type,
      testNode,
      snippetName,
      widgetSpanChildType,
      testWidgetSpanChildNode,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? panelName)? selectPanel,
    TResult? Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )?
    overrideTargetGK,
    TResult? Function(bool onlyTargetsWrappers)? forceRefresh,
    TResult? Function(SNode? newContent, String? scName, dynamic skipSave)?
    updateClipboard,
    TResult? Function(String snippetName, String versionId)? publishSnippet,
    TResult? Function(String snippetName, String versionId)? revertSnippet,
    TResult? Function(String pathName)? deletePage,
    TResult? Function(String snippetName)? toggleAutoPublishingOfSnippet,
    TResult? Function(bool b)? autoPublishDefault,
    TResult? Function(bool hide)? hideIframes,
    TResult? Function(String snippetName, String panelName)?
    setPanelOrPlaceholderSnippet,
    TResult? Function(String snippetName)? enterSelectWidgetMode,
    TResult? Function()? exitSelectWidgetMode,
    TResult? Function(SnippetRootNode rootNode, SNode? selectedNode)?
    pushSnippetEditor,
    TResult? Function(bool save)? popSnippetEditor,
    TResult? Function()? showDirectoryTree,
    TResult? Function(bool save)? removeDirectoryTree,
    TResult? Function(SNode node)? selectNode,
    TResult? Function()? clearNodeSelection,
    TResult? Function(SNode node, String newSnippetName)? saveNodeAsSnippet,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    replaceSelectionWith,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    wrapSelectionWith,
    TResult? Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    appendChild,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingBefore,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingAfter,
    TResult? Function(Type? widgetSpanChildType)? pasteReplacement,
    TResult? Function(
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    pasteChild,
    TResult? Function()? pasteSiblingBefore,
    TResult? Function()? pasteSiblingAfter,
    TResult? Function()? deleteNodeTapped,
    TResult? Function()? completeDeletion,
    TResult? Function(SnippetRootNode rootNode)? copySnippetJsonToClipboard,
    TResult? Function(String? snippetJson)? replaceSnippetFromJson,
    TResult? Function(SNode node, String? scName, dynamic skipSave)? copyNode,
    TResult? Function(SNode node, String? scName, dynamic skipSave)? cutNode,
    TResult? Function(String snippetName, SNode? selectedNode)?
    selectedDirectoryOrNode,
    TResult? Function(Uint8List? newBytes)? imageChanged,
    TResult? Function()? forceSnippetRefresh,
  }) {
    return appendChild?.call(
      type,
      testNode,
      snippetName,
      widgetSpanChildType,
      testWidgetSpanChildNode,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? panelName)? selectPanel,
    TResult Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )?
    overrideTargetGK,
    TResult Function(bool onlyTargetsWrappers)? forceRefresh,
    TResult Function(SNode? newContent, String? scName, dynamic skipSave)?
    updateClipboard,
    TResult Function(String snippetName, String versionId)? publishSnippet,
    TResult Function(String snippetName, String versionId)? revertSnippet,
    TResult Function(String pathName)? deletePage,
    TResult Function(String snippetName)? toggleAutoPublishingOfSnippet,
    TResult Function(bool b)? autoPublishDefault,
    TResult Function(bool hide)? hideIframes,
    TResult Function(String snippetName, String panelName)?
    setPanelOrPlaceholderSnippet,
    TResult Function(String snippetName)? enterSelectWidgetMode,
    TResult Function()? exitSelectWidgetMode,
    TResult Function(SnippetRootNode rootNode, SNode? selectedNode)?
    pushSnippetEditor,
    TResult Function(bool save)? popSnippetEditor,
    TResult Function()? showDirectoryTree,
    TResult Function(bool save)? removeDirectoryTree,
    TResult Function(SNode node)? selectNode,
    TResult Function()? clearNodeSelection,
    TResult Function(SNode node, String newSnippetName)? saveNodeAsSnippet,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    replaceSelectionWith,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    wrapSelectionWith,
    TResult Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    appendChild,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingBefore,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingAfter,
    TResult Function(Type? widgetSpanChildType)? pasteReplacement,
    TResult Function(Type? widgetSpanChildType, SNode? testWidgetSpanChildNode)?
    pasteChild,
    TResult Function()? pasteSiblingBefore,
    TResult Function()? pasteSiblingAfter,
    TResult Function()? deleteNodeTapped,
    TResult Function()? completeDeletion,
    TResult Function(SnippetRootNode rootNode)? copySnippetJsonToClipboard,
    TResult Function(String? snippetJson)? replaceSnippetFromJson,
    TResult Function(SNode node, String? scName, dynamic skipSave)? copyNode,
    TResult Function(SNode node, String? scName, dynamic skipSave)? cutNode,
    TResult Function(String snippetName, SNode? selectedNode)?
    selectedDirectoryOrNode,
    TResult Function(Uint8List? newBytes)? imageChanged,
    TResult Function()? forceSnippetRefresh,
    required TResult orElse(),
  }) {
    if (appendChild != null) {
      return appendChild(
        type,
        testNode,
        snippetName,
        widgetSpanChildType,
        testWidgetSpanChildNode,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SelectPanel value) selectPanel,
    required TResult Function(OverrideTargetGK value) overrideTargetGK,
    required TResult Function(ForceRefresh value) forceRefresh,
    required TResult Function(UpdateClipboard value) updateClipboard,
    required TResult Function(PublishSnippet value) publishSnippet,
    required TResult Function(RevertSnippet value) revertSnippet,
    required TResult Function(DeletePage value) deletePage,
    required TResult Function(ToggleAutoPublishingOfSnippet value)
    toggleAutoPublishingOfSnippet,
    required TResult Function(AutoPublishDefault value) autoPublishDefault,
    required TResult Function(HideIframes value) hideIframes,
    required TResult Function(SetPanelSnippet value)
    setPanelOrPlaceholderSnippet,
    required TResult Function(EnterSelectWidgetMode value)
    enterSelectWidgetMode,
    required TResult Function(ExitSelectWidgetMode value) exitSelectWidgetMode,
    required TResult Function(PushSnippetEditor value) pushSnippetEditor,
    required TResult Function(PopSnippetEditor value) popSnippetEditor,
    required TResult Function(ShowDirectoryTree value) showDirectoryTree,
    required TResult Function(RemoveDirectoryTree value) removeDirectoryTree,
    required TResult Function(SelectNode value) selectNode,
    required TResult Function(ClearNodeSelection value) clearNodeSelection,
    required TResult Function(SaveNodeAsSnippet value) saveNodeAsSnippet,
    required TResult Function(ReplaceSelectionWith value) replaceSelectionWith,
    required TResult Function(WrapSelectionWith value) wrapSelectionWith,
    required TResult Function(AppendChild value) appendChild,
    required TResult Function(AddSiblingBefore value) addSiblingBefore,
    required TResult Function(AddSiblingAfter value) addSiblingAfter,
    required TResult Function(PasteReplacement value) pasteReplacement,
    required TResult Function(PasteChild value) pasteChild,
    required TResult Function(PasteSiblingBefore value) pasteSiblingBefore,
    required TResult Function(PasteSiblingAfter value) pasteSiblingAfter,
    required TResult Function(DeleteNodeTapped value) deleteNodeTapped,
    required TResult Function(CompleteDeletion value) completeDeletion,
    required TResult Function(CopySnippetJsonToClipboard value)
    copySnippetJsonToClipboard,
    required TResult Function(ReplaceSnippetFromJson value)
    replaceSnippetFromJson,
    required TResult Function(CopyNode value) copyNode,
    required TResult Function(CutNode value) cutNode,
    required TResult Function(SelectedDirectoryOrNode value)
    selectedDirectoryOrNode,
    required TResult Function(ImageChanged value) imageChanged,
    required TResult Function(ForceSnippetRefresh value) forceSnippetRefresh,
  }) {
    return appendChild(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SelectPanel value)? selectPanel,
    TResult? Function(OverrideTargetGK value)? overrideTargetGK,
    TResult? Function(ForceRefresh value)? forceRefresh,
    TResult? Function(UpdateClipboard value)? updateClipboard,
    TResult? Function(PublishSnippet value)? publishSnippet,
    TResult? Function(RevertSnippet value)? revertSnippet,
    TResult? Function(DeletePage value)? deletePage,
    TResult? Function(ToggleAutoPublishingOfSnippet value)?
    toggleAutoPublishingOfSnippet,
    TResult? Function(AutoPublishDefault value)? autoPublishDefault,
    TResult? Function(HideIframes value)? hideIframes,
    TResult? Function(SetPanelSnippet value)? setPanelOrPlaceholderSnippet,
    TResult? Function(EnterSelectWidgetMode value)? enterSelectWidgetMode,
    TResult? Function(ExitSelectWidgetMode value)? exitSelectWidgetMode,
    TResult? Function(PushSnippetEditor value)? pushSnippetEditor,
    TResult? Function(PopSnippetEditor value)? popSnippetEditor,
    TResult? Function(ShowDirectoryTree value)? showDirectoryTree,
    TResult? Function(RemoveDirectoryTree value)? removeDirectoryTree,
    TResult? Function(SelectNode value)? selectNode,
    TResult? Function(ClearNodeSelection value)? clearNodeSelection,
    TResult? Function(SaveNodeAsSnippet value)? saveNodeAsSnippet,
    TResult? Function(ReplaceSelectionWith value)? replaceSelectionWith,
    TResult? Function(WrapSelectionWith value)? wrapSelectionWith,
    TResult? Function(AppendChild value)? appendChild,
    TResult? Function(AddSiblingBefore value)? addSiblingBefore,
    TResult? Function(AddSiblingAfter value)? addSiblingAfter,
    TResult? Function(PasteReplacement value)? pasteReplacement,
    TResult? Function(PasteChild value)? pasteChild,
    TResult? Function(PasteSiblingBefore value)? pasteSiblingBefore,
    TResult? Function(PasteSiblingAfter value)? pasteSiblingAfter,
    TResult? Function(DeleteNodeTapped value)? deleteNodeTapped,
    TResult? Function(CompleteDeletion value)? completeDeletion,
    TResult? Function(CopySnippetJsonToClipboard value)?
    copySnippetJsonToClipboard,
    TResult? Function(ReplaceSnippetFromJson value)? replaceSnippetFromJson,
    TResult? Function(CopyNode value)? copyNode,
    TResult? Function(CutNode value)? cutNode,
    TResult? Function(SelectedDirectoryOrNode value)? selectedDirectoryOrNode,
    TResult? Function(ImageChanged value)? imageChanged,
    TResult? Function(ForceSnippetRefresh value)? forceSnippetRefresh,
  }) {
    return appendChild?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SelectPanel value)? selectPanel,
    TResult Function(OverrideTargetGK value)? overrideTargetGK,
    TResult Function(ForceRefresh value)? forceRefresh,
    TResult Function(UpdateClipboard value)? updateClipboard,
    TResult Function(PublishSnippet value)? publishSnippet,
    TResult Function(RevertSnippet value)? revertSnippet,
    TResult Function(DeletePage value)? deletePage,
    TResult Function(ToggleAutoPublishingOfSnippet value)?
    toggleAutoPublishingOfSnippet,
    TResult Function(AutoPublishDefault value)? autoPublishDefault,
    TResult Function(HideIframes value)? hideIframes,
    TResult Function(SetPanelSnippet value)? setPanelOrPlaceholderSnippet,
    TResult Function(EnterSelectWidgetMode value)? enterSelectWidgetMode,
    TResult Function(ExitSelectWidgetMode value)? exitSelectWidgetMode,
    TResult Function(PushSnippetEditor value)? pushSnippetEditor,
    TResult Function(PopSnippetEditor value)? popSnippetEditor,
    TResult Function(ShowDirectoryTree value)? showDirectoryTree,
    TResult Function(RemoveDirectoryTree value)? removeDirectoryTree,
    TResult Function(SelectNode value)? selectNode,
    TResult Function(ClearNodeSelection value)? clearNodeSelection,
    TResult Function(SaveNodeAsSnippet value)? saveNodeAsSnippet,
    TResult Function(ReplaceSelectionWith value)? replaceSelectionWith,
    TResult Function(WrapSelectionWith value)? wrapSelectionWith,
    TResult Function(AppendChild value)? appendChild,
    TResult Function(AddSiblingBefore value)? addSiblingBefore,
    TResult Function(AddSiblingAfter value)? addSiblingAfter,
    TResult Function(PasteReplacement value)? pasteReplacement,
    TResult Function(PasteChild value)? pasteChild,
    TResult Function(PasteSiblingBefore value)? pasteSiblingBefore,
    TResult Function(PasteSiblingAfter value)? pasteSiblingAfter,
    TResult Function(DeleteNodeTapped value)? deleteNodeTapped,
    TResult Function(CompleteDeletion value)? completeDeletion,
    TResult Function(CopySnippetJsonToClipboard value)?
    copySnippetJsonToClipboard,
    TResult Function(ReplaceSnippetFromJson value)? replaceSnippetFromJson,
    TResult Function(CopyNode value)? copyNode,
    TResult Function(CutNode value)? cutNode,
    TResult Function(SelectedDirectoryOrNode value)? selectedDirectoryOrNode,
    TResult Function(ImageChanged value)? imageChanged,
    TResult Function(ForceSnippetRefresh value)? forceSnippetRefresh,
    required TResult orElse(),
  }) {
    if (appendChild != null) {
      return appendChild(this);
    }
    return orElse();
  }
}

abstract class AppendChild implements CAPIEvent {
  const factory AppendChild({
    final Type? type,
    final SNode? testNode,
    final String? snippetName,
    final Type? widgetSpanChildType,
    final SNode? testWidgetSpanChildNode,
  }) = _$AppendChildImpl;

  Type? get type;
  SNode? get testNode;
  String? get snippetName; // only used when type is SnippetRefNode
  Type? get widgetSpanChildType;
  SNode? get testWidgetSpanChildNode;

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppendChildImplCopyWith<_$AppendChildImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddSiblingBeforeImplCopyWith<$Res> {
  factory _$$AddSiblingBeforeImplCopyWith(
    _$AddSiblingBeforeImpl value,
    $Res Function(_$AddSiblingBeforeImpl) then,
  ) = __$$AddSiblingBeforeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Type? type, String? snippetName, SNode? testNode});
}

/// @nodoc
class __$$AddSiblingBeforeImplCopyWithImpl<$Res>
    extends _$CAPIEventCopyWithImpl<$Res, _$AddSiblingBeforeImpl>
    implements _$$AddSiblingBeforeImplCopyWith<$Res> {
  __$$AddSiblingBeforeImplCopyWithImpl(
    _$AddSiblingBeforeImpl _value,
    $Res Function(_$AddSiblingBeforeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? snippetName = freezed,
    Object? testNode = freezed,
  }) {
    return _then(
      _$AddSiblingBeforeImpl(
        type:
            freezed == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                    as Type?,
        snippetName:
            freezed == snippetName
                ? _value.snippetName
                : snippetName // ignore: cast_nullable_to_non_nullable
                    as String?,
        testNode:
            freezed == testNode
                ? _value.testNode
                : testNode // ignore: cast_nullable_to_non_nullable
                    as SNode?,
      ),
    );
  }
}

/// @nodoc

class _$AddSiblingBeforeImpl
    with DiagnosticableTreeMixin
    implements AddSiblingBefore {
  const _$AddSiblingBeforeImpl({this.type, this.snippetName, this.testNode});

  @override
  final Type? type;
  @override
  final String? snippetName;
  // only used when type is SnippetRefNode
  @override
  final SNode? testNode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CAPIEvent.addSiblingBefore(type: $type, snippetName: $snippetName, testNode: $testNode)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CAPIEvent.addSiblingBefore'))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('snippetName', snippetName))
      ..add(DiagnosticsProperty('testNode', testNode));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddSiblingBeforeImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.snippetName, snippetName) ||
                other.snippetName == snippetName) &&
            (identical(other.testNode, testNode) ||
                other.testNode == testNode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type, snippetName, testNode);

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddSiblingBeforeImplCopyWith<_$AddSiblingBeforeImpl> get copyWith =>
      __$$AddSiblingBeforeImplCopyWithImpl<_$AddSiblingBeforeImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? panelName) selectPanel,
    required TResult Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )
    overrideTargetGK,
    required TResult Function(bool onlyTargetsWrappers) forceRefresh,
    required TResult Function(
      SNode? newContent,
      String? scName,
      dynamic skipSave,
    )
    updateClipboard,
    required TResult Function(String snippetName, String versionId)
    publishSnippet,
    required TResult Function(String snippetName, String versionId)
    revertSnippet,
    required TResult Function(String pathName) deletePage,
    required TResult Function(String snippetName) toggleAutoPublishingOfSnippet,
    required TResult Function(bool b) autoPublishDefault,
    required TResult Function(bool hide) hideIframes,
    required TResult Function(String snippetName, String panelName)
    setPanelOrPlaceholderSnippet,
    required TResult Function(String snippetName) enterSelectWidgetMode,
    required TResult Function() exitSelectWidgetMode,
    required TResult Function(SnippetRootNode rootNode, SNode? selectedNode)
    pushSnippetEditor,
    required TResult Function(bool save) popSnippetEditor,
    required TResult Function() showDirectoryTree,
    required TResult Function(bool save) removeDirectoryTree,
    required TResult Function(SNode node) selectNode,
    required TResult Function() clearNodeSelection,
    required TResult Function(SNode node, String newSnippetName)
    saveNodeAsSnippet,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    replaceSelectionWith,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    wrapSelectionWith,
    required TResult Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )
    appendChild,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    addSiblingBefore,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    addSiblingAfter,
    required TResult Function(Type? widgetSpanChildType) pasteReplacement,
    required TResult Function(
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )
    pasteChild,
    required TResult Function() pasteSiblingBefore,
    required TResult Function() pasteSiblingAfter,
    required TResult Function() deleteNodeTapped,
    required TResult Function() completeDeletion,
    required TResult Function(SnippetRootNode rootNode)
    copySnippetJsonToClipboard,
    required TResult Function(String? snippetJson) replaceSnippetFromJson,
    required TResult Function(SNode node, String? scName, dynamic skipSave)
    copyNode,
    required TResult Function(SNode node, String? scName, dynamic skipSave)
    cutNode,
    required TResult Function(String snippetName, SNode? selectedNode)
    selectedDirectoryOrNode,
    required TResult Function(Uint8List? newBytes) imageChanged,
    required TResult Function() forceSnippetRefresh,
  }) {
    return addSiblingBefore(type, snippetName, testNode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? panelName)? selectPanel,
    TResult? Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )?
    overrideTargetGK,
    TResult? Function(bool onlyTargetsWrappers)? forceRefresh,
    TResult? Function(SNode? newContent, String? scName, dynamic skipSave)?
    updateClipboard,
    TResult? Function(String snippetName, String versionId)? publishSnippet,
    TResult? Function(String snippetName, String versionId)? revertSnippet,
    TResult? Function(String pathName)? deletePage,
    TResult? Function(String snippetName)? toggleAutoPublishingOfSnippet,
    TResult? Function(bool b)? autoPublishDefault,
    TResult? Function(bool hide)? hideIframes,
    TResult? Function(String snippetName, String panelName)?
    setPanelOrPlaceholderSnippet,
    TResult? Function(String snippetName)? enterSelectWidgetMode,
    TResult? Function()? exitSelectWidgetMode,
    TResult? Function(SnippetRootNode rootNode, SNode? selectedNode)?
    pushSnippetEditor,
    TResult? Function(bool save)? popSnippetEditor,
    TResult? Function()? showDirectoryTree,
    TResult? Function(bool save)? removeDirectoryTree,
    TResult? Function(SNode node)? selectNode,
    TResult? Function()? clearNodeSelection,
    TResult? Function(SNode node, String newSnippetName)? saveNodeAsSnippet,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    replaceSelectionWith,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    wrapSelectionWith,
    TResult? Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    appendChild,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingBefore,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingAfter,
    TResult? Function(Type? widgetSpanChildType)? pasteReplacement,
    TResult? Function(
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    pasteChild,
    TResult? Function()? pasteSiblingBefore,
    TResult? Function()? pasteSiblingAfter,
    TResult? Function()? deleteNodeTapped,
    TResult? Function()? completeDeletion,
    TResult? Function(SnippetRootNode rootNode)? copySnippetJsonToClipboard,
    TResult? Function(String? snippetJson)? replaceSnippetFromJson,
    TResult? Function(SNode node, String? scName, dynamic skipSave)? copyNode,
    TResult? Function(SNode node, String? scName, dynamic skipSave)? cutNode,
    TResult? Function(String snippetName, SNode? selectedNode)?
    selectedDirectoryOrNode,
    TResult? Function(Uint8List? newBytes)? imageChanged,
    TResult? Function()? forceSnippetRefresh,
  }) {
    return addSiblingBefore?.call(type, snippetName, testNode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? panelName)? selectPanel,
    TResult Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )?
    overrideTargetGK,
    TResult Function(bool onlyTargetsWrappers)? forceRefresh,
    TResult Function(SNode? newContent, String? scName, dynamic skipSave)?
    updateClipboard,
    TResult Function(String snippetName, String versionId)? publishSnippet,
    TResult Function(String snippetName, String versionId)? revertSnippet,
    TResult Function(String pathName)? deletePage,
    TResult Function(String snippetName)? toggleAutoPublishingOfSnippet,
    TResult Function(bool b)? autoPublishDefault,
    TResult Function(bool hide)? hideIframes,
    TResult Function(String snippetName, String panelName)?
    setPanelOrPlaceholderSnippet,
    TResult Function(String snippetName)? enterSelectWidgetMode,
    TResult Function()? exitSelectWidgetMode,
    TResult Function(SnippetRootNode rootNode, SNode? selectedNode)?
    pushSnippetEditor,
    TResult Function(bool save)? popSnippetEditor,
    TResult Function()? showDirectoryTree,
    TResult Function(bool save)? removeDirectoryTree,
    TResult Function(SNode node)? selectNode,
    TResult Function()? clearNodeSelection,
    TResult Function(SNode node, String newSnippetName)? saveNodeAsSnippet,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    replaceSelectionWith,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    wrapSelectionWith,
    TResult Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    appendChild,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingBefore,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingAfter,
    TResult Function(Type? widgetSpanChildType)? pasteReplacement,
    TResult Function(Type? widgetSpanChildType, SNode? testWidgetSpanChildNode)?
    pasteChild,
    TResult Function()? pasteSiblingBefore,
    TResult Function()? pasteSiblingAfter,
    TResult Function()? deleteNodeTapped,
    TResult Function()? completeDeletion,
    TResult Function(SnippetRootNode rootNode)? copySnippetJsonToClipboard,
    TResult Function(String? snippetJson)? replaceSnippetFromJson,
    TResult Function(SNode node, String? scName, dynamic skipSave)? copyNode,
    TResult Function(SNode node, String? scName, dynamic skipSave)? cutNode,
    TResult Function(String snippetName, SNode? selectedNode)?
    selectedDirectoryOrNode,
    TResult Function(Uint8List? newBytes)? imageChanged,
    TResult Function()? forceSnippetRefresh,
    required TResult orElse(),
  }) {
    if (addSiblingBefore != null) {
      return addSiblingBefore(type, snippetName, testNode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SelectPanel value) selectPanel,
    required TResult Function(OverrideTargetGK value) overrideTargetGK,
    required TResult Function(ForceRefresh value) forceRefresh,
    required TResult Function(UpdateClipboard value) updateClipboard,
    required TResult Function(PublishSnippet value) publishSnippet,
    required TResult Function(RevertSnippet value) revertSnippet,
    required TResult Function(DeletePage value) deletePage,
    required TResult Function(ToggleAutoPublishingOfSnippet value)
    toggleAutoPublishingOfSnippet,
    required TResult Function(AutoPublishDefault value) autoPublishDefault,
    required TResult Function(HideIframes value) hideIframes,
    required TResult Function(SetPanelSnippet value)
    setPanelOrPlaceholderSnippet,
    required TResult Function(EnterSelectWidgetMode value)
    enterSelectWidgetMode,
    required TResult Function(ExitSelectWidgetMode value) exitSelectWidgetMode,
    required TResult Function(PushSnippetEditor value) pushSnippetEditor,
    required TResult Function(PopSnippetEditor value) popSnippetEditor,
    required TResult Function(ShowDirectoryTree value) showDirectoryTree,
    required TResult Function(RemoveDirectoryTree value) removeDirectoryTree,
    required TResult Function(SelectNode value) selectNode,
    required TResult Function(ClearNodeSelection value) clearNodeSelection,
    required TResult Function(SaveNodeAsSnippet value) saveNodeAsSnippet,
    required TResult Function(ReplaceSelectionWith value) replaceSelectionWith,
    required TResult Function(WrapSelectionWith value) wrapSelectionWith,
    required TResult Function(AppendChild value) appendChild,
    required TResult Function(AddSiblingBefore value) addSiblingBefore,
    required TResult Function(AddSiblingAfter value) addSiblingAfter,
    required TResult Function(PasteReplacement value) pasteReplacement,
    required TResult Function(PasteChild value) pasteChild,
    required TResult Function(PasteSiblingBefore value) pasteSiblingBefore,
    required TResult Function(PasteSiblingAfter value) pasteSiblingAfter,
    required TResult Function(DeleteNodeTapped value) deleteNodeTapped,
    required TResult Function(CompleteDeletion value) completeDeletion,
    required TResult Function(CopySnippetJsonToClipboard value)
    copySnippetJsonToClipboard,
    required TResult Function(ReplaceSnippetFromJson value)
    replaceSnippetFromJson,
    required TResult Function(CopyNode value) copyNode,
    required TResult Function(CutNode value) cutNode,
    required TResult Function(SelectedDirectoryOrNode value)
    selectedDirectoryOrNode,
    required TResult Function(ImageChanged value) imageChanged,
    required TResult Function(ForceSnippetRefresh value) forceSnippetRefresh,
  }) {
    return addSiblingBefore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SelectPanel value)? selectPanel,
    TResult? Function(OverrideTargetGK value)? overrideTargetGK,
    TResult? Function(ForceRefresh value)? forceRefresh,
    TResult? Function(UpdateClipboard value)? updateClipboard,
    TResult? Function(PublishSnippet value)? publishSnippet,
    TResult? Function(RevertSnippet value)? revertSnippet,
    TResult? Function(DeletePage value)? deletePage,
    TResult? Function(ToggleAutoPublishingOfSnippet value)?
    toggleAutoPublishingOfSnippet,
    TResult? Function(AutoPublishDefault value)? autoPublishDefault,
    TResult? Function(HideIframes value)? hideIframes,
    TResult? Function(SetPanelSnippet value)? setPanelOrPlaceholderSnippet,
    TResult? Function(EnterSelectWidgetMode value)? enterSelectWidgetMode,
    TResult? Function(ExitSelectWidgetMode value)? exitSelectWidgetMode,
    TResult? Function(PushSnippetEditor value)? pushSnippetEditor,
    TResult? Function(PopSnippetEditor value)? popSnippetEditor,
    TResult? Function(ShowDirectoryTree value)? showDirectoryTree,
    TResult? Function(RemoveDirectoryTree value)? removeDirectoryTree,
    TResult? Function(SelectNode value)? selectNode,
    TResult? Function(ClearNodeSelection value)? clearNodeSelection,
    TResult? Function(SaveNodeAsSnippet value)? saveNodeAsSnippet,
    TResult? Function(ReplaceSelectionWith value)? replaceSelectionWith,
    TResult? Function(WrapSelectionWith value)? wrapSelectionWith,
    TResult? Function(AppendChild value)? appendChild,
    TResult? Function(AddSiblingBefore value)? addSiblingBefore,
    TResult? Function(AddSiblingAfter value)? addSiblingAfter,
    TResult? Function(PasteReplacement value)? pasteReplacement,
    TResult? Function(PasteChild value)? pasteChild,
    TResult? Function(PasteSiblingBefore value)? pasteSiblingBefore,
    TResult? Function(PasteSiblingAfter value)? pasteSiblingAfter,
    TResult? Function(DeleteNodeTapped value)? deleteNodeTapped,
    TResult? Function(CompleteDeletion value)? completeDeletion,
    TResult? Function(CopySnippetJsonToClipboard value)?
    copySnippetJsonToClipboard,
    TResult? Function(ReplaceSnippetFromJson value)? replaceSnippetFromJson,
    TResult? Function(CopyNode value)? copyNode,
    TResult? Function(CutNode value)? cutNode,
    TResult? Function(SelectedDirectoryOrNode value)? selectedDirectoryOrNode,
    TResult? Function(ImageChanged value)? imageChanged,
    TResult? Function(ForceSnippetRefresh value)? forceSnippetRefresh,
  }) {
    return addSiblingBefore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SelectPanel value)? selectPanel,
    TResult Function(OverrideTargetGK value)? overrideTargetGK,
    TResult Function(ForceRefresh value)? forceRefresh,
    TResult Function(UpdateClipboard value)? updateClipboard,
    TResult Function(PublishSnippet value)? publishSnippet,
    TResult Function(RevertSnippet value)? revertSnippet,
    TResult Function(DeletePage value)? deletePage,
    TResult Function(ToggleAutoPublishingOfSnippet value)?
    toggleAutoPublishingOfSnippet,
    TResult Function(AutoPublishDefault value)? autoPublishDefault,
    TResult Function(HideIframes value)? hideIframes,
    TResult Function(SetPanelSnippet value)? setPanelOrPlaceholderSnippet,
    TResult Function(EnterSelectWidgetMode value)? enterSelectWidgetMode,
    TResult Function(ExitSelectWidgetMode value)? exitSelectWidgetMode,
    TResult Function(PushSnippetEditor value)? pushSnippetEditor,
    TResult Function(PopSnippetEditor value)? popSnippetEditor,
    TResult Function(ShowDirectoryTree value)? showDirectoryTree,
    TResult Function(RemoveDirectoryTree value)? removeDirectoryTree,
    TResult Function(SelectNode value)? selectNode,
    TResult Function(ClearNodeSelection value)? clearNodeSelection,
    TResult Function(SaveNodeAsSnippet value)? saveNodeAsSnippet,
    TResult Function(ReplaceSelectionWith value)? replaceSelectionWith,
    TResult Function(WrapSelectionWith value)? wrapSelectionWith,
    TResult Function(AppendChild value)? appendChild,
    TResult Function(AddSiblingBefore value)? addSiblingBefore,
    TResult Function(AddSiblingAfter value)? addSiblingAfter,
    TResult Function(PasteReplacement value)? pasteReplacement,
    TResult Function(PasteChild value)? pasteChild,
    TResult Function(PasteSiblingBefore value)? pasteSiblingBefore,
    TResult Function(PasteSiblingAfter value)? pasteSiblingAfter,
    TResult Function(DeleteNodeTapped value)? deleteNodeTapped,
    TResult Function(CompleteDeletion value)? completeDeletion,
    TResult Function(CopySnippetJsonToClipboard value)?
    copySnippetJsonToClipboard,
    TResult Function(ReplaceSnippetFromJson value)? replaceSnippetFromJson,
    TResult Function(CopyNode value)? copyNode,
    TResult Function(CutNode value)? cutNode,
    TResult Function(SelectedDirectoryOrNode value)? selectedDirectoryOrNode,
    TResult Function(ImageChanged value)? imageChanged,
    TResult Function(ForceSnippetRefresh value)? forceSnippetRefresh,
    required TResult orElse(),
  }) {
    if (addSiblingBefore != null) {
      return addSiblingBefore(this);
    }
    return orElse();
  }
}

abstract class AddSiblingBefore implements CAPIEvent {
  const factory AddSiblingBefore({
    final Type? type,
    final String? snippetName,
    final SNode? testNode,
  }) = _$AddSiblingBeforeImpl;

  Type? get type;
  String? get snippetName; // only used when type is SnippetRefNode
  SNode? get testNode;

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddSiblingBeforeImplCopyWith<_$AddSiblingBeforeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddSiblingAfterImplCopyWith<$Res> {
  factory _$$AddSiblingAfterImplCopyWith(
    _$AddSiblingAfterImpl value,
    $Res Function(_$AddSiblingAfterImpl) then,
  ) = __$$AddSiblingAfterImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Type? type, String? snippetName, SNode? testNode});
}

/// @nodoc
class __$$AddSiblingAfterImplCopyWithImpl<$Res>
    extends _$CAPIEventCopyWithImpl<$Res, _$AddSiblingAfterImpl>
    implements _$$AddSiblingAfterImplCopyWith<$Res> {
  __$$AddSiblingAfterImplCopyWithImpl(
    _$AddSiblingAfterImpl _value,
    $Res Function(_$AddSiblingAfterImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? snippetName = freezed,
    Object? testNode = freezed,
  }) {
    return _then(
      _$AddSiblingAfterImpl(
        type:
            freezed == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                    as Type?,
        snippetName:
            freezed == snippetName
                ? _value.snippetName
                : snippetName // ignore: cast_nullable_to_non_nullable
                    as String?,
        testNode:
            freezed == testNode
                ? _value.testNode
                : testNode // ignore: cast_nullable_to_non_nullable
                    as SNode?,
      ),
    );
  }
}

/// @nodoc

class _$AddSiblingAfterImpl
    with DiagnosticableTreeMixin
    implements AddSiblingAfter {
  const _$AddSiblingAfterImpl({this.type, this.snippetName, this.testNode});

  @override
  final Type? type;
  @override
  final String? snippetName;
  // only used when type is SnippetRefNode
  @override
  final SNode? testNode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CAPIEvent.addSiblingAfter(type: $type, snippetName: $snippetName, testNode: $testNode)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CAPIEvent.addSiblingAfter'))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('snippetName', snippetName))
      ..add(DiagnosticsProperty('testNode', testNode));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddSiblingAfterImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.snippetName, snippetName) ||
                other.snippetName == snippetName) &&
            (identical(other.testNode, testNode) ||
                other.testNode == testNode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type, snippetName, testNode);

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddSiblingAfterImplCopyWith<_$AddSiblingAfterImpl> get copyWith =>
      __$$AddSiblingAfterImplCopyWithImpl<_$AddSiblingAfterImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? panelName) selectPanel,
    required TResult Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )
    overrideTargetGK,
    required TResult Function(bool onlyTargetsWrappers) forceRefresh,
    required TResult Function(
      SNode? newContent,
      String? scName,
      dynamic skipSave,
    )
    updateClipboard,
    required TResult Function(String snippetName, String versionId)
    publishSnippet,
    required TResult Function(String snippetName, String versionId)
    revertSnippet,
    required TResult Function(String pathName) deletePage,
    required TResult Function(String snippetName) toggleAutoPublishingOfSnippet,
    required TResult Function(bool b) autoPublishDefault,
    required TResult Function(bool hide) hideIframes,
    required TResult Function(String snippetName, String panelName)
    setPanelOrPlaceholderSnippet,
    required TResult Function(String snippetName) enterSelectWidgetMode,
    required TResult Function() exitSelectWidgetMode,
    required TResult Function(SnippetRootNode rootNode, SNode? selectedNode)
    pushSnippetEditor,
    required TResult Function(bool save) popSnippetEditor,
    required TResult Function() showDirectoryTree,
    required TResult Function(bool save) removeDirectoryTree,
    required TResult Function(SNode node) selectNode,
    required TResult Function() clearNodeSelection,
    required TResult Function(SNode node, String newSnippetName)
    saveNodeAsSnippet,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    replaceSelectionWith,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    wrapSelectionWith,
    required TResult Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )
    appendChild,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    addSiblingBefore,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    addSiblingAfter,
    required TResult Function(Type? widgetSpanChildType) pasteReplacement,
    required TResult Function(
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )
    pasteChild,
    required TResult Function() pasteSiblingBefore,
    required TResult Function() pasteSiblingAfter,
    required TResult Function() deleteNodeTapped,
    required TResult Function() completeDeletion,
    required TResult Function(SnippetRootNode rootNode)
    copySnippetJsonToClipboard,
    required TResult Function(String? snippetJson) replaceSnippetFromJson,
    required TResult Function(SNode node, String? scName, dynamic skipSave)
    copyNode,
    required TResult Function(SNode node, String? scName, dynamic skipSave)
    cutNode,
    required TResult Function(String snippetName, SNode? selectedNode)
    selectedDirectoryOrNode,
    required TResult Function(Uint8List? newBytes) imageChanged,
    required TResult Function() forceSnippetRefresh,
  }) {
    return addSiblingAfter(type, snippetName, testNode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? panelName)? selectPanel,
    TResult? Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )?
    overrideTargetGK,
    TResult? Function(bool onlyTargetsWrappers)? forceRefresh,
    TResult? Function(SNode? newContent, String? scName, dynamic skipSave)?
    updateClipboard,
    TResult? Function(String snippetName, String versionId)? publishSnippet,
    TResult? Function(String snippetName, String versionId)? revertSnippet,
    TResult? Function(String pathName)? deletePage,
    TResult? Function(String snippetName)? toggleAutoPublishingOfSnippet,
    TResult? Function(bool b)? autoPublishDefault,
    TResult? Function(bool hide)? hideIframes,
    TResult? Function(String snippetName, String panelName)?
    setPanelOrPlaceholderSnippet,
    TResult? Function(String snippetName)? enterSelectWidgetMode,
    TResult? Function()? exitSelectWidgetMode,
    TResult? Function(SnippetRootNode rootNode, SNode? selectedNode)?
    pushSnippetEditor,
    TResult? Function(bool save)? popSnippetEditor,
    TResult? Function()? showDirectoryTree,
    TResult? Function(bool save)? removeDirectoryTree,
    TResult? Function(SNode node)? selectNode,
    TResult? Function()? clearNodeSelection,
    TResult? Function(SNode node, String newSnippetName)? saveNodeAsSnippet,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    replaceSelectionWith,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    wrapSelectionWith,
    TResult? Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    appendChild,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingBefore,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingAfter,
    TResult? Function(Type? widgetSpanChildType)? pasteReplacement,
    TResult? Function(
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    pasteChild,
    TResult? Function()? pasteSiblingBefore,
    TResult? Function()? pasteSiblingAfter,
    TResult? Function()? deleteNodeTapped,
    TResult? Function()? completeDeletion,
    TResult? Function(SnippetRootNode rootNode)? copySnippetJsonToClipboard,
    TResult? Function(String? snippetJson)? replaceSnippetFromJson,
    TResult? Function(SNode node, String? scName, dynamic skipSave)? copyNode,
    TResult? Function(SNode node, String? scName, dynamic skipSave)? cutNode,
    TResult? Function(String snippetName, SNode? selectedNode)?
    selectedDirectoryOrNode,
    TResult? Function(Uint8List? newBytes)? imageChanged,
    TResult? Function()? forceSnippetRefresh,
  }) {
    return addSiblingAfter?.call(type, snippetName, testNode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? panelName)? selectPanel,
    TResult Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )?
    overrideTargetGK,
    TResult Function(bool onlyTargetsWrappers)? forceRefresh,
    TResult Function(SNode? newContent, String? scName, dynamic skipSave)?
    updateClipboard,
    TResult Function(String snippetName, String versionId)? publishSnippet,
    TResult Function(String snippetName, String versionId)? revertSnippet,
    TResult Function(String pathName)? deletePage,
    TResult Function(String snippetName)? toggleAutoPublishingOfSnippet,
    TResult Function(bool b)? autoPublishDefault,
    TResult Function(bool hide)? hideIframes,
    TResult Function(String snippetName, String panelName)?
    setPanelOrPlaceholderSnippet,
    TResult Function(String snippetName)? enterSelectWidgetMode,
    TResult Function()? exitSelectWidgetMode,
    TResult Function(SnippetRootNode rootNode, SNode? selectedNode)?
    pushSnippetEditor,
    TResult Function(bool save)? popSnippetEditor,
    TResult Function()? showDirectoryTree,
    TResult Function(bool save)? removeDirectoryTree,
    TResult Function(SNode node)? selectNode,
    TResult Function()? clearNodeSelection,
    TResult Function(SNode node, String newSnippetName)? saveNodeAsSnippet,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    replaceSelectionWith,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    wrapSelectionWith,
    TResult Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    appendChild,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingBefore,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingAfter,
    TResult Function(Type? widgetSpanChildType)? pasteReplacement,
    TResult Function(Type? widgetSpanChildType, SNode? testWidgetSpanChildNode)?
    pasteChild,
    TResult Function()? pasteSiblingBefore,
    TResult Function()? pasteSiblingAfter,
    TResult Function()? deleteNodeTapped,
    TResult Function()? completeDeletion,
    TResult Function(SnippetRootNode rootNode)? copySnippetJsonToClipboard,
    TResult Function(String? snippetJson)? replaceSnippetFromJson,
    TResult Function(SNode node, String? scName, dynamic skipSave)? copyNode,
    TResult Function(SNode node, String? scName, dynamic skipSave)? cutNode,
    TResult Function(String snippetName, SNode? selectedNode)?
    selectedDirectoryOrNode,
    TResult Function(Uint8List? newBytes)? imageChanged,
    TResult Function()? forceSnippetRefresh,
    required TResult orElse(),
  }) {
    if (addSiblingAfter != null) {
      return addSiblingAfter(type, snippetName, testNode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SelectPanel value) selectPanel,
    required TResult Function(OverrideTargetGK value) overrideTargetGK,
    required TResult Function(ForceRefresh value) forceRefresh,
    required TResult Function(UpdateClipboard value) updateClipboard,
    required TResult Function(PublishSnippet value) publishSnippet,
    required TResult Function(RevertSnippet value) revertSnippet,
    required TResult Function(DeletePage value) deletePage,
    required TResult Function(ToggleAutoPublishingOfSnippet value)
    toggleAutoPublishingOfSnippet,
    required TResult Function(AutoPublishDefault value) autoPublishDefault,
    required TResult Function(HideIframes value) hideIframes,
    required TResult Function(SetPanelSnippet value)
    setPanelOrPlaceholderSnippet,
    required TResult Function(EnterSelectWidgetMode value)
    enterSelectWidgetMode,
    required TResult Function(ExitSelectWidgetMode value) exitSelectWidgetMode,
    required TResult Function(PushSnippetEditor value) pushSnippetEditor,
    required TResult Function(PopSnippetEditor value) popSnippetEditor,
    required TResult Function(ShowDirectoryTree value) showDirectoryTree,
    required TResult Function(RemoveDirectoryTree value) removeDirectoryTree,
    required TResult Function(SelectNode value) selectNode,
    required TResult Function(ClearNodeSelection value) clearNodeSelection,
    required TResult Function(SaveNodeAsSnippet value) saveNodeAsSnippet,
    required TResult Function(ReplaceSelectionWith value) replaceSelectionWith,
    required TResult Function(WrapSelectionWith value) wrapSelectionWith,
    required TResult Function(AppendChild value) appendChild,
    required TResult Function(AddSiblingBefore value) addSiblingBefore,
    required TResult Function(AddSiblingAfter value) addSiblingAfter,
    required TResult Function(PasteReplacement value) pasteReplacement,
    required TResult Function(PasteChild value) pasteChild,
    required TResult Function(PasteSiblingBefore value) pasteSiblingBefore,
    required TResult Function(PasteSiblingAfter value) pasteSiblingAfter,
    required TResult Function(DeleteNodeTapped value) deleteNodeTapped,
    required TResult Function(CompleteDeletion value) completeDeletion,
    required TResult Function(CopySnippetJsonToClipboard value)
    copySnippetJsonToClipboard,
    required TResult Function(ReplaceSnippetFromJson value)
    replaceSnippetFromJson,
    required TResult Function(CopyNode value) copyNode,
    required TResult Function(CutNode value) cutNode,
    required TResult Function(SelectedDirectoryOrNode value)
    selectedDirectoryOrNode,
    required TResult Function(ImageChanged value) imageChanged,
    required TResult Function(ForceSnippetRefresh value) forceSnippetRefresh,
  }) {
    return addSiblingAfter(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SelectPanel value)? selectPanel,
    TResult? Function(OverrideTargetGK value)? overrideTargetGK,
    TResult? Function(ForceRefresh value)? forceRefresh,
    TResult? Function(UpdateClipboard value)? updateClipboard,
    TResult? Function(PublishSnippet value)? publishSnippet,
    TResult? Function(RevertSnippet value)? revertSnippet,
    TResult? Function(DeletePage value)? deletePage,
    TResult? Function(ToggleAutoPublishingOfSnippet value)?
    toggleAutoPublishingOfSnippet,
    TResult? Function(AutoPublishDefault value)? autoPublishDefault,
    TResult? Function(HideIframes value)? hideIframes,
    TResult? Function(SetPanelSnippet value)? setPanelOrPlaceholderSnippet,
    TResult? Function(EnterSelectWidgetMode value)? enterSelectWidgetMode,
    TResult? Function(ExitSelectWidgetMode value)? exitSelectWidgetMode,
    TResult? Function(PushSnippetEditor value)? pushSnippetEditor,
    TResult? Function(PopSnippetEditor value)? popSnippetEditor,
    TResult? Function(ShowDirectoryTree value)? showDirectoryTree,
    TResult? Function(RemoveDirectoryTree value)? removeDirectoryTree,
    TResult? Function(SelectNode value)? selectNode,
    TResult? Function(ClearNodeSelection value)? clearNodeSelection,
    TResult? Function(SaveNodeAsSnippet value)? saveNodeAsSnippet,
    TResult? Function(ReplaceSelectionWith value)? replaceSelectionWith,
    TResult? Function(WrapSelectionWith value)? wrapSelectionWith,
    TResult? Function(AppendChild value)? appendChild,
    TResult? Function(AddSiblingBefore value)? addSiblingBefore,
    TResult? Function(AddSiblingAfter value)? addSiblingAfter,
    TResult? Function(PasteReplacement value)? pasteReplacement,
    TResult? Function(PasteChild value)? pasteChild,
    TResult? Function(PasteSiblingBefore value)? pasteSiblingBefore,
    TResult? Function(PasteSiblingAfter value)? pasteSiblingAfter,
    TResult? Function(DeleteNodeTapped value)? deleteNodeTapped,
    TResult? Function(CompleteDeletion value)? completeDeletion,
    TResult? Function(CopySnippetJsonToClipboard value)?
    copySnippetJsonToClipboard,
    TResult? Function(ReplaceSnippetFromJson value)? replaceSnippetFromJson,
    TResult? Function(CopyNode value)? copyNode,
    TResult? Function(CutNode value)? cutNode,
    TResult? Function(SelectedDirectoryOrNode value)? selectedDirectoryOrNode,
    TResult? Function(ImageChanged value)? imageChanged,
    TResult? Function(ForceSnippetRefresh value)? forceSnippetRefresh,
  }) {
    return addSiblingAfter?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SelectPanel value)? selectPanel,
    TResult Function(OverrideTargetGK value)? overrideTargetGK,
    TResult Function(ForceRefresh value)? forceRefresh,
    TResult Function(UpdateClipboard value)? updateClipboard,
    TResult Function(PublishSnippet value)? publishSnippet,
    TResult Function(RevertSnippet value)? revertSnippet,
    TResult Function(DeletePage value)? deletePage,
    TResult Function(ToggleAutoPublishingOfSnippet value)?
    toggleAutoPublishingOfSnippet,
    TResult Function(AutoPublishDefault value)? autoPublishDefault,
    TResult Function(HideIframes value)? hideIframes,
    TResult Function(SetPanelSnippet value)? setPanelOrPlaceholderSnippet,
    TResult Function(EnterSelectWidgetMode value)? enterSelectWidgetMode,
    TResult Function(ExitSelectWidgetMode value)? exitSelectWidgetMode,
    TResult Function(PushSnippetEditor value)? pushSnippetEditor,
    TResult Function(PopSnippetEditor value)? popSnippetEditor,
    TResult Function(ShowDirectoryTree value)? showDirectoryTree,
    TResult Function(RemoveDirectoryTree value)? removeDirectoryTree,
    TResult Function(SelectNode value)? selectNode,
    TResult Function(ClearNodeSelection value)? clearNodeSelection,
    TResult Function(SaveNodeAsSnippet value)? saveNodeAsSnippet,
    TResult Function(ReplaceSelectionWith value)? replaceSelectionWith,
    TResult Function(WrapSelectionWith value)? wrapSelectionWith,
    TResult Function(AppendChild value)? appendChild,
    TResult Function(AddSiblingBefore value)? addSiblingBefore,
    TResult Function(AddSiblingAfter value)? addSiblingAfter,
    TResult Function(PasteReplacement value)? pasteReplacement,
    TResult Function(PasteChild value)? pasteChild,
    TResult Function(PasteSiblingBefore value)? pasteSiblingBefore,
    TResult Function(PasteSiblingAfter value)? pasteSiblingAfter,
    TResult Function(DeleteNodeTapped value)? deleteNodeTapped,
    TResult Function(CompleteDeletion value)? completeDeletion,
    TResult Function(CopySnippetJsonToClipboard value)?
    copySnippetJsonToClipboard,
    TResult Function(ReplaceSnippetFromJson value)? replaceSnippetFromJson,
    TResult Function(CopyNode value)? copyNode,
    TResult Function(CutNode value)? cutNode,
    TResult Function(SelectedDirectoryOrNode value)? selectedDirectoryOrNode,
    TResult Function(ImageChanged value)? imageChanged,
    TResult Function(ForceSnippetRefresh value)? forceSnippetRefresh,
    required TResult orElse(),
  }) {
    if (addSiblingAfter != null) {
      return addSiblingAfter(this);
    }
    return orElse();
  }
}

abstract class AddSiblingAfter implements CAPIEvent {
  const factory AddSiblingAfter({
    final Type? type,
    final String? snippetName,
    final SNode? testNode,
  }) = _$AddSiblingAfterImpl;

  Type? get type;
  String? get snippetName; // only used when type is SnippetRefNode
  SNode? get testNode;

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddSiblingAfterImplCopyWith<_$AddSiblingAfterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PasteReplacementImplCopyWith<$Res> {
  factory _$$PasteReplacementImplCopyWith(
    _$PasteReplacementImpl value,
    $Res Function(_$PasteReplacementImpl) then,
  ) = __$$PasteReplacementImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Type? widgetSpanChildType});
}

/// @nodoc
class __$$PasteReplacementImplCopyWithImpl<$Res>
    extends _$CAPIEventCopyWithImpl<$Res, _$PasteReplacementImpl>
    implements _$$PasteReplacementImplCopyWith<$Res> {
  __$$PasteReplacementImplCopyWithImpl(
    _$PasteReplacementImpl _value,
    $Res Function(_$PasteReplacementImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? widgetSpanChildType = freezed}) {
    return _then(
      _$PasteReplacementImpl(
        widgetSpanChildType:
            freezed == widgetSpanChildType
                ? _value.widgetSpanChildType
                : widgetSpanChildType // ignore: cast_nullable_to_non_nullable
                    as Type?,
      ),
    );
  }
}

/// @nodoc

class _$PasteReplacementImpl
    with DiagnosticableTreeMixin
    implements PasteReplacement {
  const _$PasteReplacementImpl({this.widgetSpanChildType});

  // required STreeNode clipboardNode,
  @override
  final Type? widgetSpanChildType;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CAPIEvent.pasteReplacement(widgetSpanChildType: $widgetSpanChildType)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CAPIEvent.pasteReplacement'))
      ..add(DiagnosticsProperty('widgetSpanChildType', widgetSpanChildType));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PasteReplacementImpl &&
            (identical(other.widgetSpanChildType, widgetSpanChildType) ||
                other.widgetSpanChildType == widgetSpanChildType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, widgetSpanChildType);

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PasteReplacementImplCopyWith<_$PasteReplacementImpl> get copyWith =>
      __$$PasteReplacementImplCopyWithImpl<_$PasteReplacementImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? panelName) selectPanel,
    required TResult Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )
    overrideTargetGK,
    required TResult Function(bool onlyTargetsWrappers) forceRefresh,
    required TResult Function(
      SNode? newContent,
      String? scName,
      dynamic skipSave,
    )
    updateClipboard,
    required TResult Function(String snippetName, String versionId)
    publishSnippet,
    required TResult Function(String snippetName, String versionId)
    revertSnippet,
    required TResult Function(String pathName) deletePage,
    required TResult Function(String snippetName) toggleAutoPublishingOfSnippet,
    required TResult Function(bool b) autoPublishDefault,
    required TResult Function(bool hide) hideIframes,
    required TResult Function(String snippetName, String panelName)
    setPanelOrPlaceholderSnippet,
    required TResult Function(String snippetName) enterSelectWidgetMode,
    required TResult Function() exitSelectWidgetMode,
    required TResult Function(SnippetRootNode rootNode, SNode? selectedNode)
    pushSnippetEditor,
    required TResult Function(bool save) popSnippetEditor,
    required TResult Function() showDirectoryTree,
    required TResult Function(bool save) removeDirectoryTree,
    required TResult Function(SNode node) selectNode,
    required TResult Function() clearNodeSelection,
    required TResult Function(SNode node, String newSnippetName)
    saveNodeAsSnippet,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    replaceSelectionWith,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    wrapSelectionWith,
    required TResult Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )
    appendChild,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    addSiblingBefore,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    addSiblingAfter,
    required TResult Function(Type? widgetSpanChildType) pasteReplacement,
    required TResult Function(
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )
    pasteChild,
    required TResult Function() pasteSiblingBefore,
    required TResult Function() pasteSiblingAfter,
    required TResult Function() deleteNodeTapped,
    required TResult Function() completeDeletion,
    required TResult Function(SnippetRootNode rootNode)
    copySnippetJsonToClipboard,
    required TResult Function(String? snippetJson) replaceSnippetFromJson,
    required TResult Function(SNode node, String? scName, dynamic skipSave)
    copyNode,
    required TResult Function(SNode node, String? scName, dynamic skipSave)
    cutNode,
    required TResult Function(String snippetName, SNode? selectedNode)
    selectedDirectoryOrNode,
    required TResult Function(Uint8List? newBytes) imageChanged,
    required TResult Function() forceSnippetRefresh,
  }) {
    return pasteReplacement(widgetSpanChildType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? panelName)? selectPanel,
    TResult? Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )?
    overrideTargetGK,
    TResult? Function(bool onlyTargetsWrappers)? forceRefresh,
    TResult? Function(SNode? newContent, String? scName, dynamic skipSave)?
    updateClipboard,
    TResult? Function(String snippetName, String versionId)? publishSnippet,
    TResult? Function(String snippetName, String versionId)? revertSnippet,
    TResult? Function(String pathName)? deletePage,
    TResult? Function(String snippetName)? toggleAutoPublishingOfSnippet,
    TResult? Function(bool b)? autoPublishDefault,
    TResult? Function(bool hide)? hideIframes,
    TResult? Function(String snippetName, String panelName)?
    setPanelOrPlaceholderSnippet,
    TResult? Function(String snippetName)? enterSelectWidgetMode,
    TResult? Function()? exitSelectWidgetMode,
    TResult? Function(SnippetRootNode rootNode, SNode? selectedNode)?
    pushSnippetEditor,
    TResult? Function(bool save)? popSnippetEditor,
    TResult? Function()? showDirectoryTree,
    TResult? Function(bool save)? removeDirectoryTree,
    TResult? Function(SNode node)? selectNode,
    TResult? Function()? clearNodeSelection,
    TResult? Function(SNode node, String newSnippetName)? saveNodeAsSnippet,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    replaceSelectionWith,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    wrapSelectionWith,
    TResult? Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    appendChild,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingBefore,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingAfter,
    TResult? Function(Type? widgetSpanChildType)? pasteReplacement,
    TResult? Function(
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    pasteChild,
    TResult? Function()? pasteSiblingBefore,
    TResult? Function()? pasteSiblingAfter,
    TResult? Function()? deleteNodeTapped,
    TResult? Function()? completeDeletion,
    TResult? Function(SnippetRootNode rootNode)? copySnippetJsonToClipboard,
    TResult? Function(String? snippetJson)? replaceSnippetFromJson,
    TResult? Function(SNode node, String? scName, dynamic skipSave)? copyNode,
    TResult? Function(SNode node, String? scName, dynamic skipSave)? cutNode,
    TResult? Function(String snippetName, SNode? selectedNode)?
    selectedDirectoryOrNode,
    TResult? Function(Uint8List? newBytes)? imageChanged,
    TResult? Function()? forceSnippetRefresh,
  }) {
    return pasteReplacement?.call(widgetSpanChildType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? panelName)? selectPanel,
    TResult Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )?
    overrideTargetGK,
    TResult Function(bool onlyTargetsWrappers)? forceRefresh,
    TResult Function(SNode? newContent, String? scName, dynamic skipSave)?
    updateClipboard,
    TResult Function(String snippetName, String versionId)? publishSnippet,
    TResult Function(String snippetName, String versionId)? revertSnippet,
    TResult Function(String pathName)? deletePage,
    TResult Function(String snippetName)? toggleAutoPublishingOfSnippet,
    TResult Function(bool b)? autoPublishDefault,
    TResult Function(bool hide)? hideIframes,
    TResult Function(String snippetName, String panelName)?
    setPanelOrPlaceholderSnippet,
    TResult Function(String snippetName)? enterSelectWidgetMode,
    TResult Function()? exitSelectWidgetMode,
    TResult Function(SnippetRootNode rootNode, SNode? selectedNode)?
    pushSnippetEditor,
    TResult Function(bool save)? popSnippetEditor,
    TResult Function()? showDirectoryTree,
    TResult Function(bool save)? removeDirectoryTree,
    TResult Function(SNode node)? selectNode,
    TResult Function()? clearNodeSelection,
    TResult Function(SNode node, String newSnippetName)? saveNodeAsSnippet,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    replaceSelectionWith,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    wrapSelectionWith,
    TResult Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    appendChild,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingBefore,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingAfter,
    TResult Function(Type? widgetSpanChildType)? pasteReplacement,
    TResult Function(Type? widgetSpanChildType, SNode? testWidgetSpanChildNode)?
    pasteChild,
    TResult Function()? pasteSiblingBefore,
    TResult Function()? pasteSiblingAfter,
    TResult Function()? deleteNodeTapped,
    TResult Function()? completeDeletion,
    TResult Function(SnippetRootNode rootNode)? copySnippetJsonToClipboard,
    TResult Function(String? snippetJson)? replaceSnippetFromJson,
    TResult Function(SNode node, String? scName, dynamic skipSave)? copyNode,
    TResult Function(SNode node, String? scName, dynamic skipSave)? cutNode,
    TResult Function(String snippetName, SNode? selectedNode)?
    selectedDirectoryOrNode,
    TResult Function(Uint8List? newBytes)? imageChanged,
    TResult Function()? forceSnippetRefresh,
    required TResult orElse(),
  }) {
    if (pasteReplacement != null) {
      return pasteReplacement(widgetSpanChildType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SelectPanel value) selectPanel,
    required TResult Function(OverrideTargetGK value) overrideTargetGK,
    required TResult Function(ForceRefresh value) forceRefresh,
    required TResult Function(UpdateClipboard value) updateClipboard,
    required TResult Function(PublishSnippet value) publishSnippet,
    required TResult Function(RevertSnippet value) revertSnippet,
    required TResult Function(DeletePage value) deletePage,
    required TResult Function(ToggleAutoPublishingOfSnippet value)
    toggleAutoPublishingOfSnippet,
    required TResult Function(AutoPublishDefault value) autoPublishDefault,
    required TResult Function(HideIframes value) hideIframes,
    required TResult Function(SetPanelSnippet value)
    setPanelOrPlaceholderSnippet,
    required TResult Function(EnterSelectWidgetMode value)
    enterSelectWidgetMode,
    required TResult Function(ExitSelectWidgetMode value) exitSelectWidgetMode,
    required TResult Function(PushSnippetEditor value) pushSnippetEditor,
    required TResult Function(PopSnippetEditor value) popSnippetEditor,
    required TResult Function(ShowDirectoryTree value) showDirectoryTree,
    required TResult Function(RemoveDirectoryTree value) removeDirectoryTree,
    required TResult Function(SelectNode value) selectNode,
    required TResult Function(ClearNodeSelection value) clearNodeSelection,
    required TResult Function(SaveNodeAsSnippet value) saveNodeAsSnippet,
    required TResult Function(ReplaceSelectionWith value) replaceSelectionWith,
    required TResult Function(WrapSelectionWith value) wrapSelectionWith,
    required TResult Function(AppendChild value) appendChild,
    required TResult Function(AddSiblingBefore value) addSiblingBefore,
    required TResult Function(AddSiblingAfter value) addSiblingAfter,
    required TResult Function(PasteReplacement value) pasteReplacement,
    required TResult Function(PasteChild value) pasteChild,
    required TResult Function(PasteSiblingBefore value) pasteSiblingBefore,
    required TResult Function(PasteSiblingAfter value) pasteSiblingAfter,
    required TResult Function(DeleteNodeTapped value) deleteNodeTapped,
    required TResult Function(CompleteDeletion value) completeDeletion,
    required TResult Function(CopySnippetJsonToClipboard value)
    copySnippetJsonToClipboard,
    required TResult Function(ReplaceSnippetFromJson value)
    replaceSnippetFromJson,
    required TResult Function(CopyNode value) copyNode,
    required TResult Function(CutNode value) cutNode,
    required TResult Function(SelectedDirectoryOrNode value)
    selectedDirectoryOrNode,
    required TResult Function(ImageChanged value) imageChanged,
    required TResult Function(ForceSnippetRefresh value) forceSnippetRefresh,
  }) {
    return pasteReplacement(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SelectPanel value)? selectPanel,
    TResult? Function(OverrideTargetGK value)? overrideTargetGK,
    TResult? Function(ForceRefresh value)? forceRefresh,
    TResult? Function(UpdateClipboard value)? updateClipboard,
    TResult? Function(PublishSnippet value)? publishSnippet,
    TResult? Function(RevertSnippet value)? revertSnippet,
    TResult? Function(DeletePage value)? deletePage,
    TResult? Function(ToggleAutoPublishingOfSnippet value)?
    toggleAutoPublishingOfSnippet,
    TResult? Function(AutoPublishDefault value)? autoPublishDefault,
    TResult? Function(HideIframes value)? hideIframes,
    TResult? Function(SetPanelSnippet value)? setPanelOrPlaceholderSnippet,
    TResult? Function(EnterSelectWidgetMode value)? enterSelectWidgetMode,
    TResult? Function(ExitSelectWidgetMode value)? exitSelectWidgetMode,
    TResult? Function(PushSnippetEditor value)? pushSnippetEditor,
    TResult? Function(PopSnippetEditor value)? popSnippetEditor,
    TResult? Function(ShowDirectoryTree value)? showDirectoryTree,
    TResult? Function(RemoveDirectoryTree value)? removeDirectoryTree,
    TResult? Function(SelectNode value)? selectNode,
    TResult? Function(ClearNodeSelection value)? clearNodeSelection,
    TResult? Function(SaveNodeAsSnippet value)? saveNodeAsSnippet,
    TResult? Function(ReplaceSelectionWith value)? replaceSelectionWith,
    TResult? Function(WrapSelectionWith value)? wrapSelectionWith,
    TResult? Function(AppendChild value)? appendChild,
    TResult? Function(AddSiblingBefore value)? addSiblingBefore,
    TResult? Function(AddSiblingAfter value)? addSiblingAfter,
    TResult? Function(PasteReplacement value)? pasteReplacement,
    TResult? Function(PasteChild value)? pasteChild,
    TResult? Function(PasteSiblingBefore value)? pasteSiblingBefore,
    TResult? Function(PasteSiblingAfter value)? pasteSiblingAfter,
    TResult? Function(DeleteNodeTapped value)? deleteNodeTapped,
    TResult? Function(CompleteDeletion value)? completeDeletion,
    TResult? Function(CopySnippetJsonToClipboard value)?
    copySnippetJsonToClipboard,
    TResult? Function(ReplaceSnippetFromJson value)? replaceSnippetFromJson,
    TResult? Function(CopyNode value)? copyNode,
    TResult? Function(CutNode value)? cutNode,
    TResult? Function(SelectedDirectoryOrNode value)? selectedDirectoryOrNode,
    TResult? Function(ImageChanged value)? imageChanged,
    TResult? Function(ForceSnippetRefresh value)? forceSnippetRefresh,
  }) {
    return pasteReplacement?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SelectPanel value)? selectPanel,
    TResult Function(OverrideTargetGK value)? overrideTargetGK,
    TResult Function(ForceRefresh value)? forceRefresh,
    TResult Function(UpdateClipboard value)? updateClipboard,
    TResult Function(PublishSnippet value)? publishSnippet,
    TResult Function(RevertSnippet value)? revertSnippet,
    TResult Function(DeletePage value)? deletePage,
    TResult Function(ToggleAutoPublishingOfSnippet value)?
    toggleAutoPublishingOfSnippet,
    TResult Function(AutoPublishDefault value)? autoPublishDefault,
    TResult Function(HideIframes value)? hideIframes,
    TResult Function(SetPanelSnippet value)? setPanelOrPlaceholderSnippet,
    TResult Function(EnterSelectWidgetMode value)? enterSelectWidgetMode,
    TResult Function(ExitSelectWidgetMode value)? exitSelectWidgetMode,
    TResult Function(PushSnippetEditor value)? pushSnippetEditor,
    TResult Function(PopSnippetEditor value)? popSnippetEditor,
    TResult Function(ShowDirectoryTree value)? showDirectoryTree,
    TResult Function(RemoveDirectoryTree value)? removeDirectoryTree,
    TResult Function(SelectNode value)? selectNode,
    TResult Function(ClearNodeSelection value)? clearNodeSelection,
    TResult Function(SaveNodeAsSnippet value)? saveNodeAsSnippet,
    TResult Function(ReplaceSelectionWith value)? replaceSelectionWith,
    TResult Function(WrapSelectionWith value)? wrapSelectionWith,
    TResult Function(AppendChild value)? appendChild,
    TResult Function(AddSiblingBefore value)? addSiblingBefore,
    TResult Function(AddSiblingAfter value)? addSiblingAfter,
    TResult Function(PasteReplacement value)? pasteReplacement,
    TResult Function(PasteChild value)? pasteChild,
    TResult Function(PasteSiblingBefore value)? pasteSiblingBefore,
    TResult Function(PasteSiblingAfter value)? pasteSiblingAfter,
    TResult Function(DeleteNodeTapped value)? deleteNodeTapped,
    TResult Function(CompleteDeletion value)? completeDeletion,
    TResult Function(CopySnippetJsonToClipboard value)?
    copySnippetJsonToClipboard,
    TResult Function(ReplaceSnippetFromJson value)? replaceSnippetFromJson,
    TResult Function(CopyNode value)? copyNode,
    TResult Function(CutNode value)? cutNode,
    TResult Function(SelectedDirectoryOrNode value)? selectedDirectoryOrNode,
    TResult Function(ImageChanged value)? imageChanged,
    TResult Function(ForceSnippetRefresh value)? forceSnippetRefresh,
    required TResult orElse(),
  }) {
    if (pasteReplacement != null) {
      return pasteReplacement(this);
    }
    return orElse();
  }
}

abstract class PasteReplacement implements CAPIEvent {
  const factory PasteReplacement({final Type? widgetSpanChildType}) =
      _$PasteReplacementImpl;

  // required STreeNode clipboardNode,
  Type? get widgetSpanChildType;

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PasteReplacementImplCopyWith<_$PasteReplacementImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PasteChildImplCopyWith<$Res> {
  factory _$$PasteChildImplCopyWith(
    _$PasteChildImpl value,
    $Res Function(_$PasteChildImpl) then,
  ) = __$$PasteChildImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Type? widgetSpanChildType, SNode? testWidgetSpanChildNode});
}

/// @nodoc
class __$$PasteChildImplCopyWithImpl<$Res>
    extends _$CAPIEventCopyWithImpl<$Res, _$PasteChildImpl>
    implements _$$PasteChildImplCopyWith<$Res> {
  __$$PasteChildImplCopyWithImpl(
    _$PasteChildImpl _value,
    $Res Function(_$PasteChildImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? widgetSpanChildType = freezed,
    Object? testWidgetSpanChildNode = freezed,
  }) {
    return _then(
      _$PasteChildImpl(
        widgetSpanChildType:
            freezed == widgetSpanChildType
                ? _value.widgetSpanChildType
                : widgetSpanChildType // ignore: cast_nullable_to_non_nullable
                    as Type?,
        testWidgetSpanChildNode:
            freezed == testWidgetSpanChildNode
                ? _value.testWidgetSpanChildNode
                : testWidgetSpanChildNode // ignore: cast_nullable_to_non_nullable
                    as SNode?,
      ),
    );
  }
}

/// @nodoc

class _$PasteChildImpl with DiagnosticableTreeMixin implements PasteChild {
  const _$PasteChildImpl({
    this.widgetSpanChildType,
    this.testWidgetSpanChildNode,
  });

  // required STreeNode clipboardNode,
  @override
  final Type? widgetSpanChildType;
  @override
  final SNode? testWidgetSpanChildNode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CAPIEvent.pasteChild(widgetSpanChildType: $widgetSpanChildType, testWidgetSpanChildNode: $testWidgetSpanChildNode)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CAPIEvent.pasteChild'))
      ..add(DiagnosticsProperty('widgetSpanChildType', widgetSpanChildType))
      ..add(
        DiagnosticsProperty('testWidgetSpanChildNode', testWidgetSpanChildNode),
      );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PasteChildImpl &&
            (identical(other.widgetSpanChildType, widgetSpanChildType) ||
                other.widgetSpanChildType == widgetSpanChildType) &&
            (identical(
                  other.testWidgetSpanChildNode,
                  testWidgetSpanChildNode,
                ) ||
                other.testWidgetSpanChildNode == testWidgetSpanChildNode));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, widgetSpanChildType, testWidgetSpanChildNode);

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PasteChildImplCopyWith<_$PasteChildImpl> get copyWith =>
      __$$PasteChildImplCopyWithImpl<_$PasteChildImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? panelName) selectPanel,
    required TResult Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )
    overrideTargetGK,
    required TResult Function(bool onlyTargetsWrappers) forceRefresh,
    required TResult Function(
      SNode? newContent,
      String? scName,
      dynamic skipSave,
    )
    updateClipboard,
    required TResult Function(String snippetName, String versionId)
    publishSnippet,
    required TResult Function(String snippetName, String versionId)
    revertSnippet,
    required TResult Function(String pathName) deletePage,
    required TResult Function(String snippetName) toggleAutoPublishingOfSnippet,
    required TResult Function(bool b) autoPublishDefault,
    required TResult Function(bool hide) hideIframes,
    required TResult Function(String snippetName, String panelName)
    setPanelOrPlaceholderSnippet,
    required TResult Function(String snippetName) enterSelectWidgetMode,
    required TResult Function() exitSelectWidgetMode,
    required TResult Function(SnippetRootNode rootNode, SNode? selectedNode)
    pushSnippetEditor,
    required TResult Function(bool save) popSnippetEditor,
    required TResult Function() showDirectoryTree,
    required TResult Function(bool save) removeDirectoryTree,
    required TResult Function(SNode node) selectNode,
    required TResult Function() clearNodeSelection,
    required TResult Function(SNode node, String newSnippetName)
    saveNodeAsSnippet,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    replaceSelectionWith,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    wrapSelectionWith,
    required TResult Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )
    appendChild,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    addSiblingBefore,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    addSiblingAfter,
    required TResult Function(Type? widgetSpanChildType) pasteReplacement,
    required TResult Function(
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )
    pasteChild,
    required TResult Function() pasteSiblingBefore,
    required TResult Function() pasteSiblingAfter,
    required TResult Function() deleteNodeTapped,
    required TResult Function() completeDeletion,
    required TResult Function(SnippetRootNode rootNode)
    copySnippetJsonToClipboard,
    required TResult Function(String? snippetJson) replaceSnippetFromJson,
    required TResult Function(SNode node, String? scName, dynamic skipSave)
    copyNode,
    required TResult Function(SNode node, String? scName, dynamic skipSave)
    cutNode,
    required TResult Function(String snippetName, SNode? selectedNode)
    selectedDirectoryOrNode,
    required TResult Function(Uint8List? newBytes) imageChanged,
    required TResult Function() forceSnippetRefresh,
  }) {
    return pasteChild(widgetSpanChildType, testWidgetSpanChildNode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? panelName)? selectPanel,
    TResult? Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )?
    overrideTargetGK,
    TResult? Function(bool onlyTargetsWrappers)? forceRefresh,
    TResult? Function(SNode? newContent, String? scName, dynamic skipSave)?
    updateClipboard,
    TResult? Function(String snippetName, String versionId)? publishSnippet,
    TResult? Function(String snippetName, String versionId)? revertSnippet,
    TResult? Function(String pathName)? deletePage,
    TResult? Function(String snippetName)? toggleAutoPublishingOfSnippet,
    TResult? Function(bool b)? autoPublishDefault,
    TResult? Function(bool hide)? hideIframes,
    TResult? Function(String snippetName, String panelName)?
    setPanelOrPlaceholderSnippet,
    TResult? Function(String snippetName)? enterSelectWidgetMode,
    TResult? Function()? exitSelectWidgetMode,
    TResult? Function(SnippetRootNode rootNode, SNode? selectedNode)?
    pushSnippetEditor,
    TResult? Function(bool save)? popSnippetEditor,
    TResult? Function()? showDirectoryTree,
    TResult? Function(bool save)? removeDirectoryTree,
    TResult? Function(SNode node)? selectNode,
    TResult? Function()? clearNodeSelection,
    TResult? Function(SNode node, String newSnippetName)? saveNodeAsSnippet,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    replaceSelectionWith,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    wrapSelectionWith,
    TResult? Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    appendChild,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingBefore,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingAfter,
    TResult? Function(Type? widgetSpanChildType)? pasteReplacement,
    TResult? Function(
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    pasteChild,
    TResult? Function()? pasteSiblingBefore,
    TResult? Function()? pasteSiblingAfter,
    TResult? Function()? deleteNodeTapped,
    TResult? Function()? completeDeletion,
    TResult? Function(SnippetRootNode rootNode)? copySnippetJsonToClipboard,
    TResult? Function(String? snippetJson)? replaceSnippetFromJson,
    TResult? Function(SNode node, String? scName, dynamic skipSave)? copyNode,
    TResult? Function(SNode node, String? scName, dynamic skipSave)? cutNode,
    TResult? Function(String snippetName, SNode? selectedNode)?
    selectedDirectoryOrNode,
    TResult? Function(Uint8List? newBytes)? imageChanged,
    TResult? Function()? forceSnippetRefresh,
  }) {
    return pasteChild?.call(widgetSpanChildType, testWidgetSpanChildNode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? panelName)? selectPanel,
    TResult Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )?
    overrideTargetGK,
    TResult Function(bool onlyTargetsWrappers)? forceRefresh,
    TResult Function(SNode? newContent, String? scName, dynamic skipSave)?
    updateClipboard,
    TResult Function(String snippetName, String versionId)? publishSnippet,
    TResult Function(String snippetName, String versionId)? revertSnippet,
    TResult Function(String pathName)? deletePage,
    TResult Function(String snippetName)? toggleAutoPublishingOfSnippet,
    TResult Function(bool b)? autoPublishDefault,
    TResult Function(bool hide)? hideIframes,
    TResult Function(String snippetName, String panelName)?
    setPanelOrPlaceholderSnippet,
    TResult Function(String snippetName)? enterSelectWidgetMode,
    TResult Function()? exitSelectWidgetMode,
    TResult Function(SnippetRootNode rootNode, SNode? selectedNode)?
    pushSnippetEditor,
    TResult Function(bool save)? popSnippetEditor,
    TResult Function()? showDirectoryTree,
    TResult Function(bool save)? removeDirectoryTree,
    TResult Function(SNode node)? selectNode,
    TResult Function()? clearNodeSelection,
    TResult Function(SNode node, String newSnippetName)? saveNodeAsSnippet,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    replaceSelectionWith,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    wrapSelectionWith,
    TResult Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    appendChild,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingBefore,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingAfter,
    TResult Function(Type? widgetSpanChildType)? pasteReplacement,
    TResult Function(Type? widgetSpanChildType, SNode? testWidgetSpanChildNode)?
    pasteChild,
    TResult Function()? pasteSiblingBefore,
    TResult Function()? pasteSiblingAfter,
    TResult Function()? deleteNodeTapped,
    TResult Function()? completeDeletion,
    TResult Function(SnippetRootNode rootNode)? copySnippetJsonToClipboard,
    TResult Function(String? snippetJson)? replaceSnippetFromJson,
    TResult Function(SNode node, String? scName, dynamic skipSave)? copyNode,
    TResult Function(SNode node, String? scName, dynamic skipSave)? cutNode,
    TResult Function(String snippetName, SNode? selectedNode)?
    selectedDirectoryOrNode,
    TResult Function(Uint8List? newBytes)? imageChanged,
    TResult Function()? forceSnippetRefresh,
    required TResult orElse(),
  }) {
    if (pasteChild != null) {
      return pasteChild(widgetSpanChildType, testWidgetSpanChildNode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SelectPanel value) selectPanel,
    required TResult Function(OverrideTargetGK value) overrideTargetGK,
    required TResult Function(ForceRefresh value) forceRefresh,
    required TResult Function(UpdateClipboard value) updateClipboard,
    required TResult Function(PublishSnippet value) publishSnippet,
    required TResult Function(RevertSnippet value) revertSnippet,
    required TResult Function(DeletePage value) deletePage,
    required TResult Function(ToggleAutoPublishingOfSnippet value)
    toggleAutoPublishingOfSnippet,
    required TResult Function(AutoPublishDefault value) autoPublishDefault,
    required TResult Function(HideIframes value) hideIframes,
    required TResult Function(SetPanelSnippet value)
    setPanelOrPlaceholderSnippet,
    required TResult Function(EnterSelectWidgetMode value)
    enterSelectWidgetMode,
    required TResult Function(ExitSelectWidgetMode value) exitSelectWidgetMode,
    required TResult Function(PushSnippetEditor value) pushSnippetEditor,
    required TResult Function(PopSnippetEditor value) popSnippetEditor,
    required TResult Function(ShowDirectoryTree value) showDirectoryTree,
    required TResult Function(RemoveDirectoryTree value) removeDirectoryTree,
    required TResult Function(SelectNode value) selectNode,
    required TResult Function(ClearNodeSelection value) clearNodeSelection,
    required TResult Function(SaveNodeAsSnippet value) saveNodeAsSnippet,
    required TResult Function(ReplaceSelectionWith value) replaceSelectionWith,
    required TResult Function(WrapSelectionWith value) wrapSelectionWith,
    required TResult Function(AppendChild value) appendChild,
    required TResult Function(AddSiblingBefore value) addSiblingBefore,
    required TResult Function(AddSiblingAfter value) addSiblingAfter,
    required TResult Function(PasteReplacement value) pasteReplacement,
    required TResult Function(PasteChild value) pasteChild,
    required TResult Function(PasteSiblingBefore value) pasteSiblingBefore,
    required TResult Function(PasteSiblingAfter value) pasteSiblingAfter,
    required TResult Function(DeleteNodeTapped value) deleteNodeTapped,
    required TResult Function(CompleteDeletion value) completeDeletion,
    required TResult Function(CopySnippetJsonToClipboard value)
    copySnippetJsonToClipboard,
    required TResult Function(ReplaceSnippetFromJson value)
    replaceSnippetFromJson,
    required TResult Function(CopyNode value) copyNode,
    required TResult Function(CutNode value) cutNode,
    required TResult Function(SelectedDirectoryOrNode value)
    selectedDirectoryOrNode,
    required TResult Function(ImageChanged value) imageChanged,
    required TResult Function(ForceSnippetRefresh value) forceSnippetRefresh,
  }) {
    return pasteChild(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SelectPanel value)? selectPanel,
    TResult? Function(OverrideTargetGK value)? overrideTargetGK,
    TResult? Function(ForceRefresh value)? forceRefresh,
    TResult? Function(UpdateClipboard value)? updateClipboard,
    TResult? Function(PublishSnippet value)? publishSnippet,
    TResult? Function(RevertSnippet value)? revertSnippet,
    TResult? Function(DeletePage value)? deletePage,
    TResult? Function(ToggleAutoPublishingOfSnippet value)?
    toggleAutoPublishingOfSnippet,
    TResult? Function(AutoPublishDefault value)? autoPublishDefault,
    TResult? Function(HideIframes value)? hideIframes,
    TResult? Function(SetPanelSnippet value)? setPanelOrPlaceholderSnippet,
    TResult? Function(EnterSelectWidgetMode value)? enterSelectWidgetMode,
    TResult? Function(ExitSelectWidgetMode value)? exitSelectWidgetMode,
    TResult? Function(PushSnippetEditor value)? pushSnippetEditor,
    TResult? Function(PopSnippetEditor value)? popSnippetEditor,
    TResult? Function(ShowDirectoryTree value)? showDirectoryTree,
    TResult? Function(RemoveDirectoryTree value)? removeDirectoryTree,
    TResult? Function(SelectNode value)? selectNode,
    TResult? Function(ClearNodeSelection value)? clearNodeSelection,
    TResult? Function(SaveNodeAsSnippet value)? saveNodeAsSnippet,
    TResult? Function(ReplaceSelectionWith value)? replaceSelectionWith,
    TResult? Function(WrapSelectionWith value)? wrapSelectionWith,
    TResult? Function(AppendChild value)? appendChild,
    TResult? Function(AddSiblingBefore value)? addSiblingBefore,
    TResult? Function(AddSiblingAfter value)? addSiblingAfter,
    TResult? Function(PasteReplacement value)? pasteReplacement,
    TResult? Function(PasteChild value)? pasteChild,
    TResult? Function(PasteSiblingBefore value)? pasteSiblingBefore,
    TResult? Function(PasteSiblingAfter value)? pasteSiblingAfter,
    TResult? Function(DeleteNodeTapped value)? deleteNodeTapped,
    TResult? Function(CompleteDeletion value)? completeDeletion,
    TResult? Function(CopySnippetJsonToClipboard value)?
    copySnippetJsonToClipboard,
    TResult? Function(ReplaceSnippetFromJson value)? replaceSnippetFromJson,
    TResult? Function(CopyNode value)? copyNode,
    TResult? Function(CutNode value)? cutNode,
    TResult? Function(SelectedDirectoryOrNode value)? selectedDirectoryOrNode,
    TResult? Function(ImageChanged value)? imageChanged,
    TResult? Function(ForceSnippetRefresh value)? forceSnippetRefresh,
  }) {
    return pasteChild?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SelectPanel value)? selectPanel,
    TResult Function(OverrideTargetGK value)? overrideTargetGK,
    TResult Function(ForceRefresh value)? forceRefresh,
    TResult Function(UpdateClipboard value)? updateClipboard,
    TResult Function(PublishSnippet value)? publishSnippet,
    TResult Function(RevertSnippet value)? revertSnippet,
    TResult Function(DeletePage value)? deletePage,
    TResult Function(ToggleAutoPublishingOfSnippet value)?
    toggleAutoPublishingOfSnippet,
    TResult Function(AutoPublishDefault value)? autoPublishDefault,
    TResult Function(HideIframes value)? hideIframes,
    TResult Function(SetPanelSnippet value)? setPanelOrPlaceholderSnippet,
    TResult Function(EnterSelectWidgetMode value)? enterSelectWidgetMode,
    TResult Function(ExitSelectWidgetMode value)? exitSelectWidgetMode,
    TResult Function(PushSnippetEditor value)? pushSnippetEditor,
    TResult Function(PopSnippetEditor value)? popSnippetEditor,
    TResult Function(ShowDirectoryTree value)? showDirectoryTree,
    TResult Function(RemoveDirectoryTree value)? removeDirectoryTree,
    TResult Function(SelectNode value)? selectNode,
    TResult Function(ClearNodeSelection value)? clearNodeSelection,
    TResult Function(SaveNodeAsSnippet value)? saveNodeAsSnippet,
    TResult Function(ReplaceSelectionWith value)? replaceSelectionWith,
    TResult Function(WrapSelectionWith value)? wrapSelectionWith,
    TResult Function(AppendChild value)? appendChild,
    TResult Function(AddSiblingBefore value)? addSiblingBefore,
    TResult Function(AddSiblingAfter value)? addSiblingAfter,
    TResult Function(PasteReplacement value)? pasteReplacement,
    TResult Function(PasteChild value)? pasteChild,
    TResult Function(PasteSiblingBefore value)? pasteSiblingBefore,
    TResult Function(PasteSiblingAfter value)? pasteSiblingAfter,
    TResult Function(DeleteNodeTapped value)? deleteNodeTapped,
    TResult Function(CompleteDeletion value)? completeDeletion,
    TResult Function(CopySnippetJsonToClipboard value)?
    copySnippetJsonToClipboard,
    TResult Function(ReplaceSnippetFromJson value)? replaceSnippetFromJson,
    TResult Function(CopyNode value)? copyNode,
    TResult Function(CutNode value)? cutNode,
    TResult Function(SelectedDirectoryOrNode value)? selectedDirectoryOrNode,
    TResult Function(ImageChanged value)? imageChanged,
    TResult Function(ForceSnippetRefresh value)? forceSnippetRefresh,
    required TResult orElse(),
  }) {
    if (pasteChild != null) {
      return pasteChild(this);
    }
    return orElse();
  }
}

abstract class PasteChild implements CAPIEvent {
  const factory PasteChild({
    final Type? widgetSpanChildType,
    final SNode? testWidgetSpanChildNode,
  }) = _$PasteChildImpl;

  // required STreeNode clipboardNode,
  Type? get widgetSpanChildType;
  SNode? get testWidgetSpanChildNode;

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PasteChildImplCopyWith<_$PasteChildImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PasteSiblingBeforeImplCopyWith<$Res> {
  factory _$$PasteSiblingBeforeImplCopyWith(
    _$PasteSiblingBeforeImpl value,
    $Res Function(_$PasteSiblingBeforeImpl) then,
  ) = __$$PasteSiblingBeforeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PasteSiblingBeforeImplCopyWithImpl<$Res>
    extends _$CAPIEventCopyWithImpl<$Res, _$PasteSiblingBeforeImpl>
    implements _$$PasteSiblingBeforeImplCopyWith<$Res> {
  __$$PasteSiblingBeforeImplCopyWithImpl(
    _$PasteSiblingBeforeImpl _value,
    $Res Function(_$PasteSiblingBeforeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PasteSiblingBeforeImpl
    with DiagnosticableTreeMixin
    implements PasteSiblingBefore {
  const _$PasteSiblingBeforeImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CAPIEvent.pasteSiblingBefore()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CAPIEvent.pasteSiblingBefore'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PasteSiblingBeforeImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? panelName) selectPanel,
    required TResult Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )
    overrideTargetGK,
    required TResult Function(bool onlyTargetsWrappers) forceRefresh,
    required TResult Function(
      SNode? newContent,
      String? scName,
      dynamic skipSave,
    )
    updateClipboard,
    required TResult Function(String snippetName, String versionId)
    publishSnippet,
    required TResult Function(String snippetName, String versionId)
    revertSnippet,
    required TResult Function(String pathName) deletePage,
    required TResult Function(String snippetName) toggleAutoPublishingOfSnippet,
    required TResult Function(bool b) autoPublishDefault,
    required TResult Function(bool hide) hideIframes,
    required TResult Function(String snippetName, String panelName)
    setPanelOrPlaceholderSnippet,
    required TResult Function(String snippetName) enterSelectWidgetMode,
    required TResult Function() exitSelectWidgetMode,
    required TResult Function(SnippetRootNode rootNode, SNode? selectedNode)
    pushSnippetEditor,
    required TResult Function(bool save) popSnippetEditor,
    required TResult Function() showDirectoryTree,
    required TResult Function(bool save) removeDirectoryTree,
    required TResult Function(SNode node) selectNode,
    required TResult Function() clearNodeSelection,
    required TResult Function(SNode node, String newSnippetName)
    saveNodeAsSnippet,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    replaceSelectionWith,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    wrapSelectionWith,
    required TResult Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )
    appendChild,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    addSiblingBefore,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    addSiblingAfter,
    required TResult Function(Type? widgetSpanChildType) pasteReplacement,
    required TResult Function(
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )
    pasteChild,
    required TResult Function() pasteSiblingBefore,
    required TResult Function() pasteSiblingAfter,
    required TResult Function() deleteNodeTapped,
    required TResult Function() completeDeletion,
    required TResult Function(SnippetRootNode rootNode)
    copySnippetJsonToClipboard,
    required TResult Function(String? snippetJson) replaceSnippetFromJson,
    required TResult Function(SNode node, String? scName, dynamic skipSave)
    copyNode,
    required TResult Function(SNode node, String? scName, dynamic skipSave)
    cutNode,
    required TResult Function(String snippetName, SNode? selectedNode)
    selectedDirectoryOrNode,
    required TResult Function(Uint8List? newBytes) imageChanged,
    required TResult Function() forceSnippetRefresh,
  }) {
    return pasteSiblingBefore();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? panelName)? selectPanel,
    TResult? Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )?
    overrideTargetGK,
    TResult? Function(bool onlyTargetsWrappers)? forceRefresh,
    TResult? Function(SNode? newContent, String? scName, dynamic skipSave)?
    updateClipboard,
    TResult? Function(String snippetName, String versionId)? publishSnippet,
    TResult? Function(String snippetName, String versionId)? revertSnippet,
    TResult? Function(String pathName)? deletePage,
    TResult? Function(String snippetName)? toggleAutoPublishingOfSnippet,
    TResult? Function(bool b)? autoPublishDefault,
    TResult? Function(bool hide)? hideIframes,
    TResult? Function(String snippetName, String panelName)?
    setPanelOrPlaceholderSnippet,
    TResult? Function(String snippetName)? enterSelectWidgetMode,
    TResult? Function()? exitSelectWidgetMode,
    TResult? Function(SnippetRootNode rootNode, SNode? selectedNode)?
    pushSnippetEditor,
    TResult? Function(bool save)? popSnippetEditor,
    TResult? Function()? showDirectoryTree,
    TResult? Function(bool save)? removeDirectoryTree,
    TResult? Function(SNode node)? selectNode,
    TResult? Function()? clearNodeSelection,
    TResult? Function(SNode node, String newSnippetName)? saveNodeAsSnippet,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    replaceSelectionWith,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    wrapSelectionWith,
    TResult? Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    appendChild,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingBefore,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingAfter,
    TResult? Function(Type? widgetSpanChildType)? pasteReplacement,
    TResult? Function(
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    pasteChild,
    TResult? Function()? pasteSiblingBefore,
    TResult? Function()? pasteSiblingAfter,
    TResult? Function()? deleteNodeTapped,
    TResult? Function()? completeDeletion,
    TResult? Function(SnippetRootNode rootNode)? copySnippetJsonToClipboard,
    TResult? Function(String? snippetJson)? replaceSnippetFromJson,
    TResult? Function(SNode node, String? scName, dynamic skipSave)? copyNode,
    TResult? Function(SNode node, String? scName, dynamic skipSave)? cutNode,
    TResult? Function(String snippetName, SNode? selectedNode)?
    selectedDirectoryOrNode,
    TResult? Function(Uint8List? newBytes)? imageChanged,
    TResult? Function()? forceSnippetRefresh,
  }) {
    return pasteSiblingBefore?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? panelName)? selectPanel,
    TResult Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )?
    overrideTargetGK,
    TResult Function(bool onlyTargetsWrappers)? forceRefresh,
    TResult Function(SNode? newContent, String? scName, dynamic skipSave)?
    updateClipboard,
    TResult Function(String snippetName, String versionId)? publishSnippet,
    TResult Function(String snippetName, String versionId)? revertSnippet,
    TResult Function(String pathName)? deletePage,
    TResult Function(String snippetName)? toggleAutoPublishingOfSnippet,
    TResult Function(bool b)? autoPublishDefault,
    TResult Function(bool hide)? hideIframes,
    TResult Function(String snippetName, String panelName)?
    setPanelOrPlaceholderSnippet,
    TResult Function(String snippetName)? enterSelectWidgetMode,
    TResult Function()? exitSelectWidgetMode,
    TResult Function(SnippetRootNode rootNode, SNode? selectedNode)?
    pushSnippetEditor,
    TResult Function(bool save)? popSnippetEditor,
    TResult Function()? showDirectoryTree,
    TResult Function(bool save)? removeDirectoryTree,
    TResult Function(SNode node)? selectNode,
    TResult Function()? clearNodeSelection,
    TResult Function(SNode node, String newSnippetName)? saveNodeAsSnippet,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    replaceSelectionWith,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    wrapSelectionWith,
    TResult Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    appendChild,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingBefore,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingAfter,
    TResult Function(Type? widgetSpanChildType)? pasteReplacement,
    TResult Function(Type? widgetSpanChildType, SNode? testWidgetSpanChildNode)?
    pasteChild,
    TResult Function()? pasteSiblingBefore,
    TResult Function()? pasteSiblingAfter,
    TResult Function()? deleteNodeTapped,
    TResult Function()? completeDeletion,
    TResult Function(SnippetRootNode rootNode)? copySnippetJsonToClipboard,
    TResult Function(String? snippetJson)? replaceSnippetFromJson,
    TResult Function(SNode node, String? scName, dynamic skipSave)? copyNode,
    TResult Function(SNode node, String? scName, dynamic skipSave)? cutNode,
    TResult Function(String snippetName, SNode? selectedNode)?
    selectedDirectoryOrNode,
    TResult Function(Uint8List? newBytes)? imageChanged,
    TResult Function()? forceSnippetRefresh,
    required TResult orElse(),
  }) {
    if (pasteSiblingBefore != null) {
      return pasteSiblingBefore();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SelectPanel value) selectPanel,
    required TResult Function(OverrideTargetGK value) overrideTargetGK,
    required TResult Function(ForceRefresh value) forceRefresh,
    required TResult Function(UpdateClipboard value) updateClipboard,
    required TResult Function(PublishSnippet value) publishSnippet,
    required TResult Function(RevertSnippet value) revertSnippet,
    required TResult Function(DeletePage value) deletePage,
    required TResult Function(ToggleAutoPublishingOfSnippet value)
    toggleAutoPublishingOfSnippet,
    required TResult Function(AutoPublishDefault value) autoPublishDefault,
    required TResult Function(HideIframes value) hideIframes,
    required TResult Function(SetPanelSnippet value)
    setPanelOrPlaceholderSnippet,
    required TResult Function(EnterSelectWidgetMode value)
    enterSelectWidgetMode,
    required TResult Function(ExitSelectWidgetMode value) exitSelectWidgetMode,
    required TResult Function(PushSnippetEditor value) pushSnippetEditor,
    required TResult Function(PopSnippetEditor value) popSnippetEditor,
    required TResult Function(ShowDirectoryTree value) showDirectoryTree,
    required TResult Function(RemoveDirectoryTree value) removeDirectoryTree,
    required TResult Function(SelectNode value) selectNode,
    required TResult Function(ClearNodeSelection value) clearNodeSelection,
    required TResult Function(SaveNodeAsSnippet value) saveNodeAsSnippet,
    required TResult Function(ReplaceSelectionWith value) replaceSelectionWith,
    required TResult Function(WrapSelectionWith value) wrapSelectionWith,
    required TResult Function(AppendChild value) appendChild,
    required TResult Function(AddSiblingBefore value) addSiblingBefore,
    required TResult Function(AddSiblingAfter value) addSiblingAfter,
    required TResult Function(PasteReplacement value) pasteReplacement,
    required TResult Function(PasteChild value) pasteChild,
    required TResult Function(PasteSiblingBefore value) pasteSiblingBefore,
    required TResult Function(PasteSiblingAfter value) pasteSiblingAfter,
    required TResult Function(DeleteNodeTapped value) deleteNodeTapped,
    required TResult Function(CompleteDeletion value) completeDeletion,
    required TResult Function(CopySnippetJsonToClipboard value)
    copySnippetJsonToClipboard,
    required TResult Function(ReplaceSnippetFromJson value)
    replaceSnippetFromJson,
    required TResult Function(CopyNode value) copyNode,
    required TResult Function(CutNode value) cutNode,
    required TResult Function(SelectedDirectoryOrNode value)
    selectedDirectoryOrNode,
    required TResult Function(ImageChanged value) imageChanged,
    required TResult Function(ForceSnippetRefresh value) forceSnippetRefresh,
  }) {
    return pasteSiblingBefore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SelectPanel value)? selectPanel,
    TResult? Function(OverrideTargetGK value)? overrideTargetGK,
    TResult? Function(ForceRefresh value)? forceRefresh,
    TResult? Function(UpdateClipboard value)? updateClipboard,
    TResult? Function(PublishSnippet value)? publishSnippet,
    TResult? Function(RevertSnippet value)? revertSnippet,
    TResult? Function(DeletePage value)? deletePage,
    TResult? Function(ToggleAutoPublishingOfSnippet value)?
    toggleAutoPublishingOfSnippet,
    TResult? Function(AutoPublishDefault value)? autoPublishDefault,
    TResult? Function(HideIframes value)? hideIframes,
    TResult? Function(SetPanelSnippet value)? setPanelOrPlaceholderSnippet,
    TResult? Function(EnterSelectWidgetMode value)? enterSelectWidgetMode,
    TResult? Function(ExitSelectWidgetMode value)? exitSelectWidgetMode,
    TResult? Function(PushSnippetEditor value)? pushSnippetEditor,
    TResult? Function(PopSnippetEditor value)? popSnippetEditor,
    TResult? Function(ShowDirectoryTree value)? showDirectoryTree,
    TResult? Function(RemoveDirectoryTree value)? removeDirectoryTree,
    TResult? Function(SelectNode value)? selectNode,
    TResult? Function(ClearNodeSelection value)? clearNodeSelection,
    TResult? Function(SaveNodeAsSnippet value)? saveNodeAsSnippet,
    TResult? Function(ReplaceSelectionWith value)? replaceSelectionWith,
    TResult? Function(WrapSelectionWith value)? wrapSelectionWith,
    TResult? Function(AppendChild value)? appendChild,
    TResult? Function(AddSiblingBefore value)? addSiblingBefore,
    TResult? Function(AddSiblingAfter value)? addSiblingAfter,
    TResult? Function(PasteReplacement value)? pasteReplacement,
    TResult? Function(PasteChild value)? pasteChild,
    TResult? Function(PasteSiblingBefore value)? pasteSiblingBefore,
    TResult? Function(PasteSiblingAfter value)? pasteSiblingAfter,
    TResult? Function(DeleteNodeTapped value)? deleteNodeTapped,
    TResult? Function(CompleteDeletion value)? completeDeletion,
    TResult? Function(CopySnippetJsonToClipboard value)?
    copySnippetJsonToClipboard,
    TResult? Function(ReplaceSnippetFromJson value)? replaceSnippetFromJson,
    TResult? Function(CopyNode value)? copyNode,
    TResult? Function(CutNode value)? cutNode,
    TResult? Function(SelectedDirectoryOrNode value)? selectedDirectoryOrNode,
    TResult? Function(ImageChanged value)? imageChanged,
    TResult? Function(ForceSnippetRefresh value)? forceSnippetRefresh,
  }) {
    return pasteSiblingBefore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SelectPanel value)? selectPanel,
    TResult Function(OverrideTargetGK value)? overrideTargetGK,
    TResult Function(ForceRefresh value)? forceRefresh,
    TResult Function(UpdateClipboard value)? updateClipboard,
    TResult Function(PublishSnippet value)? publishSnippet,
    TResult Function(RevertSnippet value)? revertSnippet,
    TResult Function(DeletePage value)? deletePage,
    TResult Function(ToggleAutoPublishingOfSnippet value)?
    toggleAutoPublishingOfSnippet,
    TResult Function(AutoPublishDefault value)? autoPublishDefault,
    TResult Function(HideIframes value)? hideIframes,
    TResult Function(SetPanelSnippet value)? setPanelOrPlaceholderSnippet,
    TResult Function(EnterSelectWidgetMode value)? enterSelectWidgetMode,
    TResult Function(ExitSelectWidgetMode value)? exitSelectWidgetMode,
    TResult Function(PushSnippetEditor value)? pushSnippetEditor,
    TResult Function(PopSnippetEditor value)? popSnippetEditor,
    TResult Function(ShowDirectoryTree value)? showDirectoryTree,
    TResult Function(RemoveDirectoryTree value)? removeDirectoryTree,
    TResult Function(SelectNode value)? selectNode,
    TResult Function(ClearNodeSelection value)? clearNodeSelection,
    TResult Function(SaveNodeAsSnippet value)? saveNodeAsSnippet,
    TResult Function(ReplaceSelectionWith value)? replaceSelectionWith,
    TResult Function(WrapSelectionWith value)? wrapSelectionWith,
    TResult Function(AppendChild value)? appendChild,
    TResult Function(AddSiblingBefore value)? addSiblingBefore,
    TResult Function(AddSiblingAfter value)? addSiblingAfter,
    TResult Function(PasteReplacement value)? pasteReplacement,
    TResult Function(PasteChild value)? pasteChild,
    TResult Function(PasteSiblingBefore value)? pasteSiblingBefore,
    TResult Function(PasteSiblingAfter value)? pasteSiblingAfter,
    TResult Function(DeleteNodeTapped value)? deleteNodeTapped,
    TResult Function(CompleteDeletion value)? completeDeletion,
    TResult Function(CopySnippetJsonToClipboard value)?
    copySnippetJsonToClipboard,
    TResult Function(ReplaceSnippetFromJson value)? replaceSnippetFromJson,
    TResult Function(CopyNode value)? copyNode,
    TResult Function(CutNode value)? cutNode,
    TResult Function(SelectedDirectoryOrNode value)? selectedDirectoryOrNode,
    TResult Function(ImageChanged value)? imageChanged,
    TResult Function(ForceSnippetRefresh value)? forceSnippetRefresh,
    required TResult orElse(),
  }) {
    if (pasteSiblingBefore != null) {
      return pasteSiblingBefore(this);
    }
    return orElse();
  }
}

abstract class PasteSiblingBefore implements CAPIEvent {
  const factory PasteSiblingBefore() = _$PasteSiblingBeforeImpl;
}

/// @nodoc
abstract class _$$PasteSiblingAfterImplCopyWith<$Res> {
  factory _$$PasteSiblingAfterImplCopyWith(
    _$PasteSiblingAfterImpl value,
    $Res Function(_$PasteSiblingAfterImpl) then,
  ) = __$$PasteSiblingAfterImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PasteSiblingAfterImplCopyWithImpl<$Res>
    extends _$CAPIEventCopyWithImpl<$Res, _$PasteSiblingAfterImpl>
    implements _$$PasteSiblingAfterImplCopyWith<$Res> {
  __$$PasteSiblingAfterImplCopyWithImpl(
    _$PasteSiblingAfterImpl _value,
    $Res Function(_$PasteSiblingAfterImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PasteSiblingAfterImpl
    with DiagnosticableTreeMixin
    implements PasteSiblingAfter {
  const _$PasteSiblingAfterImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CAPIEvent.pasteSiblingAfter()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'CAPIEvent.pasteSiblingAfter'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PasteSiblingAfterImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? panelName) selectPanel,
    required TResult Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )
    overrideTargetGK,
    required TResult Function(bool onlyTargetsWrappers) forceRefresh,
    required TResult Function(
      SNode? newContent,
      String? scName,
      dynamic skipSave,
    )
    updateClipboard,
    required TResult Function(String snippetName, String versionId)
    publishSnippet,
    required TResult Function(String snippetName, String versionId)
    revertSnippet,
    required TResult Function(String pathName) deletePage,
    required TResult Function(String snippetName) toggleAutoPublishingOfSnippet,
    required TResult Function(bool b) autoPublishDefault,
    required TResult Function(bool hide) hideIframes,
    required TResult Function(String snippetName, String panelName)
    setPanelOrPlaceholderSnippet,
    required TResult Function(String snippetName) enterSelectWidgetMode,
    required TResult Function() exitSelectWidgetMode,
    required TResult Function(SnippetRootNode rootNode, SNode? selectedNode)
    pushSnippetEditor,
    required TResult Function(bool save) popSnippetEditor,
    required TResult Function() showDirectoryTree,
    required TResult Function(bool save) removeDirectoryTree,
    required TResult Function(SNode node) selectNode,
    required TResult Function() clearNodeSelection,
    required TResult Function(SNode node, String newSnippetName)
    saveNodeAsSnippet,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    replaceSelectionWith,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    wrapSelectionWith,
    required TResult Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )
    appendChild,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    addSiblingBefore,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    addSiblingAfter,
    required TResult Function(Type? widgetSpanChildType) pasteReplacement,
    required TResult Function(
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )
    pasteChild,
    required TResult Function() pasteSiblingBefore,
    required TResult Function() pasteSiblingAfter,
    required TResult Function() deleteNodeTapped,
    required TResult Function() completeDeletion,
    required TResult Function(SnippetRootNode rootNode)
    copySnippetJsonToClipboard,
    required TResult Function(String? snippetJson) replaceSnippetFromJson,
    required TResult Function(SNode node, String? scName, dynamic skipSave)
    copyNode,
    required TResult Function(SNode node, String? scName, dynamic skipSave)
    cutNode,
    required TResult Function(String snippetName, SNode? selectedNode)
    selectedDirectoryOrNode,
    required TResult Function(Uint8List? newBytes) imageChanged,
    required TResult Function() forceSnippetRefresh,
  }) {
    return pasteSiblingAfter();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? panelName)? selectPanel,
    TResult? Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )?
    overrideTargetGK,
    TResult? Function(bool onlyTargetsWrappers)? forceRefresh,
    TResult? Function(SNode? newContent, String? scName, dynamic skipSave)?
    updateClipboard,
    TResult? Function(String snippetName, String versionId)? publishSnippet,
    TResult? Function(String snippetName, String versionId)? revertSnippet,
    TResult? Function(String pathName)? deletePage,
    TResult? Function(String snippetName)? toggleAutoPublishingOfSnippet,
    TResult? Function(bool b)? autoPublishDefault,
    TResult? Function(bool hide)? hideIframes,
    TResult? Function(String snippetName, String panelName)?
    setPanelOrPlaceholderSnippet,
    TResult? Function(String snippetName)? enterSelectWidgetMode,
    TResult? Function()? exitSelectWidgetMode,
    TResult? Function(SnippetRootNode rootNode, SNode? selectedNode)?
    pushSnippetEditor,
    TResult? Function(bool save)? popSnippetEditor,
    TResult? Function()? showDirectoryTree,
    TResult? Function(bool save)? removeDirectoryTree,
    TResult? Function(SNode node)? selectNode,
    TResult? Function()? clearNodeSelection,
    TResult? Function(SNode node, String newSnippetName)? saveNodeAsSnippet,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    replaceSelectionWith,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    wrapSelectionWith,
    TResult? Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    appendChild,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingBefore,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingAfter,
    TResult? Function(Type? widgetSpanChildType)? pasteReplacement,
    TResult? Function(
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    pasteChild,
    TResult? Function()? pasteSiblingBefore,
    TResult? Function()? pasteSiblingAfter,
    TResult? Function()? deleteNodeTapped,
    TResult? Function()? completeDeletion,
    TResult? Function(SnippetRootNode rootNode)? copySnippetJsonToClipboard,
    TResult? Function(String? snippetJson)? replaceSnippetFromJson,
    TResult? Function(SNode node, String? scName, dynamic skipSave)? copyNode,
    TResult? Function(SNode node, String? scName, dynamic skipSave)? cutNode,
    TResult? Function(String snippetName, SNode? selectedNode)?
    selectedDirectoryOrNode,
    TResult? Function(Uint8List? newBytes)? imageChanged,
    TResult? Function()? forceSnippetRefresh,
  }) {
    return pasteSiblingAfter?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? panelName)? selectPanel,
    TResult Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )?
    overrideTargetGK,
    TResult Function(bool onlyTargetsWrappers)? forceRefresh,
    TResult Function(SNode? newContent, String? scName, dynamic skipSave)?
    updateClipboard,
    TResult Function(String snippetName, String versionId)? publishSnippet,
    TResult Function(String snippetName, String versionId)? revertSnippet,
    TResult Function(String pathName)? deletePage,
    TResult Function(String snippetName)? toggleAutoPublishingOfSnippet,
    TResult Function(bool b)? autoPublishDefault,
    TResult Function(bool hide)? hideIframes,
    TResult Function(String snippetName, String panelName)?
    setPanelOrPlaceholderSnippet,
    TResult Function(String snippetName)? enterSelectWidgetMode,
    TResult Function()? exitSelectWidgetMode,
    TResult Function(SnippetRootNode rootNode, SNode? selectedNode)?
    pushSnippetEditor,
    TResult Function(bool save)? popSnippetEditor,
    TResult Function()? showDirectoryTree,
    TResult Function(bool save)? removeDirectoryTree,
    TResult Function(SNode node)? selectNode,
    TResult Function()? clearNodeSelection,
    TResult Function(SNode node, String newSnippetName)? saveNodeAsSnippet,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    replaceSelectionWith,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    wrapSelectionWith,
    TResult Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    appendChild,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingBefore,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingAfter,
    TResult Function(Type? widgetSpanChildType)? pasteReplacement,
    TResult Function(Type? widgetSpanChildType, SNode? testWidgetSpanChildNode)?
    pasteChild,
    TResult Function()? pasteSiblingBefore,
    TResult Function()? pasteSiblingAfter,
    TResult Function()? deleteNodeTapped,
    TResult Function()? completeDeletion,
    TResult Function(SnippetRootNode rootNode)? copySnippetJsonToClipboard,
    TResult Function(String? snippetJson)? replaceSnippetFromJson,
    TResult Function(SNode node, String? scName, dynamic skipSave)? copyNode,
    TResult Function(SNode node, String? scName, dynamic skipSave)? cutNode,
    TResult Function(String snippetName, SNode? selectedNode)?
    selectedDirectoryOrNode,
    TResult Function(Uint8List? newBytes)? imageChanged,
    TResult Function()? forceSnippetRefresh,
    required TResult orElse(),
  }) {
    if (pasteSiblingAfter != null) {
      return pasteSiblingAfter();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SelectPanel value) selectPanel,
    required TResult Function(OverrideTargetGK value) overrideTargetGK,
    required TResult Function(ForceRefresh value) forceRefresh,
    required TResult Function(UpdateClipboard value) updateClipboard,
    required TResult Function(PublishSnippet value) publishSnippet,
    required TResult Function(RevertSnippet value) revertSnippet,
    required TResult Function(DeletePage value) deletePage,
    required TResult Function(ToggleAutoPublishingOfSnippet value)
    toggleAutoPublishingOfSnippet,
    required TResult Function(AutoPublishDefault value) autoPublishDefault,
    required TResult Function(HideIframes value) hideIframes,
    required TResult Function(SetPanelSnippet value)
    setPanelOrPlaceholderSnippet,
    required TResult Function(EnterSelectWidgetMode value)
    enterSelectWidgetMode,
    required TResult Function(ExitSelectWidgetMode value) exitSelectWidgetMode,
    required TResult Function(PushSnippetEditor value) pushSnippetEditor,
    required TResult Function(PopSnippetEditor value) popSnippetEditor,
    required TResult Function(ShowDirectoryTree value) showDirectoryTree,
    required TResult Function(RemoveDirectoryTree value) removeDirectoryTree,
    required TResult Function(SelectNode value) selectNode,
    required TResult Function(ClearNodeSelection value) clearNodeSelection,
    required TResult Function(SaveNodeAsSnippet value) saveNodeAsSnippet,
    required TResult Function(ReplaceSelectionWith value) replaceSelectionWith,
    required TResult Function(WrapSelectionWith value) wrapSelectionWith,
    required TResult Function(AppendChild value) appendChild,
    required TResult Function(AddSiblingBefore value) addSiblingBefore,
    required TResult Function(AddSiblingAfter value) addSiblingAfter,
    required TResult Function(PasteReplacement value) pasteReplacement,
    required TResult Function(PasteChild value) pasteChild,
    required TResult Function(PasteSiblingBefore value) pasteSiblingBefore,
    required TResult Function(PasteSiblingAfter value) pasteSiblingAfter,
    required TResult Function(DeleteNodeTapped value) deleteNodeTapped,
    required TResult Function(CompleteDeletion value) completeDeletion,
    required TResult Function(CopySnippetJsonToClipboard value)
    copySnippetJsonToClipboard,
    required TResult Function(ReplaceSnippetFromJson value)
    replaceSnippetFromJson,
    required TResult Function(CopyNode value) copyNode,
    required TResult Function(CutNode value) cutNode,
    required TResult Function(SelectedDirectoryOrNode value)
    selectedDirectoryOrNode,
    required TResult Function(ImageChanged value) imageChanged,
    required TResult Function(ForceSnippetRefresh value) forceSnippetRefresh,
  }) {
    return pasteSiblingAfter(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SelectPanel value)? selectPanel,
    TResult? Function(OverrideTargetGK value)? overrideTargetGK,
    TResult? Function(ForceRefresh value)? forceRefresh,
    TResult? Function(UpdateClipboard value)? updateClipboard,
    TResult? Function(PublishSnippet value)? publishSnippet,
    TResult? Function(RevertSnippet value)? revertSnippet,
    TResult? Function(DeletePage value)? deletePage,
    TResult? Function(ToggleAutoPublishingOfSnippet value)?
    toggleAutoPublishingOfSnippet,
    TResult? Function(AutoPublishDefault value)? autoPublishDefault,
    TResult? Function(HideIframes value)? hideIframes,
    TResult? Function(SetPanelSnippet value)? setPanelOrPlaceholderSnippet,
    TResult? Function(EnterSelectWidgetMode value)? enterSelectWidgetMode,
    TResult? Function(ExitSelectWidgetMode value)? exitSelectWidgetMode,
    TResult? Function(PushSnippetEditor value)? pushSnippetEditor,
    TResult? Function(PopSnippetEditor value)? popSnippetEditor,
    TResult? Function(ShowDirectoryTree value)? showDirectoryTree,
    TResult? Function(RemoveDirectoryTree value)? removeDirectoryTree,
    TResult? Function(SelectNode value)? selectNode,
    TResult? Function(ClearNodeSelection value)? clearNodeSelection,
    TResult? Function(SaveNodeAsSnippet value)? saveNodeAsSnippet,
    TResult? Function(ReplaceSelectionWith value)? replaceSelectionWith,
    TResult? Function(WrapSelectionWith value)? wrapSelectionWith,
    TResult? Function(AppendChild value)? appendChild,
    TResult? Function(AddSiblingBefore value)? addSiblingBefore,
    TResult? Function(AddSiblingAfter value)? addSiblingAfter,
    TResult? Function(PasteReplacement value)? pasteReplacement,
    TResult? Function(PasteChild value)? pasteChild,
    TResult? Function(PasteSiblingBefore value)? pasteSiblingBefore,
    TResult? Function(PasteSiblingAfter value)? pasteSiblingAfter,
    TResult? Function(DeleteNodeTapped value)? deleteNodeTapped,
    TResult? Function(CompleteDeletion value)? completeDeletion,
    TResult? Function(CopySnippetJsonToClipboard value)?
    copySnippetJsonToClipboard,
    TResult? Function(ReplaceSnippetFromJson value)? replaceSnippetFromJson,
    TResult? Function(CopyNode value)? copyNode,
    TResult? Function(CutNode value)? cutNode,
    TResult? Function(SelectedDirectoryOrNode value)? selectedDirectoryOrNode,
    TResult? Function(ImageChanged value)? imageChanged,
    TResult? Function(ForceSnippetRefresh value)? forceSnippetRefresh,
  }) {
    return pasteSiblingAfter?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SelectPanel value)? selectPanel,
    TResult Function(OverrideTargetGK value)? overrideTargetGK,
    TResult Function(ForceRefresh value)? forceRefresh,
    TResult Function(UpdateClipboard value)? updateClipboard,
    TResult Function(PublishSnippet value)? publishSnippet,
    TResult Function(RevertSnippet value)? revertSnippet,
    TResult Function(DeletePage value)? deletePage,
    TResult Function(ToggleAutoPublishingOfSnippet value)?
    toggleAutoPublishingOfSnippet,
    TResult Function(AutoPublishDefault value)? autoPublishDefault,
    TResult Function(HideIframes value)? hideIframes,
    TResult Function(SetPanelSnippet value)? setPanelOrPlaceholderSnippet,
    TResult Function(EnterSelectWidgetMode value)? enterSelectWidgetMode,
    TResult Function(ExitSelectWidgetMode value)? exitSelectWidgetMode,
    TResult Function(PushSnippetEditor value)? pushSnippetEditor,
    TResult Function(PopSnippetEditor value)? popSnippetEditor,
    TResult Function(ShowDirectoryTree value)? showDirectoryTree,
    TResult Function(RemoveDirectoryTree value)? removeDirectoryTree,
    TResult Function(SelectNode value)? selectNode,
    TResult Function(ClearNodeSelection value)? clearNodeSelection,
    TResult Function(SaveNodeAsSnippet value)? saveNodeAsSnippet,
    TResult Function(ReplaceSelectionWith value)? replaceSelectionWith,
    TResult Function(WrapSelectionWith value)? wrapSelectionWith,
    TResult Function(AppendChild value)? appendChild,
    TResult Function(AddSiblingBefore value)? addSiblingBefore,
    TResult Function(AddSiblingAfter value)? addSiblingAfter,
    TResult Function(PasteReplacement value)? pasteReplacement,
    TResult Function(PasteChild value)? pasteChild,
    TResult Function(PasteSiblingBefore value)? pasteSiblingBefore,
    TResult Function(PasteSiblingAfter value)? pasteSiblingAfter,
    TResult Function(DeleteNodeTapped value)? deleteNodeTapped,
    TResult Function(CompleteDeletion value)? completeDeletion,
    TResult Function(CopySnippetJsonToClipboard value)?
    copySnippetJsonToClipboard,
    TResult Function(ReplaceSnippetFromJson value)? replaceSnippetFromJson,
    TResult Function(CopyNode value)? copyNode,
    TResult Function(CutNode value)? cutNode,
    TResult Function(SelectedDirectoryOrNode value)? selectedDirectoryOrNode,
    TResult Function(ImageChanged value)? imageChanged,
    TResult Function(ForceSnippetRefresh value)? forceSnippetRefresh,
    required TResult orElse(),
  }) {
    if (pasteSiblingAfter != null) {
      return pasteSiblingAfter(this);
    }
    return orElse();
  }
}

abstract class PasteSiblingAfter implements CAPIEvent {
  const factory PasteSiblingAfter() = _$PasteSiblingAfterImpl;
}

/// @nodoc
abstract class _$$DeleteNodeTappedImplCopyWith<$Res> {
  factory _$$DeleteNodeTappedImplCopyWith(
    _$DeleteNodeTappedImpl value,
    $Res Function(_$DeleteNodeTappedImpl) then,
  ) = __$$DeleteNodeTappedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeleteNodeTappedImplCopyWithImpl<$Res>
    extends _$CAPIEventCopyWithImpl<$Res, _$DeleteNodeTappedImpl>
    implements _$$DeleteNodeTappedImplCopyWith<$Res> {
  __$$DeleteNodeTappedImplCopyWithImpl(
    _$DeleteNodeTappedImpl _value,
    $Res Function(_$DeleteNodeTappedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DeleteNodeTappedImpl
    with DiagnosticableTreeMixin
    implements DeleteNodeTapped {
  const _$DeleteNodeTappedImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CAPIEvent.deleteNodeTapped()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'CAPIEvent.deleteNodeTapped'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DeleteNodeTappedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? panelName) selectPanel,
    required TResult Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )
    overrideTargetGK,
    required TResult Function(bool onlyTargetsWrappers) forceRefresh,
    required TResult Function(
      SNode? newContent,
      String? scName,
      dynamic skipSave,
    )
    updateClipboard,
    required TResult Function(String snippetName, String versionId)
    publishSnippet,
    required TResult Function(String snippetName, String versionId)
    revertSnippet,
    required TResult Function(String pathName) deletePage,
    required TResult Function(String snippetName) toggleAutoPublishingOfSnippet,
    required TResult Function(bool b) autoPublishDefault,
    required TResult Function(bool hide) hideIframes,
    required TResult Function(String snippetName, String panelName)
    setPanelOrPlaceholderSnippet,
    required TResult Function(String snippetName) enterSelectWidgetMode,
    required TResult Function() exitSelectWidgetMode,
    required TResult Function(SnippetRootNode rootNode, SNode? selectedNode)
    pushSnippetEditor,
    required TResult Function(bool save) popSnippetEditor,
    required TResult Function() showDirectoryTree,
    required TResult Function(bool save) removeDirectoryTree,
    required TResult Function(SNode node) selectNode,
    required TResult Function() clearNodeSelection,
    required TResult Function(SNode node, String newSnippetName)
    saveNodeAsSnippet,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    replaceSelectionWith,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    wrapSelectionWith,
    required TResult Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )
    appendChild,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    addSiblingBefore,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    addSiblingAfter,
    required TResult Function(Type? widgetSpanChildType) pasteReplacement,
    required TResult Function(
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )
    pasteChild,
    required TResult Function() pasteSiblingBefore,
    required TResult Function() pasteSiblingAfter,
    required TResult Function() deleteNodeTapped,
    required TResult Function() completeDeletion,
    required TResult Function(SnippetRootNode rootNode)
    copySnippetJsonToClipboard,
    required TResult Function(String? snippetJson) replaceSnippetFromJson,
    required TResult Function(SNode node, String? scName, dynamic skipSave)
    copyNode,
    required TResult Function(SNode node, String? scName, dynamic skipSave)
    cutNode,
    required TResult Function(String snippetName, SNode? selectedNode)
    selectedDirectoryOrNode,
    required TResult Function(Uint8List? newBytes) imageChanged,
    required TResult Function() forceSnippetRefresh,
  }) {
    return deleteNodeTapped();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? panelName)? selectPanel,
    TResult? Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )?
    overrideTargetGK,
    TResult? Function(bool onlyTargetsWrappers)? forceRefresh,
    TResult? Function(SNode? newContent, String? scName, dynamic skipSave)?
    updateClipboard,
    TResult? Function(String snippetName, String versionId)? publishSnippet,
    TResult? Function(String snippetName, String versionId)? revertSnippet,
    TResult? Function(String pathName)? deletePage,
    TResult? Function(String snippetName)? toggleAutoPublishingOfSnippet,
    TResult? Function(bool b)? autoPublishDefault,
    TResult? Function(bool hide)? hideIframes,
    TResult? Function(String snippetName, String panelName)?
    setPanelOrPlaceholderSnippet,
    TResult? Function(String snippetName)? enterSelectWidgetMode,
    TResult? Function()? exitSelectWidgetMode,
    TResult? Function(SnippetRootNode rootNode, SNode? selectedNode)?
    pushSnippetEditor,
    TResult? Function(bool save)? popSnippetEditor,
    TResult? Function()? showDirectoryTree,
    TResult? Function(bool save)? removeDirectoryTree,
    TResult? Function(SNode node)? selectNode,
    TResult? Function()? clearNodeSelection,
    TResult? Function(SNode node, String newSnippetName)? saveNodeAsSnippet,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    replaceSelectionWith,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    wrapSelectionWith,
    TResult? Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    appendChild,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingBefore,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingAfter,
    TResult? Function(Type? widgetSpanChildType)? pasteReplacement,
    TResult? Function(
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    pasteChild,
    TResult? Function()? pasteSiblingBefore,
    TResult? Function()? pasteSiblingAfter,
    TResult? Function()? deleteNodeTapped,
    TResult? Function()? completeDeletion,
    TResult? Function(SnippetRootNode rootNode)? copySnippetJsonToClipboard,
    TResult? Function(String? snippetJson)? replaceSnippetFromJson,
    TResult? Function(SNode node, String? scName, dynamic skipSave)? copyNode,
    TResult? Function(SNode node, String? scName, dynamic skipSave)? cutNode,
    TResult? Function(String snippetName, SNode? selectedNode)?
    selectedDirectoryOrNode,
    TResult? Function(Uint8List? newBytes)? imageChanged,
    TResult? Function()? forceSnippetRefresh,
  }) {
    return deleteNodeTapped?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? panelName)? selectPanel,
    TResult Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )?
    overrideTargetGK,
    TResult Function(bool onlyTargetsWrappers)? forceRefresh,
    TResult Function(SNode? newContent, String? scName, dynamic skipSave)?
    updateClipboard,
    TResult Function(String snippetName, String versionId)? publishSnippet,
    TResult Function(String snippetName, String versionId)? revertSnippet,
    TResult Function(String pathName)? deletePage,
    TResult Function(String snippetName)? toggleAutoPublishingOfSnippet,
    TResult Function(bool b)? autoPublishDefault,
    TResult Function(bool hide)? hideIframes,
    TResult Function(String snippetName, String panelName)?
    setPanelOrPlaceholderSnippet,
    TResult Function(String snippetName)? enterSelectWidgetMode,
    TResult Function()? exitSelectWidgetMode,
    TResult Function(SnippetRootNode rootNode, SNode? selectedNode)?
    pushSnippetEditor,
    TResult Function(bool save)? popSnippetEditor,
    TResult Function()? showDirectoryTree,
    TResult Function(bool save)? removeDirectoryTree,
    TResult Function(SNode node)? selectNode,
    TResult Function()? clearNodeSelection,
    TResult Function(SNode node, String newSnippetName)? saveNodeAsSnippet,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    replaceSelectionWith,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    wrapSelectionWith,
    TResult Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    appendChild,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingBefore,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingAfter,
    TResult Function(Type? widgetSpanChildType)? pasteReplacement,
    TResult Function(Type? widgetSpanChildType, SNode? testWidgetSpanChildNode)?
    pasteChild,
    TResult Function()? pasteSiblingBefore,
    TResult Function()? pasteSiblingAfter,
    TResult Function()? deleteNodeTapped,
    TResult Function()? completeDeletion,
    TResult Function(SnippetRootNode rootNode)? copySnippetJsonToClipboard,
    TResult Function(String? snippetJson)? replaceSnippetFromJson,
    TResult Function(SNode node, String? scName, dynamic skipSave)? copyNode,
    TResult Function(SNode node, String? scName, dynamic skipSave)? cutNode,
    TResult Function(String snippetName, SNode? selectedNode)?
    selectedDirectoryOrNode,
    TResult Function(Uint8List? newBytes)? imageChanged,
    TResult Function()? forceSnippetRefresh,
    required TResult orElse(),
  }) {
    if (deleteNodeTapped != null) {
      return deleteNodeTapped();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SelectPanel value) selectPanel,
    required TResult Function(OverrideTargetGK value) overrideTargetGK,
    required TResult Function(ForceRefresh value) forceRefresh,
    required TResult Function(UpdateClipboard value) updateClipboard,
    required TResult Function(PublishSnippet value) publishSnippet,
    required TResult Function(RevertSnippet value) revertSnippet,
    required TResult Function(DeletePage value) deletePage,
    required TResult Function(ToggleAutoPublishingOfSnippet value)
    toggleAutoPublishingOfSnippet,
    required TResult Function(AutoPublishDefault value) autoPublishDefault,
    required TResult Function(HideIframes value) hideIframes,
    required TResult Function(SetPanelSnippet value)
    setPanelOrPlaceholderSnippet,
    required TResult Function(EnterSelectWidgetMode value)
    enterSelectWidgetMode,
    required TResult Function(ExitSelectWidgetMode value) exitSelectWidgetMode,
    required TResult Function(PushSnippetEditor value) pushSnippetEditor,
    required TResult Function(PopSnippetEditor value) popSnippetEditor,
    required TResult Function(ShowDirectoryTree value) showDirectoryTree,
    required TResult Function(RemoveDirectoryTree value) removeDirectoryTree,
    required TResult Function(SelectNode value) selectNode,
    required TResult Function(ClearNodeSelection value) clearNodeSelection,
    required TResult Function(SaveNodeAsSnippet value) saveNodeAsSnippet,
    required TResult Function(ReplaceSelectionWith value) replaceSelectionWith,
    required TResult Function(WrapSelectionWith value) wrapSelectionWith,
    required TResult Function(AppendChild value) appendChild,
    required TResult Function(AddSiblingBefore value) addSiblingBefore,
    required TResult Function(AddSiblingAfter value) addSiblingAfter,
    required TResult Function(PasteReplacement value) pasteReplacement,
    required TResult Function(PasteChild value) pasteChild,
    required TResult Function(PasteSiblingBefore value) pasteSiblingBefore,
    required TResult Function(PasteSiblingAfter value) pasteSiblingAfter,
    required TResult Function(DeleteNodeTapped value) deleteNodeTapped,
    required TResult Function(CompleteDeletion value) completeDeletion,
    required TResult Function(CopySnippetJsonToClipboard value)
    copySnippetJsonToClipboard,
    required TResult Function(ReplaceSnippetFromJson value)
    replaceSnippetFromJson,
    required TResult Function(CopyNode value) copyNode,
    required TResult Function(CutNode value) cutNode,
    required TResult Function(SelectedDirectoryOrNode value)
    selectedDirectoryOrNode,
    required TResult Function(ImageChanged value) imageChanged,
    required TResult Function(ForceSnippetRefresh value) forceSnippetRefresh,
  }) {
    return deleteNodeTapped(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SelectPanel value)? selectPanel,
    TResult? Function(OverrideTargetGK value)? overrideTargetGK,
    TResult? Function(ForceRefresh value)? forceRefresh,
    TResult? Function(UpdateClipboard value)? updateClipboard,
    TResult? Function(PublishSnippet value)? publishSnippet,
    TResult? Function(RevertSnippet value)? revertSnippet,
    TResult? Function(DeletePage value)? deletePage,
    TResult? Function(ToggleAutoPublishingOfSnippet value)?
    toggleAutoPublishingOfSnippet,
    TResult? Function(AutoPublishDefault value)? autoPublishDefault,
    TResult? Function(HideIframes value)? hideIframes,
    TResult? Function(SetPanelSnippet value)? setPanelOrPlaceholderSnippet,
    TResult? Function(EnterSelectWidgetMode value)? enterSelectWidgetMode,
    TResult? Function(ExitSelectWidgetMode value)? exitSelectWidgetMode,
    TResult? Function(PushSnippetEditor value)? pushSnippetEditor,
    TResult? Function(PopSnippetEditor value)? popSnippetEditor,
    TResult? Function(ShowDirectoryTree value)? showDirectoryTree,
    TResult? Function(RemoveDirectoryTree value)? removeDirectoryTree,
    TResult? Function(SelectNode value)? selectNode,
    TResult? Function(ClearNodeSelection value)? clearNodeSelection,
    TResult? Function(SaveNodeAsSnippet value)? saveNodeAsSnippet,
    TResult? Function(ReplaceSelectionWith value)? replaceSelectionWith,
    TResult? Function(WrapSelectionWith value)? wrapSelectionWith,
    TResult? Function(AppendChild value)? appendChild,
    TResult? Function(AddSiblingBefore value)? addSiblingBefore,
    TResult? Function(AddSiblingAfter value)? addSiblingAfter,
    TResult? Function(PasteReplacement value)? pasteReplacement,
    TResult? Function(PasteChild value)? pasteChild,
    TResult? Function(PasteSiblingBefore value)? pasteSiblingBefore,
    TResult? Function(PasteSiblingAfter value)? pasteSiblingAfter,
    TResult? Function(DeleteNodeTapped value)? deleteNodeTapped,
    TResult? Function(CompleteDeletion value)? completeDeletion,
    TResult? Function(CopySnippetJsonToClipboard value)?
    copySnippetJsonToClipboard,
    TResult? Function(ReplaceSnippetFromJson value)? replaceSnippetFromJson,
    TResult? Function(CopyNode value)? copyNode,
    TResult? Function(CutNode value)? cutNode,
    TResult? Function(SelectedDirectoryOrNode value)? selectedDirectoryOrNode,
    TResult? Function(ImageChanged value)? imageChanged,
    TResult? Function(ForceSnippetRefresh value)? forceSnippetRefresh,
  }) {
    return deleteNodeTapped?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SelectPanel value)? selectPanel,
    TResult Function(OverrideTargetGK value)? overrideTargetGK,
    TResult Function(ForceRefresh value)? forceRefresh,
    TResult Function(UpdateClipboard value)? updateClipboard,
    TResult Function(PublishSnippet value)? publishSnippet,
    TResult Function(RevertSnippet value)? revertSnippet,
    TResult Function(DeletePage value)? deletePage,
    TResult Function(ToggleAutoPublishingOfSnippet value)?
    toggleAutoPublishingOfSnippet,
    TResult Function(AutoPublishDefault value)? autoPublishDefault,
    TResult Function(HideIframes value)? hideIframes,
    TResult Function(SetPanelSnippet value)? setPanelOrPlaceholderSnippet,
    TResult Function(EnterSelectWidgetMode value)? enterSelectWidgetMode,
    TResult Function(ExitSelectWidgetMode value)? exitSelectWidgetMode,
    TResult Function(PushSnippetEditor value)? pushSnippetEditor,
    TResult Function(PopSnippetEditor value)? popSnippetEditor,
    TResult Function(ShowDirectoryTree value)? showDirectoryTree,
    TResult Function(RemoveDirectoryTree value)? removeDirectoryTree,
    TResult Function(SelectNode value)? selectNode,
    TResult Function(ClearNodeSelection value)? clearNodeSelection,
    TResult Function(SaveNodeAsSnippet value)? saveNodeAsSnippet,
    TResult Function(ReplaceSelectionWith value)? replaceSelectionWith,
    TResult Function(WrapSelectionWith value)? wrapSelectionWith,
    TResult Function(AppendChild value)? appendChild,
    TResult Function(AddSiblingBefore value)? addSiblingBefore,
    TResult Function(AddSiblingAfter value)? addSiblingAfter,
    TResult Function(PasteReplacement value)? pasteReplacement,
    TResult Function(PasteChild value)? pasteChild,
    TResult Function(PasteSiblingBefore value)? pasteSiblingBefore,
    TResult Function(PasteSiblingAfter value)? pasteSiblingAfter,
    TResult Function(DeleteNodeTapped value)? deleteNodeTapped,
    TResult Function(CompleteDeletion value)? completeDeletion,
    TResult Function(CopySnippetJsonToClipboard value)?
    copySnippetJsonToClipboard,
    TResult Function(ReplaceSnippetFromJson value)? replaceSnippetFromJson,
    TResult Function(CopyNode value)? copyNode,
    TResult Function(CutNode value)? cutNode,
    TResult Function(SelectedDirectoryOrNode value)? selectedDirectoryOrNode,
    TResult Function(ImageChanged value)? imageChanged,
    TResult Function(ForceSnippetRefresh value)? forceSnippetRefresh,
    required TResult orElse(),
  }) {
    if (deleteNodeTapped != null) {
      return deleteNodeTapped(this);
    }
    return orElse();
  }
}

abstract class DeleteNodeTapped implements CAPIEvent {
  const factory DeleteNodeTapped() = _$DeleteNodeTappedImpl;
}

/// @nodoc
abstract class _$$CompleteDeletionImplCopyWith<$Res> {
  factory _$$CompleteDeletionImplCopyWith(
    _$CompleteDeletionImpl value,
    $Res Function(_$CompleteDeletionImpl) then,
  ) = __$$CompleteDeletionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CompleteDeletionImplCopyWithImpl<$Res>
    extends _$CAPIEventCopyWithImpl<$Res, _$CompleteDeletionImpl>
    implements _$$CompleteDeletionImplCopyWith<$Res> {
  __$$CompleteDeletionImplCopyWithImpl(
    _$CompleteDeletionImpl _value,
    $Res Function(_$CompleteDeletionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CompleteDeletionImpl
    with DiagnosticableTreeMixin
    implements CompleteDeletion {
  const _$CompleteDeletionImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CAPIEvent.completeDeletion()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'CAPIEvent.completeDeletion'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CompleteDeletionImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? panelName) selectPanel,
    required TResult Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )
    overrideTargetGK,
    required TResult Function(bool onlyTargetsWrappers) forceRefresh,
    required TResult Function(
      SNode? newContent,
      String? scName,
      dynamic skipSave,
    )
    updateClipboard,
    required TResult Function(String snippetName, String versionId)
    publishSnippet,
    required TResult Function(String snippetName, String versionId)
    revertSnippet,
    required TResult Function(String pathName) deletePage,
    required TResult Function(String snippetName) toggleAutoPublishingOfSnippet,
    required TResult Function(bool b) autoPublishDefault,
    required TResult Function(bool hide) hideIframes,
    required TResult Function(String snippetName, String panelName)
    setPanelOrPlaceholderSnippet,
    required TResult Function(String snippetName) enterSelectWidgetMode,
    required TResult Function() exitSelectWidgetMode,
    required TResult Function(SnippetRootNode rootNode, SNode? selectedNode)
    pushSnippetEditor,
    required TResult Function(bool save) popSnippetEditor,
    required TResult Function() showDirectoryTree,
    required TResult Function(bool save) removeDirectoryTree,
    required TResult Function(SNode node) selectNode,
    required TResult Function() clearNodeSelection,
    required TResult Function(SNode node, String newSnippetName)
    saveNodeAsSnippet,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    replaceSelectionWith,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    wrapSelectionWith,
    required TResult Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )
    appendChild,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    addSiblingBefore,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    addSiblingAfter,
    required TResult Function(Type? widgetSpanChildType) pasteReplacement,
    required TResult Function(
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )
    pasteChild,
    required TResult Function() pasteSiblingBefore,
    required TResult Function() pasteSiblingAfter,
    required TResult Function() deleteNodeTapped,
    required TResult Function() completeDeletion,
    required TResult Function(SnippetRootNode rootNode)
    copySnippetJsonToClipboard,
    required TResult Function(String? snippetJson) replaceSnippetFromJson,
    required TResult Function(SNode node, String? scName, dynamic skipSave)
    copyNode,
    required TResult Function(SNode node, String? scName, dynamic skipSave)
    cutNode,
    required TResult Function(String snippetName, SNode? selectedNode)
    selectedDirectoryOrNode,
    required TResult Function(Uint8List? newBytes) imageChanged,
    required TResult Function() forceSnippetRefresh,
  }) {
    return completeDeletion();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? panelName)? selectPanel,
    TResult? Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )?
    overrideTargetGK,
    TResult? Function(bool onlyTargetsWrappers)? forceRefresh,
    TResult? Function(SNode? newContent, String? scName, dynamic skipSave)?
    updateClipboard,
    TResult? Function(String snippetName, String versionId)? publishSnippet,
    TResult? Function(String snippetName, String versionId)? revertSnippet,
    TResult? Function(String pathName)? deletePage,
    TResult? Function(String snippetName)? toggleAutoPublishingOfSnippet,
    TResult? Function(bool b)? autoPublishDefault,
    TResult? Function(bool hide)? hideIframes,
    TResult? Function(String snippetName, String panelName)?
    setPanelOrPlaceholderSnippet,
    TResult? Function(String snippetName)? enterSelectWidgetMode,
    TResult? Function()? exitSelectWidgetMode,
    TResult? Function(SnippetRootNode rootNode, SNode? selectedNode)?
    pushSnippetEditor,
    TResult? Function(bool save)? popSnippetEditor,
    TResult? Function()? showDirectoryTree,
    TResult? Function(bool save)? removeDirectoryTree,
    TResult? Function(SNode node)? selectNode,
    TResult? Function()? clearNodeSelection,
    TResult? Function(SNode node, String newSnippetName)? saveNodeAsSnippet,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    replaceSelectionWith,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    wrapSelectionWith,
    TResult? Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    appendChild,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingBefore,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingAfter,
    TResult? Function(Type? widgetSpanChildType)? pasteReplacement,
    TResult? Function(
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    pasteChild,
    TResult? Function()? pasteSiblingBefore,
    TResult? Function()? pasteSiblingAfter,
    TResult? Function()? deleteNodeTapped,
    TResult? Function()? completeDeletion,
    TResult? Function(SnippetRootNode rootNode)? copySnippetJsonToClipboard,
    TResult? Function(String? snippetJson)? replaceSnippetFromJson,
    TResult? Function(SNode node, String? scName, dynamic skipSave)? copyNode,
    TResult? Function(SNode node, String? scName, dynamic skipSave)? cutNode,
    TResult? Function(String snippetName, SNode? selectedNode)?
    selectedDirectoryOrNode,
    TResult? Function(Uint8List? newBytes)? imageChanged,
    TResult? Function()? forceSnippetRefresh,
  }) {
    return completeDeletion?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? panelName)? selectPanel,
    TResult Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )?
    overrideTargetGK,
    TResult Function(bool onlyTargetsWrappers)? forceRefresh,
    TResult Function(SNode? newContent, String? scName, dynamic skipSave)?
    updateClipboard,
    TResult Function(String snippetName, String versionId)? publishSnippet,
    TResult Function(String snippetName, String versionId)? revertSnippet,
    TResult Function(String pathName)? deletePage,
    TResult Function(String snippetName)? toggleAutoPublishingOfSnippet,
    TResult Function(bool b)? autoPublishDefault,
    TResult Function(bool hide)? hideIframes,
    TResult Function(String snippetName, String panelName)?
    setPanelOrPlaceholderSnippet,
    TResult Function(String snippetName)? enterSelectWidgetMode,
    TResult Function()? exitSelectWidgetMode,
    TResult Function(SnippetRootNode rootNode, SNode? selectedNode)?
    pushSnippetEditor,
    TResult Function(bool save)? popSnippetEditor,
    TResult Function()? showDirectoryTree,
    TResult Function(bool save)? removeDirectoryTree,
    TResult Function(SNode node)? selectNode,
    TResult Function()? clearNodeSelection,
    TResult Function(SNode node, String newSnippetName)? saveNodeAsSnippet,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    replaceSelectionWith,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    wrapSelectionWith,
    TResult Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    appendChild,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingBefore,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingAfter,
    TResult Function(Type? widgetSpanChildType)? pasteReplacement,
    TResult Function(Type? widgetSpanChildType, SNode? testWidgetSpanChildNode)?
    pasteChild,
    TResult Function()? pasteSiblingBefore,
    TResult Function()? pasteSiblingAfter,
    TResult Function()? deleteNodeTapped,
    TResult Function()? completeDeletion,
    TResult Function(SnippetRootNode rootNode)? copySnippetJsonToClipboard,
    TResult Function(String? snippetJson)? replaceSnippetFromJson,
    TResult Function(SNode node, String? scName, dynamic skipSave)? copyNode,
    TResult Function(SNode node, String? scName, dynamic skipSave)? cutNode,
    TResult Function(String snippetName, SNode? selectedNode)?
    selectedDirectoryOrNode,
    TResult Function(Uint8List? newBytes)? imageChanged,
    TResult Function()? forceSnippetRefresh,
    required TResult orElse(),
  }) {
    if (completeDeletion != null) {
      return completeDeletion();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SelectPanel value) selectPanel,
    required TResult Function(OverrideTargetGK value) overrideTargetGK,
    required TResult Function(ForceRefresh value) forceRefresh,
    required TResult Function(UpdateClipboard value) updateClipboard,
    required TResult Function(PublishSnippet value) publishSnippet,
    required TResult Function(RevertSnippet value) revertSnippet,
    required TResult Function(DeletePage value) deletePage,
    required TResult Function(ToggleAutoPublishingOfSnippet value)
    toggleAutoPublishingOfSnippet,
    required TResult Function(AutoPublishDefault value) autoPublishDefault,
    required TResult Function(HideIframes value) hideIframes,
    required TResult Function(SetPanelSnippet value)
    setPanelOrPlaceholderSnippet,
    required TResult Function(EnterSelectWidgetMode value)
    enterSelectWidgetMode,
    required TResult Function(ExitSelectWidgetMode value) exitSelectWidgetMode,
    required TResult Function(PushSnippetEditor value) pushSnippetEditor,
    required TResult Function(PopSnippetEditor value) popSnippetEditor,
    required TResult Function(ShowDirectoryTree value) showDirectoryTree,
    required TResult Function(RemoveDirectoryTree value) removeDirectoryTree,
    required TResult Function(SelectNode value) selectNode,
    required TResult Function(ClearNodeSelection value) clearNodeSelection,
    required TResult Function(SaveNodeAsSnippet value) saveNodeAsSnippet,
    required TResult Function(ReplaceSelectionWith value) replaceSelectionWith,
    required TResult Function(WrapSelectionWith value) wrapSelectionWith,
    required TResult Function(AppendChild value) appendChild,
    required TResult Function(AddSiblingBefore value) addSiblingBefore,
    required TResult Function(AddSiblingAfter value) addSiblingAfter,
    required TResult Function(PasteReplacement value) pasteReplacement,
    required TResult Function(PasteChild value) pasteChild,
    required TResult Function(PasteSiblingBefore value) pasteSiblingBefore,
    required TResult Function(PasteSiblingAfter value) pasteSiblingAfter,
    required TResult Function(DeleteNodeTapped value) deleteNodeTapped,
    required TResult Function(CompleteDeletion value) completeDeletion,
    required TResult Function(CopySnippetJsonToClipboard value)
    copySnippetJsonToClipboard,
    required TResult Function(ReplaceSnippetFromJson value)
    replaceSnippetFromJson,
    required TResult Function(CopyNode value) copyNode,
    required TResult Function(CutNode value) cutNode,
    required TResult Function(SelectedDirectoryOrNode value)
    selectedDirectoryOrNode,
    required TResult Function(ImageChanged value) imageChanged,
    required TResult Function(ForceSnippetRefresh value) forceSnippetRefresh,
  }) {
    return completeDeletion(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SelectPanel value)? selectPanel,
    TResult? Function(OverrideTargetGK value)? overrideTargetGK,
    TResult? Function(ForceRefresh value)? forceRefresh,
    TResult? Function(UpdateClipboard value)? updateClipboard,
    TResult? Function(PublishSnippet value)? publishSnippet,
    TResult? Function(RevertSnippet value)? revertSnippet,
    TResult? Function(DeletePage value)? deletePage,
    TResult? Function(ToggleAutoPublishingOfSnippet value)?
    toggleAutoPublishingOfSnippet,
    TResult? Function(AutoPublishDefault value)? autoPublishDefault,
    TResult? Function(HideIframes value)? hideIframes,
    TResult? Function(SetPanelSnippet value)? setPanelOrPlaceholderSnippet,
    TResult? Function(EnterSelectWidgetMode value)? enterSelectWidgetMode,
    TResult? Function(ExitSelectWidgetMode value)? exitSelectWidgetMode,
    TResult? Function(PushSnippetEditor value)? pushSnippetEditor,
    TResult? Function(PopSnippetEditor value)? popSnippetEditor,
    TResult? Function(ShowDirectoryTree value)? showDirectoryTree,
    TResult? Function(RemoveDirectoryTree value)? removeDirectoryTree,
    TResult? Function(SelectNode value)? selectNode,
    TResult? Function(ClearNodeSelection value)? clearNodeSelection,
    TResult? Function(SaveNodeAsSnippet value)? saveNodeAsSnippet,
    TResult? Function(ReplaceSelectionWith value)? replaceSelectionWith,
    TResult? Function(WrapSelectionWith value)? wrapSelectionWith,
    TResult? Function(AppendChild value)? appendChild,
    TResult? Function(AddSiblingBefore value)? addSiblingBefore,
    TResult? Function(AddSiblingAfter value)? addSiblingAfter,
    TResult? Function(PasteReplacement value)? pasteReplacement,
    TResult? Function(PasteChild value)? pasteChild,
    TResult? Function(PasteSiblingBefore value)? pasteSiblingBefore,
    TResult? Function(PasteSiblingAfter value)? pasteSiblingAfter,
    TResult? Function(DeleteNodeTapped value)? deleteNodeTapped,
    TResult? Function(CompleteDeletion value)? completeDeletion,
    TResult? Function(CopySnippetJsonToClipboard value)?
    copySnippetJsonToClipboard,
    TResult? Function(ReplaceSnippetFromJson value)? replaceSnippetFromJson,
    TResult? Function(CopyNode value)? copyNode,
    TResult? Function(CutNode value)? cutNode,
    TResult? Function(SelectedDirectoryOrNode value)? selectedDirectoryOrNode,
    TResult? Function(ImageChanged value)? imageChanged,
    TResult? Function(ForceSnippetRefresh value)? forceSnippetRefresh,
  }) {
    return completeDeletion?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SelectPanel value)? selectPanel,
    TResult Function(OverrideTargetGK value)? overrideTargetGK,
    TResult Function(ForceRefresh value)? forceRefresh,
    TResult Function(UpdateClipboard value)? updateClipboard,
    TResult Function(PublishSnippet value)? publishSnippet,
    TResult Function(RevertSnippet value)? revertSnippet,
    TResult Function(DeletePage value)? deletePage,
    TResult Function(ToggleAutoPublishingOfSnippet value)?
    toggleAutoPublishingOfSnippet,
    TResult Function(AutoPublishDefault value)? autoPublishDefault,
    TResult Function(HideIframes value)? hideIframes,
    TResult Function(SetPanelSnippet value)? setPanelOrPlaceholderSnippet,
    TResult Function(EnterSelectWidgetMode value)? enterSelectWidgetMode,
    TResult Function(ExitSelectWidgetMode value)? exitSelectWidgetMode,
    TResult Function(PushSnippetEditor value)? pushSnippetEditor,
    TResult Function(PopSnippetEditor value)? popSnippetEditor,
    TResult Function(ShowDirectoryTree value)? showDirectoryTree,
    TResult Function(RemoveDirectoryTree value)? removeDirectoryTree,
    TResult Function(SelectNode value)? selectNode,
    TResult Function(ClearNodeSelection value)? clearNodeSelection,
    TResult Function(SaveNodeAsSnippet value)? saveNodeAsSnippet,
    TResult Function(ReplaceSelectionWith value)? replaceSelectionWith,
    TResult Function(WrapSelectionWith value)? wrapSelectionWith,
    TResult Function(AppendChild value)? appendChild,
    TResult Function(AddSiblingBefore value)? addSiblingBefore,
    TResult Function(AddSiblingAfter value)? addSiblingAfter,
    TResult Function(PasteReplacement value)? pasteReplacement,
    TResult Function(PasteChild value)? pasteChild,
    TResult Function(PasteSiblingBefore value)? pasteSiblingBefore,
    TResult Function(PasteSiblingAfter value)? pasteSiblingAfter,
    TResult Function(DeleteNodeTapped value)? deleteNodeTapped,
    TResult Function(CompleteDeletion value)? completeDeletion,
    TResult Function(CopySnippetJsonToClipboard value)?
    copySnippetJsonToClipboard,
    TResult Function(ReplaceSnippetFromJson value)? replaceSnippetFromJson,
    TResult Function(CopyNode value)? copyNode,
    TResult Function(CutNode value)? cutNode,
    TResult Function(SelectedDirectoryOrNode value)? selectedDirectoryOrNode,
    TResult Function(ImageChanged value)? imageChanged,
    TResult Function(ForceSnippetRefresh value)? forceSnippetRefresh,
    required TResult orElse(),
  }) {
    if (completeDeletion != null) {
      return completeDeletion(this);
    }
    return orElse();
  }
}

abstract class CompleteDeletion implements CAPIEvent {
  const factory CompleteDeletion() = _$CompleteDeletionImpl;
}

/// @nodoc
abstract class _$$CopySnippetJsonToClipboardImplCopyWith<$Res> {
  factory _$$CopySnippetJsonToClipboardImplCopyWith(
    _$CopySnippetJsonToClipboardImpl value,
    $Res Function(_$CopySnippetJsonToClipboardImpl) then,
  ) = __$$CopySnippetJsonToClipboardImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SnippetRootNode rootNode});
}

/// @nodoc
class __$$CopySnippetJsonToClipboardImplCopyWithImpl<$Res>
    extends _$CAPIEventCopyWithImpl<$Res, _$CopySnippetJsonToClipboardImpl>
    implements _$$CopySnippetJsonToClipboardImplCopyWith<$Res> {
  __$$CopySnippetJsonToClipboardImplCopyWithImpl(
    _$CopySnippetJsonToClipboardImpl _value,
    $Res Function(_$CopySnippetJsonToClipboardImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? rootNode = null}) {
    return _then(
      _$CopySnippetJsonToClipboardImpl(
        rootNode:
            null == rootNode
                ? _value.rootNode
                : rootNode // ignore: cast_nullable_to_non_nullable
                    as SnippetRootNode,
      ),
    );
  }
}

/// @nodoc

class _$CopySnippetJsonToClipboardImpl
    with DiagnosticableTreeMixin
    implements CopySnippetJsonToClipboard {
  const _$CopySnippetJsonToClipboardImpl({required this.rootNode});

  @override
  final SnippetRootNode rootNode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CAPIEvent.copySnippetJsonToClipboard(rootNode: $rootNode)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CAPIEvent.copySnippetJsonToClipboard'))
      ..add(DiagnosticsProperty('rootNode', rootNode));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CopySnippetJsonToClipboardImpl &&
            (identical(other.rootNode, rootNode) ||
                other.rootNode == rootNode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, rootNode);

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CopySnippetJsonToClipboardImplCopyWith<_$CopySnippetJsonToClipboardImpl>
  get copyWith => __$$CopySnippetJsonToClipboardImplCopyWithImpl<
    _$CopySnippetJsonToClipboardImpl
  >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? panelName) selectPanel,
    required TResult Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )
    overrideTargetGK,
    required TResult Function(bool onlyTargetsWrappers) forceRefresh,
    required TResult Function(
      SNode? newContent,
      String? scName,
      dynamic skipSave,
    )
    updateClipboard,
    required TResult Function(String snippetName, String versionId)
    publishSnippet,
    required TResult Function(String snippetName, String versionId)
    revertSnippet,
    required TResult Function(String pathName) deletePage,
    required TResult Function(String snippetName) toggleAutoPublishingOfSnippet,
    required TResult Function(bool b) autoPublishDefault,
    required TResult Function(bool hide) hideIframes,
    required TResult Function(String snippetName, String panelName)
    setPanelOrPlaceholderSnippet,
    required TResult Function(String snippetName) enterSelectWidgetMode,
    required TResult Function() exitSelectWidgetMode,
    required TResult Function(SnippetRootNode rootNode, SNode? selectedNode)
    pushSnippetEditor,
    required TResult Function(bool save) popSnippetEditor,
    required TResult Function() showDirectoryTree,
    required TResult Function(bool save) removeDirectoryTree,
    required TResult Function(SNode node) selectNode,
    required TResult Function() clearNodeSelection,
    required TResult Function(SNode node, String newSnippetName)
    saveNodeAsSnippet,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    replaceSelectionWith,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    wrapSelectionWith,
    required TResult Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )
    appendChild,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    addSiblingBefore,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    addSiblingAfter,
    required TResult Function(Type? widgetSpanChildType) pasteReplacement,
    required TResult Function(
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )
    pasteChild,
    required TResult Function() pasteSiblingBefore,
    required TResult Function() pasteSiblingAfter,
    required TResult Function() deleteNodeTapped,
    required TResult Function() completeDeletion,
    required TResult Function(SnippetRootNode rootNode)
    copySnippetJsonToClipboard,
    required TResult Function(String? snippetJson) replaceSnippetFromJson,
    required TResult Function(SNode node, String? scName, dynamic skipSave)
    copyNode,
    required TResult Function(SNode node, String? scName, dynamic skipSave)
    cutNode,
    required TResult Function(String snippetName, SNode? selectedNode)
    selectedDirectoryOrNode,
    required TResult Function(Uint8List? newBytes) imageChanged,
    required TResult Function() forceSnippetRefresh,
  }) {
    return copySnippetJsonToClipboard(rootNode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? panelName)? selectPanel,
    TResult? Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )?
    overrideTargetGK,
    TResult? Function(bool onlyTargetsWrappers)? forceRefresh,
    TResult? Function(SNode? newContent, String? scName, dynamic skipSave)?
    updateClipboard,
    TResult? Function(String snippetName, String versionId)? publishSnippet,
    TResult? Function(String snippetName, String versionId)? revertSnippet,
    TResult? Function(String pathName)? deletePage,
    TResult? Function(String snippetName)? toggleAutoPublishingOfSnippet,
    TResult? Function(bool b)? autoPublishDefault,
    TResult? Function(bool hide)? hideIframes,
    TResult? Function(String snippetName, String panelName)?
    setPanelOrPlaceholderSnippet,
    TResult? Function(String snippetName)? enterSelectWidgetMode,
    TResult? Function()? exitSelectWidgetMode,
    TResult? Function(SnippetRootNode rootNode, SNode? selectedNode)?
    pushSnippetEditor,
    TResult? Function(bool save)? popSnippetEditor,
    TResult? Function()? showDirectoryTree,
    TResult? Function(bool save)? removeDirectoryTree,
    TResult? Function(SNode node)? selectNode,
    TResult? Function()? clearNodeSelection,
    TResult? Function(SNode node, String newSnippetName)? saveNodeAsSnippet,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    replaceSelectionWith,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    wrapSelectionWith,
    TResult? Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    appendChild,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingBefore,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingAfter,
    TResult? Function(Type? widgetSpanChildType)? pasteReplacement,
    TResult? Function(
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    pasteChild,
    TResult? Function()? pasteSiblingBefore,
    TResult? Function()? pasteSiblingAfter,
    TResult? Function()? deleteNodeTapped,
    TResult? Function()? completeDeletion,
    TResult? Function(SnippetRootNode rootNode)? copySnippetJsonToClipboard,
    TResult? Function(String? snippetJson)? replaceSnippetFromJson,
    TResult? Function(SNode node, String? scName, dynamic skipSave)? copyNode,
    TResult? Function(SNode node, String? scName, dynamic skipSave)? cutNode,
    TResult? Function(String snippetName, SNode? selectedNode)?
    selectedDirectoryOrNode,
    TResult? Function(Uint8List? newBytes)? imageChanged,
    TResult? Function()? forceSnippetRefresh,
  }) {
    return copySnippetJsonToClipboard?.call(rootNode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? panelName)? selectPanel,
    TResult Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )?
    overrideTargetGK,
    TResult Function(bool onlyTargetsWrappers)? forceRefresh,
    TResult Function(SNode? newContent, String? scName, dynamic skipSave)?
    updateClipboard,
    TResult Function(String snippetName, String versionId)? publishSnippet,
    TResult Function(String snippetName, String versionId)? revertSnippet,
    TResult Function(String pathName)? deletePage,
    TResult Function(String snippetName)? toggleAutoPublishingOfSnippet,
    TResult Function(bool b)? autoPublishDefault,
    TResult Function(bool hide)? hideIframes,
    TResult Function(String snippetName, String panelName)?
    setPanelOrPlaceholderSnippet,
    TResult Function(String snippetName)? enterSelectWidgetMode,
    TResult Function()? exitSelectWidgetMode,
    TResult Function(SnippetRootNode rootNode, SNode? selectedNode)?
    pushSnippetEditor,
    TResult Function(bool save)? popSnippetEditor,
    TResult Function()? showDirectoryTree,
    TResult Function(bool save)? removeDirectoryTree,
    TResult Function(SNode node)? selectNode,
    TResult Function()? clearNodeSelection,
    TResult Function(SNode node, String newSnippetName)? saveNodeAsSnippet,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    replaceSelectionWith,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    wrapSelectionWith,
    TResult Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    appendChild,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingBefore,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingAfter,
    TResult Function(Type? widgetSpanChildType)? pasteReplacement,
    TResult Function(Type? widgetSpanChildType, SNode? testWidgetSpanChildNode)?
    pasteChild,
    TResult Function()? pasteSiblingBefore,
    TResult Function()? pasteSiblingAfter,
    TResult Function()? deleteNodeTapped,
    TResult Function()? completeDeletion,
    TResult Function(SnippetRootNode rootNode)? copySnippetJsonToClipboard,
    TResult Function(String? snippetJson)? replaceSnippetFromJson,
    TResult Function(SNode node, String? scName, dynamic skipSave)? copyNode,
    TResult Function(SNode node, String? scName, dynamic skipSave)? cutNode,
    TResult Function(String snippetName, SNode? selectedNode)?
    selectedDirectoryOrNode,
    TResult Function(Uint8List? newBytes)? imageChanged,
    TResult Function()? forceSnippetRefresh,
    required TResult orElse(),
  }) {
    if (copySnippetJsonToClipboard != null) {
      return copySnippetJsonToClipboard(rootNode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SelectPanel value) selectPanel,
    required TResult Function(OverrideTargetGK value) overrideTargetGK,
    required TResult Function(ForceRefresh value) forceRefresh,
    required TResult Function(UpdateClipboard value) updateClipboard,
    required TResult Function(PublishSnippet value) publishSnippet,
    required TResult Function(RevertSnippet value) revertSnippet,
    required TResult Function(DeletePage value) deletePage,
    required TResult Function(ToggleAutoPublishingOfSnippet value)
    toggleAutoPublishingOfSnippet,
    required TResult Function(AutoPublishDefault value) autoPublishDefault,
    required TResult Function(HideIframes value) hideIframes,
    required TResult Function(SetPanelSnippet value)
    setPanelOrPlaceholderSnippet,
    required TResult Function(EnterSelectWidgetMode value)
    enterSelectWidgetMode,
    required TResult Function(ExitSelectWidgetMode value) exitSelectWidgetMode,
    required TResult Function(PushSnippetEditor value) pushSnippetEditor,
    required TResult Function(PopSnippetEditor value) popSnippetEditor,
    required TResult Function(ShowDirectoryTree value) showDirectoryTree,
    required TResult Function(RemoveDirectoryTree value) removeDirectoryTree,
    required TResult Function(SelectNode value) selectNode,
    required TResult Function(ClearNodeSelection value) clearNodeSelection,
    required TResult Function(SaveNodeAsSnippet value) saveNodeAsSnippet,
    required TResult Function(ReplaceSelectionWith value) replaceSelectionWith,
    required TResult Function(WrapSelectionWith value) wrapSelectionWith,
    required TResult Function(AppendChild value) appendChild,
    required TResult Function(AddSiblingBefore value) addSiblingBefore,
    required TResult Function(AddSiblingAfter value) addSiblingAfter,
    required TResult Function(PasteReplacement value) pasteReplacement,
    required TResult Function(PasteChild value) pasteChild,
    required TResult Function(PasteSiblingBefore value) pasteSiblingBefore,
    required TResult Function(PasteSiblingAfter value) pasteSiblingAfter,
    required TResult Function(DeleteNodeTapped value) deleteNodeTapped,
    required TResult Function(CompleteDeletion value) completeDeletion,
    required TResult Function(CopySnippetJsonToClipboard value)
    copySnippetJsonToClipboard,
    required TResult Function(ReplaceSnippetFromJson value)
    replaceSnippetFromJson,
    required TResult Function(CopyNode value) copyNode,
    required TResult Function(CutNode value) cutNode,
    required TResult Function(SelectedDirectoryOrNode value)
    selectedDirectoryOrNode,
    required TResult Function(ImageChanged value) imageChanged,
    required TResult Function(ForceSnippetRefresh value) forceSnippetRefresh,
  }) {
    return copySnippetJsonToClipboard(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SelectPanel value)? selectPanel,
    TResult? Function(OverrideTargetGK value)? overrideTargetGK,
    TResult? Function(ForceRefresh value)? forceRefresh,
    TResult? Function(UpdateClipboard value)? updateClipboard,
    TResult? Function(PublishSnippet value)? publishSnippet,
    TResult? Function(RevertSnippet value)? revertSnippet,
    TResult? Function(DeletePage value)? deletePage,
    TResult? Function(ToggleAutoPublishingOfSnippet value)?
    toggleAutoPublishingOfSnippet,
    TResult? Function(AutoPublishDefault value)? autoPublishDefault,
    TResult? Function(HideIframes value)? hideIframes,
    TResult? Function(SetPanelSnippet value)? setPanelOrPlaceholderSnippet,
    TResult? Function(EnterSelectWidgetMode value)? enterSelectWidgetMode,
    TResult? Function(ExitSelectWidgetMode value)? exitSelectWidgetMode,
    TResult? Function(PushSnippetEditor value)? pushSnippetEditor,
    TResult? Function(PopSnippetEditor value)? popSnippetEditor,
    TResult? Function(ShowDirectoryTree value)? showDirectoryTree,
    TResult? Function(RemoveDirectoryTree value)? removeDirectoryTree,
    TResult? Function(SelectNode value)? selectNode,
    TResult? Function(ClearNodeSelection value)? clearNodeSelection,
    TResult? Function(SaveNodeAsSnippet value)? saveNodeAsSnippet,
    TResult? Function(ReplaceSelectionWith value)? replaceSelectionWith,
    TResult? Function(WrapSelectionWith value)? wrapSelectionWith,
    TResult? Function(AppendChild value)? appendChild,
    TResult? Function(AddSiblingBefore value)? addSiblingBefore,
    TResult? Function(AddSiblingAfter value)? addSiblingAfter,
    TResult? Function(PasteReplacement value)? pasteReplacement,
    TResult? Function(PasteChild value)? pasteChild,
    TResult? Function(PasteSiblingBefore value)? pasteSiblingBefore,
    TResult? Function(PasteSiblingAfter value)? pasteSiblingAfter,
    TResult? Function(DeleteNodeTapped value)? deleteNodeTapped,
    TResult? Function(CompleteDeletion value)? completeDeletion,
    TResult? Function(CopySnippetJsonToClipboard value)?
    copySnippetJsonToClipboard,
    TResult? Function(ReplaceSnippetFromJson value)? replaceSnippetFromJson,
    TResult? Function(CopyNode value)? copyNode,
    TResult? Function(CutNode value)? cutNode,
    TResult? Function(SelectedDirectoryOrNode value)? selectedDirectoryOrNode,
    TResult? Function(ImageChanged value)? imageChanged,
    TResult? Function(ForceSnippetRefresh value)? forceSnippetRefresh,
  }) {
    return copySnippetJsonToClipboard?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SelectPanel value)? selectPanel,
    TResult Function(OverrideTargetGK value)? overrideTargetGK,
    TResult Function(ForceRefresh value)? forceRefresh,
    TResult Function(UpdateClipboard value)? updateClipboard,
    TResult Function(PublishSnippet value)? publishSnippet,
    TResult Function(RevertSnippet value)? revertSnippet,
    TResult Function(DeletePage value)? deletePage,
    TResult Function(ToggleAutoPublishingOfSnippet value)?
    toggleAutoPublishingOfSnippet,
    TResult Function(AutoPublishDefault value)? autoPublishDefault,
    TResult Function(HideIframes value)? hideIframes,
    TResult Function(SetPanelSnippet value)? setPanelOrPlaceholderSnippet,
    TResult Function(EnterSelectWidgetMode value)? enterSelectWidgetMode,
    TResult Function(ExitSelectWidgetMode value)? exitSelectWidgetMode,
    TResult Function(PushSnippetEditor value)? pushSnippetEditor,
    TResult Function(PopSnippetEditor value)? popSnippetEditor,
    TResult Function(ShowDirectoryTree value)? showDirectoryTree,
    TResult Function(RemoveDirectoryTree value)? removeDirectoryTree,
    TResult Function(SelectNode value)? selectNode,
    TResult Function(ClearNodeSelection value)? clearNodeSelection,
    TResult Function(SaveNodeAsSnippet value)? saveNodeAsSnippet,
    TResult Function(ReplaceSelectionWith value)? replaceSelectionWith,
    TResult Function(WrapSelectionWith value)? wrapSelectionWith,
    TResult Function(AppendChild value)? appendChild,
    TResult Function(AddSiblingBefore value)? addSiblingBefore,
    TResult Function(AddSiblingAfter value)? addSiblingAfter,
    TResult Function(PasteReplacement value)? pasteReplacement,
    TResult Function(PasteChild value)? pasteChild,
    TResult Function(PasteSiblingBefore value)? pasteSiblingBefore,
    TResult Function(PasteSiblingAfter value)? pasteSiblingAfter,
    TResult Function(DeleteNodeTapped value)? deleteNodeTapped,
    TResult Function(CompleteDeletion value)? completeDeletion,
    TResult Function(CopySnippetJsonToClipboard value)?
    copySnippetJsonToClipboard,
    TResult Function(ReplaceSnippetFromJson value)? replaceSnippetFromJson,
    TResult Function(CopyNode value)? copyNode,
    TResult Function(CutNode value)? cutNode,
    TResult Function(SelectedDirectoryOrNode value)? selectedDirectoryOrNode,
    TResult Function(ImageChanged value)? imageChanged,
    TResult Function(ForceSnippetRefresh value)? forceSnippetRefresh,
    required TResult orElse(),
  }) {
    if (copySnippetJsonToClipboard != null) {
      return copySnippetJsonToClipboard(this);
    }
    return orElse();
  }
}

abstract class CopySnippetJsonToClipboard implements CAPIEvent {
  const factory CopySnippetJsonToClipboard({
    required final SnippetRootNode rootNode,
  }) = _$CopySnippetJsonToClipboardImpl;

  SnippetRootNode get rootNode;

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CopySnippetJsonToClipboardImplCopyWith<_$CopySnippetJsonToClipboardImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ReplaceSnippetFromJsonImplCopyWith<$Res> {
  factory _$$ReplaceSnippetFromJsonImplCopyWith(
    _$ReplaceSnippetFromJsonImpl value,
    $Res Function(_$ReplaceSnippetFromJsonImpl) then,
  ) = __$$ReplaceSnippetFromJsonImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? snippetJson});
}

/// @nodoc
class __$$ReplaceSnippetFromJsonImplCopyWithImpl<$Res>
    extends _$CAPIEventCopyWithImpl<$Res, _$ReplaceSnippetFromJsonImpl>
    implements _$$ReplaceSnippetFromJsonImplCopyWith<$Res> {
  __$$ReplaceSnippetFromJsonImplCopyWithImpl(
    _$ReplaceSnippetFromJsonImpl _value,
    $Res Function(_$ReplaceSnippetFromJsonImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? snippetJson = freezed}) {
    return _then(
      _$ReplaceSnippetFromJsonImpl(
        snippetJson:
            freezed == snippetJson
                ? _value.snippetJson
                : snippetJson // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc

class _$ReplaceSnippetFromJsonImpl
    with DiagnosticableTreeMixin
    implements ReplaceSnippetFromJson {
  const _$ReplaceSnippetFromJsonImpl({this.snippetJson});

  @override
  final String? snippetJson;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CAPIEvent.replaceSnippetFromJson(snippetJson: $snippetJson)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CAPIEvent.replaceSnippetFromJson'))
      ..add(DiagnosticsProperty('snippetJson', snippetJson));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReplaceSnippetFromJsonImpl &&
            (identical(other.snippetJson, snippetJson) ||
                other.snippetJson == snippetJson));
  }

  @override
  int get hashCode => Object.hash(runtimeType, snippetJson);

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReplaceSnippetFromJsonImplCopyWith<_$ReplaceSnippetFromJsonImpl>
  get copyWith =>
      __$$ReplaceSnippetFromJsonImplCopyWithImpl<_$ReplaceSnippetFromJsonImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? panelName) selectPanel,
    required TResult Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )
    overrideTargetGK,
    required TResult Function(bool onlyTargetsWrappers) forceRefresh,
    required TResult Function(
      SNode? newContent,
      String? scName,
      dynamic skipSave,
    )
    updateClipboard,
    required TResult Function(String snippetName, String versionId)
    publishSnippet,
    required TResult Function(String snippetName, String versionId)
    revertSnippet,
    required TResult Function(String pathName) deletePage,
    required TResult Function(String snippetName) toggleAutoPublishingOfSnippet,
    required TResult Function(bool b) autoPublishDefault,
    required TResult Function(bool hide) hideIframes,
    required TResult Function(String snippetName, String panelName)
    setPanelOrPlaceholderSnippet,
    required TResult Function(String snippetName) enterSelectWidgetMode,
    required TResult Function() exitSelectWidgetMode,
    required TResult Function(SnippetRootNode rootNode, SNode? selectedNode)
    pushSnippetEditor,
    required TResult Function(bool save) popSnippetEditor,
    required TResult Function() showDirectoryTree,
    required TResult Function(bool save) removeDirectoryTree,
    required TResult Function(SNode node) selectNode,
    required TResult Function() clearNodeSelection,
    required TResult Function(SNode node, String newSnippetName)
    saveNodeAsSnippet,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    replaceSelectionWith,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    wrapSelectionWith,
    required TResult Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )
    appendChild,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    addSiblingBefore,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    addSiblingAfter,
    required TResult Function(Type? widgetSpanChildType) pasteReplacement,
    required TResult Function(
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )
    pasteChild,
    required TResult Function() pasteSiblingBefore,
    required TResult Function() pasteSiblingAfter,
    required TResult Function() deleteNodeTapped,
    required TResult Function() completeDeletion,
    required TResult Function(SnippetRootNode rootNode)
    copySnippetJsonToClipboard,
    required TResult Function(String? snippetJson) replaceSnippetFromJson,
    required TResult Function(SNode node, String? scName, dynamic skipSave)
    copyNode,
    required TResult Function(SNode node, String? scName, dynamic skipSave)
    cutNode,
    required TResult Function(String snippetName, SNode? selectedNode)
    selectedDirectoryOrNode,
    required TResult Function(Uint8List? newBytes) imageChanged,
    required TResult Function() forceSnippetRefresh,
  }) {
    return replaceSnippetFromJson(snippetJson);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? panelName)? selectPanel,
    TResult? Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )?
    overrideTargetGK,
    TResult? Function(bool onlyTargetsWrappers)? forceRefresh,
    TResult? Function(SNode? newContent, String? scName, dynamic skipSave)?
    updateClipboard,
    TResult? Function(String snippetName, String versionId)? publishSnippet,
    TResult? Function(String snippetName, String versionId)? revertSnippet,
    TResult? Function(String pathName)? deletePage,
    TResult? Function(String snippetName)? toggleAutoPublishingOfSnippet,
    TResult? Function(bool b)? autoPublishDefault,
    TResult? Function(bool hide)? hideIframes,
    TResult? Function(String snippetName, String panelName)?
    setPanelOrPlaceholderSnippet,
    TResult? Function(String snippetName)? enterSelectWidgetMode,
    TResult? Function()? exitSelectWidgetMode,
    TResult? Function(SnippetRootNode rootNode, SNode? selectedNode)?
    pushSnippetEditor,
    TResult? Function(bool save)? popSnippetEditor,
    TResult? Function()? showDirectoryTree,
    TResult? Function(bool save)? removeDirectoryTree,
    TResult? Function(SNode node)? selectNode,
    TResult? Function()? clearNodeSelection,
    TResult? Function(SNode node, String newSnippetName)? saveNodeAsSnippet,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    replaceSelectionWith,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    wrapSelectionWith,
    TResult? Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    appendChild,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingBefore,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingAfter,
    TResult? Function(Type? widgetSpanChildType)? pasteReplacement,
    TResult? Function(
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    pasteChild,
    TResult? Function()? pasteSiblingBefore,
    TResult? Function()? pasteSiblingAfter,
    TResult? Function()? deleteNodeTapped,
    TResult? Function()? completeDeletion,
    TResult? Function(SnippetRootNode rootNode)? copySnippetJsonToClipboard,
    TResult? Function(String? snippetJson)? replaceSnippetFromJson,
    TResult? Function(SNode node, String? scName, dynamic skipSave)? copyNode,
    TResult? Function(SNode node, String? scName, dynamic skipSave)? cutNode,
    TResult? Function(String snippetName, SNode? selectedNode)?
    selectedDirectoryOrNode,
    TResult? Function(Uint8List? newBytes)? imageChanged,
    TResult? Function()? forceSnippetRefresh,
  }) {
    return replaceSnippetFromJson?.call(snippetJson);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? panelName)? selectPanel,
    TResult Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )?
    overrideTargetGK,
    TResult Function(bool onlyTargetsWrappers)? forceRefresh,
    TResult Function(SNode? newContent, String? scName, dynamic skipSave)?
    updateClipboard,
    TResult Function(String snippetName, String versionId)? publishSnippet,
    TResult Function(String snippetName, String versionId)? revertSnippet,
    TResult Function(String pathName)? deletePage,
    TResult Function(String snippetName)? toggleAutoPublishingOfSnippet,
    TResult Function(bool b)? autoPublishDefault,
    TResult Function(bool hide)? hideIframes,
    TResult Function(String snippetName, String panelName)?
    setPanelOrPlaceholderSnippet,
    TResult Function(String snippetName)? enterSelectWidgetMode,
    TResult Function()? exitSelectWidgetMode,
    TResult Function(SnippetRootNode rootNode, SNode? selectedNode)?
    pushSnippetEditor,
    TResult Function(bool save)? popSnippetEditor,
    TResult Function()? showDirectoryTree,
    TResult Function(bool save)? removeDirectoryTree,
    TResult Function(SNode node)? selectNode,
    TResult Function()? clearNodeSelection,
    TResult Function(SNode node, String newSnippetName)? saveNodeAsSnippet,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    replaceSelectionWith,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    wrapSelectionWith,
    TResult Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    appendChild,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingBefore,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingAfter,
    TResult Function(Type? widgetSpanChildType)? pasteReplacement,
    TResult Function(Type? widgetSpanChildType, SNode? testWidgetSpanChildNode)?
    pasteChild,
    TResult Function()? pasteSiblingBefore,
    TResult Function()? pasteSiblingAfter,
    TResult Function()? deleteNodeTapped,
    TResult Function()? completeDeletion,
    TResult Function(SnippetRootNode rootNode)? copySnippetJsonToClipboard,
    TResult Function(String? snippetJson)? replaceSnippetFromJson,
    TResult Function(SNode node, String? scName, dynamic skipSave)? copyNode,
    TResult Function(SNode node, String? scName, dynamic skipSave)? cutNode,
    TResult Function(String snippetName, SNode? selectedNode)?
    selectedDirectoryOrNode,
    TResult Function(Uint8List? newBytes)? imageChanged,
    TResult Function()? forceSnippetRefresh,
    required TResult orElse(),
  }) {
    if (replaceSnippetFromJson != null) {
      return replaceSnippetFromJson(snippetJson);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SelectPanel value) selectPanel,
    required TResult Function(OverrideTargetGK value) overrideTargetGK,
    required TResult Function(ForceRefresh value) forceRefresh,
    required TResult Function(UpdateClipboard value) updateClipboard,
    required TResult Function(PublishSnippet value) publishSnippet,
    required TResult Function(RevertSnippet value) revertSnippet,
    required TResult Function(DeletePage value) deletePage,
    required TResult Function(ToggleAutoPublishingOfSnippet value)
    toggleAutoPublishingOfSnippet,
    required TResult Function(AutoPublishDefault value) autoPublishDefault,
    required TResult Function(HideIframes value) hideIframes,
    required TResult Function(SetPanelSnippet value)
    setPanelOrPlaceholderSnippet,
    required TResult Function(EnterSelectWidgetMode value)
    enterSelectWidgetMode,
    required TResult Function(ExitSelectWidgetMode value) exitSelectWidgetMode,
    required TResult Function(PushSnippetEditor value) pushSnippetEditor,
    required TResult Function(PopSnippetEditor value) popSnippetEditor,
    required TResult Function(ShowDirectoryTree value) showDirectoryTree,
    required TResult Function(RemoveDirectoryTree value) removeDirectoryTree,
    required TResult Function(SelectNode value) selectNode,
    required TResult Function(ClearNodeSelection value) clearNodeSelection,
    required TResult Function(SaveNodeAsSnippet value) saveNodeAsSnippet,
    required TResult Function(ReplaceSelectionWith value) replaceSelectionWith,
    required TResult Function(WrapSelectionWith value) wrapSelectionWith,
    required TResult Function(AppendChild value) appendChild,
    required TResult Function(AddSiblingBefore value) addSiblingBefore,
    required TResult Function(AddSiblingAfter value) addSiblingAfter,
    required TResult Function(PasteReplacement value) pasteReplacement,
    required TResult Function(PasteChild value) pasteChild,
    required TResult Function(PasteSiblingBefore value) pasteSiblingBefore,
    required TResult Function(PasteSiblingAfter value) pasteSiblingAfter,
    required TResult Function(DeleteNodeTapped value) deleteNodeTapped,
    required TResult Function(CompleteDeletion value) completeDeletion,
    required TResult Function(CopySnippetJsonToClipboard value)
    copySnippetJsonToClipboard,
    required TResult Function(ReplaceSnippetFromJson value)
    replaceSnippetFromJson,
    required TResult Function(CopyNode value) copyNode,
    required TResult Function(CutNode value) cutNode,
    required TResult Function(SelectedDirectoryOrNode value)
    selectedDirectoryOrNode,
    required TResult Function(ImageChanged value) imageChanged,
    required TResult Function(ForceSnippetRefresh value) forceSnippetRefresh,
  }) {
    return replaceSnippetFromJson(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SelectPanel value)? selectPanel,
    TResult? Function(OverrideTargetGK value)? overrideTargetGK,
    TResult? Function(ForceRefresh value)? forceRefresh,
    TResult? Function(UpdateClipboard value)? updateClipboard,
    TResult? Function(PublishSnippet value)? publishSnippet,
    TResult? Function(RevertSnippet value)? revertSnippet,
    TResult? Function(DeletePage value)? deletePage,
    TResult? Function(ToggleAutoPublishingOfSnippet value)?
    toggleAutoPublishingOfSnippet,
    TResult? Function(AutoPublishDefault value)? autoPublishDefault,
    TResult? Function(HideIframes value)? hideIframes,
    TResult? Function(SetPanelSnippet value)? setPanelOrPlaceholderSnippet,
    TResult? Function(EnterSelectWidgetMode value)? enterSelectWidgetMode,
    TResult? Function(ExitSelectWidgetMode value)? exitSelectWidgetMode,
    TResult? Function(PushSnippetEditor value)? pushSnippetEditor,
    TResult? Function(PopSnippetEditor value)? popSnippetEditor,
    TResult? Function(ShowDirectoryTree value)? showDirectoryTree,
    TResult? Function(RemoveDirectoryTree value)? removeDirectoryTree,
    TResult? Function(SelectNode value)? selectNode,
    TResult? Function(ClearNodeSelection value)? clearNodeSelection,
    TResult? Function(SaveNodeAsSnippet value)? saveNodeAsSnippet,
    TResult? Function(ReplaceSelectionWith value)? replaceSelectionWith,
    TResult? Function(WrapSelectionWith value)? wrapSelectionWith,
    TResult? Function(AppendChild value)? appendChild,
    TResult? Function(AddSiblingBefore value)? addSiblingBefore,
    TResult? Function(AddSiblingAfter value)? addSiblingAfter,
    TResult? Function(PasteReplacement value)? pasteReplacement,
    TResult? Function(PasteChild value)? pasteChild,
    TResult? Function(PasteSiblingBefore value)? pasteSiblingBefore,
    TResult? Function(PasteSiblingAfter value)? pasteSiblingAfter,
    TResult? Function(DeleteNodeTapped value)? deleteNodeTapped,
    TResult? Function(CompleteDeletion value)? completeDeletion,
    TResult? Function(CopySnippetJsonToClipboard value)?
    copySnippetJsonToClipboard,
    TResult? Function(ReplaceSnippetFromJson value)? replaceSnippetFromJson,
    TResult? Function(CopyNode value)? copyNode,
    TResult? Function(CutNode value)? cutNode,
    TResult? Function(SelectedDirectoryOrNode value)? selectedDirectoryOrNode,
    TResult? Function(ImageChanged value)? imageChanged,
    TResult? Function(ForceSnippetRefresh value)? forceSnippetRefresh,
  }) {
    return replaceSnippetFromJson?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SelectPanel value)? selectPanel,
    TResult Function(OverrideTargetGK value)? overrideTargetGK,
    TResult Function(ForceRefresh value)? forceRefresh,
    TResult Function(UpdateClipboard value)? updateClipboard,
    TResult Function(PublishSnippet value)? publishSnippet,
    TResult Function(RevertSnippet value)? revertSnippet,
    TResult Function(DeletePage value)? deletePage,
    TResult Function(ToggleAutoPublishingOfSnippet value)?
    toggleAutoPublishingOfSnippet,
    TResult Function(AutoPublishDefault value)? autoPublishDefault,
    TResult Function(HideIframes value)? hideIframes,
    TResult Function(SetPanelSnippet value)? setPanelOrPlaceholderSnippet,
    TResult Function(EnterSelectWidgetMode value)? enterSelectWidgetMode,
    TResult Function(ExitSelectWidgetMode value)? exitSelectWidgetMode,
    TResult Function(PushSnippetEditor value)? pushSnippetEditor,
    TResult Function(PopSnippetEditor value)? popSnippetEditor,
    TResult Function(ShowDirectoryTree value)? showDirectoryTree,
    TResult Function(RemoveDirectoryTree value)? removeDirectoryTree,
    TResult Function(SelectNode value)? selectNode,
    TResult Function(ClearNodeSelection value)? clearNodeSelection,
    TResult Function(SaveNodeAsSnippet value)? saveNodeAsSnippet,
    TResult Function(ReplaceSelectionWith value)? replaceSelectionWith,
    TResult Function(WrapSelectionWith value)? wrapSelectionWith,
    TResult Function(AppendChild value)? appendChild,
    TResult Function(AddSiblingBefore value)? addSiblingBefore,
    TResult Function(AddSiblingAfter value)? addSiblingAfter,
    TResult Function(PasteReplacement value)? pasteReplacement,
    TResult Function(PasteChild value)? pasteChild,
    TResult Function(PasteSiblingBefore value)? pasteSiblingBefore,
    TResult Function(PasteSiblingAfter value)? pasteSiblingAfter,
    TResult Function(DeleteNodeTapped value)? deleteNodeTapped,
    TResult Function(CompleteDeletion value)? completeDeletion,
    TResult Function(CopySnippetJsonToClipboard value)?
    copySnippetJsonToClipboard,
    TResult Function(ReplaceSnippetFromJson value)? replaceSnippetFromJson,
    TResult Function(CopyNode value)? copyNode,
    TResult Function(CutNode value)? cutNode,
    TResult Function(SelectedDirectoryOrNode value)? selectedDirectoryOrNode,
    TResult Function(ImageChanged value)? imageChanged,
    TResult Function(ForceSnippetRefresh value)? forceSnippetRefresh,
    required TResult orElse(),
  }) {
    if (replaceSnippetFromJson != null) {
      return replaceSnippetFromJson(this);
    }
    return orElse();
  }
}

abstract class ReplaceSnippetFromJson implements CAPIEvent {
  const factory ReplaceSnippetFromJson({final String? snippetJson}) =
      _$ReplaceSnippetFromJsonImpl;

  String? get snippetJson;

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReplaceSnippetFromJsonImplCopyWith<_$ReplaceSnippetFromJsonImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CopyNodeImplCopyWith<$Res> {
  factory _$$CopyNodeImplCopyWith(
    _$CopyNodeImpl value,
    $Res Function(_$CopyNodeImpl) then,
  ) = __$$CopyNodeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SNode node, String? scName, dynamic skipSave});
}

/// @nodoc
class __$$CopyNodeImplCopyWithImpl<$Res>
    extends _$CAPIEventCopyWithImpl<$Res, _$CopyNodeImpl>
    implements _$$CopyNodeImplCopyWith<$Res> {
  __$$CopyNodeImplCopyWithImpl(
    _$CopyNodeImpl _value,
    $Res Function(_$CopyNodeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? node = null,
    Object? scName = freezed,
    Object? skipSave = freezed,
  }) {
    return _then(
      _$CopyNodeImpl(
        node:
            null == node
                ? _value.node
                : node // ignore: cast_nullable_to_non_nullable
                    as SNode,
        scName:
            freezed == scName
                ? _value.scName
                : scName // ignore: cast_nullable_to_non_nullable
                    as String?,
        skipSave: freezed == skipSave ? _value.skipSave! : skipSave,
      ),
    );
  }
}

/// @nodoc

class _$CopyNodeImpl with DiagnosticableTreeMixin implements CopyNode {
  const _$CopyNodeImpl({
    required this.node,
    required this.scName,
    this.skipSave = false,
  });

  @override
  final SNode node;
  @override
  final String? scName;
  @override
  @JsonKey()
  final dynamic skipSave;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CAPIEvent.copyNode(node: $node, scName: $scName, skipSave: $skipSave)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CAPIEvent.copyNode'))
      ..add(DiagnosticsProperty('node', node))
      ..add(DiagnosticsProperty('scName', scName))
      ..add(DiagnosticsProperty('skipSave', skipSave));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CopyNodeImpl &&
            (identical(other.node, node) || other.node == node) &&
            (identical(other.scName, scName) || other.scName == scName) &&
            const DeepCollectionEquality().equals(other.skipSave, skipSave));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    node,
    scName,
    const DeepCollectionEquality().hash(skipSave),
  );

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CopyNodeImplCopyWith<_$CopyNodeImpl> get copyWith =>
      __$$CopyNodeImplCopyWithImpl<_$CopyNodeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? panelName) selectPanel,
    required TResult Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )
    overrideTargetGK,
    required TResult Function(bool onlyTargetsWrappers) forceRefresh,
    required TResult Function(
      SNode? newContent,
      String? scName,
      dynamic skipSave,
    )
    updateClipboard,
    required TResult Function(String snippetName, String versionId)
    publishSnippet,
    required TResult Function(String snippetName, String versionId)
    revertSnippet,
    required TResult Function(String pathName) deletePage,
    required TResult Function(String snippetName) toggleAutoPublishingOfSnippet,
    required TResult Function(bool b) autoPublishDefault,
    required TResult Function(bool hide) hideIframes,
    required TResult Function(String snippetName, String panelName)
    setPanelOrPlaceholderSnippet,
    required TResult Function(String snippetName) enterSelectWidgetMode,
    required TResult Function() exitSelectWidgetMode,
    required TResult Function(SnippetRootNode rootNode, SNode? selectedNode)
    pushSnippetEditor,
    required TResult Function(bool save) popSnippetEditor,
    required TResult Function() showDirectoryTree,
    required TResult Function(bool save) removeDirectoryTree,
    required TResult Function(SNode node) selectNode,
    required TResult Function() clearNodeSelection,
    required TResult Function(SNode node, String newSnippetName)
    saveNodeAsSnippet,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    replaceSelectionWith,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    wrapSelectionWith,
    required TResult Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )
    appendChild,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    addSiblingBefore,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    addSiblingAfter,
    required TResult Function(Type? widgetSpanChildType) pasteReplacement,
    required TResult Function(
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )
    pasteChild,
    required TResult Function() pasteSiblingBefore,
    required TResult Function() pasteSiblingAfter,
    required TResult Function() deleteNodeTapped,
    required TResult Function() completeDeletion,
    required TResult Function(SnippetRootNode rootNode)
    copySnippetJsonToClipboard,
    required TResult Function(String? snippetJson) replaceSnippetFromJson,
    required TResult Function(SNode node, String? scName, dynamic skipSave)
    copyNode,
    required TResult Function(SNode node, String? scName, dynamic skipSave)
    cutNode,
    required TResult Function(String snippetName, SNode? selectedNode)
    selectedDirectoryOrNode,
    required TResult Function(Uint8List? newBytes) imageChanged,
    required TResult Function() forceSnippetRefresh,
  }) {
    return copyNode(node, scName, skipSave);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? panelName)? selectPanel,
    TResult? Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )?
    overrideTargetGK,
    TResult? Function(bool onlyTargetsWrappers)? forceRefresh,
    TResult? Function(SNode? newContent, String? scName, dynamic skipSave)?
    updateClipboard,
    TResult? Function(String snippetName, String versionId)? publishSnippet,
    TResult? Function(String snippetName, String versionId)? revertSnippet,
    TResult? Function(String pathName)? deletePage,
    TResult? Function(String snippetName)? toggleAutoPublishingOfSnippet,
    TResult? Function(bool b)? autoPublishDefault,
    TResult? Function(bool hide)? hideIframes,
    TResult? Function(String snippetName, String panelName)?
    setPanelOrPlaceholderSnippet,
    TResult? Function(String snippetName)? enterSelectWidgetMode,
    TResult? Function()? exitSelectWidgetMode,
    TResult? Function(SnippetRootNode rootNode, SNode? selectedNode)?
    pushSnippetEditor,
    TResult? Function(bool save)? popSnippetEditor,
    TResult? Function()? showDirectoryTree,
    TResult? Function(bool save)? removeDirectoryTree,
    TResult? Function(SNode node)? selectNode,
    TResult? Function()? clearNodeSelection,
    TResult? Function(SNode node, String newSnippetName)? saveNodeAsSnippet,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    replaceSelectionWith,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    wrapSelectionWith,
    TResult? Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    appendChild,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingBefore,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingAfter,
    TResult? Function(Type? widgetSpanChildType)? pasteReplacement,
    TResult? Function(
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    pasteChild,
    TResult? Function()? pasteSiblingBefore,
    TResult? Function()? pasteSiblingAfter,
    TResult? Function()? deleteNodeTapped,
    TResult? Function()? completeDeletion,
    TResult? Function(SnippetRootNode rootNode)? copySnippetJsonToClipboard,
    TResult? Function(String? snippetJson)? replaceSnippetFromJson,
    TResult? Function(SNode node, String? scName, dynamic skipSave)? copyNode,
    TResult? Function(SNode node, String? scName, dynamic skipSave)? cutNode,
    TResult? Function(String snippetName, SNode? selectedNode)?
    selectedDirectoryOrNode,
    TResult? Function(Uint8List? newBytes)? imageChanged,
    TResult? Function()? forceSnippetRefresh,
  }) {
    return copyNode?.call(node, scName, skipSave);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? panelName)? selectPanel,
    TResult Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )?
    overrideTargetGK,
    TResult Function(bool onlyTargetsWrappers)? forceRefresh,
    TResult Function(SNode? newContent, String? scName, dynamic skipSave)?
    updateClipboard,
    TResult Function(String snippetName, String versionId)? publishSnippet,
    TResult Function(String snippetName, String versionId)? revertSnippet,
    TResult Function(String pathName)? deletePage,
    TResult Function(String snippetName)? toggleAutoPublishingOfSnippet,
    TResult Function(bool b)? autoPublishDefault,
    TResult Function(bool hide)? hideIframes,
    TResult Function(String snippetName, String panelName)?
    setPanelOrPlaceholderSnippet,
    TResult Function(String snippetName)? enterSelectWidgetMode,
    TResult Function()? exitSelectWidgetMode,
    TResult Function(SnippetRootNode rootNode, SNode? selectedNode)?
    pushSnippetEditor,
    TResult Function(bool save)? popSnippetEditor,
    TResult Function()? showDirectoryTree,
    TResult Function(bool save)? removeDirectoryTree,
    TResult Function(SNode node)? selectNode,
    TResult Function()? clearNodeSelection,
    TResult Function(SNode node, String newSnippetName)? saveNodeAsSnippet,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    replaceSelectionWith,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    wrapSelectionWith,
    TResult Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    appendChild,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingBefore,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingAfter,
    TResult Function(Type? widgetSpanChildType)? pasteReplacement,
    TResult Function(Type? widgetSpanChildType, SNode? testWidgetSpanChildNode)?
    pasteChild,
    TResult Function()? pasteSiblingBefore,
    TResult Function()? pasteSiblingAfter,
    TResult Function()? deleteNodeTapped,
    TResult Function()? completeDeletion,
    TResult Function(SnippetRootNode rootNode)? copySnippetJsonToClipboard,
    TResult Function(String? snippetJson)? replaceSnippetFromJson,
    TResult Function(SNode node, String? scName, dynamic skipSave)? copyNode,
    TResult Function(SNode node, String? scName, dynamic skipSave)? cutNode,
    TResult Function(String snippetName, SNode? selectedNode)?
    selectedDirectoryOrNode,
    TResult Function(Uint8List? newBytes)? imageChanged,
    TResult Function()? forceSnippetRefresh,
    required TResult orElse(),
  }) {
    if (copyNode != null) {
      return copyNode(node, scName, skipSave);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SelectPanel value) selectPanel,
    required TResult Function(OverrideTargetGK value) overrideTargetGK,
    required TResult Function(ForceRefresh value) forceRefresh,
    required TResult Function(UpdateClipboard value) updateClipboard,
    required TResult Function(PublishSnippet value) publishSnippet,
    required TResult Function(RevertSnippet value) revertSnippet,
    required TResult Function(DeletePage value) deletePage,
    required TResult Function(ToggleAutoPublishingOfSnippet value)
    toggleAutoPublishingOfSnippet,
    required TResult Function(AutoPublishDefault value) autoPublishDefault,
    required TResult Function(HideIframes value) hideIframes,
    required TResult Function(SetPanelSnippet value)
    setPanelOrPlaceholderSnippet,
    required TResult Function(EnterSelectWidgetMode value)
    enterSelectWidgetMode,
    required TResult Function(ExitSelectWidgetMode value) exitSelectWidgetMode,
    required TResult Function(PushSnippetEditor value) pushSnippetEditor,
    required TResult Function(PopSnippetEditor value) popSnippetEditor,
    required TResult Function(ShowDirectoryTree value) showDirectoryTree,
    required TResult Function(RemoveDirectoryTree value) removeDirectoryTree,
    required TResult Function(SelectNode value) selectNode,
    required TResult Function(ClearNodeSelection value) clearNodeSelection,
    required TResult Function(SaveNodeAsSnippet value) saveNodeAsSnippet,
    required TResult Function(ReplaceSelectionWith value) replaceSelectionWith,
    required TResult Function(WrapSelectionWith value) wrapSelectionWith,
    required TResult Function(AppendChild value) appendChild,
    required TResult Function(AddSiblingBefore value) addSiblingBefore,
    required TResult Function(AddSiblingAfter value) addSiblingAfter,
    required TResult Function(PasteReplacement value) pasteReplacement,
    required TResult Function(PasteChild value) pasteChild,
    required TResult Function(PasteSiblingBefore value) pasteSiblingBefore,
    required TResult Function(PasteSiblingAfter value) pasteSiblingAfter,
    required TResult Function(DeleteNodeTapped value) deleteNodeTapped,
    required TResult Function(CompleteDeletion value) completeDeletion,
    required TResult Function(CopySnippetJsonToClipboard value)
    copySnippetJsonToClipboard,
    required TResult Function(ReplaceSnippetFromJson value)
    replaceSnippetFromJson,
    required TResult Function(CopyNode value) copyNode,
    required TResult Function(CutNode value) cutNode,
    required TResult Function(SelectedDirectoryOrNode value)
    selectedDirectoryOrNode,
    required TResult Function(ImageChanged value) imageChanged,
    required TResult Function(ForceSnippetRefresh value) forceSnippetRefresh,
  }) {
    return copyNode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SelectPanel value)? selectPanel,
    TResult? Function(OverrideTargetGK value)? overrideTargetGK,
    TResult? Function(ForceRefresh value)? forceRefresh,
    TResult? Function(UpdateClipboard value)? updateClipboard,
    TResult? Function(PublishSnippet value)? publishSnippet,
    TResult? Function(RevertSnippet value)? revertSnippet,
    TResult? Function(DeletePage value)? deletePage,
    TResult? Function(ToggleAutoPublishingOfSnippet value)?
    toggleAutoPublishingOfSnippet,
    TResult? Function(AutoPublishDefault value)? autoPublishDefault,
    TResult? Function(HideIframes value)? hideIframes,
    TResult? Function(SetPanelSnippet value)? setPanelOrPlaceholderSnippet,
    TResult? Function(EnterSelectWidgetMode value)? enterSelectWidgetMode,
    TResult? Function(ExitSelectWidgetMode value)? exitSelectWidgetMode,
    TResult? Function(PushSnippetEditor value)? pushSnippetEditor,
    TResult? Function(PopSnippetEditor value)? popSnippetEditor,
    TResult? Function(ShowDirectoryTree value)? showDirectoryTree,
    TResult? Function(RemoveDirectoryTree value)? removeDirectoryTree,
    TResult? Function(SelectNode value)? selectNode,
    TResult? Function(ClearNodeSelection value)? clearNodeSelection,
    TResult? Function(SaveNodeAsSnippet value)? saveNodeAsSnippet,
    TResult? Function(ReplaceSelectionWith value)? replaceSelectionWith,
    TResult? Function(WrapSelectionWith value)? wrapSelectionWith,
    TResult? Function(AppendChild value)? appendChild,
    TResult? Function(AddSiblingBefore value)? addSiblingBefore,
    TResult? Function(AddSiblingAfter value)? addSiblingAfter,
    TResult? Function(PasteReplacement value)? pasteReplacement,
    TResult? Function(PasteChild value)? pasteChild,
    TResult? Function(PasteSiblingBefore value)? pasteSiblingBefore,
    TResult? Function(PasteSiblingAfter value)? pasteSiblingAfter,
    TResult? Function(DeleteNodeTapped value)? deleteNodeTapped,
    TResult? Function(CompleteDeletion value)? completeDeletion,
    TResult? Function(CopySnippetJsonToClipboard value)?
    copySnippetJsonToClipboard,
    TResult? Function(ReplaceSnippetFromJson value)? replaceSnippetFromJson,
    TResult? Function(CopyNode value)? copyNode,
    TResult? Function(CutNode value)? cutNode,
    TResult? Function(SelectedDirectoryOrNode value)? selectedDirectoryOrNode,
    TResult? Function(ImageChanged value)? imageChanged,
    TResult? Function(ForceSnippetRefresh value)? forceSnippetRefresh,
  }) {
    return copyNode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SelectPanel value)? selectPanel,
    TResult Function(OverrideTargetGK value)? overrideTargetGK,
    TResult Function(ForceRefresh value)? forceRefresh,
    TResult Function(UpdateClipboard value)? updateClipboard,
    TResult Function(PublishSnippet value)? publishSnippet,
    TResult Function(RevertSnippet value)? revertSnippet,
    TResult Function(DeletePage value)? deletePage,
    TResult Function(ToggleAutoPublishingOfSnippet value)?
    toggleAutoPublishingOfSnippet,
    TResult Function(AutoPublishDefault value)? autoPublishDefault,
    TResult Function(HideIframes value)? hideIframes,
    TResult Function(SetPanelSnippet value)? setPanelOrPlaceholderSnippet,
    TResult Function(EnterSelectWidgetMode value)? enterSelectWidgetMode,
    TResult Function(ExitSelectWidgetMode value)? exitSelectWidgetMode,
    TResult Function(PushSnippetEditor value)? pushSnippetEditor,
    TResult Function(PopSnippetEditor value)? popSnippetEditor,
    TResult Function(ShowDirectoryTree value)? showDirectoryTree,
    TResult Function(RemoveDirectoryTree value)? removeDirectoryTree,
    TResult Function(SelectNode value)? selectNode,
    TResult Function(ClearNodeSelection value)? clearNodeSelection,
    TResult Function(SaveNodeAsSnippet value)? saveNodeAsSnippet,
    TResult Function(ReplaceSelectionWith value)? replaceSelectionWith,
    TResult Function(WrapSelectionWith value)? wrapSelectionWith,
    TResult Function(AppendChild value)? appendChild,
    TResult Function(AddSiblingBefore value)? addSiblingBefore,
    TResult Function(AddSiblingAfter value)? addSiblingAfter,
    TResult Function(PasteReplacement value)? pasteReplacement,
    TResult Function(PasteChild value)? pasteChild,
    TResult Function(PasteSiblingBefore value)? pasteSiblingBefore,
    TResult Function(PasteSiblingAfter value)? pasteSiblingAfter,
    TResult Function(DeleteNodeTapped value)? deleteNodeTapped,
    TResult Function(CompleteDeletion value)? completeDeletion,
    TResult Function(CopySnippetJsonToClipboard value)?
    copySnippetJsonToClipboard,
    TResult Function(ReplaceSnippetFromJson value)? replaceSnippetFromJson,
    TResult Function(CopyNode value)? copyNode,
    TResult Function(CutNode value)? cutNode,
    TResult Function(SelectedDirectoryOrNode value)? selectedDirectoryOrNode,
    TResult Function(ImageChanged value)? imageChanged,
    TResult Function(ForceSnippetRefresh value)? forceSnippetRefresh,
    required TResult orElse(),
  }) {
    if (copyNode != null) {
      return copyNode(this);
    }
    return orElse();
  }
}

abstract class CopyNode implements CAPIEvent {
  const factory CopyNode({
    required final SNode node,
    required final String? scName,
    final dynamic skipSave,
  }) = _$CopyNodeImpl;

  SNode get node;
  String? get scName;
  dynamic get skipSave;

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CopyNodeImplCopyWith<_$CopyNodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CutNodeImplCopyWith<$Res> {
  factory _$$CutNodeImplCopyWith(
    _$CutNodeImpl value,
    $Res Function(_$CutNodeImpl) then,
  ) = __$$CutNodeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SNode node, String? scName, dynamic skipSave});
}

/// @nodoc
class __$$CutNodeImplCopyWithImpl<$Res>
    extends _$CAPIEventCopyWithImpl<$Res, _$CutNodeImpl>
    implements _$$CutNodeImplCopyWith<$Res> {
  __$$CutNodeImplCopyWithImpl(
    _$CutNodeImpl _value,
    $Res Function(_$CutNodeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? node = null,
    Object? scName = freezed,
    Object? skipSave = freezed,
  }) {
    return _then(
      _$CutNodeImpl(
        node:
            null == node
                ? _value.node
                : node // ignore: cast_nullable_to_non_nullable
                    as SNode,
        scName:
            freezed == scName
                ? _value.scName
                : scName // ignore: cast_nullable_to_non_nullable
                    as String?,
        skipSave: freezed == skipSave ? _value.skipSave! : skipSave,
      ),
    );
  }
}

/// @nodoc

class _$CutNodeImpl with DiagnosticableTreeMixin implements CutNode {
  const _$CutNodeImpl({
    required this.node,
    required this.scName,
    this.skipSave = false,
  });

  @override
  final SNode node;
  @override
  final String? scName;
  @override
  @JsonKey()
  final dynamic skipSave;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CAPIEvent.cutNode(node: $node, scName: $scName, skipSave: $skipSave)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CAPIEvent.cutNode'))
      ..add(DiagnosticsProperty('node', node))
      ..add(DiagnosticsProperty('scName', scName))
      ..add(DiagnosticsProperty('skipSave', skipSave));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CutNodeImpl &&
            (identical(other.node, node) || other.node == node) &&
            (identical(other.scName, scName) || other.scName == scName) &&
            const DeepCollectionEquality().equals(other.skipSave, skipSave));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    node,
    scName,
    const DeepCollectionEquality().hash(skipSave),
  );

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CutNodeImplCopyWith<_$CutNodeImpl> get copyWith =>
      __$$CutNodeImplCopyWithImpl<_$CutNodeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? panelName) selectPanel,
    required TResult Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )
    overrideTargetGK,
    required TResult Function(bool onlyTargetsWrappers) forceRefresh,
    required TResult Function(
      SNode? newContent,
      String? scName,
      dynamic skipSave,
    )
    updateClipboard,
    required TResult Function(String snippetName, String versionId)
    publishSnippet,
    required TResult Function(String snippetName, String versionId)
    revertSnippet,
    required TResult Function(String pathName) deletePage,
    required TResult Function(String snippetName) toggleAutoPublishingOfSnippet,
    required TResult Function(bool b) autoPublishDefault,
    required TResult Function(bool hide) hideIframes,
    required TResult Function(String snippetName, String panelName)
    setPanelOrPlaceholderSnippet,
    required TResult Function(String snippetName) enterSelectWidgetMode,
    required TResult Function() exitSelectWidgetMode,
    required TResult Function(SnippetRootNode rootNode, SNode? selectedNode)
    pushSnippetEditor,
    required TResult Function(bool save) popSnippetEditor,
    required TResult Function() showDirectoryTree,
    required TResult Function(bool save) removeDirectoryTree,
    required TResult Function(SNode node) selectNode,
    required TResult Function() clearNodeSelection,
    required TResult Function(SNode node, String newSnippetName)
    saveNodeAsSnippet,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    replaceSelectionWith,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    wrapSelectionWith,
    required TResult Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )
    appendChild,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    addSiblingBefore,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    addSiblingAfter,
    required TResult Function(Type? widgetSpanChildType) pasteReplacement,
    required TResult Function(
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )
    pasteChild,
    required TResult Function() pasteSiblingBefore,
    required TResult Function() pasteSiblingAfter,
    required TResult Function() deleteNodeTapped,
    required TResult Function() completeDeletion,
    required TResult Function(SnippetRootNode rootNode)
    copySnippetJsonToClipboard,
    required TResult Function(String? snippetJson) replaceSnippetFromJson,
    required TResult Function(SNode node, String? scName, dynamic skipSave)
    copyNode,
    required TResult Function(SNode node, String? scName, dynamic skipSave)
    cutNode,
    required TResult Function(String snippetName, SNode? selectedNode)
    selectedDirectoryOrNode,
    required TResult Function(Uint8List? newBytes) imageChanged,
    required TResult Function() forceSnippetRefresh,
  }) {
    return cutNode(node, scName, skipSave);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? panelName)? selectPanel,
    TResult? Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )?
    overrideTargetGK,
    TResult? Function(bool onlyTargetsWrappers)? forceRefresh,
    TResult? Function(SNode? newContent, String? scName, dynamic skipSave)?
    updateClipboard,
    TResult? Function(String snippetName, String versionId)? publishSnippet,
    TResult? Function(String snippetName, String versionId)? revertSnippet,
    TResult? Function(String pathName)? deletePage,
    TResult? Function(String snippetName)? toggleAutoPublishingOfSnippet,
    TResult? Function(bool b)? autoPublishDefault,
    TResult? Function(bool hide)? hideIframes,
    TResult? Function(String snippetName, String panelName)?
    setPanelOrPlaceholderSnippet,
    TResult? Function(String snippetName)? enterSelectWidgetMode,
    TResult? Function()? exitSelectWidgetMode,
    TResult? Function(SnippetRootNode rootNode, SNode? selectedNode)?
    pushSnippetEditor,
    TResult? Function(bool save)? popSnippetEditor,
    TResult? Function()? showDirectoryTree,
    TResult? Function(bool save)? removeDirectoryTree,
    TResult? Function(SNode node)? selectNode,
    TResult? Function()? clearNodeSelection,
    TResult? Function(SNode node, String newSnippetName)? saveNodeAsSnippet,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    replaceSelectionWith,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    wrapSelectionWith,
    TResult? Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    appendChild,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingBefore,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingAfter,
    TResult? Function(Type? widgetSpanChildType)? pasteReplacement,
    TResult? Function(
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    pasteChild,
    TResult? Function()? pasteSiblingBefore,
    TResult? Function()? pasteSiblingAfter,
    TResult? Function()? deleteNodeTapped,
    TResult? Function()? completeDeletion,
    TResult? Function(SnippetRootNode rootNode)? copySnippetJsonToClipboard,
    TResult? Function(String? snippetJson)? replaceSnippetFromJson,
    TResult? Function(SNode node, String? scName, dynamic skipSave)? copyNode,
    TResult? Function(SNode node, String? scName, dynamic skipSave)? cutNode,
    TResult? Function(String snippetName, SNode? selectedNode)?
    selectedDirectoryOrNode,
    TResult? Function(Uint8List? newBytes)? imageChanged,
    TResult? Function()? forceSnippetRefresh,
  }) {
    return cutNode?.call(node, scName, skipSave);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? panelName)? selectPanel,
    TResult Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )?
    overrideTargetGK,
    TResult Function(bool onlyTargetsWrappers)? forceRefresh,
    TResult Function(SNode? newContent, String? scName, dynamic skipSave)?
    updateClipboard,
    TResult Function(String snippetName, String versionId)? publishSnippet,
    TResult Function(String snippetName, String versionId)? revertSnippet,
    TResult Function(String pathName)? deletePage,
    TResult Function(String snippetName)? toggleAutoPublishingOfSnippet,
    TResult Function(bool b)? autoPublishDefault,
    TResult Function(bool hide)? hideIframes,
    TResult Function(String snippetName, String panelName)?
    setPanelOrPlaceholderSnippet,
    TResult Function(String snippetName)? enterSelectWidgetMode,
    TResult Function()? exitSelectWidgetMode,
    TResult Function(SnippetRootNode rootNode, SNode? selectedNode)?
    pushSnippetEditor,
    TResult Function(bool save)? popSnippetEditor,
    TResult Function()? showDirectoryTree,
    TResult Function(bool save)? removeDirectoryTree,
    TResult Function(SNode node)? selectNode,
    TResult Function()? clearNodeSelection,
    TResult Function(SNode node, String newSnippetName)? saveNodeAsSnippet,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    replaceSelectionWith,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    wrapSelectionWith,
    TResult Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    appendChild,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingBefore,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingAfter,
    TResult Function(Type? widgetSpanChildType)? pasteReplacement,
    TResult Function(Type? widgetSpanChildType, SNode? testWidgetSpanChildNode)?
    pasteChild,
    TResult Function()? pasteSiblingBefore,
    TResult Function()? pasteSiblingAfter,
    TResult Function()? deleteNodeTapped,
    TResult Function()? completeDeletion,
    TResult Function(SnippetRootNode rootNode)? copySnippetJsonToClipboard,
    TResult Function(String? snippetJson)? replaceSnippetFromJson,
    TResult Function(SNode node, String? scName, dynamic skipSave)? copyNode,
    TResult Function(SNode node, String? scName, dynamic skipSave)? cutNode,
    TResult Function(String snippetName, SNode? selectedNode)?
    selectedDirectoryOrNode,
    TResult Function(Uint8List? newBytes)? imageChanged,
    TResult Function()? forceSnippetRefresh,
    required TResult orElse(),
  }) {
    if (cutNode != null) {
      return cutNode(node, scName, skipSave);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SelectPanel value) selectPanel,
    required TResult Function(OverrideTargetGK value) overrideTargetGK,
    required TResult Function(ForceRefresh value) forceRefresh,
    required TResult Function(UpdateClipboard value) updateClipboard,
    required TResult Function(PublishSnippet value) publishSnippet,
    required TResult Function(RevertSnippet value) revertSnippet,
    required TResult Function(DeletePage value) deletePage,
    required TResult Function(ToggleAutoPublishingOfSnippet value)
    toggleAutoPublishingOfSnippet,
    required TResult Function(AutoPublishDefault value) autoPublishDefault,
    required TResult Function(HideIframes value) hideIframes,
    required TResult Function(SetPanelSnippet value)
    setPanelOrPlaceholderSnippet,
    required TResult Function(EnterSelectWidgetMode value)
    enterSelectWidgetMode,
    required TResult Function(ExitSelectWidgetMode value) exitSelectWidgetMode,
    required TResult Function(PushSnippetEditor value) pushSnippetEditor,
    required TResult Function(PopSnippetEditor value) popSnippetEditor,
    required TResult Function(ShowDirectoryTree value) showDirectoryTree,
    required TResult Function(RemoveDirectoryTree value) removeDirectoryTree,
    required TResult Function(SelectNode value) selectNode,
    required TResult Function(ClearNodeSelection value) clearNodeSelection,
    required TResult Function(SaveNodeAsSnippet value) saveNodeAsSnippet,
    required TResult Function(ReplaceSelectionWith value) replaceSelectionWith,
    required TResult Function(WrapSelectionWith value) wrapSelectionWith,
    required TResult Function(AppendChild value) appendChild,
    required TResult Function(AddSiblingBefore value) addSiblingBefore,
    required TResult Function(AddSiblingAfter value) addSiblingAfter,
    required TResult Function(PasteReplacement value) pasteReplacement,
    required TResult Function(PasteChild value) pasteChild,
    required TResult Function(PasteSiblingBefore value) pasteSiblingBefore,
    required TResult Function(PasteSiblingAfter value) pasteSiblingAfter,
    required TResult Function(DeleteNodeTapped value) deleteNodeTapped,
    required TResult Function(CompleteDeletion value) completeDeletion,
    required TResult Function(CopySnippetJsonToClipboard value)
    copySnippetJsonToClipboard,
    required TResult Function(ReplaceSnippetFromJson value)
    replaceSnippetFromJson,
    required TResult Function(CopyNode value) copyNode,
    required TResult Function(CutNode value) cutNode,
    required TResult Function(SelectedDirectoryOrNode value)
    selectedDirectoryOrNode,
    required TResult Function(ImageChanged value) imageChanged,
    required TResult Function(ForceSnippetRefresh value) forceSnippetRefresh,
  }) {
    return cutNode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SelectPanel value)? selectPanel,
    TResult? Function(OverrideTargetGK value)? overrideTargetGK,
    TResult? Function(ForceRefresh value)? forceRefresh,
    TResult? Function(UpdateClipboard value)? updateClipboard,
    TResult? Function(PublishSnippet value)? publishSnippet,
    TResult? Function(RevertSnippet value)? revertSnippet,
    TResult? Function(DeletePage value)? deletePage,
    TResult? Function(ToggleAutoPublishingOfSnippet value)?
    toggleAutoPublishingOfSnippet,
    TResult? Function(AutoPublishDefault value)? autoPublishDefault,
    TResult? Function(HideIframes value)? hideIframes,
    TResult? Function(SetPanelSnippet value)? setPanelOrPlaceholderSnippet,
    TResult? Function(EnterSelectWidgetMode value)? enterSelectWidgetMode,
    TResult? Function(ExitSelectWidgetMode value)? exitSelectWidgetMode,
    TResult? Function(PushSnippetEditor value)? pushSnippetEditor,
    TResult? Function(PopSnippetEditor value)? popSnippetEditor,
    TResult? Function(ShowDirectoryTree value)? showDirectoryTree,
    TResult? Function(RemoveDirectoryTree value)? removeDirectoryTree,
    TResult? Function(SelectNode value)? selectNode,
    TResult? Function(ClearNodeSelection value)? clearNodeSelection,
    TResult? Function(SaveNodeAsSnippet value)? saveNodeAsSnippet,
    TResult? Function(ReplaceSelectionWith value)? replaceSelectionWith,
    TResult? Function(WrapSelectionWith value)? wrapSelectionWith,
    TResult? Function(AppendChild value)? appendChild,
    TResult? Function(AddSiblingBefore value)? addSiblingBefore,
    TResult? Function(AddSiblingAfter value)? addSiblingAfter,
    TResult? Function(PasteReplacement value)? pasteReplacement,
    TResult? Function(PasteChild value)? pasteChild,
    TResult? Function(PasteSiblingBefore value)? pasteSiblingBefore,
    TResult? Function(PasteSiblingAfter value)? pasteSiblingAfter,
    TResult? Function(DeleteNodeTapped value)? deleteNodeTapped,
    TResult? Function(CompleteDeletion value)? completeDeletion,
    TResult? Function(CopySnippetJsonToClipboard value)?
    copySnippetJsonToClipboard,
    TResult? Function(ReplaceSnippetFromJson value)? replaceSnippetFromJson,
    TResult? Function(CopyNode value)? copyNode,
    TResult? Function(CutNode value)? cutNode,
    TResult? Function(SelectedDirectoryOrNode value)? selectedDirectoryOrNode,
    TResult? Function(ImageChanged value)? imageChanged,
    TResult? Function(ForceSnippetRefresh value)? forceSnippetRefresh,
  }) {
    return cutNode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SelectPanel value)? selectPanel,
    TResult Function(OverrideTargetGK value)? overrideTargetGK,
    TResult Function(ForceRefresh value)? forceRefresh,
    TResult Function(UpdateClipboard value)? updateClipboard,
    TResult Function(PublishSnippet value)? publishSnippet,
    TResult Function(RevertSnippet value)? revertSnippet,
    TResult Function(DeletePage value)? deletePage,
    TResult Function(ToggleAutoPublishingOfSnippet value)?
    toggleAutoPublishingOfSnippet,
    TResult Function(AutoPublishDefault value)? autoPublishDefault,
    TResult Function(HideIframes value)? hideIframes,
    TResult Function(SetPanelSnippet value)? setPanelOrPlaceholderSnippet,
    TResult Function(EnterSelectWidgetMode value)? enterSelectWidgetMode,
    TResult Function(ExitSelectWidgetMode value)? exitSelectWidgetMode,
    TResult Function(PushSnippetEditor value)? pushSnippetEditor,
    TResult Function(PopSnippetEditor value)? popSnippetEditor,
    TResult Function(ShowDirectoryTree value)? showDirectoryTree,
    TResult Function(RemoveDirectoryTree value)? removeDirectoryTree,
    TResult Function(SelectNode value)? selectNode,
    TResult Function(ClearNodeSelection value)? clearNodeSelection,
    TResult Function(SaveNodeAsSnippet value)? saveNodeAsSnippet,
    TResult Function(ReplaceSelectionWith value)? replaceSelectionWith,
    TResult Function(WrapSelectionWith value)? wrapSelectionWith,
    TResult Function(AppendChild value)? appendChild,
    TResult Function(AddSiblingBefore value)? addSiblingBefore,
    TResult Function(AddSiblingAfter value)? addSiblingAfter,
    TResult Function(PasteReplacement value)? pasteReplacement,
    TResult Function(PasteChild value)? pasteChild,
    TResult Function(PasteSiblingBefore value)? pasteSiblingBefore,
    TResult Function(PasteSiblingAfter value)? pasteSiblingAfter,
    TResult Function(DeleteNodeTapped value)? deleteNodeTapped,
    TResult Function(CompleteDeletion value)? completeDeletion,
    TResult Function(CopySnippetJsonToClipboard value)?
    copySnippetJsonToClipboard,
    TResult Function(ReplaceSnippetFromJson value)? replaceSnippetFromJson,
    TResult Function(CopyNode value)? copyNode,
    TResult Function(CutNode value)? cutNode,
    TResult Function(SelectedDirectoryOrNode value)? selectedDirectoryOrNode,
    TResult Function(ImageChanged value)? imageChanged,
    TResult Function(ForceSnippetRefresh value)? forceSnippetRefresh,
    required TResult orElse(),
  }) {
    if (cutNode != null) {
      return cutNode(this);
    }
    return orElse();
  }
}

abstract class CutNode implements CAPIEvent {
  const factory CutNode({
    required final SNode node,
    required final String? scName,
    final dynamic skipSave,
  }) = _$CutNodeImpl;

  SNode get node;
  String? get scName;
  dynamic get skipSave;

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CutNodeImplCopyWith<_$CutNodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectedDirectoryOrNodeImplCopyWith<$Res> {
  factory _$$SelectedDirectoryOrNodeImplCopyWith(
    _$SelectedDirectoryOrNodeImpl value,
    $Res Function(_$SelectedDirectoryOrNodeImpl) then,
  ) = __$$SelectedDirectoryOrNodeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String snippetName, SNode? selectedNode});
}

/// @nodoc
class __$$SelectedDirectoryOrNodeImplCopyWithImpl<$Res>
    extends _$CAPIEventCopyWithImpl<$Res, _$SelectedDirectoryOrNodeImpl>
    implements _$$SelectedDirectoryOrNodeImplCopyWith<$Res> {
  __$$SelectedDirectoryOrNodeImplCopyWithImpl(
    _$SelectedDirectoryOrNodeImpl _value,
    $Res Function(_$SelectedDirectoryOrNodeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? snippetName = null, Object? selectedNode = freezed}) {
    return _then(
      _$SelectedDirectoryOrNodeImpl(
        snippetName:
            null == snippetName
                ? _value.snippetName
                : snippetName // ignore: cast_nullable_to_non_nullable
                    as String,
        selectedNode:
            freezed == selectedNode
                ? _value.selectedNode
                : selectedNode // ignore: cast_nullable_to_non_nullable
                    as SNode?,
      ),
    );
  }
}

/// @nodoc

class _$SelectedDirectoryOrNodeImpl
    with DiagnosticableTreeMixin
    implements SelectedDirectoryOrNode {
  const _$SelectedDirectoryOrNodeImpl({
    required this.snippetName,
    required this.selectedNode,
  });

  @override
  final String snippetName;
  @override
  final SNode? selectedNode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CAPIEvent.selectedDirectoryOrNode(snippetName: $snippetName, selectedNode: $selectedNode)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CAPIEvent.selectedDirectoryOrNode'))
      ..add(DiagnosticsProperty('snippetName', snippetName))
      ..add(DiagnosticsProperty('selectedNode', selectedNode));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectedDirectoryOrNodeImpl &&
            (identical(other.snippetName, snippetName) ||
                other.snippetName == snippetName) &&
            (identical(other.selectedNode, selectedNode) ||
                other.selectedNode == selectedNode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, snippetName, selectedNode);

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectedDirectoryOrNodeImplCopyWith<_$SelectedDirectoryOrNodeImpl>
  get copyWith => __$$SelectedDirectoryOrNodeImplCopyWithImpl<
    _$SelectedDirectoryOrNodeImpl
  >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? panelName) selectPanel,
    required TResult Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )
    overrideTargetGK,
    required TResult Function(bool onlyTargetsWrappers) forceRefresh,
    required TResult Function(
      SNode? newContent,
      String? scName,
      dynamic skipSave,
    )
    updateClipboard,
    required TResult Function(String snippetName, String versionId)
    publishSnippet,
    required TResult Function(String snippetName, String versionId)
    revertSnippet,
    required TResult Function(String pathName) deletePage,
    required TResult Function(String snippetName) toggleAutoPublishingOfSnippet,
    required TResult Function(bool b) autoPublishDefault,
    required TResult Function(bool hide) hideIframes,
    required TResult Function(String snippetName, String panelName)
    setPanelOrPlaceholderSnippet,
    required TResult Function(String snippetName) enterSelectWidgetMode,
    required TResult Function() exitSelectWidgetMode,
    required TResult Function(SnippetRootNode rootNode, SNode? selectedNode)
    pushSnippetEditor,
    required TResult Function(bool save) popSnippetEditor,
    required TResult Function() showDirectoryTree,
    required TResult Function(bool save) removeDirectoryTree,
    required TResult Function(SNode node) selectNode,
    required TResult Function() clearNodeSelection,
    required TResult Function(SNode node, String newSnippetName)
    saveNodeAsSnippet,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    replaceSelectionWith,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    wrapSelectionWith,
    required TResult Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )
    appendChild,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    addSiblingBefore,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    addSiblingAfter,
    required TResult Function(Type? widgetSpanChildType) pasteReplacement,
    required TResult Function(
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )
    pasteChild,
    required TResult Function() pasteSiblingBefore,
    required TResult Function() pasteSiblingAfter,
    required TResult Function() deleteNodeTapped,
    required TResult Function() completeDeletion,
    required TResult Function(SnippetRootNode rootNode)
    copySnippetJsonToClipboard,
    required TResult Function(String? snippetJson) replaceSnippetFromJson,
    required TResult Function(SNode node, String? scName, dynamic skipSave)
    copyNode,
    required TResult Function(SNode node, String? scName, dynamic skipSave)
    cutNode,
    required TResult Function(String snippetName, SNode? selectedNode)
    selectedDirectoryOrNode,
    required TResult Function(Uint8List? newBytes) imageChanged,
    required TResult Function() forceSnippetRefresh,
  }) {
    return selectedDirectoryOrNode(snippetName, selectedNode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? panelName)? selectPanel,
    TResult? Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )?
    overrideTargetGK,
    TResult? Function(bool onlyTargetsWrappers)? forceRefresh,
    TResult? Function(SNode? newContent, String? scName, dynamic skipSave)?
    updateClipboard,
    TResult? Function(String snippetName, String versionId)? publishSnippet,
    TResult? Function(String snippetName, String versionId)? revertSnippet,
    TResult? Function(String pathName)? deletePage,
    TResult? Function(String snippetName)? toggleAutoPublishingOfSnippet,
    TResult? Function(bool b)? autoPublishDefault,
    TResult? Function(bool hide)? hideIframes,
    TResult? Function(String snippetName, String panelName)?
    setPanelOrPlaceholderSnippet,
    TResult? Function(String snippetName)? enterSelectWidgetMode,
    TResult? Function()? exitSelectWidgetMode,
    TResult? Function(SnippetRootNode rootNode, SNode? selectedNode)?
    pushSnippetEditor,
    TResult? Function(bool save)? popSnippetEditor,
    TResult? Function()? showDirectoryTree,
    TResult? Function(bool save)? removeDirectoryTree,
    TResult? Function(SNode node)? selectNode,
    TResult? Function()? clearNodeSelection,
    TResult? Function(SNode node, String newSnippetName)? saveNodeAsSnippet,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    replaceSelectionWith,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    wrapSelectionWith,
    TResult? Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    appendChild,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingBefore,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingAfter,
    TResult? Function(Type? widgetSpanChildType)? pasteReplacement,
    TResult? Function(
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    pasteChild,
    TResult? Function()? pasteSiblingBefore,
    TResult? Function()? pasteSiblingAfter,
    TResult? Function()? deleteNodeTapped,
    TResult? Function()? completeDeletion,
    TResult? Function(SnippetRootNode rootNode)? copySnippetJsonToClipboard,
    TResult? Function(String? snippetJson)? replaceSnippetFromJson,
    TResult? Function(SNode node, String? scName, dynamic skipSave)? copyNode,
    TResult? Function(SNode node, String? scName, dynamic skipSave)? cutNode,
    TResult? Function(String snippetName, SNode? selectedNode)?
    selectedDirectoryOrNode,
    TResult? Function(Uint8List? newBytes)? imageChanged,
    TResult? Function()? forceSnippetRefresh,
  }) {
    return selectedDirectoryOrNode?.call(snippetName, selectedNode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? panelName)? selectPanel,
    TResult Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )?
    overrideTargetGK,
    TResult Function(bool onlyTargetsWrappers)? forceRefresh,
    TResult Function(SNode? newContent, String? scName, dynamic skipSave)?
    updateClipboard,
    TResult Function(String snippetName, String versionId)? publishSnippet,
    TResult Function(String snippetName, String versionId)? revertSnippet,
    TResult Function(String pathName)? deletePage,
    TResult Function(String snippetName)? toggleAutoPublishingOfSnippet,
    TResult Function(bool b)? autoPublishDefault,
    TResult Function(bool hide)? hideIframes,
    TResult Function(String snippetName, String panelName)?
    setPanelOrPlaceholderSnippet,
    TResult Function(String snippetName)? enterSelectWidgetMode,
    TResult Function()? exitSelectWidgetMode,
    TResult Function(SnippetRootNode rootNode, SNode? selectedNode)?
    pushSnippetEditor,
    TResult Function(bool save)? popSnippetEditor,
    TResult Function()? showDirectoryTree,
    TResult Function(bool save)? removeDirectoryTree,
    TResult Function(SNode node)? selectNode,
    TResult Function()? clearNodeSelection,
    TResult Function(SNode node, String newSnippetName)? saveNodeAsSnippet,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    replaceSelectionWith,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    wrapSelectionWith,
    TResult Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    appendChild,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingBefore,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingAfter,
    TResult Function(Type? widgetSpanChildType)? pasteReplacement,
    TResult Function(Type? widgetSpanChildType, SNode? testWidgetSpanChildNode)?
    pasteChild,
    TResult Function()? pasteSiblingBefore,
    TResult Function()? pasteSiblingAfter,
    TResult Function()? deleteNodeTapped,
    TResult Function()? completeDeletion,
    TResult Function(SnippetRootNode rootNode)? copySnippetJsonToClipboard,
    TResult Function(String? snippetJson)? replaceSnippetFromJson,
    TResult Function(SNode node, String? scName, dynamic skipSave)? copyNode,
    TResult Function(SNode node, String? scName, dynamic skipSave)? cutNode,
    TResult Function(String snippetName, SNode? selectedNode)?
    selectedDirectoryOrNode,
    TResult Function(Uint8List? newBytes)? imageChanged,
    TResult Function()? forceSnippetRefresh,
    required TResult orElse(),
  }) {
    if (selectedDirectoryOrNode != null) {
      return selectedDirectoryOrNode(snippetName, selectedNode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SelectPanel value) selectPanel,
    required TResult Function(OverrideTargetGK value) overrideTargetGK,
    required TResult Function(ForceRefresh value) forceRefresh,
    required TResult Function(UpdateClipboard value) updateClipboard,
    required TResult Function(PublishSnippet value) publishSnippet,
    required TResult Function(RevertSnippet value) revertSnippet,
    required TResult Function(DeletePage value) deletePage,
    required TResult Function(ToggleAutoPublishingOfSnippet value)
    toggleAutoPublishingOfSnippet,
    required TResult Function(AutoPublishDefault value) autoPublishDefault,
    required TResult Function(HideIframes value) hideIframes,
    required TResult Function(SetPanelSnippet value)
    setPanelOrPlaceholderSnippet,
    required TResult Function(EnterSelectWidgetMode value)
    enterSelectWidgetMode,
    required TResult Function(ExitSelectWidgetMode value) exitSelectWidgetMode,
    required TResult Function(PushSnippetEditor value) pushSnippetEditor,
    required TResult Function(PopSnippetEditor value) popSnippetEditor,
    required TResult Function(ShowDirectoryTree value) showDirectoryTree,
    required TResult Function(RemoveDirectoryTree value) removeDirectoryTree,
    required TResult Function(SelectNode value) selectNode,
    required TResult Function(ClearNodeSelection value) clearNodeSelection,
    required TResult Function(SaveNodeAsSnippet value) saveNodeAsSnippet,
    required TResult Function(ReplaceSelectionWith value) replaceSelectionWith,
    required TResult Function(WrapSelectionWith value) wrapSelectionWith,
    required TResult Function(AppendChild value) appendChild,
    required TResult Function(AddSiblingBefore value) addSiblingBefore,
    required TResult Function(AddSiblingAfter value) addSiblingAfter,
    required TResult Function(PasteReplacement value) pasteReplacement,
    required TResult Function(PasteChild value) pasteChild,
    required TResult Function(PasteSiblingBefore value) pasteSiblingBefore,
    required TResult Function(PasteSiblingAfter value) pasteSiblingAfter,
    required TResult Function(DeleteNodeTapped value) deleteNodeTapped,
    required TResult Function(CompleteDeletion value) completeDeletion,
    required TResult Function(CopySnippetJsonToClipboard value)
    copySnippetJsonToClipboard,
    required TResult Function(ReplaceSnippetFromJson value)
    replaceSnippetFromJson,
    required TResult Function(CopyNode value) copyNode,
    required TResult Function(CutNode value) cutNode,
    required TResult Function(SelectedDirectoryOrNode value)
    selectedDirectoryOrNode,
    required TResult Function(ImageChanged value) imageChanged,
    required TResult Function(ForceSnippetRefresh value) forceSnippetRefresh,
  }) {
    return selectedDirectoryOrNode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SelectPanel value)? selectPanel,
    TResult? Function(OverrideTargetGK value)? overrideTargetGK,
    TResult? Function(ForceRefresh value)? forceRefresh,
    TResult? Function(UpdateClipboard value)? updateClipboard,
    TResult? Function(PublishSnippet value)? publishSnippet,
    TResult? Function(RevertSnippet value)? revertSnippet,
    TResult? Function(DeletePage value)? deletePage,
    TResult? Function(ToggleAutoPublishingOfSnippet value)?
    toggleAutoPublishingOfSnippet,
    TResult? Function(AutoPublishDefault value)? autoPublishDefault,
    TResult? Function(HideIframes value)? hideIframes,
    TResult? Function(SetPanelSnippet value)? setPanelOrPlaceholderSnippet,
    TResult? Function(EnterSelectWidgetMode value)? enterSelectWidgetMode,
    TResult? Function(ExitSelectWidgetMode value)? exitSelectWidgetMode,
    TResult? Function(PushSnippetEditor value)? pushSnippetEditor,
    TResult? Function(PopSnippetEditor value)? popSnippetEditor,
    TResult? Function(ShowDirectoryTree value)? showDirectoryTree,
    TResult? Function(RemoveDirectoryTree value)? removeDirectoryTree,
    TResult? Function(SelectNode value)? selectNode,
    TResult? Function(ClearNodeSelection value)? clearNodeSelection,
    TResult? Function(SaveNodeAsSnippet value)? saveNodeAsSnippet,
    TResult? Function(ReplaceSelectionWith value)? replaceSelectionWith,
    TResult? Function(WrapSelectionWith value)? wrapSelectionWith,
    TResult? Function(AppendChild value)? appendChild,
    TResult? Function(AddSiblingBefore value)? addSiblingBefore,
    TResult? Function(AddSiblingAfter value)? addSiblingAfter,
    TResult? Function(PasteReplacement value)? pasteReplacement,
    TResult? Function(PasteChild value)? pasteChild,
    TResult? Function(PasteSiblingBefore value)? pasteSiblingBefore,
    TResult? Function(PasteSiblingAfter value)? pasteSiblingAfter,
    TResult? Function(DeleteNodeTapped value)? deleteNodeTapped,
    TResult? Function(CompleteDeletion value)? completeDeletion,
    TResult? Function(CopySnippetJsonToClipboard value)?
    copySnippetJsonToClipboard,
    TResult? Function(ReplaceSnippetFromJson value)? replaceSnippetFromJson,
    TResult? Function(CopyNode value)? copyNode,
    TResult? Function(CutNode value)? cutNode,
    TResult? Function(SelectedDirectoryOrNode value)? selectedDirectoryOrNode,
    TResult? Function(ImageChanged value)? imageChanged,
    TResult? Function(ForceSnippetRefresh value)? forceSnippetRefresh,
  }) {
    return selectedDirectoryOrNode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SelectPanel value)? selectPanel,
    TResult Function(OverrideTargetGK value)? overrideTargetGK,
    TResult Function(ForceRefresh value)? forceRefresh,
    TResult Function(UpdateClipboard value)? updateClipboard,
    TResult Function(PublishSnippet value)? publishSnippet,
    TResult Function(RevertSnippet value)? revertSnippet,
    TResult Function(DeletePage value)? deletePage,
    TResult Function(ToggleAutoPublishingOfSnippet value)?
    toggleAutoPublishingOfSnippet,
    TResult Function(AutoPublishDefault value)? autoPublishDefault,
    TResult Function(HideIframes value)? hideIframes,
    TResult Function(SetPanelSnippet value)? setPanelOrPlaceholderSnippet,
    TResult Function(EnterSelectWidgetMode value)? enterSelectWidgetMode,
    TResult Function(ExitSelectWidgetMode value)? exitSelectWidgetMode,
    TResult Function(PushSnippetEditor value)? pushSnippetEditor,
    TResult Function(PopSnippetEditor value)? popSnippetEditor,
    TResult Function(ShowDirectoryTree value)? showDirectoryTree,
    TResult Function(RemoveDirectoryTree value)? removeDirectoryTree,
    TResult Function(SelectNode value)? selectNode,
    TResult Function(ClearNodeSelection value)? clearNodeSelection,
    TResult Function(SaveNodeAsSnippet value)? saveNodeAsSnippet,
    TResult Function(ReplaceSelectionWith value)? replaceSelectionWith,
    TResult Function(WrapSelectionWith value)? wrapSelectionWith,
    TResult Function(AppendChild value)? appendChild,
    TResult Function(AddSiblingBefore value)? addSiblingBefore,
    TResult Function(AddSiblingAfter value)? addSiblingAfter,
    TResult Function(PasteReplacement value)? pasteReplacement,
    TResult Function(PasteChild value)? pasteChild,
    TResult Function(PasteSiblingBefore value)? pasteSiblingBefore,
    TResult Function(PasteSiblingAfter value)? pasteSiblingAfter,
    TResult Function(DeleteNodeTapped value)? deleteNodeTapped,
    TResult Function(CompleteDeletion value)? completeDeletion,
    TResult Function(CopySnippetJsonToClipboard value)?
    copySnippetJsonToClipboard,
    TResult Function(ReplaceSnippetFromJson value)? replaceSnippetFromJson,
    TResult Function(CopyNode value)? copyNode,
    TResult Function(CutNode value)? cutNode,
    TResult Function(SelectedDirectoryOrNode value)? selectedDirectoryOrNode,
    TResult Function(ImageChanged value)? imageChanged,
    TResult Function(ForceSnippetRefresh value)? forceSnippetRefresh,
    required TResult orElse(),
  }) {
    if (selectedDirectoryOrNode != null) {
      return selectedDirectoryOrNode(this);
    }
    return orElse();
  }
}

abstract class SelectedDirectoryOrNode implements CAPIEvent {
  const factory SelectedDirectoryOrNode({
    required final String snippetName,
    required final SNode? selectedNode,
  }) = _$SelectedDirectoryOrNodeImpl;

  String get snippetName;
  SNode? get selectedNode;

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SelectedDirectoryOrNodeImplCopyWith<_$SelectedDirectoryOrNodeImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ImageChangedImplCopyWith<$Res> {
  factory _$$ImageChangedImplCopyWith(
    _$ImageChangedImpl value,
    $Res Function(_$ImageChangedImpl) then,
  ) = __$$ImageChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Uint8List? newBytes});
}

/// @nodoc
class __$$ImageChangedImplCopyWithImpl<$Res>
    extends _$CAPIEventCopyWithImpl<$Res, _$ImageChangedImpl>
    implements _$$ImageChangedImplCopyWith<$Res> {
  __$$ImageChangedImplCopyWithImpl(
    _$ImageChangedImpl _value,
    $Res Function(_$ImageChangedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? newBytes = freezed}) {
    return _then(
      _$ImageChangedImpl(
        newBytes:
            freezed == newBytes
                ? _value.newBytes
                : newBytes // ignore: cast_nullable_to_non_nullable
                    as Uint8List?,
      ),
    );
  }
}

/// @nodoc

class _$ImageChangedImpl with DiagnosticableTreeMixin implements ImageChanged {
  const _$ImageChangedImpl({this.newBytes});

  @override
  final Uint8List? newBytes;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CAPIEvent.imageChanged(newBytes: $newBytes)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CAPIEvent.imageChanged'))
      ..add(DiagnosticsProperty('newBytes', newBytes));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageChangedImpl &&
            const DeepCollectionEquality().equals(other.newBytes, newBytes));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(newBytes));

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageChangedImplCopyWith<_$ImageChangedImpl> get copyWith =>
      __$$ImageChangedImplCopyWithImpl<_$ImageChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? panelName) selectPanel,
    required TResult Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )
    overrideTargetGK,
    required TResult Function(bool onlyTargetsWrappers) forceRefresh,
    required TResult Function(
      SNode? newContent,
      String? scName,
      dynamic skipSave,
    )
    updateClipboard,
    required TResult Function(String snippetName, String versionId)
    publishSnippet,
    required TResult Function(String snippetName, String versionId)
    revertSnippet,
    required TResult Function(String pathName) deletePage,
    required TResult Function(String snippetName) toggleAutoPublishingOfSnippet,
    required TResult Function(bool b) autoPublishDefault,
    required TResult Function(bool hide) hideIframes,
    required TResult Function(String snippetName, String panelName)
    setPanelOrPlaceholderSnippet,
    required TResult Function(String snippetName) enterSelectWidgetMode,
    required TResult Function() exitSelectWidgetMode,
    required TResult Function(SnippetRootNode rootNode, SNode? selectedNode)
    pushSnippetEditor,
    required TResult Function(bool save) popSnippetEditor,
    required TResult Function() showDirectoryTree,
    required TResult Function(bool save) removeDirectoryTree,
    required TResult Function(SNode node) selectNode,
    required TResult Function() clearNodeSelection,
    required TResult Function(SNode node, String newSnippetName)
    saveNodeAsSnippet,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    replaceSelectionWith,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    wrapSelectionWith,
    required TResult Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )
    appendChild,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    addSiblingBefore,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    addSiblingAfter,
    required TResult Function(Type? widgetSpanChildType) pasteReplacement,
    required TResult Function(
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )
    pasteChild,
    required TResult Function() pasteSiblingBefore,
    required TResult Function() pasteSiblingAfter,
    required TResult Function() deleteNodeTapped,
    required TResult Function() completeDeletion,
    required TResult Function(SnippetRootNode rootNode)
    copySnippetJsonToClipboard,
    required TResult Function(String? snippetJson) replaceSnippetFromJson,
    required TResult Function(SNode node, String? scName, dynamic skipSave)
    copyNode,
    required TResult Function(SNode node, String? scName, dynamic skipSave)
    cutNode,
    required TResult Function(String snippetName, SNode? selectedNode)
    selectedDirectoryOrNode,
    required TResult Function(Uint8List? newBytes) imageChanged,
    required TResult Function() forceSnippetRefresh,
  }) {
    return imageChanged(newBytes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? panelName)? selectPanel,
    TResult? Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )?
    overrideTargetGK,
    TResult? Function(bool onlyTargetsWrappers)? forceRefresh,
    TResult? Function(SNode? newContent, String? scName, dynamic skipSave)?
    updateClipboard,
    TResult? Function(String snippetName, String versionId)? publishSnippet,
    TResult? Function(String snippetName, String versionId)? revertSnippet,
    TResult? Function(String pathName)? deletePage,
    TResult? Function(String snippetName)? toggleAutoPublishingOfSnippet,
    TResult? Function(bool b)? autoPublishDefault,
    TResult? Function(bool hide)? hideIframes,
    TResult? Function(String snippetName, String panelName)?
    setPanelOrPlaceholderSnippet,
    TResult? Function(String snippetName)? enterSelectWidgetMode,
    TResult? Function()? exitSelectWidgetMode,
    TResult? Function(SnippetRootNode rootNode, SNode? selectedNode)?
    pushSnippetEditor,
    TResult? Function(bool save)? popSnippetEditor,
    TResult? Function()? showDirectoryTree,
    TResult? Function(bool save)? removeDirectoryTree,
    TResult? Function(SNode node)? selectNode,
    TResult? Function()? clearNodeSelection,
    TResult? Function(SNode node, String newSnippetName)? saveNodeAsSnippet,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    replaceSelectionWith,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    wrapSelectionWith,
    TResult? Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    appendChild,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingBefore,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingAfter,
    TResult? Function(Type? widgetSpanChildType)? pasteReplacement,
    TResult? Function(
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    pasteChild,
    TResult? Function()? pasteSiblingBefore,
    TResult? Function()? pasteSiblingAfter,
    TResult? Function()? deleteNodeTapped,
    TResult? Function()? completeDeletion,
    TResult? Function(SnippetRootNode rootNode)? copySnippetJsonToClipboard,
    TResult? Function(String? snippetJson)? replaceSnippetFromJson,
    TResult? Function(SNode node, String? scName, dynamic skipSave)? copyNode,
    TResult? Function(SNode node, String? scName, dynamic skipSave)? cutNode,
    TResult? Function(String snippetName, SNode? selectedNode)?
    selectedDirectoryOrNode,
    TResult? Function(Uint8List? newBytes)? imageChanged,
    TResult? Function()? forceSnippetRefresh,
  }) {
    return imageChanged?.call(newBytes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? panelName)? selectPanel,
    TResult Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )?
    overrideTargetGK,
    TResult Function(bool onlyTargetsWrappers)? forceRefresh,
    TResult Function(SNode? newContent, String? scName, dynamic skipSave)?
    updateClipboard,
    TResult Function(String snippetName, String versionId)? publishSnippet,
    TResult Function(String snippetName, String versionId)? revertSnippet,
    TResult Function(String pathName)? deletePage,
    TResult Function(String snippetName)? toggleAutoPublishingOfSnippet,
    TResult Function(bool b)? autoPublishDefault,
    TResult Function(bool hide)? hideIframes,
    TResult Function(String snippetName, String panelName)?
    setPanelOrPlaceholderSnippet,
    TResult Function(String snippetName)? enterSelectWidgetMode,
    TResult Function()? exitSelectWidgetMode,
    TResult Function(SnippetRootNode rootNode, SNode? selectedNode)?
    pushSnippetEditor,
    TResult Function(bool save)? popSnippetEditor,
    TResult Function()? showDirectoryTree,
    TResult Function(bool save)? removeDirectoryTree,
    TResult Function(SNode node)? selectNode,
    TResult Function()? clearNodeSelection,
    TResult Function(SNode node, String newSnippetName)? saveNodeAsSnippet,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    replaceSelectionWith,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    wrapSelectionWith,
    TResult Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    appendChild,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingBefore,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingAfter,
    TResult Function(Type? widgetSpanChildType)? pasteReplacement,
    TResult Function(Type? widgetSpanChildType, SNode? testWidgetSpanChildNode)?
    pasteChild,
    TResult Function()? pasteSiblingBefore,
    TResult Function()? pasteSiblingAfter,
    TResult Function()? deleteNodeTapped,
    TResult Function()? completeDeletion,
    TResult Function(SnippetRootNode rootNode)? copySnippetJsonToClipboard,
    TResult Function(String? snippetJson)? replaceSnippetFromJson,
    TResult Function(SNode node, String? scName, dynamic skipSave)? copyNode,
    TResult Function(SNode node, String? scName, dynamic skipSave)? cutNode,
    TResult Function(String snippetName, SNode? selectedNode)?
    selectedDirectoryOrNode,
    TResult Function(Uint8List? newBytes)? imageChanged,
    TResult Function()? forceSnippetRefresh,
    required TResult orElse(),
  }) {
    if (imageChanged != null) {
      return imageChanged(newBytes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SelectPanel value) selectPanel,
    required TResult Function(OverrideTargetGK value) overrideTargetGK,
    required TResult Function(ForceRefresh value) forceRefresh,
    required TResult Function(UpdateClipboard value) updateClipboard,
    required TResult Function(PublishSnippet value) publishSnippet,
    required TResult Function(RevertSnippet value) revertSnippet,
    required TResult Function(DeletePage value) deletePage,
    required TResult Function(ToggleAutoPublishingOfSnippet value)
    toggleAutoPublishingOfSnippet,
    required TResult Function(AutoPublishDefault value) autoPublishDefault,
    required TResult Function(HideIframes value) hideIframes,
    required TResult Function(SetPanelSnippet value)
    setPanelOrPlaceholderSnippet,
    required TResult Function(EnterSelectWidgetMode value)
    enterSelectWidgetMode,
    required TResult Function(ExitSelectWidgetMode value) exitSelectWidgetMode,
    required TResult Function(PushSnippetEditor value) pushSnippetEditor,
    required TResult Function(PopSnippetEditor value) popSnippetEditor,
    required TResult Function(ShowDirectoryTree value) showDirectoryTree,
    required TResult Function(RemoveDirectoryTree value) removeDirectoryTree,
    required TResult Function(SelectNode value) selectNode,
    required TResult Function(ClearNodeSelection value) clearNodeSelection,
    required TResult Function(SaveNodeAsSnippet value) saveNodeAsSnippet,
    required TResult Function(ReplaceSelectionWith value) replaceSelectionWith,
    required TResult Function(WrapSelectionWith value) wrapSelectionWith,
    required TResult Function(AppendChild value) appendChild,
    required TResult Function(AddSiblingBefore value) addSiblingBefore,
    required TResult Function(AddSiblingAfter value) addSiblingAfter,
    required TResult Function(PasteReplacement value) pasteReplacement,
    required TResult Function(PasteChild value) pasteChild,
    required TResult Function(PasteSiblingBefore value) pasteSiblingBefore,
    required TResult Function(PasteSiblingAfter value) pasteSiblingAfter,
    required TResult Function(DeleteNodeTapped value) deleteNodeTapped,
    required TResult Function(CompleteDeletion value) completeDeletion,
    required TResult Function(CopySnippetJsonToClipboard value)
    copySnippetJsonToClipboard,
    required TResult Function(ReplaceSnippetFromJson value)
    replaceSnippetFromJson,
    required TResult Function(CopyNode value) copyNode,
    required TResult Function(CutNode value) cutNode,
    required TResult Function(SelectedDirectoryOrNode value)
    selectedDirectoryOrNode,
    required TResult Function(ImageChanged value) imageChanged,
    required TResult Function(ForceSnippetRefresh value) forceSnippetRefresh,
  }) {
    return imageChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SelectPanel value)? selectPanel,
    TResult? Function(OverrideTargetGK value)? overrideTargetGK,
    TResult? Function(ForceRefresh value)? forceRefresh,
    TResult? Function(UpdateClipboard value)? updateClipboard,
    TResult? Function(PublishSnippet value)? publishSnippet,
    TResult? Function(RevertSnippet value)? revertSnippet,
    TResult? Function(DeletePage value)? deletePage,
    TResult? Function(ToggleAutoPublishingOfSnippet value)?
    toggleAutoPublishingOfSnippet,
    TResult? Function(AutoPublishDefault value)? autoPublishDefault,
    TResult? Function(HideIframes value)? hideIframes,
    TResult? Function(SetPanelSnippet value)? setPanelOrPlaceholderSnippet,
    TResult? Function(EnterSelectWidgetMode value)? enterSelectWidgetMode,
    TResult? Function(ExitSelectWidgetMode value)? exitSelectWidgetMode,
    TResult? Function(PushSnippetEditor value)? pushSnippetEditor,
    TResult? Function(PopSnippetEditor value)? popSnippetEditor,
    TResult? Function(ShowDirectoryTree value)? showDirectoryTree,
    TResult? Function(RemoveDirectoryTree value)? removeDirectoryTree,
    TResult? Function(SelectNode value)? selectNode,
    TResult? Function(ClearNodeSelection value)? clearNodeSelection,
    TResult? Function(SaveNodeAsSnippet value)? saveNodeAsSnippet,
    TResult? Function(ReplaceSelectionWith value)? replaceSelectionWith,
    TResult? Function(WrapSelectionWith value)? wrapSelectionWith,
    TResult? Function(AppendChild value)? appendChild,
    TResult? Function(AddSiblingBefore value)? addSiblingBefore,
    TResult? Function(AddSiblingAfter value)? addSiblingAfter,
    TResult? Function(PasteReplacement value)? pasteReplacement,
    TResult? Function(PasteChild value)? pasteChild,
    TResult? Function(PasteSiblingBefore value)? pasteSiblingBefore,
    TResult? Function(PasteSiblingAfter value)? pasteSiblingAfter,
    TResult? Function(DeleteNodeTapped value)? deleteNodeTapped,
    TResult? Function(CompleteDeletion value)? completeDeletion,
    TResult? Function(CopySnippetJsonToClipboard value)?
    copySnippetJsonToClipboard,
    TResult? Function(ReplaceSnippetFromJson value)? replaceSnippetFromJson,
    TResult? Function(CopyNode value)? copyNode,
    TResult? Function(CutNode value)? cutNode,
    TResult? Function(SelectedDirectoryOrNode value)? selectedDirectoryOrNode,
    TResult? Function(ImageChanged value)? imageChanged,
    TResult? Function(ForceSnippetRefresh value)? forceSnippetRefresh,
  }) {
    return imageChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SelectPanel value)? selectPanel,
    TResult Function(OverrideTargetGK value)? overrideTargetGK,
    TResult Function(ForceRefresh value)? forceRefresh,
    TResult Function(UpdateClipboard value)? updateClipboard,
    TResult Function(PublishSnippet value)? publishSnippet,
    TResult Function(RevertSnippet value)? revertSnippet,
    TResult Function(DeletePage value)? deletePage,
    TResult Function(ToggleAutoPublishingOfSnippet value)?
    toggleAutoPublishingOfSnippet,
    TResult Function(AutoPublishDefault value)? autoPublishDefault,
    TResult Function(HideIframes value)? hideIframes,
    TResult Function(SetPanelSnippet value)? setPanelOrPlaceholderSnippet,
    TResult Function(EnterSelectWidgetMode value)? enterSelectWidgetMode,
    TResult Function(ExitSelectWidgetMode value)? exitSelectWidgetMode,
    TResult Function(PushSnippetEditor value)? pushSnippetEditor,
    TResult Function(PopSnippetEditor value)? popSnippetEditor,
    TResult Function(ShowDirectoryTree value)? showDirectoryTree,
    TResult Function(RemoveDirectoryTree value)? removeDirectoryTree,
    TResult Function(SelectNode value)? selectNode,
    TResult Function(ClearNodeSelection value)? clearNodeSelection,
    TResult Function(SaveNodeAsSnippet value)? saveNodeAsSnippet,
    TResult Function(ReplaceSelectionWith value)? replaceSelectionWith,
    TResult Function(WrapSelectionWith value)? wrapSelectionWith,
    TResult Function(AppendChild value)? appendChild,
    TResult Function(AddSiblingBefore value)? addSiblingBefore,
    TResult Function(AddSiblingAfter value)? addSiblingAfter,
    TResult Function(PasteReplacement value)? pasteReplacement,
    TResult Function(PasteChild value)? pasteChild,
    TResult Function(PasteSiblingBefore value)? pasteSiblingBefore,
    TResult Function(PasteSiblingAfter value)? pasteSiblingAfter,
    TResult Function(DeleteNodeTapped value)? deleteNodeTapped,
    TResult Function(CompleteDeletion value)? completeDeletion,
    TResult Function(CopySnippetJsonToClipboard value)?
    copySnippetJsonToClipboard,
    TResult Function(ReplaceSnippetFromJson value)? replaceSnippetFromJson,
    TResult Function(CopyNode value)? copyNode,
    TResult Function(CutNode value)? cutNode,
    TResult Function(SelectedDirectoryOrNode value)? selectedDirectoryOrNode,
    TResult Function(ImageChanged value)? imageChanged,
    TResult Function(ForceSnippetRefresh value)? forceSnippetRefresh,
    required TResult orElse(),
  }) {
    if (imageChanged != null) {
      return imageChanged(this);
    }
    return orElse();
  }
}

abstract class ImageChanged implements CAPIEvent {
  const factory ImageChanged({final Uint8List? newBytes}) = _$ImageChangedImpl;

  Uint8List? get newBytes;

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ImageChangedImplCopyWith<_$ImageChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ForceSnippetRefreshImplCopyWith<$Res> {
  factory _$$ForceSnippetRefreshImplCopyWith(
    _$ForceSnippetRefreshImpl value,
    $Res Function(_$ForceSnippetRefreshImpl) then,
  ) = __$$ForceSnippetRefreshImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ForceSnippetRefreshImplCopyWithImpl<$Res>
    extends _$CAPIEventCopyWithImpl<$Res, _$ForceSnippetRefreshImpl>
    implements _$$ForceSnippetRefreshImplCopyWith<$Res> {
  __$$ForceSnippetRefreshImplCopyWithImpl(
    _$ForceSnippetRefreshImpl _value,
    $Res Function(_$ForceSnippetRefreshImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CAPIEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ForceSnippetRefreshImpl
    with DiagnosticableTreeMixin
    implements ForceSnippetRefresh {
  const _$ForceSnippetRefreshImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CAPIEvent.forceSnippetRefresh()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CAPIEvent.forceSnippetRefresh'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForceSnippetRefreshImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? panelName) selectPanel,
    required TResult Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )
    overrideTargetGK,
    required TResult Function(bool onlyTargetsWrappers) forceRefresh,
    required TResult Function(
      SNode? newContent,
      String? scName,
      dynamic skipSave,
    )
    updateClipboard,
    required TResult Function(String snippetName, String versionId)
    publishSnippet,
    required TResult Function(String snippetName, String versionId)
    revertSnippet,
    required TResult Function(String pathName) deletePage,
    required TResult Function(String snippetName) toggleAutoPublishingOfSnippet,
    required TResult Function(bool b) autoPublishDefault,
    required TResult Function(bool hide) hideIframes,
    required TResult Function(String snippetName, String panelName)
    setPanelOrPlaceholderSnippet,
    required TResult Function(String snippetName) enterSelectWidgetMode,
    required TResult Function() exitSelectWidgetMode,
    required TResult Function(SnippetRootNode rootNode, SNode? selectedNode)
    pushSnippetEditor,
    required TResult Function(bool save) popSnippetEditor,
    required TResult Function() showDirectoryTree,
    required TResult Function(bool save) removeDirectoryTree,
    required TResult Function(SNode node) selectNode,
    required TResult Function() clearNodeSelection,
    required TResult Function(SNode node, String newSnippetName)
    saveNodeAsSnippet,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    replaceSelectionWith,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    wrapSelectionWith,
    required TResult Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )
    appendChild,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    addSiblingBefore,
    required TResult Function(Type? type, String? snippetName, SNode? testNode)
    addSiblingAfter,
    required TResult Function(Type? widgetSpanChildType) pasteReplacement,
    required TResult Function(
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )
    pasteChild,
    required TResult Function() pasteSiblingBefore,
    required TResult Function() pasteSiblingAfter,
    required TResult Function() deleteNodeTapped,
    required TResult Function() completeDeletion,
    required TResult Function(SnippetRootNode rootNode)
    copySnippetJsonToClipboard,
    required TResult Function(String? snippetJson) replaceSnippetFromJson,
    required TResult Function(SNode node, String? scName, dynamic skipSave)
    copyNode,
    required TResult Function(SNode node, String? scName, dynamic skipSave)
    cutNode,
    required TResult Function(String snippetName, SNode? selectedNode)
    selectedDirectoryOrNode,
    required TResult Function(Uint8List? newBytes) imageChanged,
    required TResult Function() forceSnippetRefresh,
  }) {
    return forceSnippetRefresh();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? panelName)? selectPanel,
    TResult? Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )?
    overrideTargetGK,
    TResult? Function(bool onlyTargetsWrappers)? forceRefresh,
    TResult? Function(SNode? newContent, String? scName, dynamic skipSave)?
    updateClipboard,
    TResult? Function(String snippetName, String versionId)? publishSnippet,
    TResult? Function(String snippetName, String versionId)? revertSnippet,
    TResult? Function(String pathName)? deletePage,
    TResult? Function(String snippetName)? toggleAutoPublishingOfSnippet,
    TResult? Function(bool b)? autoPublishDefault,
    TResult? Function(bool hide)? hideIframes,
    TResult? Function(String snippetName, String panelName)?
    setPanelOrPlaceholderSnippet,
    TResult? Function(String snippetName)? enterSelectWidgetMode,
    TResult? Function()? exitSelectWidgetMode,
    TResult? Function(SnippetRootNode rootNode, SNode? selectedNode)?
    pushSnippetEditor,
    TResult? Function(bool save)? popSnippetEditor,
    TResult? Function()? showDirectoryTree,
    TResult? Function(bool save)? removeDirectoryTree,
    TResult? Function(SNode node)? selectNode,
    TResult? Function()? clearNodeSelection,
    TResult? Function(SNode node, String newSnippetName)? saveNodeAsSnippet,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    replaceSelectionWith,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    wrapSelectionWith,
    TResult? Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    appendChild,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingBefore,
    TResult? Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingAfter,
    TResult? Function(Type? widgetSpanChildType)? pasteReplacement,
    TResult? Function(
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    pasteChild,
    TResult? Function()? pasteSiblingBefore,
    TResult? Function()? pasteSiblingAfter,
    TResult? Function()? deleteNodeTapped,
    TResult? Function()? completeDeletion,
    TResult? Function(SnippetRootNode rootNode)? copySnippetJsonToClipboard,
    TResult? Function(String? snippetJson)? replaceSnippetFromJson,
    TResult? Function(SNode node, String? scName, dynamic skipSave)? copyNode,
    TResult? Function(SNode node, String? scName, dynamic skipSave)? cutNode,
    TResult? Function(String snippetName, SNode? selectedNode)?
    selectedDirectoryOrNode,
    TResult? Function(Uint8List? newBytes)? imageChanged,
    TResult? Function()? forceSnippetRefresh,
  }) {
    return forceSnippetRefresh?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? panelName)? selectPanel,
    TResult Function(
      String wName,
      int index,
      GlobalKey<State<StatefulWidget>> gk,
    )?
    overrideTargetGK,
    TResult Function(bool onlyTargetsWrappers)? forceRefresh,
    TResult Function(SNode? newContent, String? scName, dynamic skipSave)?
    updateClipboard,
    TResult Function(String snippetName, String versionId)? publishSnippet,
    TResult Function(String snippetName, String versionId)? revertSnippet,
    TResult Function(String pathName)? deletePage,
    TResult Function(String snippetName)? toggleAutoPublishingOfSnippet,
    TResult Function(bool b)? autoPublishDefault,
    TResult Function(bool hide)? hideIframes,
    TResult Function(String snippetName, String panelName)?
    setPanelOrPlaceholderSnippet,
    TResult Function(String snippetName)? enterSelectWidgetMode,
    TResult Function()? exitSelectWidgetMode,
    TResult Function(SnippetRootNode rootNode, SNode? selectedNode)?
    pushSnippetEditor,
    TResult Function(bool save)? popSnippetEditor,
    TResult Function()? showDirectoryTree,
    TResult Function(bool save)? removeDirectoryTree,
    TResult Function(SNode node)? selectNode,
    TResult Function()? clearNodeSelection,
    TResult Function(SNode node, String newSnippetName)? saveNodeAsSnippet,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    replaceSelectionWith,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    wrapSelectionWith,
    TResult Function(
      Type? type,
      SNode? testNode,
      String? snippetName,
      Type? widgetSpanChildType,
      SNode? testWidgetSpanChildNode,
    )?
    appendChild,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingBefore,
    TResult Function(Type? type, String? snippetName, SNode? testNode)?
    addSiblingAfter,
    TResult Function(Type? widgetSpanChildType)? pasteReplacement,
    TResult Function(Type? widgetSpanChildType, SNode? testWidgetSpanChildNode)?
    pasteChild,
    TResult Function()? pasteSiblingBefore,
    TResult Function()? pasteSiblingAfter,
    TResult Function()? deleteNodeTapped,
    TResult Function()? completeDeletion,
    TResult Function(SnippetRootNode rootNode)? copySnippetJsonToClipboard,
    TResult Function(String? snippetJson)? replaceSnippetFromJson,
    TResult Function(SNode node, String? scName, dynamic skipSave)? copyNode,
    TResult Function(SNode node, String? scName, dynamic skipSave)? cutNode,
    TResult Function(String snippetName, SNode? selectedNode)?
    selectedDirectoryOrNode,
    TResult Function(Uint8List? newBytes)? imageChanged,
    TResult Function()? forceSnippetRefresh,
    required TResult orElse(),
  }) {
    if (forceSnippetRefresh != null) {
      return forceSnippetRefresh();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SelectPanel value) selectPanel,
    required TResult Function(OverrideTargetGK value) overrideTargetGK,
    required TResult Function(ForceRefresh value) forceRefresh,
    required TResult Function(UpdateClipboard value) updateClipboard,
    required TResult Function(PublishSnippet value) publishSnippet,
    required TResult Function(RevertSnippet value) revertSnippet,
    required TResult Function(DeletePage value) deletePage,
    required TResult Function(ToggleAutoPublishingOfSnippet value)
    toggleAutoPublishingOfSnippet,
    required TResult Function(AutoPublishDefault value) autoPublishDefault,
    required TResult Function(HideIframes value) hideIframes,
    required TResult Function(SetPanelSnippet value)
    setPanelOrPlaceholderSnippet,
    required TResult Function(EnterSelectWidgetMode value)
    enterSelectWidgetMode,
    required TResult Function(ExitSelectWidgetMode value) exitSelectWidgetMode,
    required TResult Function(PushSnippetEditor value) pushSnippetEditor,
    required TResult Function(PopSnippetEditor value) popSnippetEditor,
    required TResult Function(ShowDirectoryTree value) showDirectoryTree,
    required TResult Function(RemoveDirectoryTree value) removeDirectoryTree,
    required TResult Function(SelectNode value) selectNode,
    required TResult Function(ClearNodeSelection value) clearNodeSelection,
    required TResult Function(SaveNodeAsSnippet value) saveNodeAsSnippet,
    required TResult Function(ReplaceSelectionWith value) replaceSelectionWith,
    required TResult Function(WrapSelectionWith value) wrapSelectionWith,
    required TResult Function(AppendChild value) appendChild,
    required TResult Function(AddSiblingBefore value) addSiblingBefore,
    required TResult Function(AddSiblingAfter value) addSiblingAfter,
    required TResult Function(PasteReplacement value) pasteReplacement,
    required TResult Function(PasteChild value) pasteChild,
    required TResult Function(PasteSiblingBefore value) pasteSiblingBefore,
    required TResult Function(PasteSiblingAfter value) pasteSiblingAfter,
    required TResult Function(DeleteNodeTapped value) deleteNodeTapped,
    required TResult Function(CompleteDeletion value) completeDeletion,
    required TResult Function(CopySnippetJsonToClipboard value)
    copySnippetJsonToClipboard,
    required TResult Function(ReplaceSnippetFromJson value)
    replaceSnippetFromJson,
    required TResult Function(CopyNode value) copyNode,
    required TResult Function(CutNode value) cutNode,
    required TResult Function(SelectedDirectoryOrNode value)
    selectedDirectoryOrNode,
    required TResult Function(ImageChanged value) imageChanged,
    required TResult Function(ForceSnippetRefresh value) forceSnippetRefresh,
  }) {
    return forceSnippetRefresh(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SelectPanel value)? selectPanel,
    TResult? Function(OverrideTargetGK value)? overrideTargetGK,
    TResult? Function(ForceRefresh value)? forceRefresh,
    TResult? Function(UpdateClipboard value)? updateClipboard,
    TResult? Function(PublishSnippet value)? publishSnippet,
    TResult? Function(RevertSnippet value)? revertSnippet,
    TResult? Function(DeletePage value)? deletePage,
    TResult? Function(ToggleAutoPublishingOfSnippet value)?
    toggleAutoPublishingOfSnippet,
    TResult? Function(AutoPublishDefault value)? autoPublishDefault,
    TResult? Function(HideIframes value)? hideIframes,
    TResult? Function(SetPanelSnippet value)? setPanelOrPlaceholderSnippet,
    TResult? Function(EnterSelectWidgetMode value)? enterSelectWidgetMode,
    TResult? Function(ExitSelectWidgetMode value)? exitSelectWidgetMode,
    TResult? Function(PushSnippetEditor value)? pushSnippetEditor,
    TResult? Function(PopSnippetEditor value)? popSnippetEditor,
    TResult? Function(ShowDirectoryTree value)? showDirectoryTree,
    TResult? Function(RemoveDirectoryTree value)? removeDirectoryTree,
    TResult? Function(SelectNode value)? selectNode,
    TResult? Function(ClearNodeSelection value)? clearNodeSelection,
    TResult? Function(SaveNodeAsSnippet value)? saveNodeAsSnippet,
    TResult? Function(ReplaceSelectionWith value)? replaceSelectionWith,
    TResult? Function(WrapSelectionWith value)? wrapSelectionWith,
    TResult? Function(AppendChild value)? appendChild,
    TResult? Function(AddSiblingBefore value)? addSiblingBefore,
    TResult? Function(AddSiblingAfter value)? addSiblingAfter,
    TResult? Function(PasteReplacement value)? pasteReplacement,
    TResult? Function(PasteChild value)? pasteChild,
    TResult? Function(PasteSiblingBefore value)? pasteSiblingBefore,
    TResult? Function(PasteSiblingAfter value)? pasteSiblingAfter,
    TResult? Function(DeleteNodeTapped value)? deleteNodeTapped,
    TResult? Function(CompleteDeletion value)? completeDeletion,
    TResult? Function(CopySnippetJsonToClipboard value)?
    copySnippetJsonToClipboard,
    TResult? Function(ReplaceSnippetFromJson value)? replaceSnippetFromJson,
    TResult? Function(CopyNode value)? copyNode,
    TResult? Function(CutNode value)? cutNode,
    TResult? Function(SelectedDirectoryOrNode value)? selectedDirectoryOrNode,
    TResult? Function(ImageChanged value)? imageChanged,
    TResult? Function(ForceSnippetRefresh value)? forceSnippetRefresh,
  }) {
    return forceSnippetRefresh?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SelectPanel value)? selectPanel,
    TResult Function(OverrideTargetGK value)? overrideTargetGK,
    TResult Function(ForceRefresh value)? forceRefresh,
    TResult Function(UpdateClipboard value)? updateClipboard,
    TResult Function(PublishSnippet value)? publishSnippet,
    TResult Function(RevertSnippet value)? revertSnippet,
    TResult Function(DeletePage value)? deletePage,
    TResult Function(ToggleAutoPublishingOfSnippet value)?
    toggleAutoPublishingOfSnippet,
    TResult Function(AutoPublishDefault value)? autoPublishDefault,
    TResult Function(HideIframes value)? hideIframes,
    TResult Function(SetPanelSnippet value)? setPanelOrPlaceholderSnippet,
    TResult Function(EnterSelectWidgetMode value)? enterSelectWidgetMode,
    TResult Function(ExitSelectWidgetMode value)? exitSelectWidgetMode,
    TResult Function(PushSnippetEditor value)? pushSnippetEditor,
    TResult Function(PopSnippetEditor value)? popSnippetEditor,
    TResult Function(ShowDirectoryTree value)? showDirectoryTree,
    TResult Function(RemoveDirectoryTree value)? removeDirectoryTree,
    TResult Function(SelectNode value)? selectNode,
    TResult Function(ClearNodeSelection value)? clearNodeSelection,
    TResult Function(SaveNodeAsSnippet value)? saveNodeAsSnippet,
    TResult Function(ReplaceSelectionWith value)? replaceSelectionWith,
    TResult Function(WrapSelectionWith value)? wrapSelectionWith,
    TResult Function(AppendChild value)? appendChild,
    TResult Function(AddSiblingBefore value)? addSiblingBefore,
    TResult Function(AddSiblingAfter value)? addSiblingAfter,
    TResult Function(PasteReplacement value)? pasteReplacement,
    TResult Function(PasteChild value)? pasteChild,
    TResult Function(PasteSiblingBefore value)? pasteSiblingBefore,
    TResult Function(PasteSiblingAfter value)? pasteSiblingAfter,
    TResult Function(DeleteNodeTapped value)? deleteNodeTapped,
    TResult Function(CompleteDeletion value)? completeDeletion,
    TResult Function(CopySnippetJsonToClipboard value)?
    copySnippetJsonToClipboard,
    TResult Function(ReplaceSnippetFromJson value)? replaceSnippetFromJson,
    TResult Function(CopyNode value)? copyNode,
    TResult Function(CutNode value)? cutNode,
    TResult Function(SelectedDirectoryOrNode value)? selectedDirectoryOrNode,
    TResult Function(ImageChanged value)? imageChanged,
    TResult Function(ForceSnippetRefresh value)? forceSnippetRefresh,
    required TResult orElse(),
  }) {
    if (forceSnippetRefresh != null) {
      return forceSnippetRefresh(this);
    }
    return orElse();
  }
}

abstract class ForceSnippetRefresh implements CAPIEvent {
  const factory ForceSnippetRefresh() = _$ForceSnippetRefreshImpl;
}
