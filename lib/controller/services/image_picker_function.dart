 import 'dart:io';
import 'package:cabskaro/controller/provider/loading_provider.dart';
import 'package:cabskaro/controller/services/services.dart';
import 'package:cabskaro/model/user_profile_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

final updateuserData =
FirebaseFirestore.instance.collection(UserProfile().collection);

void imagepickerFunc(
  ImageSource source, userId, BuildContext context) async {
  final loadingProvider = Provider.of<LoadingProvider>(context, listen: false);

  try {
    loadingProvider.setLoading(true);
    Navigator.of(context).pop();

    final value = await ImagePicker().pickImage(source: source);

    if (value != null) {
      File imagePath = File(value.path);
      final ref = FirebaseStorage.instance.ref("/usersImages/" +
          DateTime.now().millisecondsSinceEpoch.toString());
      UploadTask uploadTask = ref.putFile(imagePath.absolute);

      await uploadTask.whenComplete(() async {
        String downloadURL = await ref.getDownloadURL();

        loadingProvider.setLoading(false);

        await updateuserData.doc(userId).update({UserProfile().photo: downloadURL});
        Services().toastmsg("Image Updated Successfully", true);
      });

    } else {
      loadingProvider.setLoading(false); 
    }
  } catch (e) {
    loadingProvider.setLoading(false);
    Services().toastmsg("Upload Failed", false);
  }
}