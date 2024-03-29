import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mwiti_app/res/custom_colors.dart';
import 'package:mwiti_app/utils/authentication.dart';
import 'package:mwiti_app/widgets/apple_sign_in_button.dart';
import 'package:mwiti_app/widgets/facebook_sign_in_button.dart';
import 'package:mwiti_app/widgets/google_sign_in_button.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.adobePurple,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 20,
            left: 16.0,
            right: 16.0,
            bottom: 20.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Text('mwiti'),
                    Flexible(
                      flex: 1,
                      child: Image.asset(
                        'assets/washing.png',
                        height: 160,
                      ),
                    ),
                    SizedBox(height: 30),

                    Text(
                      'Welcome',
                      style: TextStyle(
                        color: Color.fromARGB(255, 253, 253, 253),
                        fontSize: 32,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Sign in below with the folowing options',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      width: 300,
                      child: Column(
                        children: [
                          FutureBuilder(
                            future: Authentication.initializeFirebase(
                                context: context),
                            builder: (context, snapshot) {
                              if (snapshot.hasError) {
                                return Text('Error initializing Firebase');
                              } else if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                return SizedBox(
                                    width: 300, child: GoogleSignInButton());
                              }
                              return CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  CustomColors.firebaseOrange,
                                ),
                              );
                            },
                          ),
                          const FacebookSignInButton(),
                          AppleSignInButton()
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
