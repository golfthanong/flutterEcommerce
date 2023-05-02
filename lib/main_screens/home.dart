import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Widgets/fake_search.dart';
import '../minor_screens/search.dart';

class HomeSrceen extends StatefulWidget {
  const HomeSrceen({super.key});

  @override
  State<HomeSrceen> createState() => _HomeSrceenState();
}

class _HomeSrceenState extends State<HomeSrceen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      //ในหนึ่งหน้าให้แบ่ง tab แสดง
      length: 5, //มีกี่ tab
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const FakeSearch(),
          bottom: const TabBar(
            isScrollable: true, //ถ้าเมนูยาวเกิน 1 หน้าจอต้องมีScrollable
            indicatorColor: Colors.orange, //กำหนดสีเส้นในเมนู
            indicatorWeight: 6,
            tabs: [
              RepeatedTab(label: 'สกินแคร์'),
              RepeatedTab(label: 'อาหารเสริม'),
              RepeatedTab(label: 'เครื่องสำอาง'),
              RepeatedTab(label: 'Software'),
              RepeatedTab(label: 'ความเชื่อ'),
            ],
          ),
        ),
        body: const TabBarView(
          //ใช้ คู่กับDefaultTabController
          children: [
            Center(
              child: Text('สกินแคร์ Screen'),
            ),
            Center(
              child: Text('อาหารเสริม Screen'),
            ),
            Center(
              child: Text('เครื่องสำอาง Screen'),
            ),
            Center(
              child: Text('Software Screen'),
            ),
            Center(
              child: Text('ความเชื่อ โปรแกรมจิต Screen'),
            ),
          ],
        ),
      ),
    );
  }
}

class RepeatedTab extends StatelessWidget {
  final String label;
  const RepeatedTab({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(
        label,
        style: TextStyle(color: Colors.grey.shade600),
      ),
    );
  }
}
