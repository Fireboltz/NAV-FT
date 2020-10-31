import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:navft/design_course/design_course_app_theme.dart';
import 'package:navft/questionnaire/screens/home_screen.dart';
import 'package:navft/questionnaire/widgets/button.dart';

class ListPage extends StatelessWidget {
  ListPage({Key key, this.onLayoutToggle, this.disp, this.reg})
      : super(key: key);
  final VoidCallback onLayoutToggle;
  final List<DocumentSnapshot> disp;
  final String reg;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: DesignCourseAppTheme.nearlyWhite,
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).padding.top,
              ),
              getAppBarUI(context),
              Container(
                child: _buildContent(),
              ),
            ])));
  }

  void createCollection(String reg, BuildContext context) async {
    final databaseReference = Firestore.instance;
    DocumentReference ref = await databaseReference.collection(reg).add({
      "location": GeoPoint(80, 80),
      "time": Timestamp(100, 100),
    });
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HomeScreen(
                  regNo: reg,
                  docID: ref.documentID,
                )));
  }

  Widget _buildContent() {
    return Expanded(
        child: ListView.builder(
            itemCount: disp.length,
            itemBuilder: (BuildContext content, int index) {
              DocumentSnapshot contact = disp[index];
              return ContactListTile(contact);
            }));
  }

  Widget getAppBarUI(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 18, right: 18),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Vehicle Fitness',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    letterSpacing: 0.2,
                    color: DesignCourseAppTheme.grey,
                  ),
                ),
                Text(
                  'Search Result',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    letterSpacing: 0.27,
                    color: DesignCourseAppTheme.darkerText,
                  ),
                ),
                SizedBox(height: 10,),
                RaisedButton(
                  color: Colors.lightBlueAccent,
                  onPressed: () {
                    createCollection(reg, context);
                  },
                  child: Text(
                    'Take a new survey',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 60,
            height: 60,
            child: Image.asset('assets/design_course/userImage.png'),
          )
        ],
      ),
    );
  }
}

class ContactListTile extends ListTile {
  ContactListTile(DocumentSnapshot contact)
      : super(
          title: Text(contact.documentID),
          subtitle: Text(contact.data.toString()),
        );
}
