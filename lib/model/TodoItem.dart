enum Days { monday, tuesday, wensday, thursday, friday, saturday, sunday }

class DateDay {
  static String dateToString(Days days) {
    switch (days) {
      case Days.monday:
        return "Monday";
      case Days.tuesday:
        return "Tuesday";
      case Days.wensday:
        return "Wensday";
      case Days.thursday:
        return "Thursday";
      case Days.friday:
        return "Friday";
      case Days.saturday:
        return "Saturday";
      default:
        return "Sunday";
    }
  }
}

class TodoItem {
  String name;
  String descripton;
  int id;
  String qRcode;
  Days days;
  TodoItem({this.name, this.descripton, this.days, this.id,this.qRcode});
  @override
  String toString() {
    return 'the todo title is $name and it\'s description is $descripton in the day ${DateDay.dateToString(days)}';
  }
}
