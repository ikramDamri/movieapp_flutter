
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/style/theme.dart' as Style;
import '../model/item.dart';

class complaintScreen extends StatefulWidget {
  @override
  _complaintScreenState createState() => _complaintScreenState();
}

class _complaintScreenState extends State<complaintScreen> {
  TextEditingController sampledata1 = new TextEditingController();
  TextEditingController sampledata2 = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Style.Colors.mainColor,
        title: Text(
          'CmplaintRaise',
          style: TextStyle(color: Style.Colors.secondColor),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Style.Colors.secondColor),
          onPressed: () {
            // passing this to our root
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                        height: 200,
                        width: 225,
                        child: Image.asset(
                          "assets/complaint.png",
                          fit: BoxFit.contain,
                        )),
            SizedBox(
              height: 6,
            ),
            TextFormField(
              controller: sampledata1,
              minLines: 2,
              maxLines: 4,
              decoration: InputDecoration(
                fillColor: Style.Colors.champColor,

                  labelText: "Plaint Type", border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: sampledata2,
              minLines: 3,
              maxLines: 5,
              decoration: InputDecoration(
                  fillColor: Style.Colors.champColor,
                  labelText: "Description", border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
               
                onPressed: () {
                  Map<String, dynamic> data = {
                    "fieled1": sampledata1.text,
                    "fieled2": sampledata2.text
                  };
                  FirebaseFirestore.instance.collection("complaint").add(data);
                },
                child: Text("RaiseComplaint"))
          ],
        ),
      )),
    );
  }
}
