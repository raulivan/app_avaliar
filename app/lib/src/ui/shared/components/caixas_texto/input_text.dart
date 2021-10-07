import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  late String hintText;
  String? Function(String?)? validator;
  Icon? icon;
  late TextInputType keyboardType;
  TextEditingController? controller;
  bool? obscureText;

  InputText({
    Key? key,
    this.controller,
    required this.hintText,
    this.icon,
    required this.keyboardType,
    this.obscureText,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        primaryColor: Colors.orange,
      ),
      child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                obscureText: obscureText ?? false,
                controller: controller,
                validator: validator ?? (value) => null,
                keyboardType: keyboardType,
                autofocus: false,
                style: const TextStyle(fontSize: 15.0, color: Colors.black),
                decoration: InputDecoration(
                  icon: icon,
                  border: InputBorder.none,
                  hintText: hintText,
                  filled: true,
                  fillColor: Colors.grey[100],
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: const BorderSide(color: Colors.green),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
