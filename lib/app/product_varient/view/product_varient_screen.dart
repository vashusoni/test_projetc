import 'package:flutter/material.dart';

import '../../product/model/ProductModelsList.dart';

class ProductVariantScreen extends StatefulWidget {
  const ProductVariantScreen({Key? key, required this.variant})
      : super(key: key);

  @override
  State<ProductVariantScreen> createState() => _ProductVariantScreenState();

  final List<Variants>? variant;
}

class _ProductVariantScreenState extends State<ProductVariantScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          itemCount: widget.variant!.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Color(int.parse(
                              "0xff${widget.variant![index].colorCode!.substring(1)}"))),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        widget.variant![index].attributeName.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                      Text(
                        widget.variant![index].attributeOptionName.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/product_image/rupee.png",
                              height: 13, color: Colors.black45),
                          Text(
                            widget.variant![index].mrp.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black45,
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            );
          }),
    );
  }
}
