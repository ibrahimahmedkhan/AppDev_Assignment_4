import 'package:flutter/material.dart';

class MultiTextField extends StatefulWidget {
  const MultiTextField({Key? key, required this.textEditingControllers})
      : super(key: key);
  final List<TextEditingController> textEditingControllers;

  @override
  State<MultiTextField> createState() => _MultiTextFieldState();
}

class _MultiTextFieldState extends State<MultiTextField>
    with SingleTickerProviderStateMixin {
  final List<Widget> _phoneWidgets = List<TextField>.empty(growable: true);
  // final List<TextEditingController> _textEditingControllers =
  //     List<TextEditingController>.empty(growable: true);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () => setState(() {
                        TextEditingController controller =
                            TextEditingController();
                        widget.textEditingControllers.add(controller);
                        _phoneWidgets.add(TextField(
                          controller: controller,
                        ));
                      }),
                  icon: const Icon(Icons.add)),
              IconButton(
                  onPressed: () => setState(() {
                        _phoneWidgets.removeLast();
                      }),
                  icon: const Icon(Icons.remove))
            ],
          ),
          Column(
            children: List.generate(
                _phoneWidgets.length, (index) => _phoneWidgets[index]),
          ),
        ],
      ),
    );
  }
}
