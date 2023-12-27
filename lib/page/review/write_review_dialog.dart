import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rinjani_visitor/core/presentation/theme/theme.dart';
import 'package:rinjani_visitor/features/order/presentation/view_model/order_list.dart';
import 'package:rinjani_visitor/features/review/presentation/view_model/write_review.dart';
import 'package:rinjani_visitor/core/presentation/widget/button/primary_button.dart';
import 'package:rinjani_visitor/core/presentation/widget/form/input_field.dart';

import '_widgets/rating.dart';

class WriteReviewPage extends ConsumerStatefulWidget {
  final String orderId;
  final void Function()? onReviewSuccess;
  const WriteReviewPage(this.orderId, {super.key, this.onReviewSuccess});

  @override
  ConsumerState<WriteReviewPage> createState() => _WriteReviewPageState();
}

class _WriteReviewPageState extends ConsumerState<WriteReviewPage> {
  final _reviewController = TextEditingController();
  Future<String?>? _future;
  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final review = ref.watch(reviewFormViewModelProvider);
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text("Write Review"),
      ),
      resizeToAvoidBottomInset: false,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder(
                future: _future,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      return Text(
                        snapshot.error.toString(),
                        style: redTextStyle,
                      );
                    }
                    final _ = ref.refresh(orderListViewModelProvider);
                    return Text(snapshot.data ?? "");
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const CupertinoActivityIndicator();
                  }
                  return const SizedBox();
                }),
            Text(
              "Your Rating",
              style: blackTextStyle.copyWith(fontSize: heading4),
            ),
            RatingSelector(
                rating: 5,
                currentRating: review.rating,
                onStarTapped: (val) {
                  setState(() {
                    review.rating = val;
                  });
                }),
            const SizedBox(height: 16.0),
            InputFormField(
              inputFormatters: [
                LengthLimitingTextInputFormatter(50),
              ],
              controller: _reviewController,
              validator: (val) {
                if (val!.isEmpty) {
                  return "Please write your review";
                }
                return null;
              },
              label: "Write your review here",
            ),
            PrimaryButton(
                child: const Text("Submit Review"),
                onPressed: () {
                  review.messageReview = _reviewController.text;
                  ref
                      .read(reviewFormViewModelProvider.notifier)
                      .finalizeReviewForm(
                        widget.orderId,
                        _reviewController.text,
                        review.rating,
                      );
                  _future = ref
                      .read(reviewFormViewModelProvider.notifier)
                      .sendReview();
                  _future
                      ?.then((value) => widget.onReviewSuccess!())
                      .catchError((e) {
                    Fluttertoast.showToast(msg: e.toString());
                  });
                })
          ],
        ),
      ),
    );
  }
}
