import 'package:birddie/providers/user_provider.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

final cloudinary = CloudinaryPublic('myogamechanic', 'kf3reywm', cache: false);

String profilePictureUrl = '';
String profileVideoUrl = '';

final ImagePicker profilePicturePicker = ImagePicker();

setProfilePicture(BuildContext context) async {
  final XFile? image =
      await profilePicturePicker.pickImage(source: ImageSource.gallery);
  try {
    CloudinaryResponse response = await cloudinary.uploadFile(
      CloudinaryFile.fromFile(
        image!.path,
        folder: 'userProfileImages',
        resourceType: CloudinaryResourceType.Image,
      ),
    );
    profilePictureUrl = response.secureUrl;
    // ignore: use_build_context_synchronously
    context.read<UserProvider>().setProfilePicture(profilePictureUrl);
    // ignore: empty_catches
  } on CloudinaryException {}
}

setProfileVideo(BuildContext context) async {
  final XFile? image =
      await profilePicturePicker.pickVideo(source: ImageSource.gallery);
  try {
    CloudinaryResponse response = await cloudinary.uploadFile(
      CloudinaryFile.fromFile(
        image!.path,
        folder: 'userProfileVideos',
        resourceType: CloudinaryResourceType.Image,
      ),
    );
    // ignore: use_build_context_synchronously
    context.read<UserProvider>().setProfilePicture(response.secureUrl);
    // ignore: empty_catches
  } on CloudinaryException {}
}
