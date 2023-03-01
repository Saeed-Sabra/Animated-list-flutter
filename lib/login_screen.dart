// ignore_for_file: camel_case_types, unused_local_variable, sort_child_properties_last, avoid_print

import 'package:flutter/material.dart';
import 'package:task_22/animated_list.dart';
import 'package:task_22/register_screen.dart';

class login_screen extends StatefulWidget {
  const login_screen({super.key});

  @override
  State<login_screen> createState() => _login_screenState();
}

class _login_screenState extends State<login_screen> {
  bool _isHidden = true;
  final formKey = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              ClipPath(
                clipper: CustomClipPath(),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: height / 3,
                  color: Colors.deepPurple,
                  child: const Center(
                    child: Text(
                      "LOGIN",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: width * 0.9,
                  child: TextFormField(
                    controller: emailcontroller,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "please input your Email";
                      } else if (emailcontroller.text.contains('@') == false ||
                          emailcontroller.text.contains('.') == false) {
                        return 'Please input a valid Email';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 128, 88, 197),
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.email,
                        color: Color.fromARGB(255, 128, 88, 197),
                      ),
                      hintText: 'email@example.com',
                      labelText: "Email",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: width * 0.9,
                  height: height * 0.1,
                  child: TextFormField(
                    obscureText: _isHidden,
                    controller: passwordcontroller,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "please input your Password";
                      } else if (value.length < 8) {
                        return "The Password must be at least 8 characters long";
                      } else if (value.startsWith("A ~ Z")) {
                        return "The Password must start with a capital letter";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 128, 88, 197),
                        ),
                      ),
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Color.fromARGB(255, 128, 88, 197),
                      ),
                      suffix: InkWell(
                        onTap: _togglePasswordView,
                        child: Icon(_isHidden
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                      hintText: "Enter Password",
                      labelText: "Password",
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Forget your password?',
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 15,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        debugPrint(emailcontroller.text);
                        debugPrint(passwordcontroller.text);
                      }
                      if (formKey.currentState!.validate() == true) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const MyListView(),
                          ),
                        );
                      }
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height / 4,
              ),
              SizedBox(
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const register_screen(),
                      ),
                    );
                  },
                  child: const Text('New User? Create Account',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      )),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }

  void _togglePasswordView() {
    setState(
      () {
        _isHidden = !_isHidden;
      },
    );
  }
}
