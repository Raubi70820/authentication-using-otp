import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_auth/otp.dart';
import 'package:pinput/pinput.dart';

class phoneauth extends StatefulWidget {
  const phoneauth({super.key});
  static String verify = "";

  @override
  State<phoneauth> createState() => _phoneauthState();
}

class _phoneauthState extends State<phoneauth> {
  TextEditingController countrycode = TextEditingController();
  var phone = "";
  void intState() {
    countrycode.text = "+91";
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                ' please enter your number',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'you will recieve a 6 digit code to verify next',
                style: TextStyle(fontSize: 10),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 55,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 40,
                      child: TextField(
                        
                        controller: countrycode,
                        decoration:
                            const InputDecoration(border: InputBorder.none,),
                      ),
                    ),
                    const Text(
                      "|",
                      style: TextStyle(fontSize: 33, color: Colors.grey),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        onChanged: (value) {
                          phone = value;
                        },
                        decoration: const InputDecoration(
                            border: InputBorder.none, hintText: 'phone'),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 45,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.verifyPhoneNumber(
                      phoneNumber: '${countrycode.text + phone}',
                      verificationCompleted:
                          (PhoneAuthCredential credential) {},
                      verificationFailed: (FirebaseAuthException e) {},
                      codeSent: (String verificationId, int? resendToken) {
                        phoneauth.verify = verificationId;
                      },
                      codeAutoRetrievalTimeout: (String verificationId) {},
                    );

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Myotp()));
                  },
                  child: Text("continue",style: TextStyle(color: Colors.white70),),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 40, 1, 147),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
