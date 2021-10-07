import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  IconData icone;
  String texto;
  void Function() onClick;

  MenuItem(this.icone, this.texto, this.onClick, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        child: Container(
          padding: const EdgeInsets.only(left: 20),
          height: 60,
          child: Row(
            children: <Widget>[
              Icon(icone, size: 32, color: Colors.black),
              const SizedBox(width: 32),
              Text(
                texto,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              )
            ],
          ),
        ),
        onTap: onClick,
      ),
    );
  }
}
