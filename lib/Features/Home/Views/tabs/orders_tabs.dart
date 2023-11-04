import 'package:flutter/cupertino.dart';

class OrdersTab extends StatelessWidget {
  const OrdersTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(child: Image.asset("assets/images/EmptyState.png")),
        SizedBox(height: 9,),
        Text("NO Orders found",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
        Text("you can place your needed orders to let serve you",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Color(0xff707070)),textAlign: TextAlign.center,)
      ],
    );
  }
}
