import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:courseflutter/controllers/category_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'cate_state.dart';

class CateCubit extends Cubit<CateState> {
  CateCubit() : super(CateInitial());

  static CateCubit get(context) => BlocProvider.of(context);

  List<CateModel> cate = [];
  void getCate()async{



    FirebaseFirestore.instance.collection("categories")
    .get().then((value) {
        cate = [];
      value.docs.forEach((element) {
      

        cate.add(CateModel.fromJson(element.data()),);
       
      });
       emit(getCateState());
      print(cate.length);
    }).catchError((e){
      e.toString();
      emit(cateErrState());
    });

  }
 

}
