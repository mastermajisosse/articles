import 'package:afaq/utils/mystyle.dart';
import 'package:afaq/utils/size_config.dart';
import 'package:flutter/material.dart';

class ContactScreen extends StatefulWidget {
  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      padding:
          EdgeInsets.symmetric(horizontal: SizeConfig.paddingHorizontal * 5),
      child: ListView(
        key: _scaffoldKey,
        children: <Widget>[
          SizedBox(height: SizeConfig.paddingVertical * 5),
          Center(
            child: Icon(
              Icons.mail,
              size: SizeConfig.paddingVertical * 6,
            ),
          ),
          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                false
                    ? Center(
                        child: Text(
                          "err",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )
                    : Container(),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.paddingVertical,
                  ),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextFormField(
                      // obscureText: obscure,
                      keyboardType: TextInputType.text,
                      decoration: Mystyle.inputDecoration(
                        hint: "عنوان الرسالة",
                      ),
                      // onSaved: (v) => password = v,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return "*المرجو ادخال كلمة المرور";
                        } else if (value.length < 5) {
                          return 'كلمة المرور مكونة من اكتر من 4 احرف';
                        } else
                          return null;
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.paddingVertical,
                  ),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextFormField(
                      maxLines: 6,
                      keyboardType: TextInputType.text,
                      decoration: Mystyle.inputDecoration(
                        hint: "محتوى الرسالة",
                      ),
                      // onSaved: (v) => password = v,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return "*المرجو ادخال كلمة المرور";
                        } else if (value.length < 5) {
                          return 'كلمة المرور مكونة من اكتر من 4 احرف';
                        } else
                          return null;
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: SizeConfig.paddingVertical * 5),
          InkWell(
            onTap: () {},
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            child: Container(
              width: double.infinity,
              height: SizeConfig.screenHeight / 15,
              decoration: BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Center(
                child: Text(
                  "ارسال",
                  style: Mystyle.regulartitleTextStyle.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
