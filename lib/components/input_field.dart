import 'package:flutter/material.dart';

class LoginInputField extends StatelessWidget {
  final String hintText;
  final bool pwd;
  final VoidCallback onPressed;
  final TextEditingController inputController;

  const LoginInputField({
    Key? key,
    required this.hintText,
    required this.pwd,
    required this.onPressed,
    required this.inputController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      padding:
          EdgeInsets.only(right: size.width * 0.05, bottom: size.width * 0.05),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return "Field can't be empty";
          }
          return null;
        },
        obscureText: pwd,
        enableSuggestions: !pwd,
        autocorrect: !pwd,
        controller: inputController,
        cursorColor: Colors.black,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          fillColor: Colors.white,
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.black.withOpacity(0.3)),
        ),
      ),
    );
  }
}
