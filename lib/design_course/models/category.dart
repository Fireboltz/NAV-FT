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

  static List<Category> surveys = <Category>[
    Category(
      imagePath: 'assets/design_course/interFace3.png',
      title: 'Tyres',
    ),
    Category(
      imagePath: 'assets/design_course/interFace4.png',
      title: 'Steering',
    ),
    Category(
      imagePath: 'assets/design_course/interFace4.png',
      title: 'Engine',
    ),
    Category(
      imagePath: 'assets/design_course/interFace3.png',
      title: 'Suspension',
    ),
    Category(
      imagePath: 'assets/design_course/interFace4.png',
      title: 'Horn',
    ),
    Category(
      imagePath: 'assets/design_course/interFace3.png',
      title: 'Brake',
    ),
    Category(
      imagePath: 'assets/design_course/interFace4.png',
      title: 'Lamps and Signals',
    ),
    Category(
      imagePath: 'assets/design_course/interFace3.png',
      title: 'Embossing',
    ),
    Category(
      imagePath: 'assets/design_course/interFace4.png',
      title: 'Speedometer',
    ),
    Category(
      imagePath: 'assets/design_course/interFace3.png',
      title: 'Painting',
    ),
    Category(
      imagePath: 'assets/design_course/interFace4.png',
      title: 'Wiper',
    ),
    Category(
      imagePath: 'assets/design_course/interFace3.png',
      title: 'Body',
    ),
    Category(
      imagePath: 'assets/design_course/interFace4.png',
      title: 'Electricals',
    ),
    Category(
      imagePath: 'assets/design_course/interFace3.png',
      title: 'Finishing',
    ),
    Category(
      imagePath: 'assets/design_course/interFace4.png',
      title: 'Road Test',
    ),
    Category(
      imagePath: 'assets/design_course/interFace3.png',
        title: 'Pollution',
    ),
    Category(
      imagePath: 'assets/design_course/interFace4.png',
      title: 'Safety Glasses',
    ),
    Category(
      imagePath: 'assets/design_course/interFace3.png',
      title: 'Seat Belts',
    ),
    Category(
      imagePath: 'assets/design_course/interFace4.png',
      title: 'Emergency Information',
    ),
  ];
}
