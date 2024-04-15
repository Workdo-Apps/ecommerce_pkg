// ignore_for_file: avoid_print, unnecessary_brace_in_string_interps, unnecessary_null_comparison, body_might_complete_normally_nullable

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FacebookAuth facebookAuth = FacebookAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<User?> googleLogin(BuildContext context) async {
    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

      final AuthCredential authCredential =
      GoogleAuthProvider.credential(idToken: googleSignInAuthentication.idToken, accessToken: googleSignInAuthentication.accessToken);

      UserCredential result = await auth.signInWithCredential(authCredential);
      User? user = result.user;
      print("========>> ${authCredential}");
      print("========>> ${result}");
      log("==user======>> ${user!.providerData.first.uid}");
      print("========>> ${user!.email}");
      print("========>> ${user.displayName}");
      return user;
      // return googleSignInAuthentication;
    }
    return null;
  }

  Future facebookLogin({List<String>? permissions}) async {
    try {
      LoginResult loginResult = await facebookAuth.login(
          permissions: permissions ?? ["public_profile"],
          loginBehavior: LoginBehavior.katanaOnly
      );
      print("======userData accessToken:: ${loginResult}");
      print("status======userData accessToken:: ${loginResult.status}");
      print("message======userData accessToken:: ${loginResult.message}");
      print("======userData accessToken:: ${loginResult.accessToken}");
      if (loginResult.accessToken != null) {
        // Loader.hideLoader();
        print("======userData userId:: ${loginResult.accessToken!.userId}");
        print("======userData token:: ${loginResult.accessToken!.token}");
        print("======userData ${loginResult.message}");
        var authCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);
        UserCredential result = await auth.signInWithCredential(authCredential);
        print("======authCredential ${authCredential}");
        print("======result ${result}");

        Map<String, dynamic> userData = await facebookAuth.getUserData();
        print("======userData ${userData}");
        if (userData != null) {
          return userData;
          // return loginResult;
        } else {
          return null;
        }
      }
    } catch (e) {
      print("========e: ${e.toString()}");
    }
  }

  Future<UserCredential?> signInWithApple({
    String? clientId,
    String? redirectUrl,
  }) async {
    // 1. perform the sign-in request
    final credential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      // webAuthenticationOptions: WebAuthenticationOptions(clientId: clientId!, redirectUri: Uri.parse(redirectUrl!)),
    );
    print("====>credential ${credential}");
    if (credential != null) {
      // 2. check the result
      //     final appleIdCredential = credential.credential!;
      final oAuthProvider = OAuthProvider('apple.com');
      final appleIdCredential = oAuthProvider.credential(
        idToken: credential.identityToken!,
        accessToken: credential.authorizationCode,
      );
      print('====>appleIdCredential:: ${appleIdCredential}');
      final userCredential = await auth.signInWithCredential(appleIdCredential);
      print('====>userCredential ${userCredential}');
      final firebaseUser = userCredential.user!;
      print('====>firebaseUser:: ${firebaseUser}');
      print('====> displayName:: ${firebaseUser.displayName}');
      // return firebaseUser;
      return userCredential;
    }
    return null;
  }

  Future handleSignOut() async {
    await auth.signOut();
    await googleSignIn.disconnect();
    await facebookAuth.logOut();
  }
}
