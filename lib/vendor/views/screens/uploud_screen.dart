

import 'package:courseflutter/provider/product_provider.dart';
import 'package:courseflutter/vendor/views/screens/uploud_tap_screens/images_tab_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'uploud_tap_screens/attributes_tab_screen.dart';
import 'uploud_tap_screens/general_screen.dart';
import 'uploud_tap_screens/shipping_screen.dart';

class UploudScreen extends StatelessWidget {
  const UploudScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductProvider _productProvider =
     Provider.of<ProductProvider>(context);
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow.shade900,
          elevation: 0,
          bottom: TabBar(tabs: [
            Tab(
              child: Text('General'),
              ),
            Tab(
              child: Text('Shipping'),
              ),
            Tab(
              child: Text('Attributes'),
              ),
            Tab(
              child: Text('Images'),
              ),

          ]),
        ),
        
        body: TabBarView(children: [
         GeneralScreen(),
         ShippingScreen(),
         AttributesTabScreen(),
         ImagesTabScreen(),
        ],),
        bottomSheet: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: (){
              print(_productProvider.productDate['productName']);
              print(_productProvider.productDate['productPrice']);
              print(_productProvider.productDate['quantity']);
              print(_productProvider.productDate['category']);
              print(_productProvider.productDate['description']);
              print(_productProvider.productDate['scheludeDate']);
              print(_productProvider.productDate['imageUrlList']);
            },
            child: Text('Save'),
            ),
        ),
      ),
    );
  }
}