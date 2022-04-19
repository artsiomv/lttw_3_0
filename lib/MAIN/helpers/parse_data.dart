
class ParseDate {
  static String parseDate(String startDate, String endDate, String time) {
    return parseEverything(startDate, endDate, time);
  }
}

String parseEverything(String startDate, String endDate, String time) {
  return parseDateToLookGood(startDate, endDate) + " @" + parseTimeToLookGood(time);
}

String parseDateToLookGood(String startDate, endDate) {
  var dateArrayStart = startDate.split("-");
  var dateArrayEnd = endDate.split("-");
  if(dateArrayStart[1] == dateArrayEnd[1] && dateArrayStart[0] == dateArrayEnd[0]) {
    return getMonthName(dateArrayStart[1]) + " " + dateArrayStart[2];
  }

  return getMonthName(dateArrayStart[1]) + " " + dateArrayStart[2] + ", " + dateArrayStart[0] + " - " + getMonthName(dateArrayEnd[1]) + " " + dateArrayEnd[2] + ", " + dateArrayEnd[0];
}

String getMonthName(String month) {
  List<String> monthArray = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
  return monthArray[int.parse(month) -1];
}

String parseTimeToLookGood(String time) {
  var dateArray = time.split(":");
  String timeOfDay = "";
  if(int.parse(dateArray[0]) >= 12 ) {
    timeOfDay = "PM";
  } else {
    timeOfDay = "AM";
  }
  int myHour = int.parse(dateArray[0]);
  if(myHour > 12) {
    return (myHour - 12).toString() + ":" + dateArray[1] + "" + timeOfDay;
  } else {
    return myHour.toString() + ":" + dateArray[1] + "" + timeOfDay;
  }
}