import 'package:chatsapp/core/color_value_manager.dart';
import 'package:chatsapp/core/size_value_manager.dart';
import 'package:flutter/material.dart';

class TextValueManager {
  static const kPrimaryText = Text(
    kSchlarchat,
    style: TextStyle(
      color: ColorValueManager.kWhiteColor,
      fontSize: FontSizeValueManager.fontZV30,
      fontFamily: kPacifico,
    ),
  );
  static const kSchlarchat = "Scholar Chat";
  static const kPleaseTryAgain = "Scholar Chat";
  static const kPacifico = "Pacifico";
  static const kFieldIsRequired = "Field is required";
  static const kEmailValid = " Enter a valid email address ";
  static const kEmail = "Email";
  static const kPassword = "Password";
  static const kNoAccount = "don't have an account?";
  static const kHaveAccount = "already have an account?";
  static const kLogo = "assets/images/scholar.png";
  static const kMessage = "message";
  static const kMessages = "messages";
  static const kcreatedAt = "createdAt";
  static const kId = "id";
  static const kTextWrong = "Something went wrong";
  static const kChat = "Chat";
  static const kemailRegExp =
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{3,}$';
  static const kSignIn = "Sign In";
  static const kRegester = "Regester";
  static const kSignUn = "Sign Un";
}
