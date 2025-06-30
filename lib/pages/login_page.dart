import 'package:begetter/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = ""; // Declare name variable inside the State class
  bool changeButton = false;

  final _formKey = GlobalKey<FormState>();

  // Method to navigate to the home page
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
        color: context.canvasColor, // Use context.canvasColor for background
        child: SingleChildScrollView(
          child: Form(
            key: _formKey, // Apply form key for validation
            child: Column(
              children: [
                // Login image
                Image.asset(
                  "assets/images/login.png",
                  fit: BoxFit.cover,
                ),

                const SizedBox(
                  height: 20.0,
                ),

                Text(
                  "Welcome $name",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: context.theme.colorScheme.primary,
                  ),
                ),

                const SizedBox(
                  height: 20.0,
                ),

                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 42),
                  child: Column(
                    children: [
                      // Username text field
                      TextFormField(
                        style: TextStyle(
                          color: context.theme.colorScheme.primary,
                        ),
                        decoration: const InputDecoration(
                          hintText: "Enter Username",
                          labelText: "Username",
                        ),
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return "Username cannot be empty";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            name = value; // Update name when text changes
                          });
                        },
                      ),

                      // Password text field
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Enter Password",
                          labelText: "Password",
                        ),
                        obscureText: true, // Hide password text
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return "Password cannot be empty";
                          } else if (value!.length < 6) {
                            return "Password length should be at least 6 characters";
                          }
                          return null;
                        },
                      ),

                      const SizedBox(
                        height: 20.0,
                      ),

                      // Elevated button for login
                      //ElevatedButton(
                      //style: TextButton.styleFrom(),
                      //onPressed: () {
                      //Navigator.pushNamed(context, MyRoutes.HomeRoute);
                      //},
                      //child: const Text("Login"),
                      //)
                      Material(
                        color: context.theme.colorScheme.secondary,
                        borderRadius:
                            BorderRadius.circular(changeButton ? 50 : 8),
                        child: InkWell(
                          onTap: () => moveToHome(context),
                          child: AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            width: changeButton ? 50 : 150,
                            height: 50,
                            alignment: Alignment.center,
                            child: changeButton
                                ? const Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  )
                                : const Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Username text field

                const SizedBox(
                  height: 40.0,
                ),
              ],
            ),
          ),
        ));
  }
}
