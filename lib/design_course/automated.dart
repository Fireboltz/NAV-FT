import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:navft/design_course/design_course_app_theme.dart';

class Automated extends StatelessWidget {
  Automated({Key key, this.onLayoutToggle})
      : super(key: key);
  final VoidCallback onLayoutToggle;

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
                padding: EdgeInsets.all(20),
                child: Text("Upload images to the cloud and let computers do all the work. Tyre checks, signals, condition of car body, engine noise and break distance measurement checks have been automated"),
              )
              ],
            )));
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
                  'Automated Testing',
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
                  onPressed: () {},
                  child: Text(
                    'Upload Images',
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