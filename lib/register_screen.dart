// ignore_for_file: camel_case_types, avoid_print

import 'package:flutter/material.dart';
import 'package:task_22/login_screen.dart';

class register_screen extends StatefulWidget {
  const register_screen({super.key});

  @override
  State<register_screen> createState() => _register_screenState();
}

class _register_screenState extends State<register_screen> {
  bool _isHidden = true;
  bool _isHiddenp = true;
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confpassController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Align(
            alignment: Alignment.topCenter,
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  ClipPath(
                    clipper: CustomClipPath(),
                    child: Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: height / 3,
                          color: Colors.deepPurple,
                          child: const Center(
                            child: Text(
                              "Register",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: height / 30,
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: SizedBox(
                      width: width * 0.9,
                      height: height * 0.1,
                      child: TextFormField(
                        keyboardType: TextInputType.name,
                        controller: nameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "please input your Name";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 128, 88, 197),
                            ),
                          ),
                          prefixIcon: Icon(
                            Icons.person,
                            color: Color.fromARGB(255, 128, 88, 197),
                          ),
                          hintText: 'Name here',
                          labelText: "FullName",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: SizedBox(
                      width: width * 0.9,
                      height: height * 0.1,
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        controller: phoneController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "please input your Phone";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 128, 88, 197),
                            ),
                          ),
                          prefixIcon: Icon(
                            Icons.phone_android,
                            color: Color.fromARGB(255, 128, 88, 197),
                          ),
                          hintText: 'Phone number',
                          labelText: "Phone number",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: SizedBox(
                      width: width * 0.9,
                      height: height * 0.1,
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "please input your Email";
                          } else if (emailController.text.contains('@') ==
                                  false ||
                              emailController.text.contains('.') == false) {
                            return 'Please input a valid Email';
                          }
                          return null;
                        },
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
                    padding: const EdgeInsets.only(bottom: 8),
                    child: SizedBox(
                      width: width * 0.9,
                      height: height * 0.1,
                      child: TextFormField(
                        obscureText: _isHiddenp,
                        controller: passwordController,
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
                            child: Icon(_isHiddenp
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
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: SizedBox(
                      width: width * 0.9,
                      height: height * 0.1,
                      child: TextFormField(
                        obscureText: _isHidden,
                        controller: confpassController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "please input your Password";
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
                            onTap: _togglePasswordViewconf,
                            child: Icon(_isHidden
                                ? Icons.visibility
                                : Icons.visibility_off),
                          ),
                          hintText: "Re-Enter Password",
                          labelText: "Confirm Password",
                          border: const OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0, bottom: 15),
                    child: Container(
                      height: height * 0.08,
                      width: width * 0.9,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            debugPrint(nameController.text);
                            debugPrint(phoneController.text);
                            debugPrint(emailController.text);
                            debugPrint(passwordController.text);
                            debugPrint(confpassController.text);
                          }
                        },
                        child: const Text(
                          'Register',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: SizedBox(
                      height: height * 0.08,
                      width: width * 0.9,
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const login_screen(),
                            ),
                          );
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: const BorderSide(
                            width: 2,
                            color: Colors.deepPurple,
                          ),
                        ),
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.deepPurple,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _togglePasswordViewconf() {
    setState(
      () {
        _isHidden = !_isHidden;
      },
    );
  }

  void _togglePasswordView() {
    setState(
      () {
        _isHiddenp = !_isHiddenp;
      },
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path0 = Path();

    path0.moveTo(0, 0);
    path0.lineTo(0, size.height * 0.748);
    path0.quadraticBezierTo(size.width * 0.2119444, size.height * 0.747,
        size.width * 0.2977778, size.height * 0.779);
    path0.quadraticBezierTo(size.width * 0.7941667, size.height * 0.9,
        size.width, size.height * 0.8);
    path0.lineTo(size.width, 0);

    return path0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}












    // path0.moveTo(0, 0);
    // path0.lineTo(0, size.height * 0.7500000);
    // path0.quadraticBezierTo(size.width * 0.2363889, size.height * 0.7300000,
    //     size.width * 0.3222222, size.height * 0.7600000);
    // path0.quadraticBezierTo(size.width * 0.7219444, size.height * 0.9050000,
    //     size.width, size.height * 0.8200000);
    // path0.lineTo(size.width, 0);
    // path0.lineTo(size.width * 0.6077778, 0);
    // path0.lineTo(size.width * 0.6077778, 0);

    // path0.moveTo(0, 0);
    // path0.lineTo(0, size.height * 0.7500000);
    // path0.quadraticBezierTo(size.width * 0.1908333, size.height * 0.7000000,
    //     size.width * 0.2777778, size.height * 0.7550000);
    // path0.quadraticBezierTo(size.width * 0.6375000, size.height * 0.9150000,
    //     size.width, size.height * 0.8200000);
    // path0.lineTo(size.width, 0);
    // path0.lineTo(size.width * 0.6077778, 0);
    // path0.lineTo(size.width * 0.6077778, 0);
