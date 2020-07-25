import 'package:afaq/bloc/profile/bloc.dart';
import 'package:afaq/main.dart';
import 'package:afaq/repository/user_auth_repo.dart';
import 'package:afaq/utils/mystyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Profule();
    // return Scaffold(
    //     body: SafeArea(
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: <Widget>[
    //       Expanded(
    //         child: Container(
    //           width: double.infinity,
    //           decoration: BoxDecoration(
    //               color: Colors.lightBlue,
    //               gradient: LinearGradient(colors: [
    //                 Mystyle.primarycolo,
    //                 Colors.black87,
    //               ])),
    //           child: Column(
    //             children: <Widget>[
    //               Row(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 children: <Widget>[
    //                   // BackButton(color: Colors.white),
    //                   InkWell(
    //                     onTap: () {
    //                       UserRepository().signOut();
    //                     },
    //                     child: Text("data"),
    //                   ),

    //                   Padding(
    //                     padding: const EdgeInsets.only(right: 1.0, top: 8.0),
    //                     child: Text(
    //                       "الصفحة الشخصية",
    //                       style: TextStyle(
    //                         color: Colors.white,
    //                         fontSize: 28,
    //                       ),
    //                     ),
    //                   ),
    //                   Container(),
    //                 ],
    //               ),
    //               SizedBox(height: 30),
    //               Container(
    //                 height: 150,
    //                 width: 150,
    //                 padding: EdgeInsets.all(8),
    //                 decoration: BoxDecoration(
    //                   border: Border.all(width: 1, color: Colors.white),
    //                   shape: BoxShape.circle,
    //                 ),
    //                 child: Container(
    //                   height: 80,
    //                   width: 80,
    //                   alignment: Alignment.center,
    //                   decoration: BoxDecoration(
    //                     border: Border.all(width: 3, color: Colors.white),
    //                     shape: BoxShape.circle,
    //                     image: DecorationImage(
    //                       image: NetworkImage(
    //                         "https://www.eksirtech.ir/imobile/imobile.png",
    //                       ),
    //                       fit: BoxFit.cover,
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //               SizedBox(height: 20),
    //               Text(
    //                 "المجيد عيعي",
    //                 style: TextStyle(
    //                   fontSize: 38,
    //                   color: Colors.white,
    //                 ),
    //               ),
    //               Text(
    //                 "الرباط",
    //                 style: TextStyle(
    //                   fontSize: 20,
    //                   color: Colors.black87,
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //       Expanded(
    //         child: Container(
    //           width: double.infinity,
    //           padding: const EdgeInsets.only(right: 48.0),
    //           child: Column(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             crossAxisAlignment: CrossAxisAlignment.end,
    //             children: <Widget>[
    //               Text(
    //                 "الايميل",
    //                 style: TextStyle(
    //                   fontSize: 18,
    //                   color: Mystyle.primarycolo,
    //                 ),
    //               ),
    //               Text(
    //                 "Email@gmail.com",
    //                 style: TextStyle(fontSize: 28, color: Colors.black87),
    //               ),
    //               SizedBox(height: 20),
    //               Text(
    //                 "الهاتف",
    //                 style: TextStyle(
    //                   fontSize: 18,
    //                   color: Mystyle.primarycolo,
    //                 ),
    //               ),
    //               Text(
    //                 "+121 309988774",
    //                 style: TextStyle(fontSize: 28, color: Colors.black87),
    //               ),
    //               SizedBox(height: 20),
    //               Text(
    //                 "انستغرام",
    //                 style: TextStyle(
    //                   fontSize: 18,
    //                   color: Mystyle.primarycolo,
    //                 ),
    //               ),
    //               Text(
    //                 "@gmailm",
    //                 style: TextStyle(fontSize: 28, color: Colors.black87),
    //               ),
    //               SizedBox(height: 20),
    //               Text(
    //                 "الفيسبوك",
    //                 style: TextStyle(
    //                   fontSize: 18,
    //                   color: Mystyle.primarycolo,
    //                 ),
    //               ),
    //               Text(
    //                 "AwesomeFlutter",
    //                 style: TextStyle(fontSize: 28, color: Colors.black87),
    //               ),
    //               SizedBox(height: 20),
    //             ],
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // ));
  }
}

class Profule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoadSuccesS) {
            return Container(
              color: Mystyle.primarycolo,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        "https://i.dlpng.com/static/png/6542357_preview.png",
                      ),
                      radius: 60,
                      backgroundColor: Colors.transparent,
                    ),
                    SizedBox(height: 40),
                    Text(
                      'الاسم',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      state.profile.firstname,
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'البريد الالكتروني',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      state.profile.email,
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 40),
                    RaisedButton(
                      onPressed: () {
                        UserRepository().signOut().whenComplete(() => {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyApp()),
                              )
                            });
                      },
                      color: Colors.deepPurple,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'تسجيل الخروج',
                          style: TextStyle(fontSize: 22, color: Colors.white),
                        ),
                      ),
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                    )
                  ],
                ),
              ),
            );
          } else
            return Container();
        },
      ),
    );
  }
}
