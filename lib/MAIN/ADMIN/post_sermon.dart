import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:lttw_3_0/MAIN/my_theme.dart';
// import 'package:image_picker/image_picker.dart';

class PostSermon extends StatefulWidget {
  PostSermon({Key key}) : super(key: key);

  @override
  _PostSermonState createState() => _PostSermonState();
}

class _PostSermonState extends State<PostSermon> {
  final myControllerTitle = TextEditingController();
  final myControllerSpeaker = TextEditingController();
  final myControllerVideoURL = TextEditingController();
  DateTime selectedDate = DateTime.now();
  final _formKey = GlobalKey<FormState>();

  int _state = 0;
  AnimationController _controller;
  GlobalKey _globalKey = GlobalKey();
  double _width = double.maxFinite;

  String status = '';
  String errMessage = 'Error Uploading Image';
  int _imageSize = 0;
  File _image;
  // final picker = ImagePicker();

  Future getImage() async {
    //File Picker code
    FilePickerResult result =
        await FilePicker.platform.pickFiles(type: FileType.image);

    if (result != null) {
      PlatformFile pickedFile = result.files.first;

      setState(() {
        if (pickedFile != null) {
          _image = File(pickedFile.path);
          _imageSize = pickedFile.size;
        } else {
          print('No image selected.');
        }
      });
    }

    //Image picker code
    // final pickedFile = await picker.getImage(source: ImageSource.camera);

    // setState(() {
    //   if (pickedFile != null) {
    //     _image = File(pickedFile.path);
    //     _imageSize = _image.lengthSync();
    //   } else {
    //     print('No image selected.');
    //   }
    // });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color primary = Theme.of(context).primaryColor;
    Color hint = Theme.of(context).hintColor;
    Color secondary = Theme.of(context).secondaryHeaderColor;
    Color selected = Theme.of(context).selectedRowColor;
    // Color background = Theme.of(context).backgroundColor;

    return Scaffold(
      // backgroundColor: background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: AppBar(
          title: Text("Add Sermon"),
        ),
      ),
      body: Builder(builder: (BuildContext context) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: Form(
            key: _formKey,
            child: ListView(children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextFormField(
                  style: TextStyle(color: secondary),
                  autocorrect: true,
                  decoration: InputDecoration(
                    icon: Icon(Icons.check, color: secondary),
                    labelText: 'Title *',
                    labelStyle: TextStyle(color: secondary),
                  ),
                  controller: myControllerTitle,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter the Title';
                    }
                    return null;
                  },
                ),
              ),
              Divider(
                color: hint,
                height: 1,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextFormField(
                  style: TextStyle(color: secondary),
                  autocorrect: true,
                  decoration: InputDecoration(
                      icon: Icon(Icons.person, color: secondary),
                      labelText: 'Main Speaker *',
                      labelStyle: TextStyle(color: secondary)),
                  controller: myControllerSpeaker,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter the Main Speaker';
                    }
                    return null;
                  },
                ),
              ),
              Divider(
                color: hint,
                height: 1,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.calendar_today, color: secondary),
                    Container(
                      padding: EdgeInsets.only(left: 10.0, right: 0.0),
                      width: MediaQuery.of(context).size.width -
                          MediaQuery.of(context).size.width / 3 -
                          70,
                      child: Text(
                        "${selectedDate.toLocal()}".split(' ')[0],
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: secondary),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 3,
                      child: RaisedButton(
                        onPressed: () => _selectDate(context),
                        child: Text(
                          'Select date',
                          style: TextStyle(
                              color: primary, fontWeight: FontWeight.bold),
                        ),
                        color: secondary,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: hint,
                height: 1,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextFormField(
                  style: TextStyle(color: secondary),
                  autocorrect: true,
                  decoration: InputDecoration(
                      icon: Icon(Icons.video_library, color: secondary),
                      labelText: 'Video URL *',
                      labelStyle: TextStyle(color: secondary)),
                  controller: myControllerVideoURL,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter valid URL link';
                    }
                    return null;
                  },
                ),
              ),
              Divider(
                color: hint,
                height: 1,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        child: RaisedButton(
                          onPressed: getImage,
                          child: Text('Choose Image',
                              style: TextStyle(color: primary)),
                          color: secondary,
                        ),
                      ),
                    ),
                    Container(
                        child: _imageSize == 0
                            ? Text('0', style: TextStyle(color: primary))
                            : Text(
                                _imageSize.toString() + "/5000",
                                style: TextStyle(
                                    color: _imageSize > 5000
                                        ? Colors.redAccent
                                        : Colors.green),
                              )),
                  ],
                ),
              ),
              Container(
                height: 300,
                child: _image == null
                    ? Text('No image selected.')
                    : Image.file(_image),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Align(
                    alignment: Alignment.center,
                    child: PhysicalModel(
                      elevation: 8,
                      shadowColor: hint,
                      color: secondary,
                      borderRadius: BorderRadius.circular(25),
                      child: Container(
                        key: _globalKey,
                        height: 48,
                        width: _width,
                        child: RaisedButton(
                          animationDuration: Duration(milliseconds: 1000),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          padding: EdgeInsets.all(0),
                          child: setUpButtonChild(primary, selected),
                          onPressed: _state < 2
                              ? () {
                                  if (_formKey.currentState.validate()) {
                                    if (_imageSize < 5000 && _imageSize > 0) {
                                      setState(() {
                                        if (_state == 0) {
                                          animateButton();
                                        }
                                      });
                                    }
                                  }
                                }
                              : null,
                          elevation: 4,
                          color: secondary,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ),
        );
      }),
    );
  }

  void animateButton() {
    setState(() {
      _state = 1;
    });
    startUpload(context);
  }

  Widget setUpButtonChild(Color primary, selected) {
    if (_state == 0) {
      return new Text(
        "Upload",
        style: TextStyle(
          color: primary,
          fontSize: 16.0,
        ),
      );
    } else if (_state == 1) {
      return CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(selected),
      );
    } else {
      return Icon(Icons.check, color: Colors.greenAccent);
    }
  }

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  _postSermonToServer(BuildContext context, String title, String speaker,
      String dateTime, String videoURL, String imageName, File image) async {
    String date = dateTime.split(" ").first;
    String uploadEndPoint = 'https://app.lttwchurch.org/3/post/postSermon.php';
    String base64Image = base64Encode(image.readAsBytesSync());

    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        //call to a remote file
        await http.post(uploadEndPoint, body: {
          "title": title,
          "speaker": speaker,
          "date": date,
          "videoURL": videoURL,
          "imageName": imageName,
          "image": base64Image
        }).then((result) {
          if (result.body.contains("Too Large")) {
            Scaffold.of(context).showSnackBar(SnackBar(
                content: Text('Failed to upload, Image is too large')));
            setState(() {
              _state = 0;
            });
          } else {
            setState(() {
              _state = 2;
            });
          }
        }).catchError((error) {
          print(error);
          Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text('Failed to Upload')));
          setState(() {
            _state = 0;
          });
        });
      }
    } on SocketException catch (_) {
      print('not connected');
    }
  }

  startUpload(BuildContext context) {
    if (null == _image) {
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text('Please select an image')));
      setState(() {
        _state = 0;
      });

      return;
    }
    String fileName = _image.path.split('/').last;
    _postSermonToServer(
      context,
      myControllerTitle.text,
      myControllerSpeaker.text,
      selectedDate.toString(),
      myControllerVideoURL.text,
      fileName,
      _image,
    );
  }
}
