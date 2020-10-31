class Category {
  Category({
    this.title = '',
    this.imagePath = '',
  });

  String title;
  int lessonCount;
  String imagePath;

  static List<Category> popularCourseList = <Category>[
    Category(
      imagePath: 'assets/design_course/interFace3.png',
      title: 'Register new Vehicle Manually',
    ),
    Category(
      imagePath: 'assets/design_course/interFace4.png',
      title: 'Register New Vehicle Via Image',
    ),
    Category(
      imagePath: 'assets/design_course/interFace3.png',
      title: 'Pending Inspections List',
    ),
    Category(
      imagePath: 'assets/design_course/interFace4.png',
      title: 'Completed Inspections List',
    ),
  ];
}
