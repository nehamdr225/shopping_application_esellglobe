import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final String value, title;
  final Function onChanged;
  InputField({Key key, this.value, this.title, this.onChanged})
      : super(key: key);

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  TextEditingController _controller;

  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value);
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Theme.of(context).textTheme.bodyText2.copyWith(fontSize: 15.0),
      controller: _controller,
      // obscureText: true,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderSide: BorderSide.none),
        labelText: widget.title,
        labelStyle: Theme.of(context).textTheme.bodyText2.copyWith(fontSize: 14.0),
      ),
    );
  }
}
