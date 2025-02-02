import 'package:chatsapp/core/color_value_manager.dart';
import 'package:chatsapp/core/size_value_manager.dart';
import 'package:chatsapp/core/text_value_manager.dart';
import 'package:chatsapp/models/auth_sevices.dart';
import 'package:chatsapp/widgets/Scholor.dart';
import 'package:chatsapp/widgets/button_custom.dart';
import 'package:chatsapp/widgets/text_button_custom.dart';
import 'package:chatsapp/widgets/textfield_custom.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegesterPage extends StatefulWidget {
  const RegesterPage({super.key});
  static String id = "regester";

  @override
  State<RegesterPage> createState() => _RegesterPageState();
}

class _RegesterPageState extends State<RegesterPage> {
  String? email, password;

  bool isloading = false;

  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final RegExp emailRegExp = RegExp(TextValueManager.kemailRegExp);
    final RegExp passwordLeastLowerCaseLetter = RegExp(r'(?=.*[a-z])');
    final RegExp passwordLeastDigit = RegExp(r'(?=.*\d)');
    final RegExp passwordLeastOneCharacter = RegExp(r'(?=.*[@$!%*?&])');
    final RegExp passwordLeastEightNumber = RegExp(r'.{8,}');
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        // backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Form(
            key: formkey,
            child: ListView(
              children: [
                const SizedBox(height: WidthAndHighValue.hV60),
                const ScholarChat(),
                const SizedBox(height: WidthAndHighValue.hV60),
                const SizedBox(
                  width: double.infinity,
                  child: Text(
                    textAlign: TextAlign.start,
                    TextValueManager.kRegester,
                    style: TextStyle(
                      color: ColorValueManager.kWhiteColor,
                      fontSize: FontSizeValueManager.fontZV25,
                    ),
                  ),
                ),
                const SizedBox(height: WidthAndHighValue.hV15),
                TextFormFieldCustom(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return TextValueManager.kFieldIsRequired;
                    } else if (!emailRegExp.hasMatch(value)) {
                      return TextValueManager.kEmailValid;
                    }
                    return null;
                  },
                  onchange: (data) {
                    email = data;
                  },
                  hintlabel: TextValueManager.kEmail,
                ),
                const SizedBox(height: WidthAndHighValue.hV15),
                TextFormFieldCustom(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return TextValueManager.kFieldIsRequired;
                    } else if (!passwordLeastLowerCaseLetter.hasMatch(value)) {
                      return " Password must be at least a [a-z] ";
                    } else if (!passwordLeastOneCharacter.hasMatch(value)) {
                      return "Password must be at least a spicail character";
                    } else if (!passwordLeastDigit.hasMatch(value)) {
                      return " Password must be at least a number";
                    } else if (!passwordLeastEightNumber.hasMatch(value)) {
                      return " Password must be at least a 8 number";
                    }
                    return null;
                  },
                  obscureText: true,
                  onchange: (data) {
                    password = data;
                  },
                  hintlabel: TextValueManager.kPassword,
                ),
                const SizedBox(height: WidthAndHighValue.hV20),
                ButtonCustom(
                  onpressed: () async {
                    if (formkey.currentState!.validate()) {
                      isloading = true;
                      setState(() {});
                      AuthSevices().regesterAuth(context, email!, password!);
                      isloading = false;
                      setState(() {});
                    }
                  },
                  textbuttom: TextValueManager.kRegester,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      TextValueManager.kHaveAccount,
                      style: TextStyle(color: ColorValueManager.kWhiteColor),
                    ),
                    TextButtonCustom(
                      onpressed: () {
                        Navigator.pop(context);
                      },
                      textbutton: TextValueManager.kSignIn,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
