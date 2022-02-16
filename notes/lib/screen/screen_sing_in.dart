import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ScreenSingIn extends StatelessWidget {
  late UserCredential userCredential;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: RaisedButton(
              onPressed: () async {
                try {
                  userCredential = await FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: "taherabbasaass@gmail.com",
                          password: "SuperSecretPassword!");
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'user-not-found') {
                    print('No user found for that email.');
                  } else if (e.code == 'wrong-password') {
                    print('Wrong password provided for that user.');
                  }
                }
                User? user = FirebaseAuth.instance.currentUser;

                if (userCredential.user!.emailVerified == false) {
                  await user?.sendEmailVerification();
                }
                print(userCredential);
              },
              child: Text('Sign In '),
            ),
          )
        ],
      ),
    );
  }
}
