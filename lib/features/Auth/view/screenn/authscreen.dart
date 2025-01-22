// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:regapi_1/core/validator.dart';
import 'package:regapi_1/features/Auth/cubit/auth_cubit.dart';
import 'package:regapi_1/features/Auth/cubit/auth_state.dart';
import 'package:regapi_1/features/Auth/view/screenn/authloginscreen.dart';
import 'package:regapi_1/features/Auth/view/widget/customtextfield.dart';
import 'package:regapi_1/features/Auth/view/widget/gender.dart';
import 'package:regapi_1/features/category/view/screen/login.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController nationalIdController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController profileImageController = TextEditingController();
  final TextEditingController tokenController = TextEditingController();
  bool visible = true;

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailController.addListener(() {
      setState(() {});
    });
    passwordController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSucessState) {
            if (state.userdata["status"] == "success") {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.indigoAccent,
                  content: Text(state.userdata["message"])));
            }
            if (state.userdata["status"] == "error") {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.red,
                  content: Text(state.userdata["message"])));
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: const Color.fromARGB(255, 231, 228, 227),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: formKey,
                child: ListView(children: [
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 15.0,
                      left: 24.0,
                      bottom: 24.0,
                      right: 24.0,
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Register",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                  Row(children: [
                    Text(
                      overflow: TextOverflow.fade,
                      "Please upload a photo for your profile",
                      // style: const TextStyle(
                      //   fontWeight: FontWeight.bold,
                      // ),
                    ),
                    const Spacer(),
                    context.read<AuthCubit>().image == null
                        ? MaterialButton(
                            onPressed: () {
                              context.read<AuthCubit>().addImage();
                            },
                            child: const Icon(
                              Icons.camera,
                              size: 80,
                            ),
                          )
                        : Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image:
                                    FileImage(context.read<AuthCubit>().image!),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                  ]),
                  CustomTextField(
                    controller: nameController,
                    validator: (value) {
                      return MyValidators.displayNameValidator(value);
                    },
                    label: "Name",
                    hint: "Enter your name",
                    prefix: Icons.account_circle,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    controller: nationalIdController,
                    validator: (value) {
                      return MyValidators.nationalIdValidator(value);
                    },
                    keyboard: TextInputType.number,
                    label: "National ID",
                    hint: "Enter your ID",
                    prefix: Icons.perm_identity_outlined,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    controller: emailController,
                    validator: (value) {
                      return MyValidators.emailValidator(value);
                    },
                    keyboard: TextInputType.emailAddress,
                    label: "Email",
                    hint: "example@gmail.com",
                    prefix: Icons.email,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    controller: phoneController,
                    validator: (value) {
                      return MyValidators.phoneValidator(value);
                    },
                    keyboard: TextInputType.phone,
                    label: "Phone Number",
                    hint: "Enter your phone",
                    prefix: Icons.phone,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    validator: (value) {
                      return MyValidators.passwordValidator(value);
                    },
                    keyboard: TextInputType.visiblePassword,
                    obscureText: visible,
                    label: "Password",
                    hint: "Enter a password",
                    prefix: Icons.lock,
                    suffix: IconButton(
                        onPressed: () {
                          visible = !visible;
                          setState(() {});
                        },
                        icon: visible == false
                            ? const Icon(
                                Icons.remove_red_eye,
                              )
                            : const Icon(
                                Icons.visibility_off,
                              )),
                    controller: passwordController,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    controller: tokenController,
                    validator: (value) {
                      return MyValidators.tokenValidator(value);
                    },
                    label: "Token",
                    hint: "Enter a token",
                    prefix: Icons.token,
                  ),
                  const SizedBox(height: 20),
                  GenderSelection(genderController: genderController),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AuthloginScreen()),
                      );
                      if (state is AuthSucessState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              backgroundColor: Colors.brown,
                              content: Text(state.userdata["message"])),
                        );
                      }
                      context.read<AuthCubit>().postDataCubit(
                            namedata: nameController.text,
                            emaildata: emailController.text,
                            genderdata: genderController.text,
                            nationalIddata: nationalIdController.text,
                            passworddata: passwordController.text,
                            phonedata: phoneController.text,
                            profileImagedata: profileImageController.text,
                            tokendata: tokenController.text,

                          );
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.brown,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AuthloginScreen()),
                      );
                    },
                    child: Text(
                      'Already Have Account ? Login Now',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.brown,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ]),
              ),
            ),
          );
        },
      ),
    );
  }
}
