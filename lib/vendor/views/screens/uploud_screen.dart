

import 'package:courseflutter/vendor/views/screens/uploud_tap_screens/images_tab_screen.dart';
import 'package:flutter/material.dart';

import 'uploud_tap_screens/attributes_tab_screen.dart';
import 'uploud_tap_screens/general_screen.dart';
import 'uploud_tap_screens/shipping_screen.dart';

class UploudScreen extends StatelessWidget {
  const UploudScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      ),
    );
  }
}