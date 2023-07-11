import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_signin/src/controller/general_controller.dart';
import 'package:google_signin/src/modules/home.dart';
import 'package:google_signin/src/widgets/custom_button.dart';
import 'package:google_signin/src/widgets/custom_form_field.dart';

import '../utils/colors.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController? emailController = TextEditingController();

  TextEditingController? passController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GeneralController>(builder: (generalController) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 15.w, right: 15.w),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(bottom: MediaQuery
                      .of(context)
                      .viewInsets
                      .bottom),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: MediaQuery
                          .of(context)
                          .size
                          .height * .02,),
                      const Icon(Icons.close, color: AppColors.customDarkGreyColor),
                      SizedBox(height: MediaQuery
                          .of(context)
                          .size
                          .height * .05,),
                      Text("Log In", style: TextStyle(fontSize: 26.sp,fontWeight: FontWeight.w500)),
                      SizedBox(height: MediaQuery
                          .of(context)
                          .size
                          .height * .05,),
                      CustomFormField(
                          validator: (value) {
                            if ((value ?? "").isEmpty) {
                              return "required";
                            }
                            if (!GetUtils.isEmail(
                                value!.trim())) {
                              return "Email Invalid";
                            }
                            return null;
                          },
                          textEditingController: emailController!,
                          textInputType: TextInputType.emailAddress,
                          hint: "Email"
                      ),


                      SizedBox(height: MediaQuery
                          .of(context)
                          .size
                          .height * .02,),

                      CustomFormField(
                          validator: (value) {
                            if ((value ?? "").isEmpty) {
                              return "required";
                            }
                            return null;
                          },
                          textEditingController: passController!,
                          textInputType: TextInputType.emailAddress,
                          hint: "Password"
                      ),
                      SizedBox(height: MediaQuery
                          .of(context)
                          .size
                          .height * .04,),

                      MyCustomButton(
                          label: "Log in",
                          backgroundColor: AppColors.customBlueColor,
                          onTap: () {
                            if (!formKey.currentState!.validate()) {
                              return;
                            }
                            Get.offAll(()=> const HomePage(title: "You have been signed in with email"));
                          },
                          labelStyle: TextStyle(
                              color: Colors.white, fontSize: 16.sp)),
                      SizedBox(height: MediaQuery
                          .of(context)
                          .size
                          .height * .02,),
                      Align(
                          alignment: Alignment.center,
                          child: Text("Forgot the password?",
                            style: TextStyle(fontSize: 15.sp),)),
                      SizedBox(height: MediaQuery
                          .of(context)
                          .size
                          .height * .1,),
                      Row(
                        children: [
                          const Expanded(
                              child: Divider(color: AppColors.customDarkGreyColor,)),
                          SizedBox(width: MediaQuery
                              .of(context)
                              .size
                              .width * .02,),
                          Text("or", style: TextStyle(
                              color: AppColors.customDarkGreyColor,
                              fontSize: 14.sp
                          )),
                          SizedBox(width: MediaQuery
                              .of(context)
                              .size
                              .width * .02,),
                          const Expanded(
                              child: Divider(color: AppColors.customDarkGreyColor,)),
                        ],
                      ),
                      SizedBox(height: MediaQuery
                          .of(context)
                          .size
                          .height * .1,),

                      InkWell(
                        onTap: () {
                          generalController.firebaseAuthentication
                              .signInWithGoogle();
                        },
                        child: Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.r),
                            border: Border.all(),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/google-logo.png", width: Get.width * .08,),
                                SizedBox(
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width * .04,
                                ),
                                Text("Login with Google",
                                  style: TextStyle(fontSize: 15.sp),),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: MediaQuery
                          .of(context)
                          .size
                          .height * .02,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have account yet? ",
                            style: TextStyle(fontSize: 15.sp),),
                          Text("Sign Up",
                            style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w600),),
                        ],
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
