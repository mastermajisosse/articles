import 'package:afaq/bloc/articles/bloc.dart';
import 'package:afaq/bloc/auth/authentication_bloc.dart';
import 'package:afaq/bloc/login/bloc.dart';
import 'package:afaq/bloc/profile/bloc.dart';
import 'package:afaq/bloc/profile/profile_bloc.dart';
import 'package:afaq/bloc/register/register_bloc.dart';
import 'package:afaq/bloc/simple_bloc_delegate.dart';
import 'package:afaq/repository/articles_repo.dart';
import 'package:afaq/repository/user_auth_repo.dart';
import 'package:afaq/repository/user_database_repo.dart';
import 'package:afaq/ui/auth/splash_screen.dart';
import 'package:afaq/ui/auth/tabauth_page.dart';
import 'package:afaq/ui/tabs_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<AuthenticationBloc>(
            create: (context) =>
                AuthenticationBloc()..add(AuthenticationStarted()),
          ),
          BlocProvider<LoginBloc>(
            create: (context) => LoginBloc(),
          ),
          BlocProvider<RegisterBloc>(
            create: (context) => RegisterBloc(),
          ),
          BlocProvider<ArticlesBloc>(
            create: (context) => ArticlesBloc()..add(ArticlesLoadSuccessE()),
          ),
          BlocProvider<ProfileBloc>(
            create: (context) => ProfileBloc()..add(ProfilesLoadSuccessE()),
          ),
        ],
        child: MiddleMan(),
      ),
    );
  }
}

class MiddleMan extends StatefulWidget {
  MiddleMan({Key key}) : super(key: key);

  @override
  _MiddleManState createState() => _MiddleManState();
}

class _MiddleManState extends State<MiddleMan> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is AuthenticationSuccess) {
          return TabsScreen();
        }
        if (state is AuthenticationInitial) {
          return CircularProgressIndicator();
        }
        if (state is AuthenticationFailure) {
          return TabAuthPage();
        }
        return null;
      },
    );
  }
}
