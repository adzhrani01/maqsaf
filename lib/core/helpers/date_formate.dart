
import 'package:intl/intl.dart' as intl;

import '../utils/string_manager.dart';
class DateFormatHelper{
  static String formatTimeOrder(DateTime dateTime, String locale) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays == 0) {
     return "اليوم";
    } else if (difference.inDays == 1) {
      if(now.isBefore(dateTime))
      return StringManager.dateYesterday;
      else
        return "غداً";
    }
    // else if (difference.inDays < 7) {
    //   return intl.DateFormat.EEEE(locale).format(dateTime); // Name of the day (e.g., Monday)
    // }
    // else if(dateTime.hour>0) {
    //   return intl.DateFormat.yMMMMd(locale).add_jm().format(dateTime); // Full date format
    // }
    else {
      return intl.DateFormat.yMMMMd(locale).format(dateTime); // Full date format
    }
  }
  static String formatTime(DateTime dateTime, String locale) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays == 0) {
      if (difference.inHours > 0) {
        return "${StringManager.dateFrom} ${difference.inHours} ${StringManager.dateHour}";
      } else if (difference.inMinutes > 0) {
        return "${StringManager.dateFrom} ${difference.inMinutes} ${StringManager.dateMinute}";
      } else {
        return StringManager.dateNow;
      }
    } else if (difference.inDays == 1) {
      return StringManager.dateYesterday;
    } else if (difference.inDays < 7) {
      return intl.DateFormat.EEEE(locale).format(dateTime); // Name of the day (e.g., Monday)
    }
    // else if(dateTime.hour>0) {
    //   return intl.DateFormat.yMMMMd(locale).add_jm().format(dateTime); // Full date format
    // }
    else {
    return intl.DateFormat.yMMMMd(locale).format(dateTime); // Full date format
    }
  }
  static String formatLeftTime(DateTime dateTime, String locale) {

    final now = DateTime.now();
    final difference = dateTime.difference(now);

   if( difference.isNegative){
     return StringManager.dateFinishApply;
   }
    else if (difference.inDays <= 0) {
      if (difference.inHours > 0) {
        return "${StringManager.dateLeft} ${difference.inHours} ${StringManager.dateHour}";
      } else if (difference.inMinutes > 0) {
        return "${StringManager.dateLeft} ${difference.inMinutes} ${StringManager.dateMinute}";
      } else {
        return StringManager.dateFinishApply;
      }
    } else if (difference.inDays == 1) {
      return "${StringManager.dateLeft} ${StringManager.datDay}";
    }
    else if (difference.inDays == 2) {
      return "${StringManager.dateLeft}  ${StringManager.dat2Day}";
    }
    else if (difference.inDays < 7) {
      return "${StringManager.dateLeft} ${difference.inDays} ${StringManager.datDays}";
    }

    else if (difference.inDays == 7) {
      return "${StringManager.dateLeft}  ${StringManager.datWeek}";
    }
    else {
      return intl.DateFormat.yMMMMd(locale).format(dateTime); // Full date format
    }
  }
}