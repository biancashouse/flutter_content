// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'capi_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CAPIEvent implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CAPIEvent'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CAPIEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CAPIEvent()';
}


}

/// @nodoc
class $CAPIEventCopyWith<$Res>  {
$CAPIEventCopyWith(CAPIEvent _, $Res Function(CAPIEvent) __);
}


/// Adds pattern-matching-related methods to [CAPIEvent].
extension CAPIEventPatterns on CAPIEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SignedIn value)?  signedIn,TResult Function( SignedOut value)?  signedOut,TResult Function( OverrideTargetGK value)?  overrideTargetGK,TResult Function( ForceRefresh value)?  forceRefresh,TResult Function( ToggleSnippetVisibility value)?  toggleSnippetVisibility,TResult Function( UpdateClipboard value)?  updateClipboard,TResult Function( PublishSnippet value)?  publishSnippet,TResult Function( RevertSnippet value)?  revertSnippet,TResult Function( DeletePage value)?  deletePage,TResult Function( ToggleAutoPublishingOfSnippet value)?  toggleAutoPublishingOfSnippet,TResult Function( AutoPublishDefault value)?  autoPublishDefault,TResult Function( SetPanelSnippet value)?  setPanelOrPlaceholderSnippet,TResult Function( EnterSelectWidgetMode value)?  enterSelectWidgetMode,TResult Function( ExitSelectWidgetMode value)?  exitSelectWidgetMode,TResult Function( PushSnippetEditor value)?  pushSnippetEditor,TResult Function( PopSnippetEditor value)?  popSnippetEditor,TResult Function( ShowDirectoryTree value)?  showDirectoryTree,TResult Function( RemoveDirectoryTree value)?  removeDirectoryTree,TResult Function( SelectNode value)?  selectNode,TResult Function( ClearNodeSelection value)?  clearNodeSelection,TResult Function( SaveNodeAsSnippet value)?  saveNodeAsSnippet,TResult Function( ReplaceSelectionWith value)?  replaceSelectionWith,TResult Function( WrapSelectionWith value)?  wrapSelectionWith,TResult Function( AppendChild value)?  appendChild,TResult Function( AddSiblingBefore value)?  addSiblingBefore,TResult Function( AddSiblingAfter value)?  addSiblingAfter,TResult Function( PasteReplacement value)?  pasteReplacement,TResult Function( PasteChild value)?  pasteChild,TResult Function( PasteSiblingBefore value)?  pasteSiblingBefore,TResult Function( PasteSiblingAfter value)?  pasteSiblingAfter,TResult Function( DeleteNodeTapped value)?  deleteNodeTapped,TResult Function( CompleteDeletion value)?  completeDeletion,TResult Function( CopySnippetJsonToClipboard value)?  copySnippetJsonToClipboard,TResult Function( ReplaceSnippetFromJson value)?  replaceSnippetFromJson,TResult Function( CopyNode value)?  copyNode,TResult Function( CutNode value)?  cutNode,TResult Function( SelectedDirectoryOrNode value)?  selectedDirectoryOrNode,TResult Function( ImageChanged value)?  imageChanged,TResult Function( ForceSnippetRefresh value)?  forceSnippetRefresh,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SignedIn() when signedIn != null:
return signedIn(_that);case SignedOut() when signedOut != null:
return signedOut(_that);case OverrideTargetGK() when overrideTargetGK != null:
return overrideTargetGK(_that);case ForceRefresh() when forceRefresh != null:
return forceRefresh(_that);case ToggleSnippetVisibility() when toggleSnippetVisibility != null:
return toggleSnippetVisibility(_that);case UpdateClipboard() when updateClipboard != null:
return updateClipboard(_that);case PublishSnippet() when publishSnippet != null:
return publishSnippet(_that);case RevertSnippet() when revertSnippet != null:
return revertSnippet(_that);case DeletePage() when deletePage != null:
return deletePage(_that);case ToggleAutoPublishingOfSnippet() when toggleAutoPublishingOfSnippet != null:
return toggleAutoPublishingOfSnippet(_that);case AutoPublishDefault() when autoPublishDefault != null:
return autoPublishDefault(_that);case SetPanelSnippet() when setPanelOrPlaceholderSnippet != null:
return setPanelOrPlaceholderSnippet(_that);case EnterSelectWidgetMode() when enterSelectWidgetMode != null:
return enterSelectWidgetMode(_that);case ExitSelectWidgetMode() when exitSelectWidgetMode != null:
return exitSelectWidgetMode(_that);case PushSnippetEditor() when pushSnippetEditor != null:
return pushSnippetEditor(_that);case PopSnippetEditor() when popSnippetEditor != null:
return popSnippetEditor(_that);case ShowDirectoryTree() when showDirectoryTree != null:
return showDirectoryTree(_that);case RemoveDirectoryTree() when removeDirectoryTree != null:
return removeDirectoryTree(_that);case SelectNode() when selectNode != null:
return selectNode(_that);case ClearNodeSelection() when clearNodeSelection != null:
return clearNodeSelection(_that);case SaveNodeAsSnippet() when saveNodeAsSnippet != null:
return saveNodeAsSnippet(_that);case ReplaceSelectionWith() when replaceSelectionWith != null:
return replaceSelectionWith(_that);case WrapSelectionWith() when wrapSelectionWith != null:
return wrapSelectionWith(_that);case AppendChild() when appendChild != null:
return appendChild(_that);case AddSiblingBefore() when addSiblingBefore != null:
return addSiblingBefore(_that);case AddSiblingAfter() when addSiblingAfter != null:
return addSiblingAfter(_that);case PasteReplacement() when pasteReplacement != null:
return pasteReplacement(_that);case PasteChild() when pasteChild != null:
return pasteChild(_that);case PasteSiblingBefore() when pasteSiblingBefore != null:
return pasteSiblingBefore(_that);case PasteSiblingAfter() when pasteSiblingAfter != null:
return pasteSiblingAfter(_that);case DeleteNodeTapped() when deleteNodeTapped != null:
return deleteNodeTapped(_that);case CompleteDeletion() when completeDeletion != null:
return completeDeletion(_that);case CopySnippetJsonToClipboard() when copySnippetJsonToClipboard != null:
return copySnippetJsonToClipboard(_that);case ReplaceSnippetFromJson() when replaceSnippetFromJson != null:
return replaceSnippetFromJson(_that);case CopyNode() when copyNode != null:
return copyNode(_that);case CutNode() when cutNode != null:
return cutNode(_that);case SelectedDirectoryOrNode() when selectedDirectoryOrNode != null:
return selectedDirectoryOrNode(_that);case ImageChanged() when imageChanged != null:
return imageChanged(_that);case ForceSnippetRefresh() when forceSnippetRefresh != null:
return forceSnippetRefresh(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SignedIn value)  signedIn,required TResult Function( SignedOut value)  signedOut,required TResult Function( OverrideTargetGK value)  overrideTargetGK,required TResult Function( ForceRefresh value)  forceRefresh,required TResult Function( ToggleSnippetVisibility value)  toggleSnippetVisibility,required TResult Function( UpdateClipboard value)  updateClipboard,required TResult Function( PublishSnippet value)  publishSnippet,required TResult Function( RevertSnippet value)  revertSnippet,required TResult Function( DeletePage value)  deletePage,required TResult Function( ToggleAutoPublishingOfSnippet value)  toggleAutoPublishingOfSnippet,required TResult Function( AutoPublishDefault value)  autoPublishDefault,required TResult Function( SetPanelSnippet value)  setPanelOrPlaceholderSnippet,required TResult Function( EnterSelectWidgetMode value)  enterSelectWidgetMode,required TResult Function( ExitSelectWidgetMode value)  exitSelectWidgetMode,required TResult Function( PushSnippetEditor value)  pushSnippetEditor,required TResult Function( PopSnippetEditor value)  popSnippetEditor,required TResult Function( ShowDirectoryTree value)  showDirectoryTree,required TResult Function( RemoveDirectoryTree value)  removeDirectoryTree,required TResult Function( SelectNode value)  selectNode,required TResult Function( ClearNodeSelection value)  clearNodeSelection,required TResult Function( SaveNodeAsSnippet value)  saveNodeAsSnippet,required TResult Function( ReplaceSelectionWith value)  replaceSelectionWith,required TResult Function( WrapSelectionWith value)  wrapSelectionWith,required TResult Function( AppendChild value)  appendChild,required TResult Function( AddSiblingBefore value)  addSiblingBefore,required TResult Function( AddSiblingAfter value)  addSiblingAfter,required TResult Function( PasteReplacement value)  pasteReplacement,required TResult Function( PasteChild value)  pasteChild,required TResult Function( PasteSiblingBefore value)  pasteSiblingBefore,required TResult Function( PasteSiblingAfter value)  pasteSiblingAfter,required TResult Function( DeleteNodeTapped value)  deleteNodeTapped,required TResult Function( CompleteDeletion value)  completeDeletion,required TResult Function( CopySnippetJsonToClipboard value)  copySnippetJsonToClipboard,required TResult Function( ReplaceSnippetFromJson value)  replaceSnippetFromJson,required TResult Function( CopyNode value)  copyNode,required TResult Function( CutNode value)  cutNode,required TResult Function( SelectedDirectoryOrNode value)  selectedDirectoryOrNode,required TResult Function( ImageChanged value)  imageChanged,required TResult Function( ForceSnippetRefresh value)  forceSnippetRefresh,}){
final _that = this;
switch (_that) {
case SignedIn():
return signedIn(_that);case SignedOut():
return signedOut(_that);case OverrideTargetGK():
return overrideTargetGK(_that);case ForceRefresh():
return forceRefresh(_that);case ToggleSnippetVisibility():
return toggleSnippetVisibility(_that);case UpdateClipboard():
return updateClipboard(_that);case PublishSnippet():
return publishSnippet(_that);case RevertSnippet():
return revertSnippet(_that);case DeletePage():
return deletePage(_that);case ToggleAutoPublishingOfSnippet():
return toggleAutoPublishingOfSnippet(_that);case AutoPublishDefault():
return autoPublishDefault(_that);case SetPanelSnippet():
return setPanelOrPlaceholderSnippet(_that);case EnterSelectWidgetMode():
return enterSelectWidgetMode(_that);case ExitSelectWidgetMode():
return exitSelectWidgetMode(_that);case PushSnippetEditor():
return pushSnippetEditor(_that);case PopSnippetEditor():
return popSnippetEditor(_that);case ShowDirectoryTree():
return showDirectoryTree(_that);case RemoveDirectoryTree():
return removeDirectoryTree(_that);case SelectNode():
return selectNode(_that);case ClearNodeSelection():
return clearNodeSelection(_that);case SaveNodeAsSnippet():
return saveNodeAsSnippet(_that);case ReplaceSelectionWith():
return replaceSelectionWith(_that);case WrapSelectionWith():
return wrapSelectionWith(_that);case AppendChild():
return appendChild(_that);case AddSiblingBefore():
return addSiblingBefore(_that);case AddSiblingAfter():
return addSiblingAfter(_that);case PasteReplacement():
return pasteReplacement(_that);case PasteChild():
return pasteChild(_that);case PasteSiblingBefore():
return pasteSiblingBefore(_that);case PasteSiblingAfter():
return pasteSiblingAfter(_that);case DeleteNodeTapped():
return deleteNodeTapped(_that);case CompleteDeletion():
return completeDeletion(_that);case CopySnippetJsonToClipboard():
return copySnippetJsonToClipboard(_that);case ReplaceSnippetFromJson():
return replaceSnippetFromJson(_that);case CopyNode():
return copyNode(_that);case CutNode():
return cutNode(_that);case SelectedDirectoryOrNode():
return selectedDirectoryOrNode(_that);case ImageChanged():
return imageChanged(_that);case ForceSnippetRefresh():
return forceSnippetRefresh(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SignedIn value)?  signedIn,TResult? Function( SignedOut value)?  signedOut,TResult? Function( OverrideTargetGK value)?  overrideTargetGK,TResult? Function( ForceRefresh value)?  forceRefresh,TResult? Function( ToggleSnippetVisibility value)?  toggleSnippetVisibility,TResult? Function( UpdateClipboard value)?  updateClipboard,TResult? Function( PublishSnippet value)?  publishSnippet,TResult? Function( RevertSnippet value)?  revertSnippet,TResult? Function( DeletePage value)?  deletePage,TResult? Function( ToggleAutoPublishingOfSnippet value)?  toggleAutoPublishingOfSnippet,TResult? Function( AutoPublishDefault value)?  autoPublishDefault,TResult? Function( SetPanelSnippet value)?  setPanelOrPlaceholderSnippet,TResult? Function( EnterSelectWidgetMode value)?  enterSelectWidgetMode,TResult? Function( ExitSelectWidgetMode value)?  exitSelectWidgetMode,TResult? Function( PushSnippetEditor value)?  pushSnippetEditor,TResult? Function( PopSnippetEditor value)?  popSnippetEditor,TResult? Function( ShowDirectoryTree value)?  showDirectoryTree,TResult? Function( RemoveDirectoryTree value)?  removeDirectoryTree,TResult? Function( SelectNode value)?  selectNode,TResult? Function( ClearNodeSelection value)?  clearNodeSelection,TResult? Function( SaveNodeAsSnippet value)?  saveNodeAsSnippet,TResult? Function( ReplaceSelectionWith value)?  replaceSelectionWith,TResult? Function( WrapSelectionWith value)?  wrapSelectionWith,TResult? Function( AppendChild value)?  appendChild,TResult? Function( AddSiblingBefore value)?  addSiblingBefore,TResult? Function( AddSiblingAfter value)?  addSiblingAfter,TResult? Function( PasteReplacement value)?  pasteReplacement,TResult? Function( PasteChild value)?  pasteChild,TResult? Function( PasteSiblingBefore value)?  pasteSiblingBefore,TResult? Function( PasteSiblingAfter value)?  pasteSiblingAfter,TResult? Function( DeleteNodeTapped value)?  deleteNodeTapped,TResult? Function( CompleteDeletion value)?  completeDeletion,TResult? Function( CopySnippetJsonToClipboard value)?  copySnippetJsonToClipboard,TResult? Function( ReplaceSnippetFromJson value)?  replaceSnippetFromJson,TResult? Function( CopyNode value)?  copyNode,TResult? Function( CutNode value)?  cutNode,TResult? Function( SelectedDirectoryOrNode value)?  selectedDirectoryOrNode,TResult? Function( ImageChanged value)?  imageChanged,TResult? Function( ForceSnippetRefresh value)?  forceSnippetRefresh,}){
final _that = this;
switch (_that) {
case SignedIn() when signedIn != null:
return signedIn(_that);case SignedOut() when signedOut != null:
return signedOut(_that);case OverrideTargetGK() when overrideTargetGK != null:
return overrideTargetGK(_that);case ForceRefresh() when forceRefresh != null:
return forceRefresh(_that);case ToggleSnippetVisibility() when toggleSnippetVisibility != null:
return toggleSnippetVisibility(_that);case UpdateClipboard() when updateClipboard != null:
return updateClipboard(_that);case PublishSnippet() when publishSnippet != null:
return publishSnippet(_that);case RevertSnippet() when revertSnippet != null:
return revertSnippet(_that);case DeletePage() when deletePage != null:
return deletePage(_that);case ToggleAutoPublishingOfSnippet() when toggleAutoPublishingOfSnippet != null:
return toggleAutoPublishingOfSnippet(_that);case AutoPublishDefault() when autoPublishDefault != null:
return autoPublishDefault(_that);case SetPanelSnippet() when setPanelOrPlaceholderSnippet != null:
return setPanelOrPlaceholderSnippet(_that);case EnterSelectWidgetMode() when enterSelectWidgetMode != null:
return enterSelectWidgetMode(_that);case ExitSelectWidgetMode() when exitSelectWidgetMode != null:
return exitSelectWidgetMode(_that);case PushSnippetEditor() when pushSnippetEditor != null:
return pushSnippetEditor(_that);case PopSnippetEditor() when popSnippetEditor != null:
return popSnippetEditor(_that);case ShowDirectoryTree() when showDirectoryTree != null:
return showDirectoryTree(_that);case RemoveDirectoryTree() when removeDirectoryTree != null:
return removeDirectoryTree(_that);case SelectNode() when selectNode != null:
return selectNode(_that);case ClearNodeSelection() when clearNodeSelection != null:
return clearNodeSelection(_that);case SaveNodeAsSnippet() when saveNodeAsSnippet != null:
return saveNodeAsSnippet(_that);case ReplaceSelectionWith() when replaceSelectionWith != null:
return replaceSelectionWith(_that);case WrapSelectionWith() when wrapSelectionWith != null:
return wrapSelectionWith(_that);case AppendChild() when appendChild != null:
return appendChild(_that);case AddSiblingBefore() when addSiblingBefore != null:
return addSiblingBefore(_that);case AddSiblingAfter() when addSiblingAfter != null:
return addSiblingAfter(_that);case PasteReplacement() when pasteReplacement != null:
return pasteReplacement(_that);case PasteChild() when pasteChild != null:
return pasteChild(_that);case PasteSiblingBefore() when pasteSiblingBefore != null:
return pasteSiblingBefore(_that);case PasteSiblingAfter() when pasteSiblingAfter != null:
return pasteSiblingAfter(_that);case DeleteNodeTapped() when deleteNodeTapped != null:
return deleteNodeTapped(_that);case CompleteDeletion() when completeDeletion != null:
return completeDeletion(_that);case CopySnippetJsonToClipboard() when copySnippetJsonToClipboard != null:
return copySnippetJsonToClipboard(_that);case ReplaceSnippetFromJson() when replaceSnippetFromJson != null:
return replaceSnippetFromJson(_that);case CopyNode() when copyNode != null:
return copyNode(_that);case CutNode() when cutNode != null:
return cutNode(_that);case SelectedDirectoryOrNode() when selectedDirectoryOrNode != null:
return selectedDirectoryOrNode(_that);case ImageChanged() when imageChanged != null:
return imageChanged(_that);case ForceSnippetRefresh() when forceSnippetRefresh != null:
return forceSnippetRefresh(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( bool asGuestEditor)?  signedIn,TResult Function()?  signedOut,TResult Function( String wName,  int index,  GlobalKey gk)?  overrideTargetGK,TResult Function( bool onlyTargetsWrappers)?  forceRefresh,TResult Function( SnippetName? snippetName)?  toggleSnippetVisibility,TResult Function( SNode? newContent,  ScrollControllerName? scName,  dynamic skipSave)?  updateClipboard,TResult Function( SnippetName snippetName,  VersionId versionId)?  publishSnippet,TResult Function( SnippetName snippetName,  VersionId versionId)?  revertSnippet,TResult Function( String pathName)?  deletePage,TResult Function( SnippetName snippetName)?  toggleAutoPublishingOfSnippet,TResult Function( bool b)?  autoPublishDefault,TResult Function( SnippetName snippetName,  PanelName panelName)?  setPanelOrPlaceholderSnippet,TResult Function( SnippetName snippetName)?  enterSelectWidgetMode,TResult Function()?  exitSelectWidgetMode,TResult Function( SnippetRootNode rootNode,  SNode? selectedNode)?  pushSnippetEditor,TResult Function( bool save)?  popSnippetEditor,TResult Function()?  showDirectoryTree,TResult Function( bool save)?  removeDirectoryTree,TResult Function( SNode node)?  selectNode,TResult Function()?  clearNodeSelection,TResult Function( SNode node,  String newSnippetName)?  saveNodeAsSnippet,TResult Function( Type? type,  SnippetName? snippetName,  SNode? testNode)?  replaceSelectionWith,TResult Function( Type? type,  SnippetName? snippetName,  SNode? testNode)?  wrapSelectionWith,TResult Function( Type? type,  SNode? testNode,  SnippetName? snippetName,  Type? widgetSpanChildType,  SNode? testWidgetSpanChildNode)?  appendChild,TResult Function( Type? type,  SnippetName? snippetName,  SNode? testNode)?  addSiblingBefore,TResult Function( Type? type,  SnippetName? snippetName,  SNode? testNode)?  addSiblingAfter,TResult Function( Type? widgetSpanChildType)?  pasteReplacement,TResult Function( Type? widgetSpanChildType,  SNode? testWidgetSpanChildNode)?  pasteChild,TResult Function()?  pasteSiblingBefore,TResult Function()?  pasteSiblingAfter,TResult Function()?  deleteNodeTapped,TResult Function()?  completeDeletion,TResult Function( SnippetRootNode rootNode)?  copySnippetJsonToClipboard,TResult Function( String? snippetJson)?  replaceSnippetFromJson,TResult Function( SNode node,  ScrollControllerName? scName,  dynamic skipSave)?  copyNode,TResult Function( SNode node,  ScrollControllerName? scName,  dynamic skipSave)?  cutNode,TResult Function( SnippetName snippetName,  SNode? selectedNode)?  selectedDirectoryOrNode,TResult Function( Uint8List? newBytes)?  imageChanged,TResult Function()?  forceSnippetRefresh,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SignedIn() when signedIn != null:
return signedIn(_that.asGuestEditor);case SignedOut() when signedOut != null:
return signedOut();case OverrideTargetGK() when overrideTargetGK != null:
return overrideTargetGK(_that.wName,_that.index,_that.gk);case ForceRefresh() when forceRefresh != null:
return forceRefresh(_that.onlyTargetsWrappers);case ToggleSnippetVisibility() when toggleSnippetVisibility != null:
return toggleSnippetVisibility(_that.snippetName);case UpdateClipboard() when updateClipboard != null:
return updateClipboard(_that.newContent,_that.scName,_that.skipSave);case PublishSnippet() when publishSnippet != null:
return publishSnippet(_that.snippetName,_that.versionId);case RevertSnippet() when revertSnippet != null:
return revertSnippet(_that.snippetName,_that.versionId);case DeletePage() when deletePage != null:
return deletePage(_that.pathName);case ToggleAutoPublishingOfSnippet() when toggleAutoPublishingOfSnippet != null:
return toggleAutoPublishingOfSnippet(_that.snippetName);case AutoPublishDefault() when autoPublishDefault != null:
return autoPublishDefault(_that.b);case SetPanelSnippet() when setPanelOrPlaceholderSnippet != null:
return setPanelOrPlaceholderSnippet(_that.snippetName,_that.panelName);case EnterSelectWidgetMode() when enterSelectWidgetMode != null:
return enterSelectWidgetMode(_that.snippetName);case ExitSelectWidgetMode() when exitSelectWidgetMode != null:
return exitSelectWidgetMode();case PushSnippetEditor() when pushSnippetEditor != null:
return pushSnippetEditor(_that.rootNode,_that.selectedNode);case PopSnippetEditor() when popSnippetEditor != null:
return popSnippetEditor(_that.save);case ShowDirectoryTree() when showDirectoryTree != null:
return showDirectoryTree();case RemoveDirectoryTree() when removeDirectoryTree != null:
return removeDirectoryTree(_that.save);case SelectNode() when selectNode != null:
return selectNode(_that.node);case ClearNodeSelection() when clearNodeSelection != null:
return clearNodeSelection();case SaveNodeAsSnippet() when saveNodeAsSnippet != null:
return saveNodeAsSnippet(_that.node,_that.newSnippetName);case ReplaceSelectionWith() when replaceSelectionWith != null:
return replaceSelectionWith(_that.type,_that.snippetName,_that.testNode);case WrapSelectionWith() when wrapSelectionWith != null:
return wrapSelectionWith(_that.type,_that.snippetName,_that.testNode);case AppendChild() when appendChild != null:
return appendChild(_that.type,_that.testNode,_that.snippetName,_that.widgetSpanChildType,_that.testWidgetSpanChildNode);case AddSiblingBefore() when addSiblingBefore != null:
return addSiblingBefore(_that.type,_that.snippetName,_that.testNode);case AddSiblingAfter() when addSiblingAfter != null:
return addSiblingAfter(_that.type,_that.snippetName,_that.testNode);case PasteReplacement() when pasteReplacement != null:
return pasteReplacement(_that.widgetSpanChildType);case PasteChild() when pasteChild != null:
return pasteChild(_that.widgetSpanChildType,_that.testWidgetSpanChildNode);case PasteSiblingBefore() when pasteSiblingBefore != null:
return pasteSiblingBefore();case PasteSiblingAfter() when pasteSiblingAfter != null:
return pasteSiblingAfter();case DeleteNodeTapped() when deleteNodeTapped != null:
return deleteNodeTapped();case CompleteDeletion() when completeDeletion != null:
return completeDeletion();case CopySnippetJsonToClipboard() when copySnippetJsonToClipboard != null:
return copySnippetJsonToClipboard(_that.rootNode);case ReplaceSnippetFromJson() when replaceSnippetFromJson != null:
return replaceSnippetFromJson(_that.snippetJson);case CopyNode() when copyNode != null:
return copyNode(_that.node,_that.scName,_that.skipSave);case CutNode() when cutNode != null:
return cutNode(_that.node,_that.scName,_that.skipSave);case SelectedDirectoryOrNode() when selectedDirectoryOrNode != null:
return selectedDirectoryOrNode(_that.snippetName,_that.selectedNode);case ImageChanged() when imageChanged != null:
return imageChanged(_that.newBytes);case ForceSnippetRefresh() when forceSnippetRefresh != null:
return forceSnippetRefresh();case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( bool asGuestEditor)  signedIn,required TResult Function()  signedOut,required TResult Function( String wName,  int index,  GlobalKey gk)  overrideTargetGK,required TResult Function( bool onlyTargetsWrappers)  forceRefresh,required TResult Function( SnippetName? snippetName)  toggleSnippetVisibility,required TResult Function( SNode? newContent,  ScrollControllerName? scName,  dynamic skipSave)  updateClipboard,required TResult Function( SnippetName snippetName,  VersionId versionId)  publishSnippet,required TResult Function( SnippetName snippetName,  VersionId versionId)  revertSnippet,required TResult Function( String pathName)  deletePage,required TResult Function( SnippetName snippetName)  toggleAutoPublishingOfSnippet,required TResult Function( bool b)  autoPublishDefault,required TResult Function( SnippetName snippetName,  PanelName panelName)  setPanelOrPlaceholderSnippet,required TResult Function( SnippetName snippetName)  enterSelectWidgetMode,required TResult Function()  exitSelectWidgetMode,required TResult Function( SnippetRootNode rootNode,  SNode? selectedNode)  pushSnippetEditor,required TResult Function( bool save)  popSnippetEditor,required TResult Function()  showDirectoryTree,required TResult Function( bool save)  removeDirectoryTree,required TResult Function( SNode node)  selectNode,required TResult Function()  clearNodeSelection,required TResult Function( SNode node,  String newSnippetName)  saveNodeAsSnippet,required TResult Function( Type? type,  SnippetName? snippetName,  SNode? testNode)  replaceSelectionWith,required TResult Function( Type? type,  SnippetName? snippetName,  SNode? testNode)  wrapSelectionWith,required TResult Function( Type? type,  SNode? testNode,  SnippetName? snippetName,  Type? widgetSpanChildType,  SNode? testWidgetSpanChildNode)  appendChild,required TResult Function( Type? type,  SnippetName? snippetName,  SNode? testNode)  addSiblingBefore,required TResult Function( Type? type,  SnippetName? snippetName,  SNode? testNode)  addSiblingAfter,required TResult Function( Type? widgetSpanChildType)  pasteReplacement,required TResult Function( Type? widgetSpanChildType,  SNode? testWidgetSpanChildNode)  pasteChild,required TResult Function()  pasteSiblingBefore,required TResult Function()  pasteSiblingAfter,required TResult Function()  deleteNodeTapped,required TResult Function()  completeDeletion,required TResult Function( SnippetRootNode rootNode)  copySnippetJsonToClipboard,required TResult Function( String? snippetJson)  replaceSnippetFromJson,required TResult Function( SNode node,  ScrollControllerName? scName,  dynamic skipSave)  copyNode,required TResult Function( SNode node,  ScrollControllerName? scName,  dynamic skipSave)  cutNode,required TResult Function( SnippetName snippetName,  SNode? selectedNode)  selectedDirectoryOrNode,required TResult Function( Uint8List? newBytes)  imageChanged,required TResult Function()  forceSnippetRefresh,}) {final _that = this;
switch (_that) {
case SignedIn():
return signedIn(_that.asGuestEditor);case SignedOut():
return signedOut();case OverrideTargetGK():
return overrideTargetGK(_that.wName,_that.index,_that.gk);case ForceRefresh():
return forceRefresh(_that.onlyTargetsWrappers);case ToggleSnippetVisibility():
return toggleSnippetVisibility(_that.snippetName);case UpdateClipboard():
return updateClipboard(_that.newContent,_that.scName,_that.skipSave);case PublishSnippet():
return publishSnippet(_that.snippetName,_that.versionId);case RevertSnippet():
return revertSnippet(_that.snippetName,_that.versionId);case DeletePage():
return deletePage(_that.pathName);case ToggleAutoPublishingOfSnippet():
return toggleAutoPublishingOfSnippet(_that.snippetName);case AutoPublishDefault():
return autoPublishDefault(_that.b);case SetPanelSnippet():
return setPanelOrPlaceholderSnippet(_that.snippetName,_that.panelName);case EnterSelectWidgetMode():
return enterSelectWidgetMode(_that.snippetName);case ExitSelectWidgetMode():
return exitSelectWidgetMode();case PushSnippetEditor():
return pushSnippetEditor(_that.rootNode,_that.selectedNode);case PopSnippetEditor():
return popSnippetEditor(_that.save);case ShowDirectoryTree():
return showDirectoryTree();case RemoveDirectoryTree():
return removeDirectoryTree(_that.save);case SelectNode():
return selectNode(_that.node);case ClearNodeSelection():
return clearNodeSelection();case SaveNodeAsSnippet():
return saveNodeAsSnippet(_that.node,_that.newSnippetName);case ReplaceSelectionWith():
return replaceSelectionWith(_that.type,_that.snippetName,_that.testNode);case WrapSelectionWith():
return wrapSelectionWith(_that.type,_that.snippetName,_that.testNode);case AppendChild():
return appendChild(_that.type,_that.testNode,_that.snippetName,_that.widgetSpanChildType,_that.testWidgetSpanChildNode);case AddSiblingBefore():
return addSiblingBefore(_that.type,_that.snippetName,_that.testNode);case AddSiblingAfter():
return addSiblingAfter(_that.type,_that.snippetName,_that.testNode);case PasteReplacement():
return pasteReplacement(_that.widgetSpanChildType);case PasteChild():
return pasteChild(_that.widgetSpanChildType,_that.testWidgetSpanChildNode);case PasteSiblingBefore():
return pasteSiblingBefore();case PasteSiblingAfter():
return pasteSiblingAfter();case DeleteNodeTapped():
return deleteNodeTapped();case CompleteDeletion():
return completeDeletion();case CopySnippetJsonToClipboard():
return copySnippetJsonToClipboard(_that.rootNode);case ReplaceSnippetFromJson():
return replaceSnippetFromJson(_that.snippetJson);case CopyNode():
return copyNode(_that.node,_that.scName,_that.skipSave);case CutNode():
return cutNode(_that.node,_that.scName,_that.skipSave);case SelectedDirectoryOrNode():
return selectedDirectoryOrNode(_that.snippetName,_that.selectedNode);case ImageChanged():
return imageChanged(_that.newBytes);case ForceSnippetRefresh():
return forceSnippetRefresh();case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( bool asGuestEditor)?  signedIn,TResult? Function()?  signedOut,TResult? Function( String wName,  int index,  GlobalKey gk)?  overrideTargetGK,TResult? Function( bool onlyTargetsWrappers)?  forceRefresh,TResult? Function( SnippetName? snippetName)?  toggleSnippetVisibility,TResult? Function( SNode? newContent,  ScrollControllerName? scName,  dynamic skipSave)?  updateClipboard,TResult? Function( SnippetName snippetName,  VersionId versionId)?  publishSnippet,TResult? Function( SnippetName snippetName,  VersionId versionId)?  revertSnippet,TResult? Function( String pathName)?  deletePage,TResult? Function( SnippetName snippetName)?  toggleAutoPublishingOfSnippet,TResult? Function( bool b)?  autoPublishDefault,TResult? Function( SnippetName snippetName,  PanelName panelName)?  setPanelOrPlaceholderSnippet,TResult? Function( SnippetName snippetName)?  enterSelectWidgetMode,TResult? Function()?  exitSelectWidgetMode,TResult? Function( SnippetRootNode rootNode,  SNode? selectedNode)?  pushSnippetEditor,TResult? Function( bool save)?  popSnippetEditor,TResult? Function()?  showDirectoryTree,TResult? Function( bool save)?  removeDirectoryTree,TResult? Function( SNode node)?  selectNode,TResult? Function()?  clearNodeSelection,TResult? Function( SNode node,  String newSnippetName)?  saveNodeAsSnippet,TResult? Function( Type? type,  SnippetName? snippetName,  SNode? testNode)?  replaceSelectionWith,TResult? Function( Type? type,  SnippetName? snippetName,  SNode? testNode)?  wrapSelectionWith,TResult? Function( Type? type,  SNode? testNode,  SnippetName? snippetName,  Type? widgetSpanChildType,  SNode? testWidgetSpanChildNode)?  appendChild,TResult? Function( Type? type,  SnippetName? snippetName,  SNode? testNode)?  addSiblingBefore,TResult? Function( Type? type,  SnippetName? snippetName,  SNode? testNode)?  addSiblingAfter,TResult? Function( Type? widgetSpanChildType)?  pasteReplacement,TResult? Function( Type? widgetSpanChildType,  SNode? testWidgetSpanChildNode)?  pasteChild,TResult? Function()?  pasteSiblingBefore,TResult? Function()?  pasteSiblingAfter,TResult? Function()?  deleteNodeTapped,TResult? Function()?  completeDeletion,TResult? Function( SnippetRootNode rootNode)?  copySnippetJsonToClipboard,TResult? Function( String? snippetJson)?  replaceSnippetFromJson,TResult? Function( SNode node,  ScrollControllerName? scName,  dynamic skipSave)?  copyNode,TResult? Function( SNode node,  ScrollControllerName? scName,  dynamic skipSave)?  cutNode,TResult? Function( SnippetName snippetName,  SNode? selectedNode)?  selectedDirectoryOrNode,TResult? Function( Uint8List? newBytes)?  imageChanged,TResult? Function()?  forceSnippetRefresh,}) {final _that = this;
switch (_that) {
case SignedIn() when signedIn != null:
return signedIn(_that.asGuestEditor);case SignedOut() when signedOut != null:
return signedOut();case OverrideTargetGK() when overrideTargetGK != null:
return overrideTargetGK(_that.wName,_that.index,_that.gk);case ForceRefresh() when forceRefresh != null:
return forceRefresh(_that.onlyTargetsWrappers);case ToggleSnippetVisibility() when toggleSnippetVisibility != null:
return toggleSnippetVisibility(_that.snippetName);case UpdateClipboard() when updateClipboard != null:
return updateClipboard(_that.newContent,_that.scName,_that.skipSave);case PublishSnippet() when publishSnippet != null:
return publishSnippet(_that.snippetName,_that.versionId);case RevertSnippet() when revertSnippet != null:
return revertSnippet(_that.snippetName,_that.versionId);case DeletePage() when deletePage != null:
return deletePage(_that.pathName);case ToggleAutoPublishingOfSnippet() when toggleAutoPublishingOfSnippet != null:
return toggleAutoPublishingOfSnippet(_that.snippetName);case AutoPublishDefault() when autoPublishDefault != null:
return autoPublishDefault(_that.b);case SetPanelSnippet() when setPanelOrPlaceholderSnippet != null:
return setPanelOrPlaceholderSnippet(_that.snippetName,_that.panelName);case EnterSelectWidgetMode() when enterSelectWidgetMode != null:
return enterSelectWidgetMode(_that.snippetName);case ExitSelectWidgetMode() when exitSelectWidgetMode != null:
return exitSelectWidgetMode();case PushSnippetEditor() when pushSnippetEditor != null:
return pushSnippetEditor(_that.rootNode,_that.selectedNode);case PopSnippetEditor() when popSnippetEditor != null:
return popSnippetEditor(_that.save);case ShowDirectoryTree() when showDirectoryTree != null:
return showDirectoryTree();case RemoveDirectoryTree() when removeDirectoryTree != null:
return removeDirectoryTree(_that.save);case SelectNode() when selectNode != null:
return selectNode(_that.node);case ClearNodeSelection() when clearNodeSelection != null:
return clearNodeSelection();case SaveNodeAsSnippet() when saveNodeAsSnippet != null:
return saveNodeAsSnippet(_that.node,_that.newSnippetName);case ReplaceSelectionWith() when replaceSelectionWith != null:
return replaceSelectionWith(_that.type,_that.snippetName,_that.testNode);case WrapSelectionWith() when wrapSelectionWith != null:
return wrapSelectionWith(_that.type,_that.snippetName,_that.testNode);case AppendChild() when appendChild != null:
return appendChild(_that.type,_that.testNode,_that.snippetName,_that.widgetSpanChildType,_that.testWidgetSpanChildNode);case AddSiblingBefore() when addSiblingBefore != null:
return addSiblingBefore(_that.type,_that.snippetName,_that.testNode);case AddSiblingAfter() when addSiblingAfter != null:
return addSiblingAfter(_that.type,_that.snippetName,_that.testNode);case PasteReplacement() when pasteReplacement != null:
return pasteReplacement(_that.widgetSpanChildType);case PasteChild() when pasteChild != null:
return pasteChild(_that.widgetSpanChildType,_that.testWidgetSpanChildNode);case PasteSiblingBefore() when pasteSiblingBefore != null:
return pasteSiblingBefore();case PasteSiblingAfter() when pasteSiblingAfter != null:
return pasteSiblingAfter();case DeleteNodeTapped() when deleteNodeTapped != null:
return deleteNodeTapped();case CompleteDeletion() when completeDeletion != null:
return completeDeletion();case CopySnippetJsonToClipboard() when copySnippetJsonToClipboard != null:
return copySnippetJsonToClipboard(_that.rootNode);case ReplaceSnippetFromJson() when replaceSnippetFromJson != null:
return replaceSnippetFromJson(_that.snippetJson);case CopyNode() when copyNode != null:
return copyNode(_that.node,_that.scName,_that.skipSave);case CutNode() when cutNode != null:
return cutNode(_that.node,_that.scName,_that.skipSave);case SelectedDirectoryOrNode() when selectedDirectoryOrNode != null:
return selectedDirectoryOrNode(_that.snippetName,_that.selectedNode);case ImageChanged() when imageChanged != null:
return imageChanged(_that.newBytes);case ForceSnippetRefresh() when forceSnippetRefresh != null:
return forceSnippetRefresh();case _:
  return null;

}
}

}

