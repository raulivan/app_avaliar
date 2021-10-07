import 'package:flutter/material.dart';

class PadraoButton extends StatelessWidget {
  String text;
  void Function()? onPressed;
  PadraoButton({Key? key, required this.text, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: SizedBox.expand(
          child: TextButton(
              onPressed: onPressed,
              child: Text(text,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20,
                  ))),
        ),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            border: Border.all(color: Colors.teal),
            color: Colors.teal),
      ),
    );
  }
}
