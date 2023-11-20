import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:rinjani_visitor/core/presentation/theme/theme.dart';

//enum untuk menentukan status dari widget agar sesuai warna dan teksnya
enum StatusColor {
  ///Error status, when data is not available or something went wrong
  error,

  /// Success status color, when data is available
  success,

  ///When product is on review stage, or when data is being uploaded
  loading,
  review,
  available,
  init,
  // Add more colors as needed
}

class Status extends StatelessWidget {
  final StatusColor status;
  final String text;
  const Status({super.key, required this.status, required this.text});

  @override
  Widget build(BuildContext context) {
    //fungsi untuk menentukan warna pada widget status berdasarkan enum
    Color getColor(StatusColor statusColor) {
      switch (statusColor) {
        case StatusColor.error:
          return errorRed;
        case StatusColor.loading:
          return infoBlue;
        case StatusColor.success:
          return successGreen;
        case StatusColor.review:
          return statusBrown;
        case StatusColor.available:
          return infoBlue;
        default:
          return CupertinoColors.white;
      }
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(xsmallRadius),
          //ubah warna status berdasarkan kondisinya
          color: getColor(status)),
      child: Text(
        //ubah teks pada status berdasarkan kondisinya
        toBeginningOfSentenceCase(text) ?? "",
        style: whiteTextStyle.copyWith(fontSize: 12, fontWeight: regular),
      ),
    );
  }
}
