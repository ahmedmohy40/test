import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:courseflutter/controllers/category_model.dart';
import 'package:courseflutter/provider/cate_cubit.dart';
import 'package:courseflutter/views/buyers/nav_screens/categoryproduct.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CateCubit()..getCate(),
      child: BlocConsumer<CateCubit, CateState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = CateCubit.get(context);
          return Scaffold(
              body: cubit.cate.isEmpty
                  ? Center(child: CircularProgressIndicator())
                  : Center(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          child: ListView.separated(
                            separatorBuilder: (context, index) => SizedBox(height: 15,),
                            itemCount: cubit.cate.length,
                            itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => CategoriesProduct(name: cubit.cate[index].categoryName!,),));
                              },
                              child: Container(
                                color: Colors.orange,
                                                  
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: ListTile(title: Text(cubit.cate[index].categoryName!),
                                  leading: CircleAvatar(backgroundImage: NetworkImage(cubit.cate[index].image!)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ));
        },
      ),
    );
  }
}
