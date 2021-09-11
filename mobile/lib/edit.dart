import 'package:flutter/material.dart';

class EditPage extends StatefulWidget {
  final editType;
  final label;

  const EditPage({Key? key, this.editType, this.label}) : super(key: key);


  @override
  _EditPageState createState() => _EditPageState();

}
class _EditPageState extends State<EditPage> {

  var textController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 50),
            Row(
              children: [
                Container(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(30, 10, 0, 0),
                    child: IconButton(
                      icon: Icon(
                          Icons.arrow_back,
                          size: 40,
                          color: Colors.black
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  )
                )
              ]
            ),
            Row(
              children: [
                Flexible(
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Text(
                      "What's your " + widget.editType + "?",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                          color: Colors.black
                      ),
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
                    child: TextField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: ""+ label,
                      ),
                      controller: textController,
                    ),
                  ),
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
                      onPressed: () {
                        print(this.textController.text);
                      },
                      child: Text(
                        'UPDATE'
                      )
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}