import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget{
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
     return Scaffold(
       body: Column(
          children: [
            Expanded(
              flex: 3,
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Color(0xff188095), Color(0xff2ab3c6)],
                      ),
                    ),

                  ),
                  Center(
                      child: Image.asset("assets/images/nano_health_suite_logo.png"),
                  ),
                  const Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text("Log In", style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),),
                  ),
                ],
              ),
            ),
            Expanded(
              flex:3,
              child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 28.0, left: 28, right: 28),
                    child: Form(

                      key: _formKey,
                      child: ListView(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          /// - Email
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: _emailController,
                            onChanged: _validateEmail,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              errorText: _emailErrorText,
                              suffixIcon: _isValid ?ImageIcon(AssetImage("assets/images/email_symbol.png"),color: Color(0xff2ab3c6),):null
                            ),
                            validator: _emailValidator,
                          ),
                          const SizedBox(height: 20,),
                          /// -  password
                          TextFormField(
                            controller: _passwordController,
                            obscureText: _obscureText,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              errorText: _passwordErrorText,
                                suffixIcon: GestureDetector(
                                  onTap: _togglePasswordVisibility,
                                  child:
                                    !_obscureText ? ImageIcon(AssetImage("assets/images/password_symbol.png",),color: Color(0xff2ab3c6),) : ImageIcon(AssetImage("assets/images/password_symbol.png"),)

                                ),




                            ),
                            validator: _validatePassword,
                          ),

                          const SizedBox(height: 20,),
                          ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                    const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(100)),
                                        side: BorderSide(
                                            color: Colors.transparent,
                                            width: 1)
                                    )
                                ),
                                overlayColor: MaterialStateProperty.all(Colors.white30),
                                elevation: MaterialStateProperty.all(0),
                                shadowColor: MaterialStateProperty.all(Colors.transparent),
                                backgroundColor: MaterialStateProperty.all(Color(0xff2ab3c6)),
                                // backgroundColor: MaterialStateProperty.all(Colors.black),
                                foregroundColor: MaterialStateProperty.all(Colors.white),
                                padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
                                textStyle: MaterialStateProperty.all(const TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 15))
                            ),
                            onPressed: _validateForm,
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Text('Continue'),
                            ),
                          ),
                          const SizedBox(height: 30,),
                          Align(
                            alignment: Alignment.center,
                            child: RichText(
                              text: TextSpan(
                                text: '',
                                style: TextStyle(color: Colors.grey.shade500, ),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: '',
                                      style: TextStyle(fontWeight: FontWeight.bold)),
                                  TextSpan(
                                      text: 'NEED HELP?',
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () => print('click')),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),

            ),


          ],
       ),
     );
  }




  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  String? _emailErrorText;
  String? _passwordErrorText;

  void _validateForm() {
    setState(() {
      _emailErrorText = null;
      _passwordErrorText = null;
    });

    if (_formKey.currentState!.validate()) {
      // Form is valid, perform login or other operations
      String email = _emailController.text;
      String password = _passwordController.text;

      // TODO: Perform login logic here

      // For demonstration purposes, let's just print the credentials
      print("Email: $email");
      print("Password: $password");
    }
  }


  bool _isValid = false;
  void _validateEmail(String email) {
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$');
    setState(() {
      _isValid = emailRegex.hasMatch(email);
    });
  }
  String? _emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    } else if (!value.contains('@')) {
      return 'Invalid email address';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }
  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  bool _obscureText = true;

}