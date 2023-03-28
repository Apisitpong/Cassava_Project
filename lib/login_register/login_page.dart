import 'package:cassava_proj/app_screens/home/cassava_home.dart';
import 'package:cassava_proj/app_screens/home/welcome_screens.dart';
import 'package:cassava_proj/login_register/register_page.dart';
import 'package:cassava_proj/provider/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cassava_proj/constants.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cassava_proj/login_register/profle.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

import '../app_screens/home/settings/cassava_profile.dart';
import 'my_button.dart';
import 'my_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Profile profile = Profile();
  final _formkey = GlobalKey<FormState>();
  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  final googleSignIn = GoogleSignIn();

  GoogleSignInAccount? _user;

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
                          height: 50,
                        ),
                        const Icon(
                          Icons.lock,
                          size: 100,
                          color: kSecondaryColor,
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        const Text(
                          'LOGIN',
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
                                    borderSide: BorderSide(
                                        color: Colors.grey.shade400)),
                                fillColor: Colors.grey.shade200,
                                filled: true,
                                hintText: 'Email '),
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
                                    borderSide: BorderSide(
                                        color: Colors.grey.shade400)),
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
                                    .signInWithEmailAndPassword(
                                        email: profile.email!,
                                        password: profile.password!)
                                    .then((value) {
                                  _formkey.currentState!.reset();
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              const ProfileScreen()));
                                });
                              } on FirebaseAuthException catch (e) {
                                Fluttertoast.showToast(
                                    msg: e.message!,
                                    gravity: ToastGravity.CENTER);
                              }
                            }
                          },
                          child: const MyButton(
                            textButton: 'Sign in',
                            color: kSecondaryColor,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        googleSignInButton(),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Not have account?'),
                            const SizedBox(
                              width: 2,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            const RegisterPage()));
                              },
                              child: const Text(
                                'Register',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: kPrimaryColor),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ));
        }
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }

  Widget googleSignInButton() {
    return GestureDetector(
      onTap: () {
        final provider = Provider.of<GoogleSignInProvider>(context,listen: false);
        provider.googleLogin();
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
            color: kPrimaryColor, borderRadius: BorderRadius.circular(8)),
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Image(
              image: AssetImage('assets/images/google_logo.png'),
              height: 30,
              width: 50,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Sign in with Google',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(
              width: 50,
            ),
          ],
        )),
      ),
    );
  }

  Future<Null> processSingInWithGoogle() async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );
    await Firebase.initializeApp().then((value) async {
      await _googleSignIn.signIn().then((value) {
        print('Login with Gmail Succes');
      });
    });
  }

  Future googleLogin() async {
    final googleUser = await googleSignIn.signIn();

    if (googleUser == null) return;
    _user = googleUser;

    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
