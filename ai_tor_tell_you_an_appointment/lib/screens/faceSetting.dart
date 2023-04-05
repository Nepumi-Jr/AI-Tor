import 'package:ai_tor_tell_you_an_appointment/backend/LangManager.dart';
import 'package:flutter/material.dart';
import 'package:ai_tor_tell_you_an_appointment/backend/faceImage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:provider/provider.dart';
import 'package:ai_tor_tell_you_an_appointment/theme_style_provider.dart';

class FaceSettings extends StatefulWidget {
  const FaceSettings({Key? key}) : super(key: key);

  @override
  State<FaceSettings> createState() => _FaceSettingsState();
}

class _FaceSettingsState extends State<FaceSettings> {
  Future<void> onImageSelectAndCrop(int index) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) {
      return;
    }

    final isDarkMode =
        Provider.of<ThemeProvider>(context, listen: false).isDarkMode;

    //? Crop session
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: image.path,
      compressFormat: ImageCompressFormat.jpg,
      compressQuality: 100,
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: LangMan.get().setting.faceCropperTitle,
            toolbarColor: Theme.of(context).colorScheme.primary,
            toolbarWidgetColor: isDarkMode ? Colors.black : Colors.white,
            initAspectRatio: CropAspectRatioPreset.square,
            lockAspectRatio: true),
        IOSUiSettings(
          title: LangMan.get().setting.faceCropperTitle,
        ),
        WebUiSettings(
          context: context,
          presentStyle: CropperPresentStyle.dialog,
          boundary: const CroppieBoundary(
            width: 520,
            height: 520,
          ),
          viewPort:
              const CroppieViewPort(width: 480, height: 480, type: 'circle'),
          enableExif: true,
          enableZoom: true,
          showZoomer: true,
        ),
      ],
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
    );

    if (croppedFile == null) {
      return;
    }
    FaceImage.setImagePathIndex(index, croppedFile.path);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    List<String> titles = [
      LangMan.get().setting.faceHappyImage,
      LangMan.get().setting.faceNormalImage,
      LangMan.get().setting.faceSadImage,
      LangMan.get().setting.faceAngryImage,
      LangMan.get().setting.faceDeadImage
    ];
    return Scaffold(
        appBar: AppBar(title: Text("Image Setting",
          style: TextStyle(color: Theme.of(context).brightness != Brightness.dark ? Colors.black : Colors.white)),
            backgroundColor: Theme.of(context).brightness == Brightness.dark ? const Color.fromRGBO(66, 66, 66, 1) : Colors.white,
            foregroundColor: Theme.of(context).colorScheme.primary),
        body: ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  onTap: () => onImageSelectAndCrop(index),
                  title: Text(titles[index]),
                  trailing:
                      Image(image: FaceImage.getImageIndex(index), height: 200),
                  visualDensity: const VisualDensity(vertical: 4),
                ),
              );
            },
            itemCount: 5));
  }
}
