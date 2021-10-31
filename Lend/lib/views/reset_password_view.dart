import 'package:Lend_A_Hand/services/authentication.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResetPasswordView extends StatefulWidget {
  @override
  _ResetPasswordViewState createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  final _formKey = GlobalKey<FormState>();
  String _email, _message;

  bool validate() {
    final form = _formKey.currentState;
    form.save();
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  void submit() async {
    if (validate()) {
      final form = _formKey.currentState;
      form.save();
      final status = context.read<AuthenticationService>().sendPasswordResetEmail(_email);
      status.then((value) async => {
            if (value != "Reset Link Sent")
              {
                setState(() {
                  _message = value;
                }),
              }
            else
              {
                setState(() {
                  _message = "A password reset link has been sent to $_email";
                }),
                await Future.delayed(Duration(seconds: 7)),
                Navigator.of(context).pushReplacementNamed('/signIn'),
              }
          });
    }
  }

  final ourLabelStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontFamily: 'OpenSans',
  );

  Widget _buildEmailTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: ourLabelStyle,
        ),
        SizedBox(height: 10.0),
        TextFormField(
          validator: EmailValidator.validate,
          onSaved: (value) => _email = value,
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'OpenSans',
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            // focusColor: Colors.black,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                width: 2,
                // style: BorderStyle.none,
              ),
            ),
            errorStyle: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
              color: Colors.deepOrange,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                width: 2,
                color: Colors.deepOrange,
                // style: BorderStyle.none,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                width: 2,
                // style: BorderStyle.none,
              ),
            ),
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(25.0),
            prefixIcon: Icon(
              Icons.email,
              color: Colors.black87,
            ),
            hintText: 'Enter your Email',
            hintStyle: TextStyle(
              color: Colors.black38,
              fontFamily: 'OpenSans',
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginButton() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/signIn');
        },
        padding: EdgeInsets.only(right: 0.0),
        child: AutoSizeText(
          'Return to Sign In',
          style: ourLabelStyle,
        ),
      ),
    );
  }

  Widget _buildResetButton() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: submit,
        padding: EdgeInsets.all(20.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Color(0xFF1BD7FF),
        child: Text(
          'Reset',
          style: TextStyle(
            color: Colors.black,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        height: _height,
        width: _width,
        child: Container(
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF12B6D9),
                      Color(0xFF7351E1),
                    ],
                  ),
                ),
              ),
              showAlert(),
              Container(
                child: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Reset Password',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50.0),
                        child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                SizedBox(height: 30.0),
                                _buildEmailTextField(),
                                _buildLoginButton(),
                                SizedBox(
                                  height: 20.0,
                                ),
                                _buildResetButton(),
                              ],
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget showAlert() {
    if (_message != null) {
      return Container(
        color: Colors.deepOrange,
        width: double.infinity,
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(Icons.error_outline),
            ),
            Expanded(
              child: AutoSizeText(
                _message,
                maxLines: 3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    setState(() {
                      _message = null;
                    });
                  }),
            ),
          ],
        ),
      );
    }
    return SizedBox(height: 0);
  }
}
