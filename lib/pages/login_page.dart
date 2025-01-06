import 'package:begetter/utils/routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = ""; // Declare name variable inside the State class
  bool changeButton = false;

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Login image
              Image.asset(
                "assets/login_image.png",
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
                      decoration: const InputDecoration(
                        hintText: "Enter Username",
                        labelText: "Username",
                      ),
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
                    InkWell(
                      onTap: () async {
                        setState(() {
                          changeButton = true;
                        });
                        await Future.delayed(Duration(seconds: 1));
                        Navigator.pushNamed(context, MyRoutes.HomeRoute);
                      },
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        width: changeButton ? 50 : 150,
                        height: 50,
                        alignment: Alignment.center,
                        child: changeButton
                            ? Icon(
                                Icons.done,
                                color: Colors.white,
                              )
                            : Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius:
                              BorderRadius.circular(changeButton ? 50 : 8),
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
        ));
  }
}
