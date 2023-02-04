// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rent_ro/controller/signup/signup_provider.dart';
import 'package:rent_ro/controller/services/signup_api_services.dart';
import 'package:rent_ro/model/signup_model.dart';
import 'package:rent_ro/utiles/colors.dart';
import 'package:rent_ro/view/screens/login_screen.dart';
import 'package:rent_ro/view/widgets/containers.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final respHeight = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Consumer<SignupProvider>(
              builder: (context, value, child) => Form(
                key: _formKey,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: respHeight * 0.05),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: respHeight * 0.04),
                    decoration: kBoxDecoration(
                        resHeight: respHeight, borderRadiusOf: 0.040),
                    child: FutureBuilder(
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Container(
                            color: Colors.black,
                            height: 500,
                            width: 200,
                          );
                        } else {
                          return Column(
                            children: [
                              SizedBox(
                                height: respHeight * 0.03,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: TextFormField(
                                    controller: value.nameController,
                                    textCapitalization:
                                        TextCapitalization.sentences,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Enter your name';
                                      }
                                      return null;
                                    },
                                    decoration: commonTextfeildDecoration(
                                        respHeight, "Name")),
                              ),
                              SizedBox(
                                height: respHeight * 0.06,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: TextFormField(
                                    maxLength: 10,
                                    controller: value.phoneNumberController,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    keyboardType:
                                        const TextInputType.numberWithOptions(
                                            decimal: true),
                                    validator: (value) {
                                      String patttern =
                                          r'(^(?:[+0]9)?[0-9]{10,12}$)';
                                      RegExp regExp = RegExp(patttern);
                                      if (value!.isEmpty) {
                                        return 'Please enter mobile number@';
                                      } else if (!regExp.hasMatch(value)) {
                                        return 'Please enter valid mobile number';
                                      }

                                      return null;
                                    },
                                    decoration: commonTextfeildDecoration(
                                        respHeight, "Mobile Number")),
                              ),
                              SizedBox(
                                height: respHeight * 0.02,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: TextFormField(
                                  controller: value.passwordController,
                                  validator: (gettingValue) {
                                    if (gettingValue!.isEmpty) {
                                      return 'Please enter a password';
                                    } else if (gettingValue.length < 8) {
                                      return 'Please enter at least 8 characrer';
                                    }

                                    return null;
                                  },
                                  obscureText: value.passwordVisible,
                                  decoration: InputDecoration(
                                    labelText: 'Password',
                                    floatingLabelStyle: TextStyle(
                                      fontSize: respHeight * 0.05,
                                      color: CommonColors.kBlack,
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            (respHeight * 0.4))),
                                    labelStyle: GoogleFonts.anybody(
                                        color: CommonColors.kBlack,
                                        fontSize: respHeight * 0.035),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(respHeight * 0.02)),
                                      borderSide: BorderSide(
                                          width: respHeight * 0.003,
                                          color: CommonColors.kRed),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(respHeight * 0.02)),
                                      borderSide: BorderSide(
                                          width: respHeight * 0.003,
                                          color: CommonColors.kGrey),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(respHeight * 0.02)),
                                      borderSide: BorderSide(
                                        width: respHeight * 0.003,
                                        color: CommonColors.kGrey,
                                      ),
                                    ),
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        Provider.of<SignupProvider>(context,
                                                listen: false)
                                            .passwordShow();
                                      },
                                      icon: Icon(
                                        value.passwordVisible
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        color: CommonColors.kBlack,
                                      ),
                                    ),
                                    fillColor: Colors.grey.shade300,
                                    filled: true,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: respHeight * 0.02,
                              ),
                              SizedBox(
                                height: respHeight * 0.05,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: GestureDetector(
                                  child: Container(
                                    height: respHeight * 0.15,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.black87,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'Sign Up',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    if (_formKey.currentState!.validate()) {
                                      final pro = Provider.of<SignupProvider>(
                                          context,
                                          listen: false);

                                      SignupModel signupModel = SignupModel(
                                          name: pro.nameController.text,
                                          mobile:
                                              pro.phoneNumberController.text,
                                          password:
                                              pro.passwordController.text);
                                      SignUpApiServices().signUpApiServices(
                                        signupModel: signupModel,
                                        context: context,
                                        mobile: pro.phoneNumberController.text,
                                      );
                                    }
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: respHeight * 0.05,
                                  horizontal: respHeight * 0.06,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Already a member! ',
                                      style: TextStyle(
                                        fontSize: respHeight * 0.045,
                                        color: CommonColors.kBlack,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        value.passwordController.clear();
                                        value.nameController.clear();
                                        value.phoneNumberController.clear();
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: ((context) =>
                                                LoginScreen()),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        'Login',
                                        style: TextStyle(
                                            fontSize: respHeight * 0.045,
                                            color: CommonColors.kBlack,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          );
                        }
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
