// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:testprojetc/app/login/services/login_services.dart';
import 'package:testprojetc/app/product_varient/view/product_varient_screen.dart';
import 'package:testprojetc/app/utils/app_colors.dart';
import '../../utils/size_config.dart';
import '../model/ProductModelsList.dart';
import '../services/product_services.dart';
import '../widget/product_widget.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    ProductServices().getProductDetails();
    super.initState();
  }
  double height = SizeConfig.heightMultiplier!;
  double width = SizeConfig.widthMultiplier!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Image.asset(
            "assets/splash_image/nykaa.png",
            height: height*5.7,
            width: width*25.6,
          ),
          actions: [
            Row(
              children: [
                Icon(
                  CupertinoIcons.search,
                  size: height*2.4,
                ),
                SizedBox(
                  width: width*5.1,
                ),
                Icon(
                  CupertinoIcons.heart,
                  size: height*2.2,
                ),
                SizedBox(
                  width: width*5.1,
                ),
                Icon(
                  CupertinoIcons.bag,
                  size: height*2.2,
                ),
                SizedBox(
                  width: width*5.1,
                ),
              ],
            )
          ],
        ),
        body: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nykaa Korean Beauty",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: height*2.9),
                        ),
                        Padding(
                          padding:  EdgeInsets.symmetric(vertical: height*1.1),
                          child: Text(
                            "57 product",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: height*2.2,
                                color: Colors.black54),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2),
                          child: Consumer<ProductServices>(
                              builder: (context, provider, child) {
                            return SizedBox(
                              height: height*4.4,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  ProductWidget(
                                    onTap: () {
                                      provider.setPageNo("1");
                                    },
                                    buttonName: "SheetMask",
                                    colors: AppColors.appPink,
                                  ),
                                  ProductWidget(
                                    onTap: () {
                                      provider.setPageNo("2");
                                    },
                                    buttonName: "SheetMask",
                                    colors: AppColors.appPink,
                                  ),
                                  ProductWidget(
                                    onTap: () {
                                      provider.setPageNo("3");
                                    },
                                    buttonName: "SheetMask",
                                    colors: AppColors.appPink,
                                  ),
                                  ProductWidget(
                                    onTap: () {
                                      provider.setPageNo("4");
                                    },
                                    buttonName: "SheetMask",
                                    colors: AppColors.appPink,
                                  ),
                                  ProductWidget(
                                    onTap: () {
                                      provider.setPageNo("5");
                                    },
                                    buttonName: "SheetMask",
                                    colors: AppColors.appPink,
                                  ),
                                  ProductWidget(
                                    onTap: () {
                                      provider.setPageNo("6");
                                    },
                                    buttonName: "SheetMask",
                                    colors: AppColors.appPink,
                                  ),
                                  ProductWidget(
                                    onTap: () {
                                      provider.setPageNo("7");
                                    },
                                    buttonName: "SheetMask",
                                    colors: AppColors.appPink,
                                  ),
                                  ProductWidget(
                                    onTap: () {
                                      provider.setPageNo("8");
                                    },
                                    buttonName: "SheetMask",
                                    colors: AppColors.appPink,
                                  ),
                                  ProductWidget(
                                    onTap: () {
                                      provider.setPageNo("9");
                                    },
                                    buttonName: "SheetMask",
                                    colors: AppColors.appPink,
                                  ),
                                  ProductWidget(
                                    onTap: () {
                                      provider.setPageNo("10");
                                    },
                                    buttonName: "SheetMask",
                                    colors: AppColors.appPink,
                                  ),
                                ],
                              ),
                            );
                          }),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          color: Colors.grey,
                          height: 1,
                        ),
                        Consumer<ProductServices>(
                            builder: (context, provider, child) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: InkWell(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (ctx) => AlertDialog(
                                          title: const Text("Sort By"),
                                          content: SizedBox(
                                            height: height*22.9,
                                            child: Column(
                                              children: [
                                                TextButton(
                                                    onPressed: () {
                                                      provider.setSortBy("mrp");
                                                      provider.setSortByTitel(
                                                          "Price");
                                                      Navigator.of(ctx).pop();
                                                    },
                                                    child: Text("Price")),
                                                TextButton(
                                                    onPressed: () {
                                                      provider.setSortBy(
                                                          "discount_percentage");
                                                      provider.setSortByTitel(
                                                          "Offers");
                                                      Navigator.of(ctx).pop();
                                                    },
                                                    child: Text("Offers")),
                                                TextButton(
                                                    onPressed: () {
                                                      provider
                                                          .setSortBy("rating");
                                                      provider.setSortByTitel(
                                                          "Rating");
                                                      Navigator.of(ctx).pop();
                                                    },
                                                    child: Text("Rating")),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          "assets/product_image/sort.png",
                                          height: height*2.2,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Sort By",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(provider.sortByTitel),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          "assets/product_image/filter.png",
                                          height: 22,
                                        ),
                                        SizedBox(
                                          width: width*1.2,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Filter",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text("Apply Filters"),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: InkWell(
                                    onTap: () {
                                      provider.setAllFieldClear();
                                    },
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            "assets/product_image/clear.png",
                                            height: 20,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: Text(
                                              "Clear All\nFiled",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          color: Colors.grey,
                          height: 1,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      flex: 10,
                      child: Container(
                        color: Colors.grey.withOpacity(.2),
                        child: Consumer<ProductServices>(
                            builder: (context, provider, child) {
                          return FutureBuilder<ProductModelsList>(
                              future: provider.getProductDetails(),
                              builder: (context, snapShot) {
                                if (snapShot.hasData) {
                                  return GridView.builder(
                                      itemCount:
                                          snapShot.data!.data!.products!.length,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisSpacing: 2,
                                              mainAxisSpacing: 2,
                                              childAspectRatio: .6,
                                              crossAxisCount: 2),
                                      itemBuilder: (context, index) {
                                        return Stack(
                                          children: [
                                            Card(
                                              color: Colors.white,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Text(
                                                          "FEATURED",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: AppColors
                                                                  .appPink),
                                                        )),
                                                    Image.asset(
                                                      "assets/product_image/sheet_mask.jpg",
                                                      height: height*13.7,
                                                    ),
                                                    SizedBox(
                                                        height: height*9.1,
                                                        width: width*46.1,
                                                        child: Text(
                                                          snapShot
                                                              .data!
                                                              .data!
                                                              .products![index]
                                                              .name
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontSize: 18),
                                                          maxLines: 3,
                                                        )),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(top: 2),
                                                          child: Image.asset(
                                                            "assets/product_image/rupee.png",
                                                            height: 12,
                                                          ),
                                                        ),
                                                        Text(
                                                          snapShot
                                                              .data!
                                                              .data!
                                                              .products![index]
                                                              .mrp
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 15),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        RatingBar.builder(
                                                          itemSize: 15,
                                                          initialRating: double
                                                              .parse(snapShot
                                                                  .data!
                                                                  .data!
                                                                  .products![
                                                                      index]
                                                                  .rating
                                                                  .toString()),
                                                          minRating: 0,
                                                          direction:
                                                              Axis.horizontal,
                                                          allowHalfRating: true,
                                                          itemCount: 5,
                                                          itemPadding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      2.0),
                                                          itemBuilder:
                                                              (context, _) =>
                                                                  Icon(
                                                            Icons.star,
                                                            color: Colors.amber,
                                                          ),
                                                          onRatingUpdate:
                                                              (rating) {},
                                                        ),
                                                        Text(
                                                            "(${snapShot.data!.data!.products![index].rating})")
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                            flex: 2,
                                                            child: InkWell(
                                                              onTap: () {
                                                                provider.favorite.containsKey(snapShot
                                                                        .data!
                                                                        .data!
                                                                        .products![
                                                                            index]
                                                                        .id)
                                                                    ? provider.setFavoriteRemove(snapShot
                                                                        .data!
                                                                        .data!
                                                                        .products![
                                                                            index]
                                                                        .id
                                                                        .toString())
                                                                    : provider.setFavoriteAdd(snapShot
                                                                        .data!
                                                                        .data!
                                                                        .products![
                                                                            index]
                                                                        .id
                                                                        .toString());
                                                              },
                                                              child: provider
                                                                      .favorite
                                                                      .containsKey(snapShot
                                                                          .data!
                                                                          .data!
                                                                          .products![
                                                                              index]
                                                                          .id)
                                                                  ? Image.asset(
                                                                      "assets/product_image/heart_one.png",
                                                                      height:
                                                                          height*2.8,
                                                                    )
                                                                  : Image.asset(
                                                                      "assets/product_image/heart_two.png",
                                                                      height:
                                                                          height*2.2,
                                                                    ),
                                                            )),
                                                        Expanded(
                                                            flex: 8,
                                                            child: InkWell(
                                                              onTap: () {
                                                                provider.addCart.containsKey(snapShot
                                                                        .data!
                                                                        .data!
                                                                        .products![
                                                                            index]
                                                                        .id
                                                                        .toString())
                                                                    ? provider.setCartRemove(snapShot
                                                                        .data!
                                                                        .data!
                                                                        .products![
                                                                            index]
                                                                        .id
                                                                        .toString())
                                                                    : provider.setAddCart(snapShot
                                                                        .data!
                                                                        .data!
                                                                        .products![
                                                                            index]
                                                                        .id
                                                                        .toString());
                                                              },
                                                              child: Container(
                                                                height: 40,
                                                                decoration: BoxDecoration(
                                                                    color: provider.addCart.containsKey(snapShot
                                                                            .data!
                                                                            .data!
                                                                            .products![
                                                                                index]
                                                                            .id
                                                                            .toString())
                                                                        ? AppColors
                                                                            .appGreen
                                                                        : AppColors
                                                                            .appPink),
                                                                child: Center(
                                                                  child: provider.addCart.containsKey(snapShot
                                                                          .data!
                                                                          .data!
                                                                          .products![
                                                                              index]
                                                                          .id
                                                                          .toString())
                                                                      ? Text(
                                                                          "Go Cart",
                                                                          style: TextStyle(
                                                                              fontSize: 16,
                                                                              fontWeight: FontWeight.bold,
                                                                              color: Colors.white),
                                                                        )
                                                                      : Text(
                                                                          "Add To Bag",
                                                                          style: TextStyle(
                                                                              fontSize: 16,
                                                                              fontWeight: FontWeight.bold,
                                                                              color: Colors.white),
                                                                        ),
                                                                ),
                                                              ),
                                                            )),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                                top: 8,
                                                right: 10,
                                                child: snapShot
                                                            .data!
                                                            .data!
                                                            .products![index]
                                                            .variants !=
                                                        null
                                                    ? InkWell(
                                                        onTap: () {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (context) => ProductVariantScreen(
                                                                      variant: snapShot
                                                                          .data!
                                                                          .data!
                                                                          .products![
                                                                              index]
                                                                          .variants)));
                                                        },
                                                        child: Container(
                                                          height: height*3.4,
                                                          width: width*7.6,
                                                          decoration: BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              color: AppColors
                                                                  .appPink
                                                                  .withOpacity(
                                                                      .5)),
                                                          child: Center(
                                                            child: Icon(
                                                                CupertinoIcons
                                                                    .bars),
                                                          ),
                                                        ),
                                                      )
                                                    : Container())
                                          ],
                                        );
                                      });
                                } else if (snapShot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Center(
                                    child: SizedBox(
                                        height: height*6.8,
                                        width: width*15.3,
                                        child: CircularProgressIndicator(
                                          color: AppColors.appPink,
                                          strokeWidth: .8,
                                        )),
                                  );
                                }
                                return Center(child: Text("Data Not Found..!"));
                              });
                        }),
                      ))
                ],
              ),
            ),
          ],
        ));
  }

  @override
  void dispose() {
   final provider=Provider.of<LoginService>(context,listen: false);
   provider.userNameController.dispose();
   provider.userPasswordController.dispose();
    super.dispose();
  }
}
