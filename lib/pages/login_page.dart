import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scholar_chat/chat_cubit/chat_cubit.dart';
import 'package:scholar_chat/constants.dart';
import 'package:scholar_chat/login_cubit/login_cubit.dart';
import 'package:scholar_chat/pages/chat_page.dart';
import 'package:scholar_chat/pages/resgister_page.dart';
import '../helper/snack_bar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/password_custom_form_text_field.dart';

class LoginPage extends StatefulWidget {

  static String id = 'LoginPage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> formKey = GlobalKey();

  String? email, password;

  bool isLoad = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if(state is LoginLoadingState){
          isLoad=true;
        }else if(state is LoginSuccessState){
          BlocProvider.of<ChatCubit>(context).fetchMessages();
          Navigator.pushNamed(context,ChatPage.id,arguments: {email});
          isLoad=false;
        }
        else if(state is LoginFailureState){
          SnackBar(content: Text(state.errorMessage),);
          isLoad=false;
        }
      },
      child: ModalProgressHUD(
        inAsyncCall: isLoad,
        child: Scaffold(
          backgroundColor: kPrimaryColor,
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Form(
              key: formKey,
              child: ListView(
                children: [
                  Image.asset('assets/images/scholar.png',
                    height: 100,),
                  const Center(
                    child: Text('Scholar Chat',
                        style: TextStyle(
                            fontSize: 40,
                            fontFamily: 'Pacifico',
                            color: Colors.white
                        )
                    ),
                  ),
                  const SizedBox(height: 60,),
                  const Text('LOGIN',
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),),
                  const SizedBox(height: 12,),

                  CustomTextFormField(hintText: 'Email',
                    onChanged: (data) {
                      email = data;
                    },),

                  const SizedBox(height: 8,),

                  PasswordCustomTextFormField(hintText: 'Password',
                    onChanged: (data) {
                      password = data;
                    },),

                  const SizedBox(height: 15,),

                  CustomButton(text: 'LOGIN',
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<LoginCubit>(context).userSignin(email: email!, password: password!,);
                      } else {

                      }
                    },),

                  const SizedBox(height: 7),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("don't have an account?",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.white
                          )
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, RegisterPage.id);
                        },
                        child: const Text('  Register',
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white
                            )
                        ),
                      ),
                    ],
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


