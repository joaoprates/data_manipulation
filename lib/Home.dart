import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _textSaved = "Nothing here";
  TextEditingController _controllerCampo = TextEditingController();

  _save() async {

    String valueTyped = _controllerCampo.text;

    final prefs = await SharedPreferences.getInstance();

    prefs.setString( "name", valueTyped );

  }

  _recuperar() async {

    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _textSaved = prefs.getString("name") ?? "No value";
    });

  }

  _remove() async {

    final prefs = await SharedPreferences.getInstance();
    prefs.remove("name");

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Manipulation"),
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: <Widget>[
            Text(
                _textSaved,
                style: TextStyle(
                    fontSize: 20
                ),
            ),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Digite algo"
              ),
              controller: _controllerCampo,
            ),
            Row(
              children: <Widget>[
                RaisedButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(15),
                  child: Text(
                      "Save",
                      style: TextStyle(
                          fontSize: 20
                      )
                  ),
                  onPressed: _save,
                ),
                RaisedButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(15),
                  child: Text(
                      "Recuperar",
                      style: TextStyle(
                          fontSize: 20
                      )
                  ),
                  onPressed: _recuperar,
                ),
                RaisedButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(15),
                  child: Text(
                      "Remove",
                      style: TextStyle(
                          fontSize: 20
                      )
                  ),
                  onPressed: _remove,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
