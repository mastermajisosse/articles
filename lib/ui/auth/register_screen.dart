import 'package:afaq/bloc/register/bloc.dart';
import 'package:afaq/bloc/register/register_bloc.dart';
import 'package:afaq/main.dart';
import 'package:afaq/ui/tabs_screen.dart';
import 'package:afaq/utils/mystyle.dart';
import 'package:afaq/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _country = TextEditingController();
  final TextEditingController _name = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _country.dispose();
    _name.dispose();
    super.dispose();
  }

  bool get isPopulated =>
      _emailController.text.isNotEmpty &&
      _country.text.isNotEmpty &&
      _name.text.isNotEmpty &&
      _passwordController.text.isNotEmpty;

  bool isRegisterButtonEnabled(RegisterState state) {
    return state.isFormValid && isPopulated && !state.isSubmitting;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<RegisterBloc, RegisterState>(
        listener: (context, state) {
          if (state.isFailure) {
            Scaffold.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text('Login Failure'), Icon(Icons.error)],
                  ),
                  backgroundColor: Colors.red,
                ),
              );
          }
          if (state.isSubmitting) {
            Scaffold.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Logging In...'),
                      CircularProgressIndicator(),
                    ],
                  ),
                ),
              );
          }
          if (state.isSuccess) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MyApp()),
            );
          }
        },
        child: BlocBuilder<RegisterBloc, RegisterState>(
          builder: (context, state) {
            return ListView(
              children: <Widget>[
                SizedBox(height: SizeConfig.screenHeight / 20),
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.paddingHorizontal * 5,
                        ),
                        child: Text(
                          "انشاء حساب جديد ",
                          style: Mystyle.titleTextStyle,
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                      SizedBox(height: SizeConfig.screenHeight / 40),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.paddingHorizontal * 5,
                          vertical: SizeConfig.paddingVertical,
                        ),
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: TextFormField(
                            controller: _name,
                            keyboardType: TextInputType.text,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Colors.black87,
                            ),
                            decoration: Mystyle.inputDecoration(hint: 'الاسم'),
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.paddingHorizontal * 5,
                          vertical: SizeConfig.paddingVertical,
                        ),
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: TextFormField(
                            controller: _country,
                            keyboardType: TextInputType.text,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Colors.black87,
                            ),
                            decoration: Mystyle.inputDecoration(hint: 'الدولة'),
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.paddingHorizontal * 5,
                          vertical: SizeConfig.paddingVertical,
                        ),
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: _emailController,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Colors.black87,
                            ),
                            decoration:
                                Mystyle.inputDecoration(hint: 'الايميل'),
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.paddingHorizontal * 5,
                          vertical: SizeConfig.paddingVertical,
                        ),
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: TextFormField(
                            controller: _passwordController,
                            obscureText: true,
                            keyboardType: TextInputType.text,
                            // autocorrect: true,
                            decoration:
                                Mystyle.inputDecoration(hint: 'كلمة المرور'),
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: SizeConfig.screenHeight / 20),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.paddingHorizontal * 5,
                        ),
                        child: InkWell(
                          onTap: () async {
                            _formKey.currentState.validate();

                            if (isRegisterButtonEnabled(state)) {
                              BlocProvider.of<RegisterBloc>(context).add(
                                RegisterSubmitted(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                  country: _country.text,
                                  name: _name.text,
                                ),
                              );
                            }
                          },
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          child: Container(
                            width: double.infinity,
                            height: SizeConfig.screenHeight / 12,
                            decoration: Mystyle.butdec,
                            alignment: Alignment.center,
                            child: Text(
                              "انشاء الحساب ",
                              style: Mystyle.monthtopicTextStyle
                                  .copyWith(fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: SizeConfig.screenHeight / 20),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
