import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoriesTab extends StatelessWidget {
   CategoriesTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: text.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Image.asset(images[index]),
              SizedBox(width: 8,),
              Expanded(child: Text(text[index])),
              Spacer(),
              IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward)),
            ],
          ),
        ),
        separatorBuilder: (context , index)=>Divider(),
      ),
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
