import 'package:birddie/cloud_functions/database_functions.dart';
import 'package:birddie/screens/dashboard.dart';
import 'package:birddie/screens/otp_verification.dart';
import 'package:birddie/screens/user_info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:birddie/providers/user_provider.dart';

FirebaseAuth auth = FirebaseAuth.instance;

var verifyNumberMessage = '';
var verifyResponse = '';
var verficationIdRecieved = '';

verifyNumber(String number, BuildContext context) async {
  try {
    print('object');
    await auth.verifyPhoneNumber(
      phoneNumber: number,
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {
        verifyResponse = 'Please enter a valid number';
      },
      codeSent: (String verificationId, int? resendToken) {
        verficationIdRecieved = verificationId;
        print("verificationId $verificationId");
        verifyResponse = 'Valid number provided';

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const OtpVerification(),
          ),
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  } on FirebaseException catch (e) {
    print('error: $e');
  }
}

String codeMessage = '';

verifyCode(String code, BuildContext context) async {
  try {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verficationIdRecieved, smsCode: code);
    await auth.signInWithCredential(credential).then(
      (value) async {
        codeMessage = 'Correct code was provided';
        getUser(context, const AddUserInfo(), const Dashboard());
      },
    );
  } on FirebaseAuthException catch (e) {
    print(e.code);
    switch (e.code) {
      case 'invalid-verification-code':
        codeMessage = 'The provided code is invalid';
        break;
      case 'invalid-verification-id':
        codeMessage = 'Please enter the code';
        break;
      default:
        codeMessage = 'An unknown error occured.';
    }
  }
}
