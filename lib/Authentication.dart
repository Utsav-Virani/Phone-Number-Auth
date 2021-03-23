import 'package:flutter/material.dart';
import 'package:phone_auth/countryCodeConverter/countryCodeToEmogiConvertor.dart';
import 'package:phone_auth/otpScreen.dart';

class Authentication extends StatefulWidget {
  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  final _formKey = GlobalKey<FormState>();
  final _formKeyOTP = GlobalKey<FormState>();

  final TextEditingController numberController = new TextEditingController();
  final TextEditingController otpController = new TextEditingController();
  final TextEditingController countryCodeController =
      new TextEditingController(text: '+' + countryCode['IN']);

  var isLoading = false;
  var isResend = false;
  var isLoginScreen = true;
  var isOTPScreen = false;
  var verificationCode = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Text(countryData[1]['name']),
                    Text("India"),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Text(countryCode[
                        //     countryData[1]['alpha2'].toUpperCase()]),
                        // Text(countryCode['IN']),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            // maxLength: 5,
                            enabled: false,
                            controller: countryCodeController,
                            // initialValue: ,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: Form(
                            key: _formKey,
                            child: TextFormField(
                              controller: numberController,
                              keyboardType: TextInputType.numberWithOptions(
                                  decimal: true),
                              inputFormatters: [
                                // FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                              ],
                              // maxLength: 10,
                              decoration:
                                  InputDecoration(hintText: "Mobile Number"),
                              // onChanged: (value) => print(value),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  final _phoneNum =
                      countryCodeController.text + numberController.text;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OtpScreen(_phoneNum)));
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                  color: Colors.amberAccent,
                  child: Text("Send OTP"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
