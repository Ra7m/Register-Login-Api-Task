import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:regapi_1/core/validator.dart';
import 'package:regapi_1/features/Auth/cubit/auth_cubit.dart';
import 'package:regapi_1/features/Auth/cubit/auth_state.dart';
import 'package:regapi_1/features/Auth/view/screenn/authscreen.dart';
import 'package:regapi_1/features/Auth/view/widget/customtextfield.dart';
import 'package:regapi_1/features/category/view/screen/login.dart';
import 'package:regapi_1/features/catog/view/screen/home-lap-cart.dart';

class AuthloginScreen extends StatefulWidget {
  const AuthloginScreen({super.key});

  @override
  State<AuthloginScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthloginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
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
          if (state is AuthSucesslogState) {
            if (state.Userdata["status"] == "success") {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.brown,
                  content: Text(state.Userdata["message"])));
            }
            if (state.Userdata["status"] == "error") {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.red,
                  content: Text(state.Userdata["message"])));
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
                          "Login",
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
                  ElevatedButton(
                    onPressed: () {
                      if (state is AuthSucessState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.brown,
                            content: Text(state.userdata["message"]),
                          ),
                        );
                      }
                      context.read<AuthCubit>().postDatalogCubit(
                            emaildata: emailController.text,
                            passworddata: passwordController.text,
                          );
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const HomeLapScreen();
                      }));
                    },
                    child: const Text(
                      "Login",
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
                              builder: (context) => const AuthScreen()),
                        );
                      },
                      child: const Text(
                        'Don`t Have Account ? Register Now',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.brown,
                            fontWeight: FontWeight.bold),
                      ))
                ]),
              ),
            ),
          );
        },
      ),
    );
  }
}
