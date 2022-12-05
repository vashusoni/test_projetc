
import 'package:flutter/material.dart';
class StackSizeWidget extends StatelessWidget {
  const StackSizeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
    );
  }
}