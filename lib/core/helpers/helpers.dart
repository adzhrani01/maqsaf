import 'dart:ffi';

// isAdmin(String? accountType)=> accountType=='Admin'||accountType==null;

bool detectLang({required String text}) {
  // String pattern = r'^(?:[a-zA-Z]|\P{L})+$';
  String pattern = r'^(?:[a-zA-Z.,;:!?]|\P{L})+$';
  RegExp regex = RegExp(pattern, unicode: true);
  return regex.hasMatch(text);
}
String formatText(dynamic value) {
 if(value is String)
   return value;
 else if(value is DateTime)
   return value.toString();
   // return DateFormat('dd MMM, yyyy').format(value as DateTime);
 else if(value is Enum)
   return formatEnum(value);
 else if(value is int)
   return value.toString();
 else if(value is double)
   return (value as double).toStringAsFixed(2);
 else
   return 'Unknown';
  // switch(value){
  //   case String:
  //     return tr(value);
  //   case DateTime:
  //     return DateFormat('dd MMM, yyyy').format(value as DateTime);
  //   case Enum:
  //     return formatEnum(value);
  //   case int:
  //     return value.toString();
  //   case double:
  //     return (value as double).toStringAsFixed(2);
  //   default:
  //     return 'Unknown';
  // }
}

String formatEnum(Enum? value) {
  return value?.name??'';
}
// String formatDate(DateTime? date){
//   return date==null?'':DateFormat.yMd().format(date);
//   // return date==null?'':DateFormat('dd MMM,yyyy').format(date);
// }
// String formatTime(DateTime? date){
//   return date==null?'':DateFormat('jm').format(date);
// }
// String formatDateAndTime(DateTime? date){
//   return date==null?'':'${DateFormat('Hm').format(date)}-${formatDate(date)}';
// }
// String formatEndDate(DateTime? endDate) {
//     return endDate != null
//     ? DateFormat('dd MMM, yyyy').format(endDate)
//         : 'At present';
// }

// DateValidity checkDateValidity(DateTime? date) {
//   if (date == null) {
//     return DateValidity.valid;
//   } else if (date.isAfter(DateTime.now())) {
//     return DateValidity.valid;
//   } else {
//     return DateValidity.expired;
//   }
// }
// ActivityStatus checkDateActivityStatus(DateTime? date) {
//   if (date == null) {
//     return ActivityStatus.inactive;
//   } else {
//     return ActivityStatus.active;
//   }
// }
