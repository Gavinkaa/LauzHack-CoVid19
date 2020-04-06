import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:help_auth_mob/services/storage_service.dart';
import 'package:image_picker/image_picker.dart'; // For Image Picker
import 'package:path/path.dart' as Path;

class ImageUploaderScreen extends StatefulWidget {
  static final String id = 'image_selector_screen';
  @override
  _ImageUploaderScreenState createState() => _ImageUploaderScreenState();
}

class _ImageUploaderScreenState extends State<ImageUploaderScreen> {
  File _image;
  String _uploadedFileURL;

  Future _chooseFile() async {
    await ImagePicker.pickImage(source: ImageSource.gallery).then((image) {
      setState(() {
        _image = image;
      });
    });
  }

  _handleImageFromGallery() async {
    File imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (imageFile != null) {
      setState(() {
        _image = imageFile;
      });
    }
  }

  _displayProfileImage() {
    if (_image == null) {
      print("null exiting");
      return;
    }
    FileImage(_image);
  }

  _submit() async {
    await StorageService.uploadUserProfileImage(_image);
  }

  clearSelection() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('FIRESTORE FILE UPLOAD',
            style: TextStyle(fontWeight: FontWeight.w300)),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('Selected Image'),
            _image != null
                ? Image.asset(
                    _image.path,
                    height: 150,
                  )
                : Container(height: 150),
            _image == null
                ? RaisedButton(
                    child: Text('Choose File'),
                    onPressed: _handleImageFromGallery,
                    color: Colors.cyan,
                  )
                : Container(),
            _image != null
                ? RaisedButton(
                    child: Text('Upload File'),
                    onPressed: _submit,
                    color: Colors.cyan,
                  )
                : Container(),
            _image != null
                ? RaisedButton(
                    child: Text('Clear Selection'),
                    onPressed: clearSelection,
                  )
                : Container(),
            Text('Uploaded Image'),
            _uploadedFileURL != null
                ? Image.network(
                    _uploadedFileURL,
                    height: 150,
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
