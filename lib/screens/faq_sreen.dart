import 'package:flutter/material.dart';
import 'package:movieapp/style/theme.dart' as Style;
import '../model/item.dart';

class faqScreen extends StatefulWidget {
  @override
  _faqScreenState createState() => _faqScreenState();
}

class _faqScreenState extends State<faqScreen> {
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      backgroundColor: Style.Colors.mainColor,
      appBar: AppBar(
        backgroundColor: Style.Colors.mainColor,
        title: Text('FAQs', style: TextStyle(color: Style.Colors.secondColor),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Style.Colors.secondColor),
          onPressed: () {
            // passing this to our root
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: itemData.length,
          itemBuilder: (context, index) {
            return Container(
              color: Style.Colors.secondColor,
              margin: EdgeInsets.only(bottom: 10.0),
              child: ExpansionPanelList(
                
                animationDuration: Duration(milliseconds: 500),
                dividerColor: Colors.red,
                expandedHeaderPadding: EdgeInsets.only(bottom: 0.0),
                elevation: 1,
                children: [
                  ExpansionPanel(
                    backgroundColor: Style.Colors.secondColor,
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return Container(
                        color: Style.Colors.secondColor,
                        padding: EdgeInsets.all(10),
                        child: Text(
                          itemData[index].headerItem,
                         // selectionColor: Style.Colors.secondColor,
                          style: TextStyle(
                            color: Style.Colors.mainColor,
                            fontSize: 18,
                          ),
                        ),
                      );
                    },
                    body: Container(
                      padding: EdgeInsets.only(left: 10, right: 10, bottom: 20),
                      color: Style.Colors.mainColorShadow,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            itemData[index].discription,
                          //  selectionColor: Style.Colors.secondColor,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              height: 1.3,
                            ),
                          ),
                        ],
                      ),
                    ),
                    isExpanded: itemData[index].expanded,
                  )
                ],
                expansionCallback: (int item, bool status) {
                  setState(() {
                    itemData[index].expanded = !itemData[index].expanded;
                  });
                },
              ),
            );
          },
        ),
      ),
    );
  }
  List<Item> itemData = <Item>[
    
    Item(
      headerItem: 'Community Guidelines on TMDB',
      discription:
          "Respect everyone, we're all here because we have something in common.\n"
          "Be polite and welcoming to new users. We were all new once."
          "Ask for help and provide assistance to others when possible."
          "Offer constructive criticism or voice a dissenting opinion, but don't be mean or disrespectful."
          "Feel free to use use Emoji (Emoticons) to convey the tone of your message. :wink:"
          "Lead by example. Treat others even better than you expect to be treated yourself and the discussions become a better place for everyone.",
      colorsItem: Colors.green,
    ),
    Item(
      headerItem: 'Can I import an exported list from IMDb?',
      discription:
          "Yes, you can! We currently support syncing an exported list to either your watchlist, favourite or rated lists. To use an exported file from IMDb, go to the bottom of one of your lists and click 'export this list'. IMDb will create a CSV file for you. When you login to TMDB, click the 'Import List' link from your account page. Drag and drop your CSV file and voila, syncing will begin.",
      colorsItem: Colors.grey,
    ),
    Item(
      headerItem: 'Can I share my watchlist/favorite/rated lists?',
      discription:
          "Each one of these lists can be toggled to be viewed publicly but are all private by default.",
            colorsItem: Colors.grey,

    ),
    Item(
      headerItem: 'How do you build my recommendations?',
      discription:
          "The more movies and TV shows you mark as a favorite, the more entries we can recommend for you. We will also automatically filter your rated items as well so you can hopefully find something new to watch instantly. Adding a minimum of 30 items will usually start to build an interesting list.",
      colorsItem: Colors.orange,
    ),
    Item(
      headerItem: "Can I watch videos on 'movieapp'?",
      discription:
          "Most of our movies and TV shows have trailers, clips and featurettes which can be viewed on TMDB. However, we do not stream or play any of the actual movies or TV shows.",
      colorsItem: Colors.orange,
    ),
    Item(
      headerItem: "Why can't I find what I am looking for?",
      discription:
          "There are two common scenarios. First, the media has not been added to our database yet. Second, it could be a misspelling, typo or foreign language issue."
          "Movies and TV shows support translated titles as well as what we call 'Alternative Titles'. A lot of times the issue is simply that the translated or alternative title hasn't been added.",
      colorsItem: Colors.orange,
    ),
    Item(
      headerItem: "What's the leaderboard?",
      discription:
          "The leaderboard is a page where you can see the top 100 contributors (based on number of edits) for the previous 7 days. If you don't see your name listed, get contributing!",
      colorsItem: Colors.orange,
    ),
    Item(
      headerItem: "Will movies automatically be removed from my watchlist once they've been rated?",
      discription:
          "They are by default, yes. If this is not the setting you would like, you can change it from within your watchlist page.",
      colorsItem: Colors.orange,
    ),
    Item(
      headerItem: "How do you build my recommendations?",
      discription:
          "The more movies and TV shows you mark as a favorite, the more entries we can recommend for you. We will also automatically filter your rated items as well so you can hopefully find something new to watch instantly. Adding a minimum of 30 items will usually start to build an interesting list.",
      colorsItem: Colors.orange,
    ),
  ];
}