/// @nodoc


class SignedIn extends CAPIEvent with DiagnosticableTreeMixin {
  const SignedIn({this.asGuestEditor = false}): super._();
  

@JsonKey() final  bool asGuestEditor;

/// Create a copy of CAPIEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignedInCopyWith<SignedIn> get copyWith => _$SignedInCopyWithImpl<SignedIn>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CAPIEvent.signedIn'))
    ..add(DiagnosticsProperty('asGuestEditor', asGuestEditor));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignedIn&&(identical(other.asGuestEditor, asGuestEditor) || other.asGuestEditor == asGuestEditor));
}


@override
int get hashCode => Object.hash(runtimeType,asGuestEditor);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CAPIEvent.signedIn(asGuestEditor: $asGuestEditor)';
}


}

/// @nodoc
abstract mixin class $SignedInCopyWith<$Res> implements $CAPIEventCopyWith<$Res> {
  factory $SignedInCopyWith(SignedIn value, $Res Function(SignedIn) _then) = _$SignedInCopyWithImpl;
@useResult
$Res call({
 bool asGuestEditor
});




}
/// @nodoc
class _$SignedInCopyWithImpl<$Res>
    implements $SignedInCopyWith<$Res> {
  _$SignedInCopyWithImpl(this._self, this._then);

  final SignedIn _self;
  final $Res Function(SignedIn) _then;

/// Create a copy of CAPIEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? asGuestEditor = null,}) {
  return _then(SignedIn(
asGuestEditor: null == asGuestEditor ? _self.asGuestEditor : asGuestEditor // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class SignedOut extends CAPIEvent with DiagnosticableTreeMixin {
  const SignedOut(): super._();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CAPIEvent.signedOut'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignedOut);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CAPIEvent.signedOut()';
}


}




/// @nodoc


class OverrideTargetGK extends CAPIEvent with DiagnosticableTreeMixin {
  const OverrideTargetGK({required this.wName, required this.index, required this.gk}): super._();
  

 final  String wName;
 final  int index;
 final  GlobalKey gk;

/// Create a copy of CAPIEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OverrideTargetGKCopyWith<OverrideTargetGK> get copyWith => _$OverrideTargetGKCopyWithImpl<OverrideTargetGK>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CAPIEvent.overrideTargetGK'))
    ..add(DiagnosticsProperty('wName', wName))..add(DiagnosticsProperty('index', index))..add(DiagnosticsProperty('gk', gk));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OverrideTargetGK&&(identical(other.wName, wName) || other.wName == wName)&&(identical(other.index, index) || other.index == index)&&(identical(other.gk, gk) || other.gk == gk));
}


