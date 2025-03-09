import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/firebase_storage/has_image.dart';

mixin FirebaseStorageMixin {
  Future<void> createImagesInFBStorage(HasImageInFBStorage imageOwner) async {
    // if localStore contains aan image with this key
    String? storageKey = imageOwner.storageKey;
    if (storageKey == null) return;

    Uint8List? bytes = await imageOwner.getImage(storageKey, localOnly: true);
    if (bytes != null) {
      try {
        fco.logger.i('writing image data to storage key: $storageKey');
        FirebaseStorage storage = FirebaseStorage.instance;
        Reference ref = storage.ref(storageKey);
        /* FullMetadata metadata = */
        await ref.getMetadata();
        await ref.putData(bytes);
        imageOwner.imageSize = bytes.lengthInBytes;
        fco.logger.d(
            'wrote new image of ${imageOwner.imageSize} bytes to FB Storage.');
      } on FirebaseException catch (e) {
        fco.logger.d("Firestore Image Update failure: ${e.message}");
      }
    }
  }

  Future<void> ensureImageCreatedUpdatedOrRemovedInFBStorage(
    HasImageInFBStorage imageOwner,
  ) async {
    if (imageOwner.imageSize != null) {
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference ref = storage.ref(imageOwner.storageKey);
      // deleted image
      if (imageOwner.imageSize == 0) {
        try {
          ref.delete();
        } on FirebaseException catch (e) {
          fco.logger.d(
              "failed to remove image (${ref.fullPath}) from FB Storage: ${e.message}");
        } finally {
          imageOwner.imageSize = null;
          //flowchart.dirty = true;
        }
      } else if (imageOwner.imageSize! > 0) {
        Uint8List? imageBytes =
            await imageOwner.getImage(imageOwner.storageKey!, localOnly: true);
        if (imageBytes != null) {
          // only update is size mismatch
          try {
            FullMetadata metadata = await ref.getMetadata();
            if ((metadata.size ?? 0) != imageOwner.imageSize) {
              // doesn't match existing image, so rewrite
              await ref.putData(imageBytes);
              fco.logger.d(
                  'rewrote image of ${imageOwner.imageSize} bytes to FB Storage.');
            }
          } on FirebaseException catch (e) {
            if (e.code == 'object-not-found') {
              //not yet in storage, now try to save
              await ref.putData(imageBytes);
              fco.logger.d(
                  'wrote image of ${imageOwner.imageSize} bytes to FB Storage. (${imageOwner.storageKey})');
            } else {
              fco.logger.d("Firestore Image Update failure: ${e.message}");
            }
          }
        }
      }
    }
  }

  // deleting a flowcharts comments just requires deleting everything below that flowchartId
  Future<void> deleteItsImagesFromStorage(String storageUrl) async {
    try {
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference ref = storage.ref(storageUrl);
      _deleteFolderContents(ref.fullPath);
    } on FirebaseException catch (e) {
      fco.logger.d("Firestore Storage delete folder failure: ${e.message}");
    }
  }

  void _deleteFolderContents(String path) {
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref(path);
    ref.listAll().then((dir) {
      for (var fileRef in dir.items) {
        _deleteFile(ref.fullPath, fileRef.name);
      }
      for (var folderRef in dir.prefixes) {
        _deleteFolderContents(folderRef.fullPath);
      }
    });
  }

  void _deleteFile(pathToFile, fileName) {
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref(pathToFile);
    Reference childRef = ref.child(fileName);
    childRef.delete();
    fco.logger.d("Firestore Storage deleted file: $fileName");
  }

  Future<String> downloadUrl(String storageUrl) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    return storage.refFromURL(storageUrl).getDownloadURL();
  }
}
