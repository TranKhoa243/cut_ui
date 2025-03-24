import 'package:flutter/material.dart';
import 'package:flutter_base_structure/presentation/base/base_page.dart';
import 'package:flutter_base_structure/presentation/base/base_page_mixin.dart';

class KeyboardKey extends StatefulWidget {
  final dynamic label;
  final dynamic value;
  final ValueSetter<dynamic> onTap;

  const KeyboardKey({
    Key? key,
    required this.label,
    required this.value,
    required this.onTap,
  }) : super(key: key);

  @override
  _KeyboardKeyState createState() => _KeyboardKeyState();
}

class _KeyboardKeyState extends State<KeyboardKey> {
  renderLabel() {
    if (widget.label is Widget) {
      return Container(
        margin: const EdgeInsets.all(3),
        alignment: Alignment.center,
        child: widget.label,
      );
      // widget.label;
    }
    return widget.label != ''
        ? Container(
            margin: const EdgeInsets.all(3),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 0,
                  blurRadius: 0,
                  offset: const Offset(-1, 1.2), // changes position of shadow
                )
              ],
            ),
            child: Text(
              widget.label,
              style: const TextStyle(
                fontSize: 25.0,
                // fontWeight: FontWeight.bold,
              ),
            ),
          )
        : Container();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onTap(widget.value);
      },
      child: AspectRatio(
        aspectRatio: 2,
        child: renderLabel(),
      ),
    );
  }
}
