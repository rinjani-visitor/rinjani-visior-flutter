import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/core/presentation/theme/theme.dart';
import 'package:rinjani_visitor/features/review/presentation/view_model/write_review.dart';
import 'package:rinjani_visitor/core/widget/button/primary_button.dart';
import 'package:rinjani_visitor/core/widget/form/input_field.dart';

import '_widgets/rating.dart';

class WriteReviewPage extends ConsumerStatefulWidget {
  const WriteReviewPage({super.key});

  @override
  ConsumerState<WriteReviewPage> createState() => _WriteReviewPageState();
}

class _WriteReviewPageState extends ConsumerState<WriteReviewPage> {
  final _reviewController = TextEditingController();

  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final review = ref.watch(writeReviewViewModelProvider);
    return CupertinoPageScaffold(
        backgroundColor: CupertinoColors.systemGrey6,
        navigationBar: const CupertinoNavigationBar(
          middle: Text("Your Review"),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Your Rating",
                  style: blackTextStyle.copyWith(fontSize: heading4),
                ),
                RatingSelector(
                    rating: 5,
                    currentRating: review.reviewScore ?? 0,
                    onStarTapped: (val) {
                      setState(() {
                        review.reviewScore = val;
                      });
                    }),
                const SizedBox(height: 16.0),
                InputFormField(
                  controller: _reviewController,
                  label: "Write your review here",
                ),
                PrimaryButton(
                    child: const Text("Submit Review"),
                    onPressed: () {
                      review.content = _reviewController.text;
                      ref
                          .read(writeReviewViewModelProvider.notifier)
                          .sendReview();
                      Navigator.pop(context);
                    })
              ],
            ),
          ),
        ));
  }
}
