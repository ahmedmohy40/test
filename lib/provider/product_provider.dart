import 'package:flutter/widgets.dart';

class ProductProvider with ChangeNotifier{
  Map <String, dynamic> productDate = {};

  getFormData(
    {String ?productName, 
     double? productPrice, 
     int? quantity, 
     String? category, 
     String? description,
     DateTime ? scheludeDate, List<String>? imageUrlList
     }){
    if(productName!=null){
      productDate['productName']= productName;
    }

    if(productPrice!=null){
      productDate['productPrice'] = productPrice;
    }
    if(quantity!=null){
      productDate['quantity'] = quantity;
    }
    if(category!=null){
      productDate['category'] = category;
    }
    
    if(description!=null){
      productDate['description'] = description;
    }
    if(scheludeDate!=null){
      productDate['scheludeDate'] = scheludeDate;
    }
    if(imageUrlList!=null){
      productDate['imageUrlList'] = imageUrlList;
    }

  }
}