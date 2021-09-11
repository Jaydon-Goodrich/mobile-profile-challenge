import 'package:flutter/material.dart';

class EditPage extends StatefulWidget {
  final editType;
  final editLabel;
  final data;

  const EditPage({Key? key, this.editType, this.editLabel, this.data})
      : super(key: key);

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  var textController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    switch (widget.editType) {
      case 'name':
        {
          textController.text = widget.data['name'];
        }
        break;
      case 'phone number':
        {
          textController.text = widget.data['phone'];
        }
        break;
      case 'email':
        {
          textController.text = widget.data['email'];
        }
        break;
      case 'favorite place to eat':
        {
          textController.text = widget.data['about_me'];
        }
        break;
      default:
        {
          textController.text = '';
        }
    }
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
                      "What's your " + widget.editType + "?",
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
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: widget.editLabel,
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
                        switch (widget.editType) {
                          case 'name':
                            {
                              widget.data['name'] = textController.text;
                            }
                            break;
                          case 'phone number':
                            {
                              widget.data['phone'] = textController.text;
                            }
                            break;
                          case 'email':
                            {
                              widget.data['email'] = textController.text;
                            }
                            break;
                          case 'favorite place to eat':
                            {
                              widget.data['about_me'] = textController.text;
                            }
                            break;
                          default:
                            {
                              textController.text = '';
                            }
                        }

                        Navigator.pop(context, widget.data);
                      },
                      child: Text('UPDATE')),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
