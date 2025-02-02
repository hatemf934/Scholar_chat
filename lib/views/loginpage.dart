import 'package:chatsapp/core/color_value_manager.dart';
import 'package:chatsapp/core/size_value_manager.dart';
import 'package:chatsapp/core/text_value_manager.dart';
import 'package:chatsapp/cubits/themecubit/themecubit.dart';
import 'package:chatsapp/cubits/themecubit/themecubitstate.dart';
import 'package:chatsapp/models/auth_sevices.dart';
import 'package:chatsapp/views/regesterpage.dart';
import 'package:chatsapp/widgets/Scholor.dart';
import 'package:chatsapp/widgets/button_custom.dart';
import 'package:chatsapp/widgets/text_button_custom.dart';
import 'package:chatsapp/widgets/textfield_custom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? email, password;

  GlobalKey<FormState> formkey = GlobalKey();

  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    final RegExp emailRegExp = RegExp(TextValueManager.kemailRegExp);
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Form(
            key: formkey,
            child: ListView(
              children: [
                Row(
                  children: [
                    BlocBuilder<Themecubit, Themecubitstate>(
                      builder: (context, state) {
                        return CupertinoSwitch(
                            activeColor:
                                ColorValueManager.kSecendryColorThemeDark,
                            value: BlocProvider.of<Themecubit>(context).state ==
                                Themecubitstate.dark,
                            onChanged: (value) {
                              BlocProvider.of<Themecubit>(context).tochange();
                            });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: WidthAndHighValue.hV60),
                const ScholarChat(),
                const SizedBox(height: WidthAndHighValue.hV60),
                const SizedBox(
                  width: double.infinity,
                  child: Text(
                    textAlign: TextAlign.start,
                    TextValueManager.kSignIn,
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
                      AuthSevices().loginAuth(context, email!, password!);
                      isloading = false;
                      setState(() {});
                    }
                  },
                  textbuttom: TextValueManager.kSignIn,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      TextValueManager.kNoAccount,
                      style: TextStyle(color: ColorValueManager.kWhiteColor),
                    ),
                    TextButtonCustom(
                      onpressed: () {
                        Navigator.pushNamed(context, RegesterPage.id);
                      },
                      textbutton: TextValueManager.kSignUn,
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

  // Future<void> loginAuth() async {
  //   // ignore: unused_local_variable
  //   UserCredential user = await FirebaseAuth.instance
  //       .signInWithEmailAndPassword(email: email!, password: password!);
  // }
}
