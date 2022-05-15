import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_boilerplate/const.dart';
import 'package:flutter_firebase_boilerplate/page/home.dart';
import 'package:flutterfire_ui/auth.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: auth.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        // net login
        if (!snapshot.hasData) {
          return SignInScreen(
            providerConfigs: const [
              EmailProviderConfiguration(),
            ],
            actions: [
              AuthStateChangeAction<AuthState>(
                (context, state) => log('${state}'),
              ),
              AuthStateChangeAction<SignedIn>(
                (context, state) {
                  // do after signed in
                  log("user signed in");
                },
              ),
              AuthStateChangeAction<UserCreated>(
                (context, state) {
                  // do after user created
                  log("user created");
                },
              ),
            ],
          );
        }

        // logged in
        if (snapshot.hasData) {
          return const HomePage();
        }

        return Container();
      },
    );
  }
}
