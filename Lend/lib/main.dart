import 'package:Lend_A_Hand/services/authentication.dart';
import 'package:Lend_A_Hand/views/home_view.dart';
import 'package:Lend_A_Hand/views/reset_password_view.dart';
import 'package:Lend_A_Hand/views/signIn_view.dart';
import 'package:Lend_A_Hand/views/signUp_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) =>
              context.read<AuthenticationService>().authStateChanges,
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Lend a hand',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: AuthenticationWrapper(),
        routes: <String, WidgetBuilder>{
          // Use '/' for '/home'
          // '/home': (BuildContext context) => HomeView(),
          '/signUp': (BuildContext context) => SignUpView(),
          '/signIn': (BuildContext context) => SignInView(),
          '/resetPassword': (BuildContext context) => ResetPasswordView(),
        },
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if (firebaseUser != null) {
      return HomeView();
    }
    return SignInView();
  }
}
