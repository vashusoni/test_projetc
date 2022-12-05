import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    Key? key, required this.onTap, required this.buttonName, required this.colors,
  }) : super(key: key);

  final Function () onTap;
  final String buttonName;
  final Color colors;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
              color: colors,
            )),
        height: 40,
        width: 150,
        child: Center(
            child: TextButton(
          onPressed: onTap,
          child: Text(
            buttonName,
            style:  TextStyle(fontWeight: FontWeight.bold, fontSize: 17,color: colors),
          ),
        )),
      ),
    );
  }
}