@override
int get hashCode => Object.hash(runtimeType,wName,index,gk);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CAPIEvent.overrideTargetGK(wName: $wName, index: $index, gk: $gk)';
}


}

/// @nodoc
abstract mixin class $OverrideTargetGKCopyWith<$Res> implements $CAPIEventCopyWith<$Res> {
  factory $OverrideTargetGKCopyWith(OverrideTargetGK value, $Res Function(OverrideTargetGK) _then) = _$OverrideTargetGKCopyWithImpl;
@useResult
$Res call({
 String wName, int index, GlobalKey gk
});




}
/// @nodoc
class _$OverrideTargetGKCopyWithImpl<$Res>
    implements $OverrideTargetGKCopyWith<$Res> {
  _$OverrideTargetGKCopyWithImpl(this._self, this._then);

  final OverrideTargetGK _self;
  final $Res Function(OverrideTargetGK) _then;

/// Create a copy of CAPIEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? wName = null,Object? index = null,Object? gk = null,}) {
  return _then(OverrideTargetGK(
wName: null == wName ? _self.wName : wName // ignore: cast_nullable_to_non_nullable
as String,index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,gk: null == gk ? _self.gk : gk // ignore: cast_nullable_to_non_nullable
as GlobalKey,
  ));
}


}

/// @nodoc


