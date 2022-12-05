import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:testprojetc/app/api/basUrl.dart';
import '../model/ProductModelsList.dart';

class ProductServices with ChangeNotifier {
  String _pageNo = "1";
  String _sortBy = "";
  String _sortByTitel = "Popularity";
  String _filter = "";

  Map _addCart = {};
  Map _favorite = {};

  Map get favorite => _favorite;

  Map get addCart => _addCart;

  String get pageNo => _pageNo;

  String get sortBy => _sortBy;

  String get sortByTitel => _sortByTitel;

  String get filter => _filter;

  setAddCart(String id) {
    _addCart[id] = id;
    notifyListeners();
  }

  setCartRemove(String id) {
    _addCart.remove(id);
    notifyListeners();
  }

  setFavoriteAdd(String id) {
    _favorite[id] = id;

    notifyListeners();
  }

  setFavoriteRemove(String id) {
    _favorite.remove(id);

    notifyListeners();
  }

  setPageNo(String value) {
    _pageNo = value;
    notifyListeners();
  }

  setFilter(String value) {
    _filter = value;
    notifyListeners();
  }

  setAllFieldClear() {
    _pageNo = "1";
    _sortBy = "";
    _sortByTitel = "Popularity";
    _filter = "";
    notifyListeners();
  }

  setSortBy(String value) {
    _sortBy = value;
    notifyListeners();
  }

  setSortByTitel(String value) {
    _sortByTitel = value;
    notifyListeners();
  }

  Future<ProductModelsList> getProductDetails() async {
    final response = await http.get(Uri.parse(
        '${BaseUrl.baseProductUrl}url_key=makeup&productSorting=$_sortBy&page_size=10&page_no=$_pageNo&searchByKeyword=&searchByWidgetProduct='));
    try {
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        ProductModelsList productList = ProductModelsList.fromJson(data);

        return productList;
      }
      return Future.error("Error_error_getProductDetails");
    } catch (e) {
      return Future.error("Error$e");
    }
  }
}
