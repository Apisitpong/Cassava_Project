import 'package:cassava_proj/login_register/profle.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../constants.dart';
import 'login_page.dart';
import 'my_button.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phonenumberController = TextEditingController();
  final addressController = TextEditingController();

  Profile profile = Profile();
  final _formkey = GlobalKey<FormState>();
  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: firebase,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Error'),
            ),
            body: Center(
              child: Text('${snapshot.error}'),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            backgroundColor: Colors.grey.shade300,
            body: SafeArea(
              child: Form(
                key: _formkey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const Icon(
                        Icons.lock,
                        size: 100,
                        color: kSecondaryColor,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        'Register',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: kSecondaryColor),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: TextFormField(
                          onSaved: (String? name) {
                            profile.name = name!;
                          },
                          validator: RequiredValidator(
                              errorText: 'Please enter your name'),
                          keyboardType: TextInputType.text,
                          controller: nameController,
                          obscureText: false,
                          decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade400)),
                              fillColor: Colors.grey.shade200,
                              filled: true,
                              hintText: 'Name (ex. Manee Jaidee)'),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: TextFormField(
                          onSaved: (String? phonenumber) {
                            profile.phonenumber = phonenumber!;
                          },
                          validator: RequiredValidator(
                              errorText: 'Please enter your phone number'),
                          keyboardType: TextInputType.phone,
                          controller: phonenumberController,
                          obscureText: false,
                          decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade400)),
                              fillColor: Colors.grey.shade200,
                              filled: true,
                              hintText: 'Phone number (ex. xxx-xxxxxxx)'),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: TextFormField(
                          onSaved: (String? address) {
                            profile.address = address!;
                          },
                          validator: RequiredValidator(
                              errorText: 'Please enter your address'),
                          keyboardType: TextInputType.text,
                          controller: addressController,
                          obscureText: false,
                          decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade400)),
                              fillColor: Colors.grey.shade200,
                              filled: true,
                              hintText: 'Address (ex. Thailand,Khon Kaen)'),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: TextFormField(
                          onSaved: (String? email) {
                            profile.email = email!;
                          },
                          validator: MultiValidator([
                            RequiredValidator(
                                errorText: 'Please enter your email'),
                            EmailValidator(errorText: 'Invalid email type')
                          ]),
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          obscureText: false,
                          decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade400)),
                              fillColor: Colors.grey.shade200,
                              filled: true,
                              hintText: 'Email (ex. Manee@gmail.com)'),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: TextFormField(
                          onSaved: (String? password) {
                            profile.password = password!;
                          },
                          validator: RequiredValidator(
                              errorText: 'Please enter your password'),
                          keyboardType: TextInputType.text,
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade400)),
                              fillColor: Colors.grey.shade200,
                              filled: true,
                              hintText: 'Password'),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      GestureDetector(
                          onTap: () async {
                            if (_formkey.currentState!.validate()) {
                              _formkey.currentState!.save();
                              try {
                                await FirebaseAuth.instance
                                    .createUserWithEmailAndPassword(
                                        email: profile.email!,
                                        password: profile.password!)
                                    .then((value) {
                                  _formkey.currentState!.reset();
                                  Fluttertoast.showToast(
                                      msg: 'Create account success!',
                                      gravity: ToastGravity.CENTER);
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              const LoginPage()));
                                });
                              } on FirebaseAuthException catch (e) {
                                // print(e.code);
                                // String message;
                                // if(e.code == 'email-already-in-use'){
                                //   message = 'There is a duplicate, please use another email';
                                // }
                                // if(e.code == 'weak-password'){
                                //   message = 'There is a duplicate, please use another email';
                                // }
                                Fluttertoast.showToast(
                                    msg: e.message!,
                                    gravity: ToastGravity.CENTER);
                              }
                            }
                          },
                          child: const MyButton(
                            textButton: 'Sign up',
                            color: kSecondaryColor,
                          )),
                      const SizedBox(
                        height: 15,
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(Icons.fast_rewind))
                    ],
                  ),
                ),
              ),
            ),
          );
        }
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
