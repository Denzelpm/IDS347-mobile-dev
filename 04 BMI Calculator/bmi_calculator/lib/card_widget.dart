import 'package:flutter/material.dart';

class CardWidget extends StatefulWidget {
  CardWidget(
      {super.key,
      required this.color,
      required this.cardContent,
      required this.tapAction});

  Color color;
  Widget cardContent;
  void Function() tapAction;

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        // width: double.infinity,
        alignment: Alignment.center,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: widget.color,
        ),
        child: widget.cardContent,
      ),
      onTap: widget.tapAction,
    );
  }
}
