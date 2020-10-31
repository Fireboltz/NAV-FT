import 'package:flutter/material.dart';
import 'package:navft/questionnaire/enums/questionnaire_type.dart';
import 'package:navft/questionnaire/models/questionnaire.dart';
import 'package:navft/questionnaire/screens/home_screen.dart';
import 'package:navft/questionnaire/screens/questionnaire_screen.dart';

import '../main.dart';
import 'design_course_app_theme.dart';
import 'models/category.dart';

class PopularCourseListView extends StatefulWidget {
  const PopularCourseListView(
      {Key key, this.callBack, this.list, this.listQues})
      : super(key: key);
  final int list;
  final List<Questionnaire> listQues;
  final Function callBack;
  @override
  _PopularCourseListViewState createState() => _PopularCourseListViewState();
}

class _PopularCourseListViewState extends State<PopularCourseListView>
    with TickerProviderStateMixin {
  AnimationController animationController;
  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: FutureBuilder<bool>(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (!snapshot.hasData) {
            return const SizedBox();
          } else {
            var lst = widget.list == 1
                ? Category.surveys
                : Category.popularCourseList;
            return GridView(
              padding: const EdgeInsets.all(8),
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              children: List<Widget>.generate(
                lst.length,
                (int index) {
                  final int count = lst.length;
                  final Animation<double> animation =
                      Tween<double>(begin: 0.0, end: 1.0).animate(
                    CurvedAnimation(
                      parent: animationController,
                      curve: Interval((1 / count) * index, 1.0,
                          curve: Curves.fastOutSlowIn),
                    ),
                  );
                  animationController.forward();
                  return CategoryView(
                    callback: () {
                      widget.callBack();
                    },
                    listQues: widget.listQues,
                    category: lst[index],
                    animation: animation,
                    animationController: animationController,
                  );
                },
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 32.0,
                crossAxisSpacing: 32.0,
                childAspectRatio: 0.8,
              ),
            );
          }
        },
      ),
    );
  }
}

class CategoryView extends StatelessWidget {
  const CategoryView(
      {Key key,
      this.listQues,
      this.category,
      this.animationController,
      this.animation,
      this.callback})
      : super(key: key);

  final VoidCallback callback;
  final List<Questionnaire> listQues;
  final Category category;
  final AnimationController animationController;
  final Animation<dynamic> animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: animation,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 50 * (1.0 - animation.value), 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              onTap: () {
                print(listQues);
                if (this.category.title == "Pending Inspections List") {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                } else if (this.category.title == "Tyres") {
                  quizPage(listQues[0], context);
                } else if (this.category.title == "Steering") {
                  quizPage(listQues[1], context);
                } else if (this.category.title == "Suspension") {
                  quizPage(listQues[2], context);
                } else if (this.category.title == "Horn") {
                  quizPage(listQues[3], context);
                } else if (this.category.title == "Brake") {
                  quizPage(listQues[4], context);
                } else if (this.category.title == "Lamps and Signals") {
                  quizPage(listQues[5], context);
                } else if (this.category.title == "Speedometer") {
                  quizPage(listQues[6], context);
                } else if (this.category.title == "Painting") {
                  quizPage(listQues[7], context);
                } else if (this.category.title == "Wiper") {
                  quizPage(listQues[8], context);
                } else if (this.category.title == "Body") {
                  quizPage(listQues[9], context);
                } else if (this.category.title == "Electricals") {
                  quizPage(listQues[10], context);
                } else if (this.category.title == "Finishing") {
                  quizPage(listQues[11], context);
                } else if (this.category.title == "Road Test") {
                  quizPage(listQues[12], context);
                } else if (this.category.title == "Safety Glasses") {
                  quizPage(listQues[13], context);
                } else if (this.category.title == "Seat Belts") {
                  quizPage(listQues[14], context);
                } else if (this.category.title == "Emergency Information") {
                  quizPage(listQues[15], context);
                } else if (this.category.title == "Engine") {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        final Noiselevel = TextEditingController();
                        return AlertDialog(
                          title: Text("What is the noise level?"),
                          content: new Row(
                            children: <Widget>[
                              new Expanded(
                                child: new TextField(
                                  controller: Noiselevel,
                                  decoration:
                                      InputDecoration(hintText: 'xx DB'),
                                ),
                              )
                            ],
                          ),
                          actions: <Widget>[
                            new FlatButton(
                                child: const Text('CANCEL'),
                                onPressed: () {
                                  Navigator.pop(context);
                                }),
                            new FlatButton(
                                child: const Text('Submit'),
                                onPressed: () {
                                  Navigator.pop(context);
                                })
                          ],
                        );
                      });
                } else if (this.category.title == "Embossing") {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        final embossing = TextEditingController();
                        return AlertDialog(
                          title: Text("How well is the ebossing done?"),
                          content: new Row(
                            children: <Widget>[
                              new Expanded(
                                child: new TextField(
                                  controller: embossing,
                                  decoration:
                                      InputDecoration(hintText: 'In Brief'),
                                ),
                              )
                            ],
                          ),
                          actions: <Widget>[
                            new FlatButton(
                                child: const Text('CANCEL'),
                                onPressed: () {
                                  Navigator.pop(context);
                                }),
                            new FlatButton(
                                child: const Text('Submit'),
                                onPressed: () {
                                  Navigator.pop(context);
                                })
                          ],
                        );
                      });
                } else if (this.category.title == "Pollution") {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        final Pollution_level = TextEditingController();
                        return AlertDialog(
                          title: Text("How well is the ebossing done?"),
                          content: new Row(
                            children: <Widget>[
                              new Expanded(
                                child: new TextField(
                                    controller: Pollution_level,
                                    decoration:
                                        InputDecoration(hintText: 'In Brief')),
                              )
                            ],
                          ),
                          actions: <Widget>[
                            new FlatButton(
                                child: const Text('CANCEL'),
                                onPressed: () {
                                  Navigator.pop(context);
                                }),
                            new FlatButton(
                                child: const Text('Submit'),
                                onPressed: () {
                                  Navigator.pop(context);
                                })
                          ],
                        );
                      });
                } else {
                  callback();
                }
              },
              child: SizedBox(
                height: 280,
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: <Widget>[
                    Container(
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: HexColor('#F8FAFB'),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(16.0)),
                                // border: new Border.all(
                                //     color: DesignCourseAppTheme.notWhite),
                              ),
                              child: Column(
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      child: Column(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 16, left: 16, right: 16),
                                            child: Text(
                                              category.title,
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16,
                                                letterSpacing: 0.27,
                                                color: DesignCourseAppTheme
                                                    .darkerText,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 48,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 48,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 24, right: 16, left: 16),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16.0)),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: DesignCourseAppTheme.grey
                                      .withOpacity(0.2),
                                  offset: const Offset(0.0, 0.0),
                                  blurRadius: 6.0),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16.0)),
                            child: AspectRatio(
                                aspectRatio: 1.28,
                                child: Image.asset(category.imagePath)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void quizPage(Questionnaire listQues, BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => QuestionnaireScreen(
          questionnaire: listQues,
        ),
      ),
    );
  }
}
