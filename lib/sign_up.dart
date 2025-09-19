import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'home_screen1.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController = TextEditingController();
  bool showErrorEmail = false;

  bool isEmail({required String em}) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(p);
    return regExp.hasMatch(em);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),

            Text(
              "Sign up",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Sign up with a valid Email",
              style: TextStyle(fontSize: 14, color: Colors.black87),
            ),

            SizedBox(height: 24),

            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "Alabassareen@gmail.com",
                labelText: "Email address",
                errorText: showErrorEmail ? "Invalid email" : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: TextButton(
                onPressed: () {
                  showErrorEmail = !isEmail(em: emailController.text);
                  setState(() {});
                  if (!showErrorEmail) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen1(
                          email: emailController.text,
                        ),
                      ),
                    );
                  }
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.yellow[700],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  "Continue",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            SizedBox(height: 24),

            Row(
              children: [
                Expanded(child: Divider(thickness: 1)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text("or"),
                ),
                Expanded(child: Divider(thickness: 1)),
              ],
            ),

            SizedBox(height: 16),

            socialButton(
              icon: Icons.apple,
              label: "Continue with Apple",
              backgroundColor: Colors.black,
              textColor: Colors.white,
            ),

            SizedBox(height: 12),

            socialButton(
              icon: FontAwesomeIcons.google,
              label: "Continue with Google",
              backgroundColor: Color(0xFF4285F4),
              textColor: Colors.white,
            ),

            SizedBox(height: 12),

            socialButton(
              icon: FontAwesomeIcons.facebook,
              label: "Continue with Facebook",
              backgroundColor: Color(0xFF1877F2),
              textColor: Colors.white,
            ),

            Spacer(),

            Center(
              child: TextButton(
                onPressed: () {},
                child: Text.rich(
                  TextSpan(
                    text: "Already have an account? ",
                    children: [
                      TextSpan(
                        text: "Log in",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  Widget socialButton({
    required IconData icon,
    required String label,
    required Color backgroundColor,
    required Color textColor,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: TextButton.icon(
        onPressed: () {},
        icon: Icon(icon, color: textColor),
        label: Text(
          label,
          style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
        ),
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}