class ForceRefresh extends CAPIEvent with DiagnosticableTreeMixin {
  const ForceRefresh({this.onlyTargetsWrappers = false}): super._();
  

@JsonKey() final  bool onlyTargetsWrappers;

/// Create a copy of CAPIEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForceRefreshCopyWith<ForceRefresh> get copyWith => _$ForceRefreshCopyWithImpl<ForceRefresh>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CAPIEvent.forceRefresh'))
    ..add(DiagnosticsProperty('onlyTargetsWrappers', onlyTargetsWrappers));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForceRefresh&&(identical(other.onlyTargetsWrappers, onlyTargetsWrappers) || other.onlyTargetsWrappers == onlyTargetsWrappers));
}


@override
int get hashCode => Object.hash(runtimeType,onlyTargetsWrappers);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CAPIEvent.forceRefresh(onlyTargetsWrappers: $onlyTargetsWrappers)';
}


}

/// @nodoc
abstract mixin class $ForceRefreshCopyWith<$Res> implements $CAPIEventCopyWith<$Res> {
  factory $ForceRefreshCopyWith(ForceRefresh value, $Res Function(ForceRefresh) _then) = _$ForceRefreshCopyWithImpl;
@useResult
$Res call({
 bool onlyTargetsWrappers
});




}
/// @nodoc
class _$ForceRefreshCopyWithImpl<$Res>
    implements $ForceRefreshCopyWith<$Res> {
  _$ForceRefreshCopyWithImpl(this._self, this._then);

  final ForceRefresh _self;
  final $Res Function(ForceRefresh) _then;

/// Create a copy of CAPIEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? onlyTargetsWrappers = null,}) {
  return _then(ForceRefresh(
onlyTargetsWrappers: null == onlyTargetsWrappers ? _self.onlyTargetsWrappers : onlyTargetsWrappers // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class ToggleSnippetVisibility extends CAPIEvent with DiagnosticableTreeMixin {
  const ToggleSnippetVisibility({this.snippetName}): super._();
  

 final  SnippetName? snippetName;

/// Create a copy of CAPIEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToggleSnippetVisibilityCopyWith<ToggleSnippetVisibility> get copyWith => _$ToggleSnippetVisibilityCopyWithImpl<ToggleSnippetVisibility>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CAPIEvent.toggleSnippetVisibility'))
    ..add(DiagnosticsProperty('snippetName', snippetName));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToggleSnippetVisibility&&(identical(other.snippetName, snippetName) || other.snippetName == snippetName));
}


@override
int get hashCode => Object.hash(runtimeType,snippetName);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CAPIEvent.toggleSnippetVisibility(snippetName: $snippetName)';
}


}

/// @nodoc
abstract mixin class $ToggleSnippetVisibilityCopyWith<$Res> implements $CAPIEventCopyWith<$Res> {
  factory $ToggleSnippetVisibilityCopyWith(ToggleSnippetVisibility value, $Res Function(ToggleSnippetVisibility) _then) = _$ToggleSnippetVisibilityCopyWithImpl;
@useResult
$Res call({
 SnippetName? snippetName
});




}
/// @nodoc
class _$ToggleSnippetVisibilityCopyWithImpl<$Res>
    implements $ToggleSnippetVisibilityCopyWith<$Res> {
  _$ToggleSnippetVisibilityCopyWithImpl(this._self, this._then);

  final ToggleSnippetVisibility _self;
  final $Res Function(ToggleSnippetVisibility) _then;

/// Create a copy of CAPIEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? snippetName = freezed,}) {
  return _then(ToggleSnippetVisibility(
snippetName: freezed == snippetName ? _self.snippetName : snippetName // ignore: cast_nullable_to_non_nullable
as SnippetName?,
  ));
}


}

/// @nodoc


class UpdateClipboard extends CAPIEvent with DiagnosticableTreeMixin {
  const UpdateClipboard({required this.newContent, required this.scName, this.skipSave = false}): super._();
  

 final  SNode? newContent;
 final  ScrollControllerName? scName;
@JsonKey() final  dynamic skipSave;

/// Create a copy of CAPIEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateClipboardCopyWith<UpdateClipboard> get copyWith => _$UpdateClipboardCopyWithImpl<UpdateClipboard>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CAPIEvent.updateClipboard'))
    ..add(DiagnosticsProperty('newContent', newContent))..add(DiagnosticsProperty('scName', scName))..add(DiagnosticsProperty('skipSave', skipSave));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateClipboard&&(identical(other.newContent, newContent) || other.newContent == newContent)&&(identical(other.scName, scName) || other.scName == scName)&&const DeepCollectionEquality().equals(other.skipSave, skipSave));
}


@override
int get hashCode => Object.hash(runtimeType,newContent,scName,const DeepCollectionEquality().hash(skipSave));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CAPIEvent.updateClipboard(newContent: $newContent, scName: $scName, skipSave: $skipSave)';
}


}

/// @nodoc
abstract mixin class $UpdateClipboardCopyWith<$Res> implements $CAPIEventCopyWith<$Res> {
  factory $UpdateClipboardCopyWith(UpdateClipboard value, $Res Function(UpdateClipboard) _then) = _$UpdateClipboardCopyWithImpl;
@useResult
$Res call({
 SNode? newContent, ScrollControllerName? scName, dynamic skipSave
});




}
/// @nodoc
class _$UpdateClipboardCopyWithImpl<$Res>
    implements $UpdateClipboardCopyWith<$Res> {
  _$UpdateClipboardCopyWithImpl(this._self, this._then);

  final UpdateClipboard _self;
  final $Res Function(UpdateClipboard) _then;

/// Create a copy of CAPIEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? newContent = freezed,Object? scName = freezed,Object? skipSave = freezed,}) {
  return _then(UpdateClipboard(
newContent: freezed == newContent ? _self.newContent : newContent // ignore: cast_nullable_to_non_nullable
as SNode?,scName: freezed == scName ? _self.scName : scName // ignore: cast_nullable_to_non_nullable
as ScrollControllerName?,skipSave: freezed == skipSave ? _self.skipSave : skipSave // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

/// @nodoc


class PublishSnippet extends CAPIEvent with DiagnosticableTreeMixin {
  const PublishSnippet({required this.snippetName, required this.versionId}): super._();
  

 final  SnippetName snippetName;
 final  VersionId versionId;

/// Create a copy of CAPIEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PublishSnippetCopyWith<PublishSnippet> get copyWith => _$PublishSnippetCopyWithImpl<PublishSnippet>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CAPIEvent.publishSnippet'))
    ..add(DiagnosticsProperty('snippetName', snippetName))..add(DiagnosticsProperty('versionId', versionId));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PublishSnippet&&(identical(other.snippetName, snippetName) || other.snippetName == snippetName)&&(identical(other.versionId, versionId) || other.versionId == versionId));
}


@override
int get hashCode => Object.hash(runtimeType,snippetName,versionId);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CAPIEvent.publishSnippet(snippetName: $snippetName, versionId: $versionId)';
}


}

/// @nodoc
abstract mixin class $PublishSnippetCopyWith<$Res> implements $CAPIEventCopyWith<$Res> {
  factory $PublishSnippetCopyWith(PublishSnippet value, $Res Function(PublishSnippet) _then) = _$PublishSnippetCopyWithImpl;
@useResult
$Res call({
 SnippetName snippetName, VersionId versionId
});




}
/// @nodoc
class _$PublishSnippetCopyWithImpl<$Res>
    implements $PublishSnippetCopyWith<$Res> {
  _$PublishSnippetCopyWithImpl(this._self, this._then);

  final PublishSnippet _self;
  final $Res Function(PublishSnippet) _then;

/// Create a copy of CAPIEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? snippetName = null,Object? versionId = null,}) {
  return _then(PublishSnippet(
snippetName: null == snippetName ? _self.snippetName : snippetName // ignore: cast_nullable_to_non_nullable
as SnippetName,versionId: null == versionId ? _self.versionId : versionId // ignore: cast_nullable_to_non_nullable
as VersionId,
  ));
}


}

