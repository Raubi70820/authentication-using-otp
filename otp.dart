import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_auth/homepage.dart';
import 'package:flutter_phone_auth/phone_auth.dart';
import 'package:pinput/pinput.dart';

class Myotp extends StatefulWidget {
  const Myotp({super.key});

  @override
  State<Myotp> createState() => _MyotpState();
}

class _MyotpState extends State<Myotp> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );

     var code = "";
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'verify phone',
                style: TextStyle(fontSize: 29, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              const Text(
                'code is sent to your register mobile number',
                style: TextStyle(fontSize: 10),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
                Pinput(
                length: 6,
                showCursor: true,
                onChanged: (value){
                  code=value;
                },
              ),

              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 45,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    // await FirebaseAuth.instance.verifyPhoneNumber(

                    //   verificationCompleted:
                    //       (PhoneAuthCredential credential) {},
                    //   verificationFailed: (FirebaseAuthException e) {},
                    //   codeSent: (String verificationId, int? resendToken) {},
                    //   codeAutoRetrievalTimeout: (String verificationId) {},
                    // );

                    // Navigator.pushNamed(context, 'otp');
                    PhoneAuthCredential credential =
                        PhoneAuthProvider.credential(
                            verificationId: phoneauth.verify, smsCode: code);

                    // Sign the user in (or link) with the credential
                    await auth.signInWithCredential(credential);
                     Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Homepage()));
                    
                  },
                  child: Text("verify and continue "),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 0, 17, 146),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'Resend opt ?',
                        style: TextStyle(color: Colors.black),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
