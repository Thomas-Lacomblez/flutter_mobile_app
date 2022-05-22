import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/google_signIn_service.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';


class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LoginPage({Key? key, required this.showRegisterPage}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  // text controller


  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  

  Future signIn() async {
     showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator()
        );
      }
    );
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim()
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor:  Colors.grey[300],
        body: SafeArea(
          child: Center( 
              child: SingleChildScrollView(
                child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  const Icon(
                    Icons.android_rounded,
                    size: 100,
                  ),
                  // Hello again
                  Text(
                    'Re bonjour !',
                    style: GoogleFonts.bebasNeue(
                      fontSize: 52,
                    ),
                  ),
                  const SizedBox(height: 75),
                  const Text(
                    'Content de vous revoir !',
                    style: TextStyle(
                      fontSize: 20
                    ),
                  ),
                  const SizedBox(height: 50),

                  //email textField
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.deepPurple),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintText: 'Email',
                        fillColor: Colors.grey[200],
                        filled: true,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  //password textfield
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextField(
                      obscureText: true,
                      controller: _passwordController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintText: 'Mot de passe',
                        fillColor: Colors.grey[200],
                        filled: true,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: GestureDetector(
                      onTap: signIn,
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color:  Colors.deepPurple,
                          borderRadius: BorderRadius.circular(12)
                        ),
                        child: const Center(
                          child: Text(
                            'Se connecter',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),

                  Center(
                    child: FloatingActionButton.extended(
                      onPressed: () async {
                       await GoogleSignInService().signInWithGoogle();
                      },
                      icon: const Icon(Icons.account_box),
                      label: const Text('Sign in with google'),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                    )
                  ),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'pas encore de compte ?',
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      GestureDetector(
                        onTap: widget.showRegisterPage,
                        child: const Text(
                          ' inscrivez-vous',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ],
                  )
                ]
                )
              ),
          )
          ),
      );
  }
}