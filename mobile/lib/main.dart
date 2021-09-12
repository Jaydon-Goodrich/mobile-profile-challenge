import 'package:flutter/material.dart';
import 'edit.dart';
import 'editImage.dart';
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobile Profile Challenge',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var dataObj = {
    'name': 'Jaydon Goodrich',
    'phone': '(801) 123-4567',
    'email': 'JaydonGoodrichTest@gmail.com',
    'about_me': 'This is a little about me and who I am.'
  };

  var _image;

  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      getImageFileFromAssets('/images/profilePic1.jpg');
    });
  }

  Future<File> getImageFileFromAssets(String path) async {
    final byteData = await rootBundle.load('assets/$path');
    final file = File('${(await getTemporaryDirectory()).path}/image.png');
    await file.writeAsBytes(byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
    setState(() {
      if (file != null) {
        _image = file;
      } else {
        print('No image selected.');
      }
    });
    return _image;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Spacer(),
            Container(
                child: Padding(
              padding: EdgeInsets.all(30),
              child: Text('Edit Profile',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      color: Color(0xFF4169e1))),
            )),
            Stack(
              alignment: Alignment.center,
              children: [
                _image != null
                    ? Container(
                        width: 150.0,
                        height: 150.0,
                        decoration: new BoxDecoration(
                          border: Border.all(
                            color: Color(0xFF4169e1),
                            width: 5,
                          ),
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: new FileImage(_image),
                          ),
                        ),
                      )
                    : Container(
                        width: 150.0,
                        height: 150.0,
                        decoration: new BoxDecoration(
                          border: Border.all(
                            color: Color(0xFF4169e1),
                            width: 5,
                          ),
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: new ExactAssetImage(
                                'assets/images/profilePic1.jpg'),
                          ),
                        ),
                      ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(100, 0, 0, 100),
                    child: ElevatedButton(
                      onPressed: () async {
                        final returnedData = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  EditImagePage(editImage: _image)),
                        );
                        setState(() {
                          _image = returnedData;
                        });
                      },
                      child: Icon(Icons.create_sharp, color: Color(0xFF4169e1)),
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(10),
                        primary: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Spacer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    height: 75,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFf9f9f9),
                      ),
                      onPressed: () async {
                        final returnedData = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditPage(
                                  editType: 'name',
                                  editLabel: 'Full Name',
                                  data: dataObj)),
                        );
                        setState(() {
                          dataObj = returnedData;
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: Column(
                          children: [
                            SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Name',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFFb2b3b3),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Flexible(
                                  child: Text(
                                    dataObj['name'] ?? 'No Name',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Color(0xFFb2b3b3),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    height: 75,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFf9f9f9),
                      ),
                      onPressed: () async {
                        final returnedData = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditPage(
                                  editType: 'phone number',
                                  editLabel: 'Phone Number',
                                  data: dataObj)),
                        );
                        setState(() {
                          dataObj = returnedData;
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: Column(
                          children: [
                            SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Phone',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFFb2b3b3),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Flexible(
                                  child: Text(
                                    dataObj['phone'] ?? 'No Phone Number',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Color(0xFFb2b3b3),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    height: 75,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFf9f9f9),
                      ),
                      onPressed: () async {
                        final returnedData = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditPage(
                                  editType: 'email',
                                  editLabel: 'Email',
                                  data: dataObj)),
                        );
                        setState(() {
                          dataObj = returnedData;
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: Column(
                          children: [
                            SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Email',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFFb2b3b3),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Flexible(
                                  child: Text(
                                    dataObj['email'] ?? 'No Email',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Color(0xFFb2b3b3),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    height: 125,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFf9f9f9),
                      ),
                      onPressed: () async {
                        final returnedData = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditPage(
                                  editType: 'favorite place to eat',
                                  editLabel: 'About You',
                                  data: dataObj)),
                        );
                        setState(() {
                          dataObj = returnedData;
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: Column(
                          children: [
                            SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Tell us about yourself',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFFb2b3b3),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Flexible(
                                  child: Text(
                                    dataObj['about_me'] ?? 'No About',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Color(0xFFb2b3b3),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
