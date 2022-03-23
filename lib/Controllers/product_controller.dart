import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:getx/Services/services.dart';
import '../Models/product.dart';




class ProductController extends GetxController{
   var isLoading = true.obs;
  var productList = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }


void fetchProducts() async {
    try {
      isLoading(true);
      var products = await RemoteServices.fetchProducts();
      if(products!=null){
        productList.value = products;
      }
    }
    finally {
      isLoading(false);
      // TODO
    }
}


}