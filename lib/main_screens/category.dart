import 'package:flutter/material.dart';

import '../Widgets/fake_search.dart';
import '../categories/skin_categ.dart';

List<ItemData> items = [
  ItemData(label: 'สกินแคร์'),
  ItemData(label: 'อาหารเสริม'),
  ItemData(label: 'เครื่องสำอาง'),
  ItemData(label: 'Software'),
  ItemData(label: 'ความเชื่อ')
];

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final PageController _pageController = PageController();
  //กำหนดให้รู้ว่า pageไหนทำงานอยู่

  @override
  void initState() {
    for (var item in items) {
      item.isSelect = false;
    }
    setState(() {
      items[0].isSelect = true;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size =
        MediaQuery.of(context).size; //ส่งค่าความกว้างหน้าจอ(ตั้งนอนก็ขยายตาม)
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const FakeSearch(),
      ),
      body: Stack(
        //ไว้แบ่งหน้าจอซ้ายขวา ตาม context
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: sideNavigator(size),
          ), //กำหนดPositioned ให้Stackว่าเริ่มที่จุดไหน
          Positioned(bottom: 0, right: 0, child: categView(size)),
        ],
      ),
    );
  }

  Widget sideNavigator(Size size) {
    return Container(
      height: size.height * 0.8,
      width: size.width * 0.2,
      color: Colors.grey.shade300,
      child: ListView.builder(
          //แบ่งหน้าจอเป็น Row
          itemCount: items.length, //ให้มีกี่ Row
          itemBuilder: (context, index) {
            //ในแต่ละอันต้องทำอะไร
            return GestureDetector(
              //context ที่มีการตรวจจัดการเปลี่ยนแปลง
              onTap: () {
                //เมื่อกดที่เมนูไหนก็จะกระโดดไป page นั้น
                _pageController.animateToPage(index,
                    duration: const Duration(
                        milliseconds: 400), //ความเร็วในการเปลี่ยน
                    curve: Curves.bounceInOut); //ตอนเปลี่ยนให้ in out
              },
              child: Container(
                height: 100, //ความสูงในแต่ละBox
                color: items[index].isSelect == true
                    ? Colors.white
                    : Colors.grey.shade300,
                child: Center(
                  child: Text(items[index].label),
                ),
              ),
            );
          }),
    );
  }

  Widget categView(Size size) {
    return Container(
      height: size.height * 0.8,
      width: size.width * 0.8,
      color: Colors.white,
      child: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          // event PageChangedต้องผ่านค่า indexลงไป
          for (var item in items) {
            item.isSelect = false;
          }
          setState(() {
            items[index].isSelect = true;
          });
        },
        scrollDirection: Axis.vertical, //ทำให้ PageView เลื่อนขึ้นบน
        children: const [
          //SkincareCateg(),
          SkinCateg(),
          Center(child: Text('อาหารเสริม Catagory')),
          Center(child: Text('เครื่องสำอาง Catagory')),
          Center(child: Text('Software Catagory')),
          Center(child: Text('ความเชื่อ Catagory')),
        ],
      ),
    );
  }
}

class ItemData {
  String label;
  bool isSelect;
  ItemData({required this.label, this.isSelect = false});
}
