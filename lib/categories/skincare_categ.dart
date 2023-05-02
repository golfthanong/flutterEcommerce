import 'package:flutter/material.dart';

import '../minor_screens/subcateg_products.dart';
import '../utility/categ_list.dart';

List<String> skincaretry = [
  'images/try/skincare0.jpg',
  'images/try/skincare1.jpg',
  'images/try/skincare2.jpg',
  'images/try/skincare3.jpg',
  'images/try/skincare4.jpg',
  'images/try/skincare5.jpg',
  'images/try/skincare6.jpg',
  'images/try/skincare7.jpg',
  'images/try/skincare8.jpg',
];
List<String> labelskincare = [
  'TSW SENSOR FOAM เซ็นเซอร์ โฟม',
  'images/try/skincare1.jpg',
  'images/try/skincare2.jpg',
  'images/try/skincare3.jpg',
  'images/try/skincare4.jpg',
  'images/try/skincare5.jpg',
  'images/try/skincare6.jpg',
  'images/try/skincare7.jpg',
  'images/try/skincare8.jpg',
];

class SkincareCateg extends StatelessWidget {
  const SkincareCateg({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: SizedBox(
              height: MediaQuery.of(context).size.height *
                  0.8, //กำหนดให้contextที่อยู่ในนี้สูง 80%ของหน้าจอ
              width: MediaQuery.of(context).size.height *
                  0.75, //กำหนดให้contextที่อยู่ในนี้สูง 75%ของหน้าจอ
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CategHeeaderLabel(
                    headerLabel: 'Skin',
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.68,
                    child: GridView.count(
                      //ให้แสดงค่าที่อ่านมาจากlist เป็น GridView
                      mainAxisSpacing: 70,
                      crossAxisSpacing: 15,
                      crossAxisCount: 3, //ให้แสดง 2 คอลัม
                      children: List.generate(skincaretry.length, (index) {
                        //generate list
                        return SubcategModel(
                          maincategName: 'Skin',
                          subcategName: skin[index],
                          assetName: skincaretry[index],
                          subcategLabal: skin[index],
                        );
                      }),
                    ),
                  )
                ],
              ),
            ),
          ),
          const Positioned(
            bottom: 0,
            right: 0,
            child: SliderBar(
              maincategName: 'skin',
            ),
          )
        ],
      ),
    );
  }
}

class SliderBar extends StatelessWidget {
  final String maincategName;
  const SliderBar({super.key, required this.maincategName});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      width: MediaQuery.of(context).size.height * 0.05,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.brown.withOpacity(0.2),
              borderRadius: BorderRadius.circular(5)),
          child: RotatedBox(
            quarterTurns: 3,
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceAround, //set ให้ rowขนาดเต็ม Size Box

              children: [
                const Text(
                  ' << ',
                  style: TextStyle(
                      color: Colors.brown,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 10),
                ),
                Text(
                  maincategName.toUpperCase(),
                  style: const TextStyle(
                      color: Colors.brown,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 10),
                ),
                const Text(
                  ' >> ',
                  style: TextStyle(
                      color: Colors.brown,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 10),
                ),
              ],
            ),
          ), //ทำให้มี contextในนั้นเหมือนแบ่งแถว
        ),
      ),
    );
  }
}

class SubcategModel extends StatelessWidget {
  final String maincategName;
  final String subcategName;
  final String assetName;
  final String subcategLabal;
  const SubcategModel({
    super.key,
    required this.maincategName,
    required this.subcategName,
    required this.assetName,
    required this.subcategLabal,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //widgetที่สามารถกดได้
      onTap: () {
        //เมื่อกดจะทำงาน
        Navigator.push(
          context,
          MaterialPageRoute(
            //MaterialPageRoute ไปหน้าใหม่
            builder: ((context) => SubCategProducts(
                  maincategName: maincategName, //ส่งค่า category ไปด้วย
                  subcategName: subcategName, //ส่งชื่อสินค้า
                )),
          ),
        );
      },
      child: Column(
        children: [
          SizedBox(
            height: 105,
            width: 105,
            child: Image(image: AssetImage(assetName)),
          ),
          Text(subcategLabal),
        ],
      ),
    );
  }
}

class CategHeeaderLabel extends StatelessWidget {
  final String headerLabel;
  const CategHeeaderLabel({super.key, required this.headerLabel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Text(
        headerLabel,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.5,
        ),
      ),
    );
  }
}
