import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../Models/model.dart';

class CategoriesTab extends StatefulWidget {
  CategoriesTab({Key? key}) : super(key: key);

  @override
  State<CategoriesTab> createState() => _CategoriesTabState();
}

class _CategoriesTabState extends State<CategoriesTab> {
  int isLoaded = 0;
  List<UsersModel> res = [];
  Future<int?> getUsersResponse() async {
    const apiLink = 'https://jsonplaceholder.typicode.com/users';
    try {
      final response = await Dio().get(apiLink);

      List listaya = response.data;
      for (var element in listaya) {
        res.add(UsersModel.fromJson(element));
      }

      setState(() {
        isLoaded = 1;
      });
    } catch (e) {
      setState(() {
        isLoaded = 2;
      });
      throw Exception(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getUsersResponse();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: isLoaded == 1
          ? ListView.separated(
        shrinkWrap: true,
        itemCount: res.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              CircleAvatar(
                child: Text(res[index].id.toString()),
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(child: Text(res[index].name!)),
              Spacer(),
              IconButton(
                  onPressed: () {}, icon: Icon(Icons.arrow_forward)),
            ],
          ),
        ),
        separatorBuilder: (context, index) => Divider(),
      )
          : isLoaded == 0
          ? Center(child: CircularProgressIndicator())
          : Center(
        child: Text('Failed to load API'),
      ),
    );
  }
}
