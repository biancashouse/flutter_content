// Copyright 2023, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_ui_localizations/firebase_ui_localizations.dart' show FirebaseUILocalizations;
import 'package:firebase_ui_storage/firebase_ui_storage.dart';
import 'package:firebase_ui_shared/firebase_ui_shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';

import 'fs_file_upload_btn.dart';

/// A button that uploads a Uint8List to Firebase Storage.
/// While upload is in progress, a [LoadingIndicator] is shown.
/// If an error occurs, [onError] is called.
class FSBytesUploadButton extends StatefulWidget {
  /// The storage instance to use.
  /// If not specified, [FirebaseStorage.instance] is used.

  final String fileName;
  final Uint8List bytes;

  /// {@macro ui.shared.widgets.button_variant}
  final ButtonVariant variant;

  /// A callback that is called when an error occurs.
  final void Function(Object? error, StackTrace? stackTrace) onError;

  /// A callback that is called when the upload is started.
  final Function(UploadTask task)? onUploadStarted;

  /// A callback that is called when the upload is complete.
  final Function(Reference ref) onUploadComplete;

  /// A metadata to be set on the uploaded file.
  final SettableMetadata? metadata;

  const FSBytesUploadButton({
    super.key,
    required this.onError,
    required this.onUploadComplete,
    this.onUploadStarted,
    this.variant = ButtonVariant.filled,
    this.metadata,
    // don't just upload into root folder
    required this.fileName,
    required this.bytes,
  });

  @override
  State<FSBytesUploadButton> createState() => _FSBytesUploadButtonState();
}

class _FSBytesUploadButtonState extends State<FSBytesUploadButton> {
  bool isLoading = false;

  Future<void> _upload(FirebaseUIStorageConfiguration config) async {
    try {
      setState(() {
        isLoading = true;
      });

      fco.afterNextBuildDo(() async {
        final folderRef = fco.folderPathRef('/plantuml-images');
        final childRef = config.namingPolicy.getUploadFileName(widget.fileName);
        final ref = folderRef.child(childRef);

        UploadTask task;

        task = ref.putData(widget.bytes, widget.metadata);

        widget.onUploadStarted?.call(task);
        await task;
        widget.onUploadComplete(ref);
      });
    } catch (e, stackTrace) {
      widget.onError(e, stackTrace);
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final config = context.configFor(FirebaseStorage.instance);
    final l = FirebaseUILocalizations.labelsOf(context);

    return LoadingButton(
      label: l.uploadButtonText,
      cupertinoIcon: CupertinoIcons.cloud_upload,
      materialIcon: Icons.upload_outlined,
      isLoading: isLoading,
      variant: widget.variant,
      onTap: () => _upload(config),
    );
  }

}
