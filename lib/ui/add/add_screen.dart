import 'dart:io';
import 'package:afaq/repository/user_auth_repo.dart';

import 'package:afaq/bloc/articles/articles_bloc.dart';
import 'package:afaq/bloc/articles/bloc.dart';
import 'package:afaq/main.dart';
import 'package:afaq/models/article_model.dart';
import 'package:afaq/utils/imageframe.dart';
import 'package:afaq/utils/mystyle.dart';
import 'package:afaq/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:afaq/models/user_model.dart';
import 'package:image_picker/image_picker.dart';

class AddScreen extends StatefulWidget {
  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final _formKey = GlobalKey<FormState>();
  File image;

  User user;

  final TextEditingController title = TextEditingController();
  final TextEditingController tags = TextEditingController();
  final TextEditingController country = TextEditingController();
  final TextEditingController body = TextEditingController();
  // Image img = Image(image: null);
  bool get isPopulated =>
      title.text.isNotEmpty &&
      country.text.isNotEmpty &&
      body.text.isNotEmpty &&
      tags.text.isNotEmpty;

  bool isEnabled(ArticlesState state) {
    return isPopulated && state is! ArticleAddLoading;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // print(UserRepository().user.uid);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height / 12),
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
      body: BlocListener<ArticlesBloc, ArticlesState>(
        listener: (context, state) {
          if (state is ArticleAddErr) {
            Scaffold.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.error),
                      Text('مشكلة في الادخال'),
                    ],
                  ),
                  backgroundColor: Colors.red,
                ),
              );
          }
          if (state is ArticleAddLoading) {
            Scaffold.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircularProgressIndicator(),
                      Text('جاري اضافة الموضوغ...'),
                    ],
                  ),
                ),
              );
          }
          if (state is ArticleAddSuccess) {
            Scaffold.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  backgroundColor: Mystyle.primarycolo,
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.insert_emoticon),
                      Text('تم الاضافة بنجاح'),
                    ],
                  ),
                ),
              );
            Future.delayed(Duration(seconds: 2)).then((value) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MyApp()),
              );
            });
          }
        },
        child: BlocBuilder<ArticlesBloc, ArticlesState>(
          builder: (context, state) {
            return mybody(state);
          },
        ),
      ),
    );
  }

  mybody(state) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: ListView(
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: SizeConfig.paddingVertical,
                    ),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: TextFormField(
                        controller: title,
                        keyboardType: TextInputType.text,
                        decoration: Mystyle.inputDecoration(
                          hint: "عنوان الموضوع",
                          icon: Icon(
                            Icons.title,
                          ),
                        ),
                        validator: (String value) {
                          if (value.isEmpty) {
                            return "*المرجو ادخال عنوان الموضوع";
                          } else if (value.length < 5) {
                            return 'عنوان الموضوع مكونة من اكتر من 4 احرف';
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
                        controller: country,
                        keyboardType: TextInputType.text,
                        decoration: Mystyle.inputDecoration(
                            hint: "الدولة",
                            icon: Icon(
                              Icons.crop_free,
                            )),
                        validator: (String value) {
                          if (value.isEmpty) {
                            return "*المرجو ادخال الدولة";
                          } else if (value.length < 5) {
                            return 'الدولة مكونة من اكتر من 4 احرف';
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
                        controller: tags,
                        keyboardType: TextInputType.text,
                        decoration: Mystyle.inputDecoration(
                            hint: "كلمات مفتاحية (tags)",
                            icon: Icon(
                              Icons.crop_free,
                            )),
                        validator: (String value) {
                          if (value.isEmpty) {
                            return "*المرجو ادخال كلمات مفتاحية";
                          } else if (value.length < 5) {
                            return 'كلمات مفتاحية مكونة من اكتر من 4 احرف';
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
                        controller: body,
                        maxLines: 12,
                        keyboardType: TextInputType.text,
                        decoration: Mystyle.inputDecoration(
                          hint: "محتوى الموضوع",
                        ),
                        validator: (String value) {
                          if (value.isEmpty) {
                            return "*المرجو ادخال المحتوى";
                          } else if (value.length < 120) {
                            return 'المحتوى مكونة من اكتر من 120 حرف';
                          } else
                            return null;
                        },
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    child: InkWell(
                      onTap: getImage,
                      child: Container(
                        width: SizeConfig.screenWidth / 3,
                        height: SizeConfig.screenWidth / 3,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: image == null
                            ? Center(
                                child: Icon(Icons.add_a_photo),
                              )
                            : Image.file(
                                image,
                                fit: BoxFit.fill,
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: SizeConfig.paddingVertical * 2),
            InkWell(
              onTap: () {
                FocusScope.of(context).unfocus();

                if (_formKey.currentState.validate() && isEnabled(state))
                  // _formKey.currentState.validate();
                  BlocProvider.of<ArticlesBloc>(context).add(
                    ArticleAdded(
                      ArticleModel(
                        id: "",
                        authorimg: "",
                        title: title.text,
                        tags: tags.text,
                        body: body.text,
                        country: country.text,
                      ),
                      image,
                    ),
                  );
              },
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
    );
  }

  var picker = ImagePicker();

  Future getImage() async {
    var pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      image = File(pickedFile.path);
    });
  }
}