/// @nodoc


class RevertSnippet extends CAPIEvent with DiagnosticableTreeMixin {
  const RevertSnippet({required this.snippetName, required this.versionId}): super._();
  

 final  SnippetName snippetName;
 final  VersionId versionId;

/// Create a copy of CAPIEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RevertSnippetCopyWith<RevertSnippet> get copyWith => _$RevertSnippetCopyWithImpl<RevertSnippet>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CAPIEvent.revertSnippet'))
    ..add(DiagnosticsProperty('snippetName', snippetName))..add(DiagnosticsProperty('versionId', versionId));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RevertSnippet&&(identical(other.snippetName, snippetName) || other.snippetName == snippetName)&&(identical(other.versionId, versionId) || other.versionId == versionId));
}


@override
int get hashCode => Object.hash(runtimeType,snippetName,versionId);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CAPIEvent.revertSnippet(snippetName: $snippetName, versionId: $versionId)';
}


}

/// @nodoc
abstract mixin class $RevertSnippetCopyWith<$Res> implements $CAPIEventCopyWith<$Res> {
  factory $RevertSnippetCopyWith(RevertSnippet value, $Res Function(RevertSnippet) _then) = _$RevertSnippetCopyWithImpl;
@useResult
$Res call({
 SnippetName snippetName, VersionId versionId
});




}
/// @nodoc
class _$RevertSnippetCopyWithImpl<$Res>
    implements $RevertSnippetCopyWith<$Res> {
  _$RevertSnippetCopyWithImpl(this._self, this._then);

  final RevertSnippet _self;
  final $Res Function(RevertSnippet) _then;

/// Create a copy of CAPIEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? snippetName = null,Object? versionId = null,}) {
  return _then(RevertSnippet(
snippetName: null == snippetName ? _self.snippetName : snippetName // ignore: cast_nullable_to_non_nullable
as SnippetName,versionId: null == versionId ? _self.versionId : versionId // ignore: cast_nullable_to_non_nullable
as VersionId,
  ));
}


}

/// @nodoc


class DeletePage extends CAPIEvent with DiagnosticableTreeMixin {
  const DeletePage({required this.pathName}): super._();
  

 final  String pathName;

/// Create a copy of CAPIEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeletePageCopyWith<DeletePage> get copyWith => _$DeletePageCopyWithImpl<DeletePage>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CAPIEvent.deletePage'))
    ..add(DiagnosticsProperty('pathName', pathName));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeletePage&&(identical(other.pathName, pathName) || other.pathName == pathName));
}


@override
int get hashCode => Object.hash(runtimeType,pathName);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CAPIEvent.deletePage(pathName: $pathName)';
}


}

/// @nodoc
abstract mixin class $DeletePageCopyWith<$Res> implements $CAPIEventCopyWith<$Res> {
  factory $DeletePageCopyWith(DeletePage value, $Res Function(DeletePage) _then) = _$DeletePageCopyWithImpl;
@useResult
$Res call({
 String pathName
});




}
/// @nodoc
class _$DeletePageCopyWithImpl<$Res>
    implements $DeletePageCopyWith<$Res> {
  _$DeletePageCopyWithImpl(this._self, this._then);

  final DeletePage _self;
  final $Res Function(DeletePage) _then;

/// Create a copy of CAPIEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? pathName = null,}) {
  return _then(DeletePage(
pathName: null == pathName ? _self.pathName : pathName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ToggleAutoPublishingOfSnippet extends CAPIEvent with DiagnosticableTreeMixin {
  const ToggleAutoPublishingOfSnippet({required this.snippetName}): super._();
  

 final  SnippetName snippetName;

/// Create a copy of CAPIEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToggleAutoPublishingOfSnippetCopyWith<ToggleAutoPublishingOfSnippet> get copyWith => _$ToggleAutoPublishingOfSnippetCopyWithImpl<ToggleAutoPublishingOfSnippet>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CAPIEvent.toggleAutoPublishingOfSnippet'))
    ..add(DiagnosticsProperty('snippetName', snippetName));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToggleAutoPublishingOfSnippet&&(identical(other.snippetName, snippetName) || other.snippetName == snippetName));
}


@override
int get hashCode => Object.hash(runtimeType,snippetName);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CAPIEvent.toggleAutoPublishingOfSnippet(snippetName: $snippetName)';
}


}

/// @nodoc
abstract mixin class $ToggleAutoPublishingOfSnippetCopyWith<$Res> implements $CAPIEventCopyWith<$Res> {
  factory $ToggleAutoPublishingOfSnippetCopyWith(ToggleAutoPublishingOfSnippet value, $Res Function(ToggleAutoPublishingOfSnippet) _then) = _$ToggleAutoPublishingOfSnippetCopyWithImpl;
@useResult
$Res call({
 SnippetName snippetName
});




}
/// @nodoc
class _$ToggleAutoPublishingOfSnippetCopyWithImpl<$Res>
    implements $ToggleAutoPublishingOfSnippetCopyWith<$Res> {
  _$ToggleAutoPublishingOfSnippetCopyWithImpl(this._self, this._then);

  final ToggleAutoPublishingOfSnippet _self;
  final $Res Function(ToggleAutoPublishingOfSnippet) _then;

/// Create a copy of CAPIEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? snippetName = null,}) {
  return _then(ToggleAutoPublishingOfSnippet(
snippetName: null == snippetName ? _self.snippetName : snippetName // ignore: cast_nullable_to_non_nullable
as SnippetName,
  ));
}


}

/// @nodoc


class AutoPublishDefault extends CAPIEvent with DiagnosticableTreeMixin {
  const AutoPublishDefault({required this.b}): super._();
  

 final  bool b;

/// Create a copy of CAPIEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AutoPublishDefaultCopyWith<AutoPublishDefault> get copyWith => _$AutoPublishDefaultCopyWithImpl<AutoPublishDefault>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CAPIEvent.autoPublishDefault'))
    ..add(DiagnosticsProperty('b', b));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AutoPublishDefault&&(identical(other.b, b) || other.b == b));
}


@override
int get hashCode => Object.hash(runtimeType,b);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CAPIEvent.autoPublishDefault(b: $b)';
}


}

/// @nodoc
abstract mixin class $AutoPublishDefaultCopyWith<$Res> implements $CAPIEventCopyWith<$Res> {
  factory $AutoPublishDefaultCopyWith(AutoPublishDefault value, $Res Function(AutoPublishDefault) _then) = _$AutoPublishDefaultCopyWithImpl;
@useResult
$Res call({
 bool b
});




}
/// @nodoc
class _$AutoPublishDefaultCopyWithImpl<$Res>
    implements $AutoPublishDefaultCopyWith<$Res> {
  _$AutoPublishDefaultCopyWithImpl(this._self, this._then);

  final AutoPublishDefault _self;
  final $Res Function(AutoPublishDefault) _then;

/// Create a copy of CAPIEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? b = null,}) {
  return _then(AutoPublishDefault(
b: null == b ? _self.b : b // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class SetPanelSnippet extends CAPIEvent with DiagnosticableTreeMixin {
  const SetPanelSnippet({required this.snippetName, required this.panelName}): super._();
  

 final  SnippetName snippetName;
 final  PanelName panelName;

/// Create a copy of CAPIEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SetPanelSnippetCopyWith<SetPanelSnippet> get copyWith => _$SetPanelSnippetCopyWithImpl<SetPanelSnippet>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CAPIEvent.setPanelOrPlaceholderSnippet'))
    ..add(DiagnosticsProperty('snippetName', snippetName))..add(DiagnosticsProperty('panelName', panelName));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SetPanelSnippet&&(identical(other.snippetName, snippetName) || other.snippetName == snippetName)&&(identical(other.panelName, panelName) || other.panelName == panelName));
}


@override
int get hashCode => Object.hash(runtimeType,snippetName,panelName);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CAPIEvent.setPanelOrPlaceholderSnippet(snippetName: $snippetName, panelName: $panelName)';
}


}

/// @nodoc
abstract mixin class $SetPanelSnippetCopyWith<$Res> implements $CAPIEventCopyWith<$Res> {
  factory $SetPanelSnippetCopyWith(SetPanelSnippet value, $Res Function(SetPanelSnippet) _then) = _$SetPanelSnippetCopyWithImpl;
@useResult
$Res call({
 SnippetName snippetName, PanelName panelName
});




}
/// @nodoc
class _$SetPanelSnippetCopyWithImpl<$Res>
    implements $SetPanelSnippetCopyWith<$Res> {
  _$SetPanelSnippetCopyWithImpl(this._self, this._then);

  final SetPanelSnippet _self;
  final $Res Function(SetPanelSnippet) _then;

/// Create a copy of CAPIEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? snippetName = null,Object? panelName = null,}) {
  return _then(SetPanelSnippet(
snippetName: null == snippetName ? _self.snippetName : snippetName // ignore: cast_nullable_to_non_nullable
as SnippetName,panelName: null == panelName ? _self.panelName : panelName // ignore: cast_nullable_to_non_nullable
as PanelName,
  ));
}


}

/// @nodoc


class EnterSelectWidgetMode extends CAPIEvent with DiagnosticableTreeMixin {
  const EnterSelectWidgetMode({required this.snippetName}): super._();
  

 final  SnippetName snippetName;

/// Create a copy of CAPIEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EnterSelectWidgetModeCopyWith<EnterSelectWidgetMode> get copyWith => _$EnterSelectWidgetModeCopyWithImpl<EnterSelectWidgetMode>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CAPIEvent.enterSelectWidgetMode'))
    ..add(DiagnosticsProperty('snippetName', snippetName));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EnterSelectWidgetMode&&(identical(other.snippetName, snippetName) || other.snippetName == snippetName));
}


@override
int get hashCode => Object.hash(runtimeType,snippetName);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CAPIEvent.enterSelectWidgetMode(snippetName: $snippetName)';
}


}

/// @nodoc
abstract mixin class $EnterSelectWidgetModeCopyWith<$Res> implements $CAPIEventCopyWith<$Res> {
  factory $EnterSelectWidgetModeCopyWith(EnterSelectWidgetMode value, $Res Function(EnterSelectWidgetMode) _then) = _$EnterSelectWidgetModeCopyWithImpl;
@useResult
$Res call({
 SnippetName snippetName
});




}
/// @nodoc
class _$EnterSelectWidgetModeCopyWithImpl<$Res>
    implements $EnterSelectWidgetModeCopyWith<$Res> {
  _$EnterSelectWidgetModeCopyWithImpl(this._self, this._then);

  final EnterSelectWidgetMode _self;
  final $Res Function(EnterSelectWidgetMode) _then;

/// Create a copy of CAPIEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? snippetName = null,}) {
  return _then(EnterSelectWidgetMode(
snippetName: null == snippetName ? _self.snippetName : snippetName // ignore: cast_nullable_to_non_nullable
as SnippetName,
  ));
}


}

/// @nodoc


class ExitSelectWidgetMode extends CAPIEvent with DiagnosticableTreeMixin {
  const ExitSelectWidgetMode(): super._();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CAPIEvent.exitSelectWidgetMode'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExitSelectWidgetMode);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CAPIEvent.exitSelectWidgetMode()';
}


}




/// @nodoc


class PushSnippetEditor extends CAPIEvent with DiagnosticableTreeMixin {
  const PushSnippetEditor({required this.rootNode, this.selectedNode}): super._();
  

 final  SnippetRootNode rootNode;
 final  SNode? selectedNode;

/// Create a copy of CAPIEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PushSnippetEditorCopyWith<PushSnippetEditor> get copyWith => _$PushSnippetEditorCopyWithImpl<PushSnippetEditor>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CAPIEvent.pushSnippetEditor'))
    ..add(DiagnosticsProperty('rootNode', rootNode))..add(DiagnosticsProperty('selectedNode', selectedNode));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PushSnippetEditor&&(identical(other.rootNode, rootNode) || other.rootNode == rootNode)&&(identical(other.selectedNode, selectedNode) || other.selectedNode == selectedNode));
}


@override
int get hashCode => Object.hash(runtimeType,rootNode,selectedNode);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CAPIEvent.pushSnippetEditor(rootNode: $rootNode, selectedNode: $selectedNode)';
}


}

