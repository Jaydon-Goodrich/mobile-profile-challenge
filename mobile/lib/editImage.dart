import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class EditImagePage extends StatefulWidget {
  final editImage;
  const EditImagePage({Key? key, this.editImage}) : super(key: key);

  @override
  _EditImagePageState createState() => _EditImagePageState();
}

class _EditImagePageState extends State<EditImagePage> {
  var textController = new TextEditingController();

  var _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });

    Navigator.pop(context, _image);
  }

  @override
  Widget build(BuildContext context) {
    _image = widget.editImage;
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 50),
          Row(children: [
            Container(
                child: Padding(
              padding: EdgeInsets.fromLTRB(30, 10, 0, 0),
              child: IconButton(
                icon: Icon(Icons.arrow_back, size: 40, color: Colors.black),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ))
          ]),
          Row(
            children: [
              Flexible(
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Text(
                      "Upload a photo of yourself:",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                          color: Colors.black),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(
                    child:
                        _image != null ? Image.file(_image) : Text('no Image')),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                      ),
                      onPressed: () async {
                        getImage();
                      },
                      child: Text('UPLOAD')),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
