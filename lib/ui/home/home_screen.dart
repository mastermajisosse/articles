import 'package:afaq/bloc/articles/articles_bloc.dart';
import 'package:afaq/bloc/articles/bloc.dart';
import 'package:afaq/models/article_model.dart';
import 'package:afaq/ui/home/homedetails_screen.dart';
import 'package:afaq/utils/mystyle.dart';
import 'package:afaq/ui/tabs_screen.dart';
import 'package:afaq/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var noimg =
      "https://www.coraf.org/wp-content/themes/consultix/images/no-image-found-360x250.png";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: BlocBuilder<ArticlesBloc, ArticlesState>(
        builder: (context, state) {
          if (state is ArticleLoadInProgress) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ArticleLoadSuccesS) {
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
                                MaterialPageRoute(builder: (_) {
                                  return BlocProvider.value(
                                    value:
                                        BlocProvider.of<ArticlesBloc>(context),
                                    child: TabsScreen(),
                                  );
                                });
                                // UserDataBaseRepo()
                                //     .profile(await UserRepository().getUser());
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
                                    articleModel: ArticleModel(
                                  image: state.articlesofmonth().image,
                                  date: state.articlesofmonth().date,
                                  title: state.articlesofmonth().title,
                                  authorName:
                                      state.articlesofmonth().authorName,
                                  authorimg: state.articlesofmonth().authorimg,
                                  // likes: "22",
                                  body: state.articlesofmonth().body,
                                )),
                              ),
                            );
                          },
                          child: Container(
                            height: SizeConfig.heightbox * 12,
                            decoration: BoxDecoration(
                              color: Colors.grey[700],
                              image: DecorationImage(
                                image:
                                    NetworkImage(state.articlesofmonth().image),
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
                                    state.articlesofmonth().title,
                                    style: Mystyle.monthtopicTextStyle,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        width: 35,
                                        height: 35,
                                        decoration: Mystyle.roundPic(
                                          state.articlesofmonth().authorimg,
                                        ),
                                      ),
                                      SizedBox(
                                          width: SizeConfig.blockSizeVertical),
                                      Text(
                                        state.articlesofmonth().authorName,
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
                          children: List.generate(state.myother().length - 1,
                              (index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomeScreenDetails(
                                      articleModel: ArticleModel(
                                        image: state
                                            .myother()
                                            .elementAt(index)
                                            .image,
                                        date: state
                                            .myother()
                                            .elementAt(index)
                                            .date,
                                        title: state
                                            .myother()
                                            .elementAt(index)
                                            .title,
                                        authorName: state
                                            .myother()
                                            .elementAt(index)
                                            .authorName,
                                        authorimg: state
                                            .myother()
                                            .elementAt(index)
                                            .authorimg,
                                        // likes: "22",
                                        body: state
                                            .myother()
                                            .elementAt(index)
                                            .body,
                                      ),
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
                                              // "https://www.eksirtech.ir/imobile/imobile.png",
                                              state
                                                  .myother()
                                                  .elementAt(index)
                                                  .image,
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
                                              state
                                                  .myother()
                                                  .elementAt(index)
                                                  .title,
                                              style:
                                                  Mystyle.regulartitleTextStyle,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Flexible(
                                              child: Text(
                                                // desc,
                                                state
                                                    .myother()
                                                    .elementAt(index)
                                                    .body,

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