/// @nodoc
abstract mixin class $PushSnippetEditorCopyWith<$Res> implements $CAPIEventCopyWith<$Res> {
  factory $PushSnippetEditorCopyWith(PushSnippetEditor value, $Res Function(PushSnippetEditor) _then) = _$PushSnippetEditorCopyWithImpl;
@useResult
$Res call({
 SnippetRootNode rootNode, SNode? selectedNode
});




}
/// @nodoc
class _$PushSnippetEditorCopyWithImpl<$Res>
    implements $PushSnippetEditorCopyWith<$Res> {
  _$PushSnippetEditorCopyWithImpl(this._self, this._then);

  final PushSnippetEditor _self;
  final $Res Function(PushSnippetEditor) _then;

/// Create a copy of CAPIEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? rootNode = null,Object? selectedNode = freezed,}) {
  return _then(PushSnippetEditor(
rootNode: null == rootNode ? _self.rootNode : rootNode // ignore: cast_nullable_to_non_nullable
as SnippetRootNode,selectedNode: freezed == selectedNode ? _self.selectedNode : selectedNode // ignore: cast_nullable_to_non_nullable
as SNode?,
  ));
}


}

/// @nodoc


class PopSnippetEditor extends CAPIEvent with DiagnosticableTreeMixin {
  const PopSnippetEditor({this.save = false}): super._();
  

@JsonKey() final  bool save;

/// Create a copy of CAPIEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PopSnippetEditorCopyWith<PopSnippetEditor> get copyWith => _$PopSnippetEditorCopyWithImpl<PopSnippetEditor>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CAPIEvent.popSnippetEditor'))
    ..add(DiagnosticsProperty('save', save));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PopSnippetEditor&&(identical(other.save, save) || other.save == save));
}


@override
int get hashCode => Object.hash(runtimeType,save);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CAPIEvent.popSnippetEditor(save: $save)';
}


}

/// @nodoc
abstract mixin class $PopSnippetEditorCopyWith<$Res> implements $CAPIEventCopyWith<$Res> {
  factory $PopSnippetEditorCopyWith(PopSnippetEditor value, $Res Function(PopSnippetEditor) _then) = _$PopSnippetEditorCopyWithImpl;
@useResult
$Res call({
 bool save
});




}
/// @nodoc
class _$PopSnippetEditorCopyWithImpl<$Res>
    implements $PopSnippetEditorCopyWith<$Res> {
  _$PopSnippetEditorCopyWithImpl(this._self, this._then);

  final PopSnippetEditor _self;
  final $Res Function(PopSnippetEditor) _then;

/// Create a copy of CAPIEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? save = null,}) {
  return _then(PopSnippetEditor(
save: null == save ? _self.save : save // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class ShowDirectoryTree extends CAPIEvent with DiagnosticableTreeMixin {
  const ShowDirectoryTree(): super._();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CAPIEvent.showDirectoryTree'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShowDirectoryTree);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CAPIEvent.showDirectoryTree()';
}


}




/// @nodoc


class RemoveDirectoryTree extends CAPIEvent with DiagnosticableTreeMixin {
  const RemoveDirectoryTree({this.save = false}): super._();
  

@JsonKey() final  bool save;

/// Create a copy of CAPIEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RemoveDirectoryTreeCopyWith<RemoveDirectoryTree> get copyWith => _$RemoveDirectoryTreeCopyWithImpl<RemoveDirectoryTree>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CAPIEvent.removeDirectoryTree'))
    ..add(DiagnosticsProperty('save', save));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemoveDirectoryTree&&(identical(other.save, save) || other.save == save));
}


@override
int get hashCode => Object.hash(runtimeType,save);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CAPIEvent.removeDirectoryTree(save: $save)';
}


}

/// @nodoc
abstract mixin class $RemoveDirectoryTreeCopyWith<$Res> implements $CAPIEventCopyWith<$Res> {
  factory $RemoveDirectoryTreeCopyWith(RemoveDirectoryTree value, $Res Function(RemoveDirectoryTree) _then) = _$RemoveDirectoryTreeCopyWithImpl;
@useResult
$Res call({
 bool save
});




}
/// @nodoc
class _$RemoveDirectoryTreeCopyWithImpl<$Res>
    implements $RemoveDirectoryTreeCopyWith<$Res> {
  _$RemoveDirectoryTreeCopyWithImpl(this._self, this._then);

  final RemoveDirectoryTree _self;
  final $Res Function(RemoveDirectoryTree) _then;

/// Create a copy of CAPIEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? save = null,}) {
  return _then(RemoveDirectoryTree(
save: null == save ? _self.save : save // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class SelectNode extends CAPIEvent with DiagnosticableTreeMixin {
  const SelectNode({required this.node}): super._();
  

 final  SNode node;

/// Create a copy of CAPIEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SelectNodeCopyWith<SelectNode> get copyWith => _$SelectNodeCopyWithImpl<SelectNode>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CAPIEvent.selectNode'))
    ..add(DiagnosticsProperty('node', node));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectNode&&(identical(other.node, node) || other.node == node));
}


@override
int get hashCode => Object.hash(runtimeType,node);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CAPIEvent.selectNode(node: $node)';
}


}

/// @nodoc
abstract mixin class $SelectNodeCopyWith<$Res> implements $CAPIEventCopyWith<$Res> {
  factory $SelectNodeCopyWith(SelectNode value, $Res Function(SelectNode) _then) = _$SelectNodeCopyWithImpl;
@useResult
$Res call({
 SNode node
});




}
/// @nodoc
class _$SelectNodeCopyWithImpl<$Res>
    implements $SelectNodeCopyWith<$Res> {
  _$SelectNodeCopyWithImpl(this._self, this._then);

  final SelectNode _self;
  final $Res Function(SelectNode) _then;

/// Create a copy of CAPIEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? node = null,}) {
  return _then(SelectNode(
node: null == node ? _self.node : node // ignore: cast_nullable_to_non_nullable
as SNode,
  ));
}


}

/// @nodoc


class ClearNodeSelection extends CAPIEvent with DiagnosticableTreeMixin {
  const ClearNodeSelection(): super._();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CAPIEvent.clearNodeSelection'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClearNodeSelection);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CAPIEvent.clearNodeSelection()';
}


}




/// @nodoc


class SaveNodeAsSnippet extends CAPIEvent with DiagnosticableTreeMixin {
  const SaveNodeAsSnippet({required this.node, required this.newSnippetName}): super._();
  

 final  SNode node;
 final  String newSnippetName;

/// Create a copy of CAPIEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SaveNodeAsSnippetCopyWith<SaveNodeAsSnippet> get copyWith => _$SaveNodeAsSnippetCopyWithImpl<SaveNodeAsSnippet>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CAPIEvent.saveNodeAsSnippet'))
    ..add(DiagnosticsProperty('node', node))..add(DiagnosticsProperty('newSnippetName', newSnippetName));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SaveNodeAsSnippet&&(identical(other.node, node) || other.node == node)&&(identical(other.newSnippetName, newSnippetName) || other.newSnippetName == newSnippetName));
}


@override
int get hashCode => Object.hash(runtimeType,node,newSnippetName);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CAPIEvent.saveNodeAsSnippet(node: $node, newSnippetName: $newSnippetName)';
}


}

/// @nodoc
abstract mixin class $SaveNodeAsSnippetCopyWith<$Res> implements $CAPIEventCopyWith<$Res> {
  factory $SaveNodeAsSnippetCopyWith(SaveNodeAsSnippet value, $Res Function(SaveNodeAsSnippet) _then) = _$SaveNodeAsSnippetCopyWithImpl;
@useResult
$Res call({
 SNode node, String newSnippetName
});




}
/// @nodoc
class _$SaveNodeAsSnippetCopyWithImpl<$Res>
    implements $SaveNodeAsSnippetCopyWith<$Res> {
  _$SaveNodeAsSnippetCopyWithImpl(this._self, this._then);

  final SaveNodeAsSnippet _self;
  final $Res Function(SaveNodeAsSnippet) _then;

/// Create a copy of CAPIEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? node = null,Object? newSnippetName = null,}) {
  return _then(SaveNodeAsSnippet(
node: null == node ? _self.node : node // ignore: cast_nullable_to_non_nullable
as SNode,newSnippetName: null == newSnippetName ? _self.newSnippetName : newSnippetName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ReplaceSelectionWith extends CAPIEvent with DiagnosticableTreeMixin {
  const ReplaceSelectionWith({this.type, this.snippetName, this.testNode}): super._();
  

 final  Type? type;
 final  SnippetName? snippetName;
// only used when type is SnippetRefNode
 final  SNode? testNode;

/// Create a copy of CAPIEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReplaceSelectionWithCopyWith<ReplaceSelectionWith> get copyWith => _$ReplaceSelectionWithCopyWithImpl<ReplaceSelectionWith>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CAPIEvent.replaceSelectionWith'))
    ..add(DiagnosticsProperty('type', type))..add(DiagnosticsProperty('snippetName', snippetName))..add(DiagnosticsProperty('testNode', testNode));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReplaceSelectionWith&&(identical(other.type, type) || other.type == type)&&(identical(other.snippetName, snippetName) || other.snippetName == snippetName)&&(identical(other.testNode, testNode) || other.testNode == testNode));
}


@override
int get hashCode => Object.hash(runtimeType,type,snippetName,testNode);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CAPIEvent.replaceSelectionWith(type: $type, snippetName: $snippetName, testNode: $testNode)';
}


}

/// @nodoc
abstract mixin class $ReplaceSelectionWithCopyWith<$Res> implements $CAPIEventCopyWith<$Res> {
  factory $ReplaceSelectionWithCopyWith(ReplaceSelectionWith value, $Res Function(ReplaceSelectionWith) _then) = _$ReplaceSelectionWithCopyWithImpl;
@useResult
$Res call({
 Type? type, SnippetName? snippetName, SNode? testNode
});




}
/// @nodoc
class _$ReplaceSelectionWithCopyWithImpl<$Res>
    implements $ReplaceSelectionWithCopyWith<$Res> {
  _$ReplaceSelectionWithCopyWithImpl(this._self, this._then);

  final ReplaceSelectionWith _self;
  final $Res Function(ReplaceSelectionWith) _then;

/// Create a copy of CAPIEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? type = freezed,Object? snippetName = freezed,Object? testNode = freezed,}) {
  return _then(ReplaceSelectionWith(
type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as Type?,snippetName: freezed == snippetName ? _self.snippetName : snippetName // ignore: cast_nullable_to_non_nullable
as SnippetName?,testNode: freezed == testNode ? _self.testNode : testNode // ignore: cast_nullable_to_non_nullable
as SNode?,
  ));
}


}

/// @nodoc


class WrapSelectionWith extends CAPIEvent with DiagnosticableTreeMixin {
  const WrapSelectionWith({this.type, this.snippetName, this.testNode}): super._();
  

 final  Type? type;
 final  SnippetName? snippetName;
// only used when type is SnippetRefNode
 final  SNode? testNode;

/// Create a copy of CAPIEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WrapSelectionWithCopyWith<WrapSelectionWith> get copyWith => _$WrapSelectionWithCopyWithImpl<WrapSelectionWith>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CAPIEvent.wrapSelectionWith'))
    ..add(DiagnosticsProperty('type', type))..add(DiagnosticsProperty('snippetName', snippetName))..add(DiagnosticsProperty('testNode', testNode));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WrapSelectionWith&&(identical(other.type, type) || other.type == type)&&(identical(other.snippetName, snippetName) || other.snippetName == snippetName)&&(identical(other.testNode, testNode) || other.testNode == testNode));
}


@override
int get hashCode => Object.hash(runtimeType,type,snippetName,testNode);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CAPIEvent.wrapSelectionWith(type: $type, snippetName: $snippetName, testNode: $testNode)';
}


}

/// @nodoc
abstract mixin class $WrapSelectionWithCopyWith<$Res> implements $CAPIEventCopyWith<$Res> {
  factory $WrapSelectionWithCopyWith(WrapSelectionWith value, $Res Function(WrapSelectionWith) _then) = _$WrapSelectionWithCopyWithImpl;
@useResult
$Res call({
 Type? type, SnippetName? snippetName, SNode? testNode
});




}
/// @nodoc
class _$WrapSelectionWithCopyWithImpl<$Res>
    implements $WrapSelectionWithCopyWith<$Res> {
  _$WrapSelectionWithCopyWithImpl(this._self, this._then);

  final WrapSelectionWith _self;
  final $Res Function(WrapSelectionWith) _then;

/// Create a copy of CAPIEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? type = freezed,Object? snippetName = freezed,Object? testNode = freezed,}) {
  return _then(WrapSelectionWith(
type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as Type?,snippetName: freezed == snippetName ? _self.snippetName : snippetName // ignore: cast_nullable_to_non_nullable
as SnippetName?,testNode: freezed == testNode ? _self.testNode : testNode // ignore: cast_nullable_to_non_nullable
as SNode?,
  ));
}


}

/// @nodoc


class AppendChild extends CAPIEvent with DiagnosticableTreeMixin {
  const AppendChild({this.type, this.testNode, this.snippetName, this.widgetSpanChildType, this.testWidgetSpanChildNode}): super._();
  

