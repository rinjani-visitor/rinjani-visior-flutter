import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rinjani_visitor/core/presentation/theme/theme.dart';

//enum untuk menentukan status dari widget agar sesuai warna dan teksnya
enum StatusColor {
  error,
  offering,
  success,
  waiting,
  review,
  available
  // Add more colors as needed
}

class Status extends StatelessWidget {
  final StatusColor status;
  const Status({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    //fungsi untuk menentukan warna pada widget status berdasarkan enum
    Color getColor(StatusColor statusColor) {
      switch (statusColor) {
        case StatusColor.error:
          return errorRed;
        case StatusColor.offering:
          return infoBlue;
        case StatusColor.success:
          return successGreen;
        case StatusColor.waiting:
          return warningYellow;
        case StatusColor.review:
          return statusBrown;
        case StatusColor.available:
          return infoBlue;
        default:
          return infoBlue;
      }
    }

    //fungsi untuk menentukan teks pada status
    String getStatus(StatusColor statusInfo) {
      switch (statusInfo) {
        case StatusColor.error:
          return 'Declined';
        case StatusColor.offering:
          return 'Offering';
        case StatusColor.success:
          return 'Success';
        case StatusColor.waiting:
          return 'Waiting for payment';
        case StatusColor.review:
          return 'Reviewing';
        case StatusColor.available:
          return 'Available';
        default:
          return 'offering';
      }
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(smallRadius),

          //ubah warna status berdasarkan kondisinya
          color: getColor(status)),
      child: Text(
        //ubah teks pada status berdasarkan kondisinya
        getStatus(status),
        style: whiteTextStyle.copyWith(fontSize: 12, fontWeight: regular),
      ),
    );
  }
}
