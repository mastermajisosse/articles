import 'package:afaq/utils/imageframe.dart';
import 'package:afaq/utils/mystyle.dart';
import 'package:afaq/utils/size_config.dart';
import 'package:flutter/material.dart';

class AddScreen extends StatefulWidget {
  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height / 12),
          child: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            centerTitle: true,
            title: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                "موضوع جديد",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                ),
              ),
            ),
            actions: <Widget>[],
          ),
        ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: ListView(
              children: <Widget>[
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
                              hint: "عنوان الموضوع",
                              icon: Icon(
                                Icons.title,
                              ),
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
                            // obscureText: obscure,
                            keyboardType: TextInputType.text,
                            decoration: Mystyle.inputDecoration(
                                hint: "الدولة",
                                icon: Icon(
                                  Icons.crop_free,
                                )),
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
                            // obscureText: obscure,
                            keyboardType: TextInputType.text,
                            decoration: Mystyle.inputDecoration(
                                hint: "كلمات مفتاحية (tags)",
                                icon: Icon(
                                  Icons.crop_free,
                                )),
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
                            maxLines: 12,
                            keyboardType: TextInputType.text,
                            decoration: Mystyle.inputDecoration(
                              hint: "محتوى الموضوع",
                            ),
                            // onSaved: (v) => password = v,
                            validator: (String value) {
                              if (value.isEmpty) {
                                return "*المرجو ادخال كلمة المرور";
                              } else if (value.length < 120) {
                                return 'كلمة المرور مكونة من اكتر من 120 حرف';
                              } else
                                return null;
                            },
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomRight,
                        child: ImageFrame(),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: SizeConfig.paddingVertical * 2),
                InkWell(
                  onTap: () {},
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  child: Container(
                    width: double.infinity,
                    height: SizeConfig.screenHeight / 15,
                    decoration: BoxDecoration(
                      color: Colors.black87,
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
                ),
                SizedBox(height: SizeConfig.paddingVertical * 2),
              ],
            ),
          ),
        ));
  }
}
