class Orders {
  String name;
  String foods;
  String specifiedGender;
  int orderNo;
  int processTime;
  int delayTime;
  int waitingTime;
  DateTime? timeReachedZero;

  Orders({
    required this.name,
    required this.foods,
    required this.specifiedGender,
    required this.orderNo,
    required this.processTime,
    required this.delayTime,
    required this.waitingTime,
    this.timeReachedZero,
  });
}
