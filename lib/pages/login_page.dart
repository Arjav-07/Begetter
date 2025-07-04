import 'package:begetter/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.HomeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.canvasColor,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset(
                  "assets/images/login.png",
                  width: 200,
                  height: 200,
                  fit: BoxFit.contain,
                ),
                "Welcome $name"
                    .text
                    .xl3
                    .bold
                    .color(context.theme.colorScheme.primary)
                    .make(),
                "Login to continue"
                    .text
                    .sm
                    .color(context.theme.colorScheme.primary.withOpacity(0.5))
                    .make()
                    .pOnly(bottom: 20),

                // Form Fields
                Column(
                  children: [
                    // Username
                    TextFormField(
                      style: TextStyle(
                        fontSize: 14,
                        color: context.theme.colorScheme.primary,
                      ),
                      decoration: InputDecoration(
                        hintText: "Enter Username",
                        hintStyle: const TextStyle(fontSize: 16),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 30, right: 8),
                          child: const Icon(Icons.person, size: 20),
                        ),
                        filled: true,
                        fillColor:
                            Theme.of(context).colorScheme.tertiaryContainer,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 18),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return "Username cannot be empty";
                        }
                        return null;
                      },
                      onChanged: (value) => setState(() => name = value),
                    ),

                    16.heightBox,

                    // Password
                    TextFormField(
                      obscureText: true,
                      style: TextStyle(
                        fontSize: 14,
                        color: context.theme.colorScheme.primary,
                      ),
                      decoration: InputDecoration(
                        hintText: "Enter Password",
                        hintStyle: const TextStyle(fontSize: 16),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(
                              left: 30, right: 8), // 👈 controls icon padding
                          child: const Icon(Icons.lock, size: 20),
                        ),
                        prefixIconConstraints: const BoxConstraints(
                          minWidth: 0,
                          minHeight: 0,
                        ),
                        filled: true,
                        fillColor:
                            Theme.of(context).colorScheme.tertiaryContainer,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal:
                              28, // 👈 more horizontal padding for the field
                          vertical: 18,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return "Password cannot be empty";
                        } else if (value!.length < 6) {
                          return "Password must be at least 6 characters";
                        }
                        return null;
                      },
                    ),

                    // Forgot password
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          // TODO: Forgot password action
                        },
                        child: "Forgot Password?"
                            .text
                            .sm
                            .color(Colors.blue)
                            .make(),
                      ),
                    ),

                    20.heightBox,

                    Theme(
                      data: Theme.of(context).copyWith(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                      ),
                      child: Material(
                        color: context.theme.colorScheme.secondary,
                        borderRadius:
                            BorderRadius.circular(changeButton ? 50 : 8),
                        child: InkWell(
                          onTap: () => moveToHome(context),
                          borderRadius:
                              BorderRadius.circular(changeButton ? 50 : 8),
                          splashColor: Colors.transparent, // 👈 just in case
                          highlightColor: Colors.transparent,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            width: changeButton ? 50 : 130,
                            height: 40,
                            alignment: Alignment.center,
                            child: changeButton
                                ? const Icon(Icons.done, color: Colors.white)
                                : const Text(
                                    "Login",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ),

                    30.heightBox,

                    // Divider
                    Row(
                      children: [
                        const Expanded(child: Divider()),
                        " OR ".text.gray500.make(),
                        const Expanded(child: Divider()),
                      ],
                    ).pSymmetric(h: 16),
                    20.heightBox,

                    // Google login
                    OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.g_mobiledata),
                      label: "Continue with Google".text.make(),
                      style: OutlinedButton.styleFrom(
                        shape: const StadiumBorder(),
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 24),
                      ),
                    ).wFull(context),

                    16.heightBox,

                    // Apple login
                    OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.apple),
                      label: "Continue with Apple".text.make(),
                      style: OutlinedButton.styleFrom(
                        shape: const StadiumBorder(),
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 24),
                      ),
                    ).wFull(context),

                    30.heightBox,

                    // Sign Up
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        "Don't have an account?".text.color(Colors.grey).make(),
                        TextButton(
                          onPressed: () {
                            // TODO: Navigate to signup screen
                          },
                          child:
                              "Sign up".text.color(Colors.blue).semiBold.make(),
                        )
                      ],
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
