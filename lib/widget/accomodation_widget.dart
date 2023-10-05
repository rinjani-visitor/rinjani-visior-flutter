import 'package:flutter/cupertino.dart';
import 'package:rinjani_visitor/theme/theme.dart';

class AccomodationWidget extends StatelessWidget {
  const AccomodationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        'Accomodation',
        style: blackTextStyle.copyWith(fontSize: 20, fontWeight: semibold),
      ),
      SizedBox(
        height: 8,
      ),
      Text(
        '1. Food\n'
        '2. Drink\n'
        '3. Snack\n',
        style: TextStyle(fontSize: 16),
      ),
    ]);
  }
}
