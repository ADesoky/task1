import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:task/Features/Home/Views/tabs/categories_tab.dart';
import 'package:task/Features/Home/Views/tabs/orders_tabs.dart';
import 'package:task/Features/Home/Views/tabs/services_tab.dart';
import 'package:task/Shared/app_colors.dart';

import '../../../Shared/components/custombutton.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

// Replace '3' with the number of tabs you want

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.5,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu_sharp,
              color: Colors.black,
            )),
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: ExactAssetImage('assets/images/profile.png'),
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  "Hey, Ahmed 🙏",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Multi-Services for Your Real Estate Needs',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const Text(
                'Explore diverse real estate services for all your needs: property managment, contstruction, insurance and more in one place'),
            const SizedBox(
              height: 20,
            ),

            CarouselSlider(
              options: CarouselOptions(height: 170.0,autoPlay: true,aspectRatio: 1,viewportFraction: 1),
              items: data.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 1.0),
                        decoration: BoxDecoration(
                            color: MyColors.seconedColor,
                        ),
                        child:Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Column(

                                children: [
                                   Text(
                                    i.text,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold, fontSize: 14),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  CustomButton(
                                    onTap: () {},
                                    text: i.buttonText,
                                    color: MyColors.redColor,
                                    height: 30,
                                    width: 140,
                                    fontColor: Colors.white,
                                  ),
                                ],
                                mainAxisAlignment: MainAxisAlignment.center,
                              ),
                            ),

                            Expanded(child: Image.asset(i.image)),
                          ],
                        ),);

                  },
                );
              }).toList(),

            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: MyColors.borderColor,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.,
                  children: [
                    Expanded(
                        child: InkWell(
                      onTap: () => changeIndex(0),
                      child: Container(
                        height: 30,
                        width: 96,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: selectedindex == 0
                              ? MyColors.redColor
                              : MyColors.borderColor,
                        ),
                        child: Center(
                          child: Text(
                            'Categories',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: selectedindex == 0
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    )),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: InkWell(
                      onTap: () => changeIndex(1),
                      child: Container(
                        height: 30,
                        width: 96,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: selectedindex == 1
                              ? MyColors.redColor
                              : MyColors.borderColor,
                        ),
                        child: Center(
                          child: Text(
                            'Services',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: selectedindex == 1
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    )),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: InkWell(
                      onTap: () => changeIndex(2),
                      child: Container(
                        height: 30,
                        width: 96,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: selectedindex == 2
                              ? MyColors.redColor
                              : MyColors.borderColor,
                        ),
                        child: Center(
                          child: Text(
                            'Orders',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: selectedindex == 2
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    )),
                  ],
                ),
              ),
            ),
            Expanded(child: tabs[selectedindex]),

          ],
        ),
      ),
    );
  }

  changeIndex(index) {
    setState(() {
      selectedindex = index;
    });
  }

  final List<Widget> tabs = [
    CategoriesTab(),
    ServicesTab(),
    OrdersTab(),
  ];
  int selectedindex = 0;


 List< CarouselData > data = [
   CarouselData(text:'Multi-Services for Your Real Estate Needs1' ,image: 'assets/images/main page.png' ,buttonText:'Order1' ),
   CarouselData(text:'Multi-Services for Your Real Estate Needs2' ,image: 'assets/images/main page.png' ,buttonText:'Order2' ),
   CarouselData(text:'Multi-Services for Your Real Estate Needs3' ,image: 'assets/images/main page.png' ,buttonText:'Order3' ),
 ];
}

class CarouselData{
  String text;
  String image;
  String buttonText;

  CarouselData({required this.text,required this.image,required this.buttonText});
}