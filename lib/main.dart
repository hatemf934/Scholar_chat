import 'package:chatsapp/core/color_value_manager.dart';
import 'package:chatsapp/core/size_value_manager.dart';
import 'package:chatsapp/core/text_value_manager.dart';
import 'package:chatsapp/cubits/themecubit/themecubit.dart';
import 'package:chatsapp/cubits/themecubit/themecubitstate.dart';
import 'package:chatsapp/firebase_options.dart';
import 'package:chatsapp/models/thememodel.dart';
import 'package:chatsapp/views/chatpage.dart';
import 'package:chatsapp/views/loginpage.dart';
import 'package:chatsapp/views/regesterpage.dart';
import 'package:chatsapp/views/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error,
              color: ColorValueManager.kRedColor,
              size: FontSizeValueManager.fontZV50),
          SizedBox(height: WidthAndHighValue.hV15),
          Text(TextValueManager.kPleaseTryAgain,
              style: TextStyle(
                  color: ColorValueManager.kRedColor,
                  fontSize: FontSizeValueManager.fontZV20),
              textAlign: TextAlign.center)
        ],
      ),
    );
  };
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Themecubit(),
      child: BlocBuilder<Themecubit, Themecubitstate>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Chat APP',
            theme: state == Themecubitstate.light
                ? Thememodel().ligtmode
                : Thememodel().darkmode,
            routes: {
              "chat": (context) => const Chatpage(),
              "/": (context) => const SplashScreen(),
              "/home": (context) => const LoginPage(),
              // maybe make a route string a static id from your page like this
              RegesterPage.id: (context) => const RegesterPage(),
            },
            debugShowCheckedModeBanner: false,
            initialRoute: "/",
          );
        },
      ),
    );
  }
}
