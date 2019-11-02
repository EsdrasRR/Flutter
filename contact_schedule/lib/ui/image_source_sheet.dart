import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageSourceSheet extends StatelessWidget {
  final Function(File) onImageSelected;
  ImageSourceSheet({this.onImageSelected});

  void imageSelected(File image) async {
    if (image != null) {
      File croppedImage = await ImageCropper.cropImage(
          sourcePath: image.path,
          cropStyle: CropStyle.circle,
          aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1));
      if (croppedImage == null) {
        return;
      }
      onImageSelected(croppedImage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          FlatButton(
            child: Text('Camera'),
            onPressed: () async {
              File image =
                  await ImagePicker.pickImage(source: ImageSource.camera);
              imageSelected(image);
            },
          ),
          Divider(),
          FlatButton(
            child: Text('Gallery'),
            onPressed: () async {
              File image =
                  await ImagePicker.pickImage(source: ImageSource.gallery);
              imageSelected(image);
            },
          ),
        ],
      ),
    );
  }
}
