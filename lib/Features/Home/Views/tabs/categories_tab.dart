import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Controlers/remote_service.dart';
import '../../Models/model.dart';


class CategoriesTab extends StatefulWidget {
  CategoriesTab({Key? key}) : super(key: key);

  @override
  State<CategoriesTab> createState() => _CategoriesTabState();
}

class _CategoriesTabState extends State<CategoriesTab> {
  int isLoaded = 0;
  List<UsersModel> res =[];
  Future<void> getUsersResponse() async {
    const apiLink = 'https://jsonplaceholder.typicode.com/users';

      final  response = await Dio().get(apiLink);
      print('status : ${response.statusCode}');

       res .addAll(
           response.data.map((json) => UsersModel.fromJson(json)).toList());


  }
@override
  void initState() {

    // TODO: implement initState
  getUsersResponse().then((value){

    setState(() {
isLoaded=1;
    });
  });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: isLoaded == 1?ListView.separated(
        shrinkWrap: true,
        itemCount: res.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
             CircleAvatar(child: Text(res[index].id.toString()),),
              SizedBox(
                width: 8,
              ),
              Expanded(child: Text(res[index].name!)),
              Spacer(),
              IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward)),
            ],
          ),
        ),
        separatorBuilder: (context, index) => Divider(),
      ):Center(child:CircularProgressIndicator()) ,
    );
  }

  List<String> text = [
    "Constructions",
    "Insurances",
    "Legal",
    "Buy & Sell",
    "Accounting Services",
  ];

  List<String> images = [
    "assets/images/construction.png",
    "assets/images/Cate.png",
    "assets/images/legal.png",
    "assets/images/buy.png",
    "assets/images/account.png",
  ];
}
