import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CategoriesProduct extends StatefulWidget {
  const CategoriesProduct({super.key,required this.name});
  final String name;
  @override
  State<CategoriesProduct> createState() => _CategoriesProductState();
}

class _CategoriesProductState extends State<CategoriesProduct> {
  bool isLoading = false;
  List cat=[];
  getcategory(){
    setState(() {
      isLoading=true;
    });
    FirebaseFirestore.instance.collection("products")
  .where("category",isEqualTo: widget.name).get().then((value) {
    value.docs.forEach((element) { 
cat.add(element.data());
    });
     setState(() {
      isLoading=false;
    });
  });
  
  }
  @override
  void initState() {
    getcategory();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:cat.isEmpty? Center(child: CircularProgressIndicator()):Padding(
        padding: const EdgeInsets.only(right: 15.0, left: 15),
        child: GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 250,
            mainAxisExtent: 330,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: 9 / 15,
          ),
          itemCount: cat.length,
          itemBuilder: (context, index) {
            return _buildProductItem(index);
          },
        ),
      )
    
    );
  }
  _buildProductItem(index) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Center(
                child: Image.network(
                  cat[index]["image"][0] ?? "",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cat[index]["name"] ?? "non",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  cat[index]["discretion"] ?? "non",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(
                      cat[index]["price"].toString() ?? "",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                // if (selectedIndex != index)
                //   AddToCartButton(
                //     onPressed: () {
                //       _addToCard(index + 1);
                //     },
                //   ),
                // if (isCardLoading && selectedIndex == index)
                //   Center(
                //     child: SizedBox(
                //         height: 22,
                //         width: 22,
                //         child: Center(
                //             child: CircularProgressIndicator(
                //           color: Colors.orange,
                //         ))),
                //   )
              ],
            ),
          ],
        ),
      ),
    );
  }
}