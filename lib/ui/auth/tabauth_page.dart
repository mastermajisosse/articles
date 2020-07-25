import 'package:afaq/ui/auth/login_screen.dart';
import 'package:afaq/ui/auth/register_screen.dart';
import 'package:afaq/utils/mystyle.dart';
import 'package:flutter/material.dart';

class TabAuthPage extends StatefulWidget {
  @override
  _TabAuthPageState createState() => _TabAuthPageState();
}

class _TabAuthPageState extends State<TabAuthPage> {
  bool callApi = true;
  int numb = 30;
  @override
  void initState() {
    super.initState();
  }

  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        initialIndex: 1,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "الحقيقة",
                style: Mystyle.titleTextStyle,
              ),
            ),
            centerTitle: true,
            automaticallyImplyLeading: false,
            bottom: TabBar(
              indicatorColor: Mystyle.primarycolo,
              labelColor: Mystyle.primarycolo,
              indicatorWeight: 4,
              unselectedLabelColor: Mystyle.primarycolo.withOpacity(.5),
              labelStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Mystyle.primarycolo,
              ),
              tabs: [Tab(text: 'انشاء حساب'), Tab(text: 'تسجيل الدخول')],
            ),
          ),
          body: TabBarView(
            children: [
              RegisterScreen(),
              LoginScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
