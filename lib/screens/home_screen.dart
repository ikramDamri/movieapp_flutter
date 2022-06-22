
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/model/user.dart';
import 'package:movieapp/screens/complaint_screen.dart';
import 'package:movieapp/screens/faq_sreen.dart';
import 'package:movieapp/screens/favourite_screen.dart';
import 'package:movieapp/screens/login_screen.dart';
import 'package:movieapp/style/theme.dart' as Style;
import 'package:movieapp/widgets/best_movies.dart';
import 'package:movieapp/widgets/genres.dart';
import 'package:movieapp/widgets/now_playing.dart';
import 'package:movieapp/widgets/persons.dart';




class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
 Widget listTile({String? title, IconData? iconData,  VoidCallback? onTap}) {
    return Container(
      height: 50,
      child: ListTile(
        onTap: onTap,
        leading: Icon(
          iconData,
          color: Colors.white,
          size: 28,
        ),
        title: Text(
          title!,
          style: TextStyle(color: Style.Colors.mainColor),
        ),
      ),
    );
  }
class _HomeScreenState extends State<HomeScreen> {
  
// Get data
User? user = FirebaseAuth.instance.currentUser;
UserModel loggedInUser = UserModel(email: '', firstName: '', secondName: '', uid: '',);

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  } 


final padding = EdgeInsets.symmetric(horizontal: 20);


// App Bar
  @override
  Widget build(BuildContext context) {
  
 
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Style.Colors.mainColor,
      drawer: Drawer(
        child: Container(
          color: Style.Colors.secondColor,
          child: ListView(
          children: [
              DrawerHeader(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 43,
                      backgroundColor: Colors.white54,
                      child: CircleAvatar(
                        backgroundColor: Style.Colors.secondColor,
                        backgroundImage: NetworkImage(
                          //userData.userImage ??
                              "https://freeiconshop.com/wp-content/uploads/edd/person-girl-flat.png",
                        ),
                        radius: 40,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("${loggedInUser.firstName} ${loggedInUser.secondName}"),
                        Text(
                          "${loggedInUser.email}",
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          
           listTile(
              iconData: Icons.home_outlined,
              title: "Home",
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ),
                );
              },
            ),
            listTile(
                iconData: Icons.favorite_outline,
                title: "Favourite",
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => FavouriteScreen(),
                    ),
                  );
                }),
            listTile(iconData: Icons.copy_outlined, 
            title: "Raise a Complaint",
            onTap: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => complaintScreen(),
                )
              );
            }),
            listTile(
              iconData: Icons.format_quote_outlined,
              title: "FAQs",
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => faqScreen(),
                  ),
                );
              },
              ),
            listTile(
              iconData: Icons.logout_outlined,
              title: "Logout",
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                );
              },
            ),
            Container(
              height: 350,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Contact Support"),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text("Call us:"),
                      SizedBox(
                        width: 10,
                      ),
                      Text("+212600000000"),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Text("Mail us:"),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "movieappsupport@gmail.com",
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
            
          ],
          )

        ),
      ),


 //App bar     
      appBar: AppBar(
        backgroundColor: Style.Colors.mainColor,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        //leading: Icon(EvaIcons.menu2Outline, color: Colors.white,),
        //title: Text("Welcome!"),
        //actions: <Widget>[
          /* IconButton(
            onPressed: () {},
            icon: Icon(EvaIcons.searchOutline, color: Colors.white,)
          ) */
       // ],
      ),
      body: ListView(
        children: <Widget>[
          NowPlaying(),
          GenresScreen(),
          PersonsList(),
          BestMovies(),
        ],
      ),
    );
  }

}

 