
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rinjani_visitor/core/widgets/text_field.dart';

class DevScreen extends StatelessWidget {
  const DevScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dev Screen"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: MTextFormField(
                hintText: "eg: Octo-Carbon",
                labelText: "Username",
              ),
            ),
            FilledButton(onPressed: () {}, child: Text("Wu Wuahai")),
            FilledButton.tonal(onPressed: () {}, child: Text("Chang Cheng")),
            OutlinedButton(onPressed: () {}, child: Text("Michigan")),
            TextButton(onPressed: () {}, child: Text("Dafeng")),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                      foregroundColor: Theme.of(context).colorScheme.onBackground,
                      side: BorderSide(color: Theme.of(context).colorScheme.onBackground),
                      textStyle: Theme.of(context).textTheme.titleSmall),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        child: SvgPicture.asset("assets/icons/google.svg"),
                      ),
                      SizedBox(width: 8,),
                      Text("Login with Google"),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
