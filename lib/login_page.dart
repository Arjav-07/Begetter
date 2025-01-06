import 'package:begetter/utils/routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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

              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 42),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Enter Username", // Changed to "Username"
                        labelText: "Username", // Changed to "Username"
                      ),
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

                    //elevated button for login
                    ElevatedButton(
                      style: TextButton.styleFrom(),
                      onPressed: () {
                        Navigator.pushNamed(context, MyRoutes.HomeRoute);
                      },
                      child: const Text("Login"),
                    )
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
