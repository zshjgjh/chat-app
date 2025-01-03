import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholar_chat/constants.dart';
import 'package:scholar_chat/pages/chat_page.dart';
import 'package:scholar_chat/register_cubit/register_cubit.dart';
import 'package:scholar_chat/widgets/password_custom_form_text_field.dart';
import '../helper/snack_bar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';


class RegisterPage extends StatefulWidget {
  static String id = 'RegisterPage';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? email;
  String? password;
  bool isLoad = false;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if(state is RegisterLoadingState){
          isLoad=true;
        }else if(state is RegisterSuccseeState){
          Navigator.pushNamed(context,ChatPage.id,arguments: {email});
          isLoad=false;
        }
        else if(state is RegisterFailureState){
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
                  const Text('REGISTER',
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),),
                  const SizedBox(height: 12,),

                  CustomTextFormField(
                      onChanged: (data) {
                        email = data;
                      },
                      hintText: 'Email'),

                  const SizedBox(height: 8,),

                  PasswordCustomTextFormField(
                      onChanged: (data) {
                        password = data;
                      },
                      hintText: 'Password'),

                  const SizedBox(height: 15,),

                  CustomButton(text: 'REGISTER', onTap: () async {
                    if (formKey.currentState!.validate()) {
                    BlocProvider.of<RegisterCubit>(context).userRegister(email: email!, password: password!);
                    } else {

                    }
                  },),
                  const SizedBox(height: 7),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("already have an account?",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.white
                          )
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Text('  LOGIN',
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


