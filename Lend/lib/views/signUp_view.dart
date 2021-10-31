import 'package:Lend_A_Hand/services/authentication.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpView extends StatefulWidget {
  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _formKey = GlobalKey<FormState>();
  String _email, _password, _error;

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
      final status = context.read<AuthenticationService>().signUp(
            email: _email,
            password: _password,
          );
      status.then((value) => {
        if (value != "Signed Up") {
            setState(() {
              _error = value;
            }),
          }
        else{
          Navigator.of(context).pushReplacementNamed('/')
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

  Widget _buildPasswordTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: ourLabelStyle,
        ),
        SizedBox(height: 10.0),
        TextFormField(
          validator: PasswordValidator.validate,
          obscureText: true,
          onSaved: (value) => _password = value,
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
                  //style: BorderStyle.none,
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
              Icons.lock,
              color: Colors.black87,
            ),
            hintText: 'Enter your Password',
            hintStyle: TextStyle(
              color: Colors.black38,
              fontFamily: 'OpenSans',
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSignUpButton() {
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
          'Create an account',
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

  Widget _buildLoginButton() {
    return FlatButton(
      onPressed: () {
        Navigator.pushReplacementNamed(context, '/signIn');
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          AutoSizeText(
            'Have an Account? ',
            style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          AutoSizeText(
            'Sign In',
            style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
                          'Sign Up',
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
                                  SizedBox(
                                    height: 30.0,
                                  ),
                                  _buildPasswordTextField(),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  _buildSignUpButton(),
                                  SizedBox(
                                    height: 30.0,
                                  ),
                                  _buildLoginButton(),
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
      ),
    );
  }

  Widget showAlert() {
    if (_error != null) {
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
                _error,
                maxLines: 3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: IconButton(
                icon: Icon(Icons.close), 
                onPressed: (){
                  setState(() {
                    _error = null;
                  });
                }
              ),
            ),
          ],
        ),
      );
    }
    return SizedBox(height: 0);
  }
}
