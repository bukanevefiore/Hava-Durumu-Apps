import 'package:flutter/material.dart';

class SehirSecWidget extends StatefulWidget {
  const SehirSecWidget({Key key}) : super(key: key);

  @override
  _SehirSecWidgetState createState() => _SehirSecWidgetState();
}

class _SehirSecWidgetState extends State<SehirSecWidget> {

 final _textControllerSehir = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Şehir Seç"),),
      body: Form(
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _textControllerSehir,
                  decoration: InputDecoration(
                    labelText: "Şehir",
                    hintText: "Şehir seçin",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            IconButton(icon: Icon(Icons.youtube_searched_for_sharp),
                onPressed: () {
              Navigator.pop(context,_textControllerSehir.text);
            }),
          ],
        ),
      ),
    );
  }
}
