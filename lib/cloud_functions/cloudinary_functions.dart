import 'package:birddie/providers/user_provider.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

final cloudinary = CloudinaryPublic('myogamechanic', 'kf3reywm', cache: false);

String profilePictureUrl =
    "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png";
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
    print(response.secureUrl);
  } on CloudinaryException catch (e) {
    print(e.message);
    print(e.request);
  }
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
    context.read<UserProvider>().setProfilePicture(response.secureUrl);
    print(response.secureUrl);
  } on CloudinaryException catch (e) {
    print(e.message);
    print(e.request);
  }
}
