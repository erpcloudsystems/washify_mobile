import 'package:intl/intl.dart';

extension DateTimeExtension on String  {
  String formatDate() {
    return DateFormat('dd-MM-yyyy').format(DateTime.parse(this));
  }
}
  