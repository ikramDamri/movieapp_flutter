
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/style/theme.dart' as Style;

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
      backgroundColor: Style.Colors.mainColor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Style.Colors.mainColor,
        title: Text(
          'Raise Complaint',
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
                          "assets/helpdesk.png",
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
                labelText: "Plaint Type", border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:  BorderSide(color: Style.Colors.secondColor ),
                ), 
                labelStyle: new TextStyle(color: Style.Colors.secondColor),),
                autofocus: false,
                style: TextStyle(color: Colors.white),
        
        
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: sampledata2,
              minLines: 3,
              maxLines: 5,
              decoration: InputDecoration(
                  labelText: "Description", border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:  BorderSide(color: Style.Colors.secondColor ),
                ), 
                labelStyle: new TextStyle(color: Style.Colors.secondColor),
                  ),
                autofocus: false,
                style: TextStyle(color: Colors.white), 
            ),
            SizedBox(
              height: 10,
            ),

      
            ElevatedButton(
              onPressed: () {  },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Style.Colors.secondColor),
              ),
              child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
                  Map<String, dynamic> data = {
                    "fieled1": sampledata1.text,
                    "fieled2": sampledata2.text
                  };
                  FirebaseFirestore.instance.collection("complaint").add(data);
                },
                
          child: Text(
            "Raise Complaint",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Style.Colors.mainColor, fontWeight: FontWeight.bold),
          )),
               
                
                
                )
          ],
        ),
      )),
    );
  }
}
