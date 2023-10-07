import 'package:fluttertoast/fluttertoast.dart';
import 'package:snap_textify/res/app_color.dart';
import 'package:intl/intl.dart';

class Utils {
  static toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: AppColor.primaryColor,
    );
  }

  static formatDate(DateTime dateTime) {
    final DateFormat dateFormatter = DateFormat('MMM d, y');
    final String formattedDate = dateFormatter.format(dateTime);
    return formattedDate;
  }

  static formatTime(DateTime dateTime) {
    final DateFormat timeFormatter = DateFormat('h:mm a');
    final String formattedTime = timeFormatter.format(dateTime);
    return formattedTime;
  }
}
