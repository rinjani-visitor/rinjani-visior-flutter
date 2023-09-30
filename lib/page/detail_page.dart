import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rinjani_visitor/core/go_router_builder.dart';
import 'package:rinjani_visitor/theme/theme.dart';
import 'package:rinjani_visitor/widget/add_on_widget.dart';
import 'package:rinjani_visitor/widget/rating_widget.dart';
import 'package:rinjani_visitor/widget/segmented_widget.dart';
import 'package:rinjani_visitor/widget/status.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  Widget imageContainer() {
    return Container(
      width: double.infinity,
      height: 241,
      decoration: BoxDecoration(color: primaryColor),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Rinjani Trip',
                  style:
                      blackTextStyle.copyWith(fontSize: 24, fontWeight: bold),
                ),
                Spacer(),
                Status()
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Icon(
                  Icons.location_pin,
                  color: lightGray,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  'Lombok, Indonesia',
                  style:
                      grayTextStyle.copyWith(fontSize: 16, fontWeight: medium),
                )
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Text(
                  '\$20 - \$40/person',
                  style: blackTextStyle.copyWith(
                      fontSize: 16, fontWeight: semibold),
                ),
                Spacer(),
                Icon(
                  Icons.favorite_outline,
                  color: lightGray,
                )
              ],
            ),
            SizedBox(
              height: 8,
            ),
            RatingWidget(),
            SizedBox(
              height: 8,
            ),
            Text(
              'Trip duration: 2 Days - 1 Night',
              style: blackTextStyle.copyWith(fontSize: 16),
            ),
          ],
        ),
      );
    }

    // Widget customButton() {
    //   return Container(
    //     width: double.infinity,
    //     height: 63,
    //     padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    //     color: whiteColor,
    //     child: Container(
    //       width: 358,
    //       height: 43,
    //       decoration: BoxDecoration(
    //           color: primaryColor,
    //           borderRadius: BorderRadius.circular(smallRadius)),
    //       child: Center(
    //           child: TextButton(
    //               style: ButtonStyle(
    //                   backgroundColor: MaterialStatePropertyAll(primaryColor),
    //                   fixedSize: MaterialStatePropertyAll(Size.fromWidth(357))),
    //               onPressed: () {
    //                 showModalBottomSheet(
    //                     context: context,
    //                     builder: (BuildContext context) {
    //                       return SizedBox(
    //                         height: 400,
    //                         child: Center(
    //                           child: ElevatedButton(
    //                               onPressed: () {
    //                                 Navigator.pop(context);
    //                               },
    //                               child: Text('close')),
    //                         ),
    //                       );
    //                     });
    //               },
    //               child: Text(
    //                 'Continue',
    //                 style: whiteTextStyle.copyWith(fontSize: 16),
    //               ))),
    //     ),
    //   );
    // }


    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('detail trip'),
        ),
        child: SafeArea(
          child: ListView(
            children: [
              Column(
                children: [
                  imageContainer(),
                  header(),
                  SegmentedWidget(),
                ],
              ),
            ],
          ),
        ));
  }
}
