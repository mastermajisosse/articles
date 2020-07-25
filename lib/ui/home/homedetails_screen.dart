import 'package:afaq/utils/mystyle.dart';
import 'package:afaq/utils/size_config.dart';
import 'package:flutter/material.dart';

class HomeScreenDetails extends StatefulWidget {
  final image, title, author, date, body, imageauth, likes;
  HomeScreenDetails({
    this.image,
    this.date,
    this.title,
    this.author,
    this.imageauth,
    this.likes,
    this.body,
  });

  @override
  _HomeScreenDetailsState createState() => _HomeScreenDetailsState();
}

class _HomeScreenDetailsState extends State<HomeScreenDetails> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Hero(
            tag: 'news',
            child: Material(
              color: Colors.white,
              child: SingleChildScrollView(
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        height: SizeConfig.heightbox * 10,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(widget.image),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        alignment: Alignment.topRight,
                        padding: EdgeInsets.symmetric(horizontal: 24.0),
                        child: Text(
                          widget.date,
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topRight,
                        padding: EdgeInsets.symmetric(horizontal: 24.0),
                        child: Text(
                          widget.title,
                          style: Mystyle.titleTextStyle,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.symmetric(horizontal: 24.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  width: 35,
                                  height: 35,
                                  decoration:
                                      Mystyle.roundPic(widget.imageauth),
                                ),
                                SizedBox(width: SizeConfig.blockSizeVertical),
                                Text(
                                  widget.author,
                                  style: Mystyle.regularTextStyle,
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(Icons.share, color: Colors.black),
                                  onPressed: null,
                                ),
                                Text(
                                  "شارك",
                                  style: Mystyle.regularTextStyle
                                      .copyWith(color: Colors.black),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.0),
                        child: Text(
                          widget.body,
                          style: TextStyle(fontSize: 16, height: 1.2),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
