import 'package:intl/intl.dart';
import 'package:nepali_utils/nepali_utils.dart';

extension DateExtension on String {
  String toAgo() {
    final currentDate = NepaliDateTime.now();
    final givenDate = NepaliDateTime.parse(this);

    final difference = currentDate.difference(givenDate);

    if (difference.inDays == 0) {
      return 'Today';
    } else if (difference.inDays == 1) {
      return 'Yesterday';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    } else if (difference.inDays < 30) {
      final weeks = difference.inDays ~/ 7;
      return '$weeks week${weeks > 1 ? 's' : ''} ago';
    } else if (difference.inDays < 365) {
      final months = difference.inDays ~/ 30;
      return '$months month${months > 1 ? 's' : ''} ago';
    } else {
      final years = difference.inDays ~/ 365;
      return '$years year${years > 1 ? 's' : ''} ago';
    }
  }

  ///
  ///
  String toEnglishDate() {
    int year = int.parse(split("-").first);
    int month = int.parse(split("-").elementAt(1));
    int day = int.parse(split("-").last);
    DateTime englishDate = NepaliDateTime(year, month, day).toDateTime();
    return englishDate.toString().substring(0, 10);
  }

  String toNepaliDate() {
    int year = int.parse(split("-").first);
    int month = int.parse(split("-").elementAt(1));
    int day = int.parse(split("-").last);
    NepaliDateTime nepaliDate = DateTime(year, month, day).toNepaliDateTime();
    return nepaliDate.toString().substring(0, 10);
  }

  ///Converting Date format to Month Day, Year e.g.(Manghir 8, 2022)
  String toNepaliFormatedMonth() {
    NepaliDateTime convDate = NepaliDateTime.parse(this);
    NepaliDateFormat formatedDate = NepaliDateFormat('dd MMMM, yyyy');
    String finalDate = formatedDate.format(convDate);
    return finalDate;
  }

  ///Converting Date format to Month Day, Year e.g.(Aug 8, 2022)
  String toEnglishFormatedMonth() {
    DateTime convDate = DateTime.parse(this);
    DateFormat formatedDate = DateFormat('MMM dd, y');
    String finalDate = formatedDate.format(convDate);
    return finalDate;
  }
}
