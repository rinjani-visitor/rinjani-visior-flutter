import 'package:flutter/material.dart';
import 'package:rinjani_visitor/core/presentation/theme/theme.dart';

class PersonCounterWidget extends StatefulWidget {
  final TextEditingController controller;
  final Function(int) onSubmit;

  const PersonCounterWidget(
      {super.key, required this.onSubmit, required this.controller});

  @override
  State<PersonCounterWidget> createState() => _PersonCounterWidgetState();
}

class _PersonCounterWidgetState extends State<PersonCounterWidget> {
  final int _min = 1;
  final int _max = 25;

  void _increment() {
    if (int.parse(widget.controller.text) >= _max) return;
    setState(() {
      widget.controller.text =
          (int.parse(widget.controller.text) + 1).toString();
    });
  }

  void _decrement() {
    if (int.parse(widget.controller.text) <= _min) return;
    setState(() {
      widget.controller.text =
          (int.parse(widget.controller.text) - 1).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.controller.text.isEmpty) {
      widget.controller.text = "1";
    }
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
          color: whiteColor, borderRadius: BorderRadius.circular(bigRadius)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Select number of persons",
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Material(
                  child: int.parse(widget.controller.text) > _min
                      ? IconButton(
                          onPressed: () => _decrement(),
                          icon: const Icon(Icons.remove),
                        )
                      : const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Icon(
                            Icons.remove,
                            color: Colors.grey,
                          ),
                        )),
              const SizedBox(width: 20),
              Text(
                widget.controller.text,
                style: TextStyle(fontSize: heading5),
              ),
              const SizedBox(width: 20),
              Material(
                  child: int.parse(widget.controller.text) < _max
                      ? IconButton(
                          onPressed: () => _increment(),
                          icon: const Icon(Icons.add),
                        )
                      : const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Icon(
                            Icons.add,
                            color: Colors.grey,
                          ),
                        )),
            ],
          ),
          TextButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(primaryColor)),
              onPressed: () {
                Navigator.pop(context);
                widget.onSubmit(int.parse(widget.controller.text));
              },
              child: SizedBox(
                  width: 294,
                  child: Center(
                      child: Text(
                    'Continue',
                    style: whiteTextStyle.copyWith(
                        fontSize: body1, fontWeight: bold),
                  )))),
        ],
      ),
    );
  }
}
