import 'package:afaq/bloc/login/bloc.dart';
import 'package:afaq/main.dart';
import 'package:afaq/utils/mystyle.dart';
import 'package:afaq/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // UserRepository get _userRepository => widget._userRepository;

  bool get isPopulated =>
      _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;

  bool isLoginButtonEnabled(LoginState state) {
    return state.isFormValid && isPopulated && !state.isSubmitting;
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<LoginBloc, LoginState>(
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
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return bodyscreen(state);
          },
        ),
      ),
    );
  }

  bodyscreen(LoginState state) {
    return ListView(
      children: <Widget>[
        SizedBox(height: SizeConfig.screenHeight / 12),
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
                  "مرحبا بكم في تطبيق الحقيقة",
                  style: Mystyle.titleTextStyle,
                  textDirection: TextDirection.rtl,
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight / 50),
              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.paddingHorizontal * 5,
                ),
                child: Text(
                  "تسجيل الدخول",
                  style: Mystyle.regularTextStyle,
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
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    // autovalidate: true,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.black87,
                    ),
                    decoration: Mystyle.inputDecoration(hint: 'الايميل'),
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
                    obscureText: true,
                    controller: _passwordController,
                    keyboardType: TextInputType.text,

                    // autovalidate: true,
                    decoration: Mystyle.inputDecoration(
                      hint: 'كلمة المرور',
                    ),
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
                  onTap: () {
                    _formKey.currentState.validate();
                    if (state.isFormValid &&
                        _emailController.text.isNotEmpty &&
                        _passwordController.text.isNotEmpty &&
                        !state.isSubmitting) {
                      BlocProvider.of<LoginBloc>(context)
                          .add(LoginWithCredentialsPressed(
                        email: _emailController.text,
                        password: _passwordController.text,
                      ));
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
                      "تسجيل الدخول",
                      style: Mystyle.monthtopicTextStyle.copyWith(fontSize: 18),
                    ),
                  ),
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight / 30),
              Container(
                width: double.infinity,
                height: SizeConfig.screenHeight / 12,
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.paddingHorizontal * 5,
                ),
                child: RaisedButton.icon(
                  icon: Icon(FontAwesomeIcons.google, color: Color(0xFFd94821)),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Color(0xFFd94821), width: 1),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  onPressed: () {
                    BlocProvider.of<LoginBloc>(context).add(
                      LoginWithGooglePressed(),
                    );
                  },
                  elevation: 0,
                  label: Text(
                    'الدخول عن طريق غوغل',
                    style: Mystyle.regulartitleTextStyle.copyWith(),
                  ),
                  color: Colors.white,
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight / 20),
            ],
          ),
        ),
      ],
    );
  }
}
