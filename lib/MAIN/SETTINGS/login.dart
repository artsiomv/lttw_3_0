import 'package:flutter/material.dart';
import 'package:lttw_3_0/MAIN/ADMIN/admin_home.dart';

class MyLogin extends StatefulWidget {
  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  final myControllerPassword = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myControllerPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Color primary = Theme.of(context).primaryColor;
    // Color background = Theme.of(context).backgroundColor;
    return Scaffold(
      // backgroundColor: background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: AppBar(
          title: Text("Settings"),
        ),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(80.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: myControllerPassword,
                decoration: InputDecoration(
                  hintText: 'Enter Your Password',
                ),
                obscureText: true,
              ),
              SizedBox(
                height: 24,
              ),
              RaisedButton(
                color: Colors.yellow,
                child: Text('ENTER'),
                onPressed: () {
                  if (myControllerPassword.text == "JesusLovesYouVeryMuch") {
                    myControllerPassword.text = "";
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AdminHome()));
                  } else {
                    myControllerPassword.text = "";
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