 final  Type? type;
 final  SNode? testNode;
 final  SnippetName? snippetName;
// only used when type is SnippetRefNode
 final  Type? widgetSpanChildType;
 final  SNode? testWidgetSpanChildNode;

/// Create a copy of CAPIEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppendChildCopyWith<AppendChild> get copyWith => _$AppendChildCopyWithImpl<AppendChild>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CAPIEvent.appendChild'))
    ..add(DiagnosticsProperty('type', type))..add(DiagnosticsProperty('testNode', testNode))..add(DiagnosticsProperty('snippetName', snippetName))..add(DiagnosticsProperty('widgetSpanChildType', widgetSpanChildType))..add(DiagnosticsProperty('testWidgetSpanChildNode', testWidgetSpanChildNode));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppendChild&&(identical(other.type, type) || other.type == type)&&(identical(other.testNode, testNode) || other.testNode == testNode)&&(identical(other.snippetName, snippetName) || other.snippetName == snippetName)&&(identical(other.widgetSpanChildType, widgetSpanChildType) || other.widgetSpanChildType == widgetSpanChildType)&&(identical(other.testWidgetSpanChildNode, testWidgetSpanChildNode) || other.testWidgetSpanChildNode == testWidgetSpanChildNode));
}


@override
int get hashCode => Object.hash(runtimeType,type,testNode,snippetName,widgetSpanChildType,testWidgetSpanChildNode);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CAPIEvent.appendChild(type: $type, testNode: $testNode, snippetName: $snippetName, widgetSpanChildType: $widgetSpanChildType, testWidgetSpanChildNode: $testWidgetSpanChildNode)';
}


}

/// @nodoc
abstract mixin class $AppendChildCopyWith<$Res> implements $CAPIEventCopyWith<$Res> {
  factory $AppendChildCopyWith(AppendChild value, $Res Function(AppendChild) _then) = _$AppendChildCopyWithImpl;
@useResult
$Res call({
 Type? type, SNode? testNode, SnippetName? snippetName, Type? widgetSpanChildType, SNode? testWidgetSpanChildNode
});




}
/// @nodoc
class _$AppendChildCopyWithImpl<$Res>
    implements $AppendChildCopyWith<$Res> {
  _$AppendChildCopyWithImpl(this._self, this._then);

  final AppendChild _self;
  final $Res Function(AppendChild) _then;

/// Create a copy of CAPIEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? type = freezed,Object? testNode = freezed,Object? snippetName = freezed,Object? widgetSpanChildType = freezed,Object? testWidgetSpanChildNode = freezed,}) {
  return _then(AppendChild(
type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as Type?,testNode: freezed == testNode ? _self.testNode : testNode // ignore: cast_nullable_to_non_nullable
as SNode?,snippetName: freezed == snippetName ? _self.snippetName : snippetName // ignore: cast_nullable_to_non_nullable
as SnippetName?,widgetSpanChildType: freezed == widgetSpanChildType ? _self.widgetSpanChildType : widgetSpanChildType // ignore: cast_nullable_to_non_nullable
as Type?,testWidgetSpanChildNode: freezed == testWidgetSpanChildNode ? _self.testWidgetSpanChildNode : testWidgetSpanChildNode // ignore: cast_nullable_to_non_nullable
as SNode?,
  ));
}


}

/// @nodoc


class AddSiblingBefore extends CAPIEvent with DiagnosticableTreeMixin {
  const AddSiblingBefore({this.type, this.snippetName, this.testNode}): super._();
  

 final  Type? type;
 final  SnippetName? snippetName;
// only used when type is SnippetRefNode
 final  SNode? testNode;

/// Create a copy of CAPIEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddSiblingBeforeCopyWith<AddSiblingBefore> get copyWith => _$AddSiblingBeforeCopyWithImpl<AddSiblingBefore>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CAPIEvent.addSiblingBefore'))
    ..add(DiagnosticsProperty('type', type))..add(DiagnosticsProperty('snippetName', snippetName))..add(DiagnosticsProperty('testNode', testNode));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddSiblingBefore&&(identical(other.type, type) || other.type == type)&&(identical(other.snippetName, snippetName) || other.snippetName == snippetName)&&(identical(other.testNode, testNode) || other.testNode == testNode));
}


@override
int get hashCode => Object.hash(runtimeType,type,snippetName,testNode);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CAPIEvent.addSiblingBefore(type: $type, snippetName: $snippetName, testNode: $testNode)';
}


}

/// @nodoc
abstract mixin class $AddSiblingBeforeCopyWith<$Res> implements $CAPIEventCopyWith<$Res> {
  factory $AddSiblingBeforeCopyWith(AddSiblingBefore value, $Res Function(AddSiblingBefore) _then) = _$AddSiblingBeforeCopyWithImpl;
@useResult
$Res call({
 Type? type, SnippetName? snippetName, SNode? testNode
});




}
/// @nodoc
class _$AddSiblingBeforeCopyWithImpl<$Res>
    implements $AddSiblingBeforeCopyWith<$Res> {
  _$AddSiblingBeforeCopyWithImpl(this._self, this._then);

  final AddSiblingBefore _self;
  final $Res Function(AddSiblingBefore) _then;

/// Create a copy of CAPIEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? type = freezed,Object? snippetName = freezed,Object? testNode = freezed,}) {
  return _then(AddSiblingBefore(
type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as Type?,snippetName: freezed == snippetName ? _self.snippetName : snippetName // ignore: cast_nullable_to_non_nullable
as SnippetName?,testNode: freezed == testNode ? _self.testNode : testNode // ignore: cast_nullable_to_non_nullable
as SNode?,
  ));
}


}

/// @nodoc


class AddSiblingAfter extends CAPIEvent with DiagnosticableTreeMixin {
  const AddSiblingAfter({this.type, this.snippetName, this.testNode}): super._();
  

 final  Type? type;
 final  SnippetName? snippetName;
// only used when type is SnippetRefNode
 final  SNode? testNode;

/// Create a copy of CAPIEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddSiblingAfterCopyWith<AddSiblingAfter> get copyWith => _$AddSiblingAfterCopyWithImpl<AddSiblingAfter>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CAPIEvent.addSiblingAfter'))
    ..add(DiagnosticsProperty('type', type))..add(DiagnosticsProperty('snippetName', snippetName))..add(DiagnosticsProperty('testNode', testNode));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddSiblingAfter&&(identical(other.type, type) || other.type == type)&&(identical(other.snippetName, snippetName) || other.snippetName == snippetName)&&(identical(other.testNode, testNode) || other.testNode == testNode));
}


@override
int get hashCode => Object.hash(runtimeType,type,snippetName,testNode);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CAPIEvent.addSiblingAfter(type: $type, snippetName: $snippetName, testNode: $testNode)';
}


}

/// @nodoc
abstract mixin class $AddSiblingAfterCopyWith<$Res> implements $CAPIEventCopyWith<$Res> {
  factory $AddSiblingAfterCopyWith(AddSiblingAfter value, $Res Function(AddSiblingAfter) _then) = _$AddSiblingAfterCopyWithImpl;
@useResult
$Res call({
 Type? type, SnippetName? snippetName, SNode? testNode
});




}
/// @nodoc
class _$AddSiblingAfterCopyWithImpl<$Res>
    implements $AddSiblingAfterCopyWith<$Res> {
  _$AddSiblingAfterCopyWithImpl(this._self, this._then);

  final AddSiblingAfter _self;
  final $Res Function(AddSiblingAfter) _then;

/// Create a copy of CAPIEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? type = freezed,Object? snippetName = freezed,Object? testNode = freezed,}) {
  return _then(AddSiblingAfter(
type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as Type?,snippetName: freezed == snippetName ? _self.snippetName : snippetName // ignore: cast_nullable_to_non_nullable
as SnippetName?,testNode: freezed == testNode ? _self.testNode : testNode // ignore: cast_nullable_to_non_nullable
as SNode?,
  ));
}


}

/// @nodoc


class PasteReplacement extends CAPIEvent with DiagnosticableTreeMixin {
  const PasteReplacement({this.widgetSpanChildType}): super._();
  

// required STreeNode clipboardNode,
 final  Type? widgetSpanChildType;

/// Create a copy of CAPIEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PasteReplacementCopyWith<PasteReplacement> get copyWith => _$PasteReplacementCopyWithImpl<PasteReplacement>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CAPIEvent.pasteReplacement'))
    ..add(DiagnosticsProperty('widgetSpanChildType', widgetSpanChildType));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PasteReplacement&&(identical(other.widgetSpanChildType, widgetSpanChildType) || other.widgetSpanChildType == widgetSpanChildType));
}


@override
int get hashCode => Object.hash(runtimeType,widgetSpanChildType);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CAPIEvent.pasteReplacement(widgetSpanChildType: $widgetSpanChildType)';
}


}

/// @nodoc
abstract mixin class $PasteReplacementCopyWith<$Res> implements $CAPIEventCopyWith<$Res> {
  factory $PasteReplacementCopyWith(PasteReplacement value, $Res Function(PasteReplacement) _then) = _$PasteReplacementCopyWithImpl;
@useResult
$Res call({
 Type? widgetSpanChildType
});




}
/// @nodoc
class _$PasteReplacementCopyWithImpl<$Res>
    implements $PasteReplacementCopyWith<$Res> {
  _$PasteReplacementCopyWithImpl(this._self, this._then);

  final PasteReplacement _self;
  final $Res Function(PasteReplacement) _then;

/// Create a copy of CAPIEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? widgetSpanChildType = freezed,}) {
  return _then(PasteReplacement(
widgetSpanChildType: freezed == widgetSpanChildType ? _self.widgetSpanChildType : widgetSpanChildType // ignore: cast_nullable_to_non_nullable
as Type?,
  ));
}


}

/// @nodoc


class PasteChild extends CAPIEvent with DiagnosticableTreeMixin {
  const PasteChild({this.widgetSpanChildType, this.testWidgetSpanChildNode}): super._();
  

// required STreeNode clipboardNode,
 final  Type? widgetSpanChildType;
 final  SNode? testWidgetSpanChildNode;

/// Create a copy of CAPIEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PasteChildCopyWith<PasteChild> get copyWith => _$PasteChildCopyWithImpl<PasteChild>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CAPIEvent.pasteChild'))
    ..add(DiagnosticsProperty('widgetSpanChildType', widgetSpanChildType))..add(DiagnosticsProperty('testWidgetSpanChildNode', testWidgetSpanChildNode));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PasteChild&&(identical(other.widgetSpanChildType, widgetSpanChildType) || other.widgetSpanChildType == widgetSpanChildType)&&(identical(other.testWidgetSpanChildNode, testWidgetSpanChildNode) || other.testWidgetSpanChildNode == testWidgetSpanChildNode));
}


@override
int get hashCode => Object.hash(runtimeType,widgetSpanChildType,testWidgetSpanChildNode);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CAPIEvent.pasteChild(widgetSpanChildType: $widgetSpanChildType, testWidgetSpanChildNode: $testWidgetSpanChildNode)';
}


}

/// @nodoc
abstract mixin class $PasteChildCopyWith<$Res> implements $CAPIEventCopyWith<$Res> {
  factory $PasteChildCopyWith(PasteChild value, $Res Function(PasteChild) _then) = _$PasteChildCopyWithImpl;
@useResult
$Res call({
 Type? widgetSpanChildType, SNode? testWidgetSpanChildNode
});




}
/// @nodoc
class _$PasteChildCopyWithImpl<$Res>
    implements $PasteChildCopyWith<$Res> {
  _$PasteChildCopyWithImpl(this._self, this._then);

  final PasteChild _self;
  final $Res Function(PasteChild) _then;

/// Create a copy of CAPIEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? widgetSpanChildType = freezed,Object? testWidgetSpanChildNode = freezed,}) {
  return _then(PasteChild(
widgetSpanChildType: freezed == widgetSpanChildType ? _self.widgetSpanChildType : widgetSpanChildType // ignore: cast_nullable_to_non_nullable
as Type?,testWidgetSpanChildNode: freezed == testWidgetSpanChildNode ? _self.testWidgetSpanChildNode : testWidgetSpanChildNode // ignore: cast_nullable_to_non_nullable
as SNode?,
  ));
}


}

/// @nodoc


class PasteSiblingBefore extends CAPIEvent with DiagnosticableTreeMixin {
  const PasteSiblingBefore(): super._();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CAPIEvent.pasteSiblingBefore'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PasteSiblingBefore);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CAPIEvent.pasteSiblingBefore()';
}


}




/// @nodoc


class PasteSiblingAfter extends CAPIEvent with DiagnosticableTreeMixin {
  const PasteSiblingAfter(): super._();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CAPIEvent.pasteSiblingAfter'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PasteSiblingAfter);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CAPIEvent.pasteSiblingAfter()';
}


}




/// @nodoc


