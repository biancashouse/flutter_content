import 'dart:collection';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:json_annotation/json_annotation.dart';

part 'snippet_info_model.mapper.dart';

@MappableClass()
class SnippetInfoModel with SnippetInfoModelMappable {
  VersionId? editingVersionId;
  VersionId? publishedVersionId;
  bool? autoPublish;

  SnippetInfoModel({this.editingVersionId, this.publishedVersionId, this.autoPublish});

  VersionId? get currentVersionId => FC().canEditContent ? editingVersionId : publishedVersionId;
}
