class DateTImeUtils {
  static String parseOnlyDate(DateTime dateTime) {
    return dateTime.toString().split(' ').first;
  }

  static String parseOnlyTime(DateTime dateTime) {
    final String hour = dateTime.hour.toString();
    final String minute = dateTime.minute.toString();
    return '$hour:$minute';
  }
}