class DeleteNodeTapped extends CAPIEvent with DiagnosticableTreeMixin {
  const DeleteNodeTapped(): super._();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CAPIEvent.deleteNodeTapped'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteNodeTapped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CAPIEvent.deleteNodeTapped()';
}


}




/// @nodoc


class CompleteDeletion extends CAPIEvent with DiagnosticableTreeMixin {
  const CompleteDeletion(): super._();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CAPIEvent.completeDeletion'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompleteDeletion);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CAPIEvent.completeDeletion()';
}


}




/// @nodoc


class CopySnippetJsonToClipboard extends CAPIEvent with DiagnosticableTreeMixin {
  const CopySnippetJsonToClipboard({required this.rootNode}): super._();
  

 final  SnippetRootNode rootNode;

/// Create a copy of CAPIEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CopySnippetJsonToClipboardCopyWith<CopySnippetJsonToClipboard> get copyWith => _$CopySnippetJsonToClipboardCopyWithImpl<CopySnippetJsonToClipboard>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CAPIEvent.copySnippetJsonToClipboard'))
    ..add(DiagnosticsProperty('rootNode', rootNode));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CopySnippetJsonToClipboard&&(identical(other.rootNode, rootNode) || other.rootNode == rootNode));
}


@override
int get hashCode => Object.hash(runtimeType,rootNode);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CAPIEvent.copySnippetJsonToClipboard(rootNode: $rootNode)';
}


}

/// @nodoc
abstract mixin class $CopySnippetJsonToClipboardCopyWith<$Res> implements $CAPIEventCopyWith<$Res> {
  factory $CopySnippetJsonToClipboardCopyWith(CopySnippetJsonToClipboard value, $Res Function(CopySnippetJsonToClipboard) _then) = _$CopySnippetJsonToClipboardCopyWithImpl;
@useResult
$Res call({
 SnippetRootNode rootNode
});




}
/// @nodoc
class _$CopySnippetJsonToClipboardCopyWithImpl<$Res>
    implements $CopySnippetJsonToClipboardCopyWith<$Res> {
  _$CopySnippetJsonToClipboardCopyWithImpl(this._self, this._then);

  final CopySnippetJsonToClipboard _self;
  final $Res Function(CopySnippetJsonToClipboard) _then;

/// Create a copy of CAPIEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? rootNode = null,}) {
  return _then(CopySnippetJsonToClipboard(
rootNode: null == rootNode ? _self.rootNode : rootNode // ignore: cast_nullable_to_non_nullable
as SnippetRootNode,
  ));
}


}

/// @nodoc


class ReplaceSnippetFromJson extends CAPIEvent with DiagnosticableTreeMixin {
  const ReplaceSnippetFromJson({this.snippetJson}): super._();
  

 final  String? snippetJson;

/// Create a copy of CAPIEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReplaceSnippetFromJsonCopyWith<ReplaceSnippetFromJson> get copyWith => _$ReplaceSnippetFromJsonCopyWithImpl<ReplaceSnippetFromJson>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CAPIEvent.replaceSnippetFromJson'))
    ..add(DiagnosticsProperty('snippetJson', snippetJson));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReplaceSnippetFromJson&&(identical(other.snippetJson, snippetJson) || other.snippetJson == snippetJson));
}


@override
int get hashCode => Object.hash(runtimeType,snippetJson);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CAPIEvent.replaceSnippetFromJson(snippetJson: $snippetJson)';
}


}

/// @nodoc
abstract mixin class $ReplaceSnippetFromJsonCopyWith<$Res> implements $CAPIEventCopyWith<$Res> {
  factory $ReplaceSnippetFromJsonCopyWith(ReplaceSnippetFromJson value, $Res Function(ReplaceSnippetFromJson) _then) = _$ReplaceSnippetFromJsonCopyWithImpl;
@useResult
$Res call({
 String? snippetJson
});




}
/// @nodoc
class _$ReplaceSnippetFromJsonCopyWithImpl<$Res>
    implements $ReplaceSnippetFromJsonCopyWith<$Res> {
  _$ReplaceSnippetFromJsonCopyWithImpl(this._self, this._then);

  final ReplaceSnippetFromJson _self;
  final $Res Function(ReplaceSnippetFromJson) _then;

/// Create a copy of CAPIEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? snippetJson = freezed,}) {
  return _then(ReplaceSnippetFromJson(
snippetJson: freezed == snippetJson ? _self.snippetJson : snippetJson // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class CopyNode extends CAPIEvent with DiagnosticableTreeMixin {
  const CopyNode({required this.node, required this.scName, this.skipSave = false}): super._();
  

 final  SNode node;
 final  ScrollControllerName? scName;
@JsonKey() final  dynamic skipSave;

/// Create a copy of CAPIEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CopyNodeCopyWith<CopyNode> get copyWith => _$CopyNodeCopyWithImpl<CopyNode>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CAPIEvent.copyNode'))
    ..add(DiagnosticsProperty('node', node))..add(DiagnosticsProperty('scName', scName))..add(DiagnosticsProperty('skipSave', skipSave));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CopyNode&&(identical(other.node, node) || other.node == node)&&(identical(other.scName, scName) || other.scName == scName)&&const DeepCollectionEquality().equals(other.skipSave, skipSave));
}


@override
int get hashCode => Object.hash(runtimeType,node,scName,const DeepCollectionEquality().hash(skipSave));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CAPIEvent.copyNode(node: $node, scName: $scName, skipSave: $skipSave)';
}


}

/// @nodoc
abstract mixin class $CopyNodeCopyWith<$Res> implements $CAPIEventCopyWith<$Res> {
  factory $CopyNodeCopyWith(CopyNode value, $Res Function(CopyNode) _then) = _$CopyNodeCopyWithImpl;
@useResult
$Res call({
 SNode node, ScrollControllerName? scName, dynamic skipSave
});




}
/// @nodoc
class _$CopyNodeCopyWithImpl<$Res>
    implements $CopyNodeCopyWith<$Res> {
  _$CopyNodeCopyWithImpl(this._self, this._then);

  final CopyNode _self;
  final $Res Function(CopyNode) _then;

/// Create a copy of CAPIEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? node = null,Object? scName = freezed,Object? skipSave = freezed,}) {
  return _then(CopyNode(
node: null == node ? _self.node : node // ignore: cast_nullable_to_non_nullable
as SNode,scName: freezed == scName ? _self.scName : scName // ignore: cast_nullable_to_non_nullable
as ScrollControllerName?,skipSave: freezed == skipSave ? _self.skipSave : skipSave // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

/// @nodoc


class CutNode extends CAPIEvent with DiagnosticableTreeMixin {
  const CutNode({required this.node, required this.scName, this.skipSave = false}): super._();
  

 final  SNode node;
 final  ScrollControllerName? scName;
@JsonKey() final  dynamic skipSave;

/// Create a copy of CAPIEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CutNodeCopyWith<CutNode> get copyWith => _$CutNodeCopyWithImpl<CutNode>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CAPIEvent.cutNode'))
    ..add(DiagnosticsProperty('node', node))..add(DiagnosticsProperty('scName', scName))..add(DiagnosticsProperty('skipSave', skipSave));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CutNode&&(identical(other.node, node) || other.node == node)&&(identical(other.scName, scName) || other.scName == scName)&&const DeepCollectionEquality().equals(other.skipSave, skipSave));
}


@override
int get hashCode => Object.hash(runtimeType,node,scName,const DeepCollectionEquality().hash(skipSave));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CAPIEvent.cutNode(node: $node, scName: $scName, skipSave: $skipSave)';
}


}

/// @nodoc
abstract mixin class $CutNodeCopyWith<$Res> implements $CAPIEventCopyWith<$Res> {
  factory $CutNodeCopyWith(CutNode value, $Res Function(CutNode) _then) = _$CutNodeCopyWithImpl;
@useResult
$Res call({
 SNode node, ScrollControllerName? scName, dynamic skipSave
});




}
/// @nodoc
class _$CutNodeCopyWithImpl<$Res>
    implements $CutNodeCopyWith<$Res> {
  _$CutNodeCopyWithImpl(this._self, this._then);

  final CutNode _self;
  final $Res Function(CutNode) _then;

/// Create a copy of CAPIEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? node = null,Object? scName = freezed,Object? skipSave = freezed,}) {
  return _then(CutNode(
node: null == node ? _self.node : node // ignore: cast_nullable_to_non_nullable
as SNode,scName: freezed == scName ? _self.scName : scName // ignore: cast_nullable_to_non_nullable
as ScrollControllerName?,skipSave: freezed == skipSave ? _self.skipSave : skipSave // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

/// @nodoc


class SelectedDirectoryOrNode extends CAPIEvent with DiagnosticableTreeMixin {
  const SelectedDirectoryOrNode({required this.snippetName, required this.selectedNode}): super._();
  

 final  SnippetName snippetName;
 final  SNode? selectedNode;

/// Create a copy of CAPIEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SelectedDirectoryOrNodeCopyWith<SelectedDirectoryOrNode> get copyWith => _$SelectedDirectoryOrNodeCopyWithImpl<SelectedDirectoryOrNode>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CAPIEvent.selectedDirectoryOrNode'))
    ..add(DiagnosticsProperty('snippetName', snippetName))..add(DiagnosticsProperty('selectedNode', selectedNode));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectedDirectoryOrNode&&(identical(other.snippetName, snippetName) || other.snippetName == snippetName)&&(identical(other.selectedNode, selectedNode) || other.selectedNode == selectedNode));
}


@override
int get hashCode => Object.hash(runtimeType,snippetName,selectedNode);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CAPIEvent.selectedDirectoryOrNode(snippetName: $snippetName, selectedNode: $selectedNode)';
}


}

/// @nodoc
abstract mixin class $SelectedDirectoryOrNodeCopyWith<$Res> implements $CAPIEventCopyWith<$Res> {
  factory $SelectedDirectoryOrNodeCopyWith(SelectedDirectoryOrNode value, $Res Function(SelectedDirectoryOrNode) _then) = _$SelectedDirectoryOrNodeCopyWithImpl;
@useResult
$Res call({
 SnippetName snippetName, SNode? selectedNode
});




}
/// @nodoc
class _$SelectedDirectoryOrNodeCopyWithImpl<$Res>
    implements $SelectedDirectoryOrNodeCopyWith<$Res> {
  _$SelectedDirectoryOrNodeCopyWithImpl(this._self, this._then);

  final SelectedDirectoryOrNode _self;
  final $Res Function(SelectedDirectoryOrNode) _then;

/// Create a copy of CAPIEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? snippetName = null,Object? selectedNode = freezed,}) {
  return _then(SelectedDirectoryOrNode(
snippetName: null == snippetName ? _self.snippetName : snippetName // ignore: cast_nullable_to_non_nullable
as SnippetName,selectedNode: freezed == selectedNode ? _self.selectedNode : selectedNode // ignore: cast_nullable_to_non_nullable
as SNode?,
  ));
}


}

/// @nodoc


class ImageChanged extends CAPIEvent with DiagnosticableTreeMixin {
  const ImageChanged({this.newBytes}): super._();
  

 final  Uint8List? newBytes;

/// Create a copy of CAPIEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImageChangedCopyWith<ImageChanged> get copyWith => _$ImageChangedCopyWithImpl<ImageChanged>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CAPIEvent.imageChanged'))
    ..add(DiagnosticsProperty('newBytes', newBytes));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImageChanged&&const DeepCollectionEquality().equals(other.newBytes, newBytes));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(newBytes));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CAPIEvent.imageChanged(newBytes: $newBytes)';
}


}

/// @nodoc
abstract mixin class $ImageChangedCopyWith<$Res> implements $CAPIEventCopyWith<$Res> {
  factory $ImageChangedCopyWith(ImageChanged value, $Res Function(ImageChanged) _then) = _$ImageChangedCopyWithImpl;
@useResult
$Res call({
 Uint8List? newBytes
});




}
/// @nodoc
class _$ImageChangedCopyWithImpl<$Res>
    implements $ImageChangedCopyWith<$Res> {
  _$ImageChangedCopyWithImpl(this._self, this._then);

  final ImageChanged _self;
  final $Res Function(ImageChanged) _then;

/// Create a copy of CAPIEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? newBytes = freezed,}) {
  return _then(ImageChanged(
newBytes: freezed == newBytes ? _self.newBytes : newBytes // ignore: cast_nullable_to_non_nullable
as Uint8List?,
  ));
}


}

/// @nodoc


class ForceSnippetRefresh extends CAPIEvent with DiagnosticableTreeMixin {
  const ForceSnippetRefresh(): super._();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CAPIEvent.forceSnippetRefresh'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForceSnippetRefresh);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CAPIEvent.forceSnippetRefresh()';
}


}




// dart format on
