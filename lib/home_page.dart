import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:getx/Controllers/product_controller.dart';
import 'package:get/get.dart';
import 'Views/product_tile.dart';



class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(
              Icons.shopping_cart_outlined,
              color: Colors.black,
            ),
          ),
        ],
        leading: IconButton(
          enableFeedback: true,
          highlightColor: Colors.grey,
          onPressed: () {
            print("Icon Button Pressed");
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    "ShopX",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontFamily: "avenir",
                      fontSize: 32,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    print("--------------");
                  },
                  icon: const Icon(Icons.view_list_rounded),
                ),
                IconButton(
                  onPressed: () {
                    print("--------------");
                  },
                  icon: const Icon(Icons.grid_view),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              if (productController.isLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return StaggeredGridView.countBuilder(
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  crossAxisCount: 2,
                  itemCount: productController.productList.length,
                  itemBuilder: (context, index) {
                    return ProductTile(productController.productList[index]);
                  },
                  staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}








/// makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline
/// https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline
