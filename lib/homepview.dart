import 'package:flutter/material.dart';
import 'package:testapp/ui_color.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: c.kappBarBg,
      appBar: c.kappBar('Bienvenue', ''),
      body: Padding(
        padding: c.kpadding,
        child: ListView(
          children: [
            Center(child: c.kcontentBar(context, "ajouter un element")),
            Center(child: c.kvalidButton("imprimer")),
            Center(
                child: kitemList(
              title: "le recu 2",
              date: "01/03/2021",
              price: "17375,00 fcfa",
              context: context,
            )),
          ],
        ),
      ),
      drawer: kdrawer(
        context: context,
        title: 'srs',
        email: 'srs.ecom@gmail.org',
      ),
      floatingActionButton: kfab(),
    );
  }

  customWidgets c = new customWidgets();
}

class kdrawer extends StatelessWidget {
  final title, email;
  final BuildContext context;
  const kdrawer({Key key, this.title, this.email, this.context})
      : super(key: key);
  @override
  Widget build(context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.3,
      color: appColors.appbarColor,
      child: ListView(
        children: [
          //Drawer Header start
          Container(
            height: MediaQuery.of(context).size.height / 10,
            color: appColors.greenColor,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: appColors.googleColor,
                radius: 60.0,
              ),
              title: Text(
                title.toUpperCase(),
                overflow: TextOverflow.fade,
                softWrap: false,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 22),
              ),
              subtitle: Text(
                email.toLowerCase(),
                overflow: TextOverflow.fade,
                softWrap: false,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          //Drawer Header end

          ///Drawer content
          _createDrawerItem(
              icon: Icons.contacts,
              text: 'Accueil',
              onTap: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => HomePage()))),
          Divider(
            height: 2,
            color: Colors.black,
          ),
          _createDrawerItem(
              icon: Icons.event,
              text: 'categories',
              onTap: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => HomePage()))),
          Divider(
            height: 2,
            color: Colors.black,
          ),
          _createDrawerItem(
              icon: Icons.note,
              text: 'rapports',
              onTap: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => HomePage()))),
          Divider(
            height: 2,
            color: Colors.black,
          ),
          _createDrawerItem(
              icon: Icons.note,
              text: 'reglage',
              onTap: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => HomePage()))),
          Divider(
            height: 2,
            color: Colors.black,
          ),
          _createDrawerItem(
              icon: Icons.note,
              text: 'bluetooth',
              onTap: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => HomePage()))),
          Divider(
            height: 2,
            color: Colors.black,
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 4),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Text('developped by SRS\nwww.anohou-service.ci'),
            ),
          ),
        ],
      ),
    );
  }

  ///Drawer Items
  Widget _createDrawerItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(
            icon,
            color: appColors.greenColor,
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              text.toUpperCase(),
              style: TextStyle(letterSpacing: 1.7),
            ),
          )
        ],
      ),
      onTap: onTap,
    );
  }

  ///Drawer Routes
}

class kitemList extends StatelessWidget {
  final title;
  final date;
  final price;
  final BuildContext context;

  const kitemList({Key key, this.title, this.date, this.price, this.context})
      : super(key: key);
  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) => HomePage()));
        },
        child: Container(
          height: 50,
          //width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: appColors.whiteColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title.toString().toUpperCase(),
                  style: TextStyle(color: appColors.textColor),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      date.toString().toLowerCase(),
                      style: TextStyle(
                        color: appColors.textColor,
                      ),
                    ),
                    Text(
                      price.toString().toLowerCase(),
                      style: TextStyle(color: appColors.textColor),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class kfab extends StatelessWidget {
  const kfab({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) => HomePage()));
      },
      child: Icon(
        Icons.add,
        color: appColors.whiteColor,
        size: 48,
      ),
      backgroundColor: appColors.drawerbarColor,
    );
  }
}

class customWidgets {
  ///the background color
  var kappBarBg = appColors.appBackgroudColor;

  /// apdding for all
  var kpadding = const EdgeInsets.all(16.0);

  /// The appbar style that 'll be apply anywhere
  Widget kappBar(
    String title,
    String devise,
  ) {
    return AppBar(
      title: Text(
        title.toUpperCase(),
        style: TextStyle(
          color: appColors.blackTextColor,
        ),
      ),
      centerTitle: true,
      elevation: 0.0,
      backgroundColor: appColors.appbarColor,
      actions: [
        devise.length > 0
            ? Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  width: 60,
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(child: Text(devise)),
                ),
              )
            : Container()
      ],
    );
  }

  /// the content bar
  Widget kcontentBar(BuildContext context, String title) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) => HomePage()));
      },
      child: Container(
        color: appColors.greenColor,
        height: 50,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                flex: 8,
                child: Text(
                  title.toUpperCase(),
                  //overflow: TextOverflow.fade,
                  softWrap: false,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Flexible(
                  flex: 2,
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ))
            ],
          ),
        ),
      ),
    );
  }

  /// the button valid
  Widget kvalidButton(String title) {
    return Container(
      height: 50,
      width: 150,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
        color: appColors.whiteColor,
      ),
      child: Center(
        child: Text(
          title.toUpperCase(),
          overflow: TextOverflow.fade,
          softWrap: false,
          style: TextStyle(
              color: appColors.blackTextColor,
              fontSize: 22,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
