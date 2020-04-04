import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PictureTakerPage extends StatefulWidget {
  PictureTakerPage({Key key}) : super(key: key);

  @override
  _PictureTakerPageState createState() => _PictureTakerPageState();
}

class _PictureTakerPageState extends State<PictureTakerPage> {
  File image;
  _openGallery(BuildContext context) async {
    var selectedImage =
        await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      image = selectedImage;
    });
    Navigator.of(context).pop();
  }

  _openCamera(BuildContext context) async {
    var selectedImage = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      image = selectedImage;
    });
    Navigator.of(context).pop();
  }

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Select mage's source"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text("Gallery"),
                  ),
                  onTap: () {
                    _openGallery(context);
                  },
                ),
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text("Camera"),
                  ),
                  onTap: () {
                    _openCamera(context);
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _displayedImage() {
    if (image != null) {
      return Image.file(
        image,
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("No image is selected"),
      );
    }
  }

  Text _raisedButtonText() {
    if (image != null) {
      return Text("Change image");
    } else {
      return Text("Select Image");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image selection"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _displayedImage(),
              RaisedButton(
                onPressed: () {
                  _showChoiceDialog(context);
                },
                child: _raisedButtonText(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
