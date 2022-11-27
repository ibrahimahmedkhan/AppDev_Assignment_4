import 'package:flutter/material.dart';

class MultiTextField extends StatefulWidget {
  const MultiTextField({Key? key}) : super(key: key);

  @override
  State<MultiTextField> createState() => _MultiTextFieldState();
}

class _MultiTextFieldState extends State<MultiTextField>
    with SingleTickerProviderStateMixin {
  final List<Widget> _phoneWidgets = List<TextField>.empty(growable: true);
  final List<TextEditingController> _textEditingControllers =
      List<TextEditingController>.empty(growable: true);

  @override
  void initState() {
    super.initState();
    _phoneWidgets.add(const TextField());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: List.generate(
            _phoneWidgets.length, (index) => _phoneWidgets[index]),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => setState(() {
                _phoneWidgets.add(const TextField());
                _textEditingControllers.add(TextEditingController());
              })),
    );
  }
}
