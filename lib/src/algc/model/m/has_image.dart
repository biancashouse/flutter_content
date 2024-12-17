import 'dart:convert';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter_content/flutter_content.dart';

typedef GetImageF = Future<Uint8List?> Function(String storageKey,
    {bool localOnly});

mixin HasImageInFBStorage {
  int? _imageSize; // we don't store the bytes, but we do the size (for updates)
  Uint8List? _imageBytes; // transient

  set imageSize(int? newSize) => _imageSize = newSize;

  int? get imageSize => _imageSize;

  set imageBytes(Uint8List? newBytes) => _imageBytes = newBytes;

  Uint8List? get imageBytes => _imageBytes;

  // https://stackoverflow.com/questions/63019132/flutter-how-to-put-listuint8list-into-shared-preferences
  Future<Uint8List?> getImage(
    String storageKey, {
    bool localOnly = false,
  }) async {
    if (imageSize == null || imageSize == 0) return null;

    // already cached ?
    if (imageBytes?.isNotEmpty ?? false) {
      imageSize = imageBytes!
          .lengthInBytes; // resetting the size is redundant, hopefully ?
      fco.logi(
        'getImage() returned memory-cached bytes: $imageSize',
      );
      return imageBytes;
    }

    // stored in local srore i.e. prefs or indexedDB ?
    // fco.logi('getting local-store-cached...', name: 'mixin HasImageInFBStorage');
    final s = fco.hiveBox?.get(storageKey);
    if (s != null) {
      imageBytes = base64Decode(s);
      if (imageBytes != null) {
        imageSize = imageBytes!.lengthInBytes;
        // fco.logi('getImage() returned local-store-cached bytes: $imageSize', name: 'mixin HasImageInFBStorage');
        return imageBytes;
      }
    }

    if (!localOnly) {
      // so not found locally, is it in firebase ?
      fco.logi('Downloading image from Firebase $storageKey...');
      firebase_storage.FirebaseStorage storage =
          firebase_storage.FirebaseStorage.instance;
      firebase_storage.Reference ref = storage.ref(storageKey);

      // fb storage getData
      Future<Uint8List?> downloadImageData() async {
        var metadata = await ref.getMetadata();
        if (metadata.contentType != 'application/octet-stream') {
          await ref.updateMetadata(firebase_storage.SettableMetadata(
              contentType: 'application/octet-stream'));
        }
        // clear in case of exception
        imageBytes = null;
        imageSize = 0;
        Uint8List? downloadedData = await ref.getData();
        // String url = await ref.getDownloadURL();
        // fco.logi('*** $url ***', name: 'mixin HasImageInFBStorage');
        // Image image = Image(image:PCacheImage(url));
        fco.logi(
            'getImage() returned downloaded bytes from FB Storage: $imageSize');
        imageBytes = downloadedData;
        imageSize = imageBytes!.lengthInBytes;
        // save to local storage
        String s = base64Encode(imageBytes!);
        await fco.hiveBox?.put(storageKey, s);
        fco.logi('saved to local store: $storageKey');
        return downloadedData;
      }

      try {
        Uint8List? data = await downloadImageData();
        return data;
      } on firebase_storage.FirebaseException catch (e) {
        fco.loge('_ensureCommentImagesExistInStorage error: ${e.message}');
        // fco.loge('\nSign in, and try again...\n');
        // await App.bloc.ensureCurrentEaSignedInToFirebase(FirebaseAuth.instance);
        // try {
        //   Uint8List? data = await downloadImageData();
        //   // save to local storage
        //   String s = base64Encode(data!);
        //   await fco.hiveBox.put(storageKey, s);
        //   fco.logi('saved to local store: $storageKey');
        //   return data;
        // } on firebase_storage.FirebaseException catch (e) {
        //   fco.loge(
        //       '_ensureCommentImagesExistInStorage error again: ${e.message}');
        // }
      }
    }

    return null;
  }
}
