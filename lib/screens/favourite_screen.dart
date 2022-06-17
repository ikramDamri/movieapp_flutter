import 'package:flutter/material.dart';
import 'package:movieapp/style/theme.dart' as Style;

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Style.Colors.mainColor,
        appBar: AppBar(
          backgroundColor: Style.Colors.mainColor,
          leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Style.Colors.secondColor),
          onPressed: () {
            // passing this to our root
            Navigator.of(context).pop();
          },
        ),
          title: Text(
            'Favorite Movies',
            style: TextStyle(color: Style.Colors.secondColor),
          ),
          centerTitle: true,
        ),
        body: ListView(children: <Widget>[
          
Container(
padding: EdgeInsets.all(2),
margin: const EdgeInsets.all(4.0),
decoration: BoxDecoration(border: Border.all(color: Colors.grey), color: Style.Colors.secondColor),
child: ListTile(
  leading: Image.asset(
  'assets/fantastic.png',
  fit: BoxFit.contain,
),
  title: Text('Fantastic Beasts: The Secrets of Dumbledore'),
  textColor: Colors.white,
  trailing: Icon(Icons.favorite, color: Colors.white,),
),),

Container(
padding: EdgeInsets.all(2),
margin: const EdgeInsets.all(4.0),
decoration: BoxDecoration(border: Border.all(color: Colors.grey), color: Style.Colors.secondColor),
child: ListTile(
  leading: Image.asset(
  'assets/morbius.png',
  fit: BoxFit.contain,
),
  title: Text('Morbius'),
    textColor: Colors.white,
  trailing: Icon(Icons.favorite , color: Colors.white,),
),),

        ]));
  }
}