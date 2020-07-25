import 'package:afaq/bloc/articles/articles_bloc.dart';
import 'package:afaq/bloc/articles/bloc.dart';
import 'package:afaq/models/user_model.dart';
import 'package:afaq/repository/user_auth_repo.dart';
import 'package:afaq/repository/user_database_repo.dart';
import 'package:afaq/ui/home/homedetails_screen.dart';
import 'package:afaq/utils/mystyle.dart';
import 'package:afaq/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String desc =
      "مكن تعلم العزف على الجيتار من خلال تعلم كيفية حمل الجيتار بشكل صحيح، حيث يجب التمسك بالأوتار باليد اليمنى بين منتصف ثقب الصوت والجسر، ولمس أوتار العنق باليد اليسرى، كما يجب الجلوس بشكل مستقيم ثمّ حمل الجيتار بحيث يكون جزء الأوتار الصغيرة متوجهة";
  String url =
      "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/1200px-Image_created_with_a_mobile_phone.png";
  String id;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: BlocBuilder<ArticlesBloc, ArticlesState>(
        builder: (context, state) {
          if (state is ArticleLoadInProgress) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ArticleLoadSuccesS) {
            // final articlesofmonth = state
            // .articles
            // .firstWhere((article) => article.id == 0, orElse: () => null);

            return Directionality(
              textDirection: TextDirection.rtl,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Hero(
                  tag: 'news',
                  child: Material(
                    child: ListView(
                      children: <Widget>[
                        SizedBox(height: SizeConfig.blockSizeVertical),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "موضوع الشهر",
                              style: Mystyle.titleTextStyle,
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.search,
                                size: 32,
                              ),
                              onPressed: () async {
                                UserDataBaseRepo()
                                    .profile(await UserRepository().getUser());
                              },
                            )
                          ],
                        ),
                        SizedBox(height: SizeConfig.paddingVertical),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeScreenDetails(
                                  image: url,
                                  date: 'مند 3 ساعات',
                                  title: "تعلم العزف على الجيتار",
                                  author: "المجيد عيعي",
                                  imageauth: url,
                                  likes: "22",
                                  body: desc,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            height: SizeConfig.heightbox * 12,
                            decoration: BoxDecoration(
                              color: Colors.grey[700],
                              image: DecorationImage(
                                image: NetworkImage(url),
                                // state.articles.first.image,
                                fit: BoxFit.cover,
                              ),
                            ),
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 24.0, right: 16.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    // "أشياء يمكنك القيام بها لأكتر انتاجية",
                                    state.articles.first.title,
                                    style: Mystyle.monthtopicTextStyle,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        width: 35,
                                        height: 35,
                                        decoration: Mystyle.roundPic(
                                          url, //state.articles.first.authimg,
                                        ),
                                      ),
                                      SizedBox(
                                          width: SizeConfig.blockSizeVertical),
                                      Text(
                                        // "المجيد عيعي",
                                        state.articles.first.authorName,
                                        style: Mystyle.monthtopicTextStyle
                                            .copyWith(
                                          fontSize: 18,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: SizeConfig.blockSizeVertical),
                        Text(
                          "مواضيع جديدة",
                          style: Mystyle.newtopicTextStyle,
                        ),
                        Column(
                          children:
                              List.generate(state.articles.length, (index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomeScreenDetails(
                                      image: url,
                                      date: 'مند 3 ساعات',
                                      title: "تعلم العزف على الجيتار",
                                      author: "المجيد عيعي",
                                      imageauth: url,
                                      likes: "22",
                                      body: desc,
                                    ),
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: double.infinity,
                                  height: SizeConfig.heightbox * 2.7,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        width: SizeConfig.widthbox * 5,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.grey[600],
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              "https://www.eksirtech.ir/imobile/imobile.png",
                                              // state.articles[index].authimg,
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                          width: SizeConfig.blockSizeVertical),
                                      Container(
                                        width: SizeConfig.screenWidth / 1.7,
                                        height: double.infinity,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              // "كيف تنتج الليمون بدون حموضة",
                                              state.articles[index].title,
                                              style:
                                                  Mystyle.regulartitleTextStyle,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Flexible(
                                              child: Text(
                                                // desc,
                                                state.articles[index].body,

                                                style: Mystyle.regularTextStyle,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else if (state is ArticleLoadFailure) {
            return Center(
              child: Text(
                "حدت خطأ ما،\n تحقق من وجود النت",
                style: Mystyle.regulartitleTextStyle,
                textAlign: TextAlign.center,
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
