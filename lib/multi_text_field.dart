import 'package:flutter/material.dart';

class MultiTextField extends StatefulWidget {
  const MultiTextField({Key? key}) : super(key: key);

  @override
  State<MultiTextField> createState() => _MultiTextFieldState();
}

class _MultiTextFieldState extends State<MultiTextField>
    with SingleTickerProviderStateMixin {
  List<Widget> _phoneWidgets = List<TextField>.empty(growable: true);
  List<TextEditingController> _textEditingControllers =
      List<TextEditingController>.empty(growable: true);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _phoneWidgets.add(TextField());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: List.generate(
              _phoneWidgets.length, (index) => _phoneWidgets[index]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => setState(() {
                _phoneWidgets.add(TextField());
                _textEditingControllers.add(TextEditingController());
              })),
    );
  }
}
