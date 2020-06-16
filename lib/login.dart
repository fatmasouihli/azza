import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterapp/constants.dart';

/*class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}*/
class LoginSignupPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => new _LoginSignupPageState();
}
enum FormMode { LOGIN, SIGNUP, FORGOTPASSWORD }

Widget showEmailInput() {
  final _formkey  =GlobalKey<FormState>();
  return Form(
    key: _formkey,
    child: Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        autofocus: true,
        decoration: new InputDecoration(
            hintText: 'Username',

            icon: new Icon(
              Icons.person,
              color: Colors.white,
            )),
              validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,


      ),
    ),
  );
}

Widget showPasswordInput() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
    child: new TextFormField(
      maxLines: 1,
      obscureText: true,
      autofocus: false,
      decoration: new InputDecoration(
          hintText: 'Password',
          icon: new Icon(
            Icons.lock,
            color: Colors.white,
          )),

     //validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,


    ),
  );
}
class _LoginSignupPageState extends State<LoginSignupPage>{
  bool _rememberMe = false;



//class _LoginSignUpPageState extends State<LoginSignUpPage> {
  final _formKey = new GlobalKey<FormState>();

  String _email;
  String _password;
  String _errorMessage;

  // Initial form is login form
  FormMode _formMode = FormMode.LOGIN;
  bool _isIos;
  bool _isLoading;
  /*Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              hintText: 'Enter your Email',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }*/

  /*Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            obscureText: true,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Enter your Password',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }
*/
  Widget _buildForgotPasswordBtn() {
    return Container(
      padding: const EdgeInsets.fromLTRB(0.0, 60.0, 0.0, 0.0),
      alignment: Alignment.center,
      child: FlatButton(
        onPressed: () => print('Forgot Password Button Pressed'),
        padding: EdgeInsets.only(bottom: 0.0),

    child: Text(
    'Forgot Password?',
    style: TextStyle(
    color: Color(0xFF111111),
        ),
    ),

      ),
    );
  }

  Widget _buildRememberMeCheckbox() {
    return Container(
      padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: _rememberMe,
              checkColor: Colors.green,
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value;
                });
              },
            ),
          ),
          Text(
            'Remember me',
            style: kLabelStyle,
          ),
        ],
      ),
    );
  }

  Widget _buildLoginBtn() {
    return Container(
     // padding: const EdgeInsets.fromLTRB(0.0, 23.0, 0.0, 0.0),
      padding: EdgeInsets.only(right: 50,left: 50,bottom: 30),
      width: double.infinity,
      child: RaisedButton(
        elevation: 1.0,
        onPressed: (){
          if(_formKey.currentState.validate()){
            print('hi');
          }
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Color(0xFFF2F2F2),

        child: Text(
          'Login',
          style: TextStyle(
            color: Color(0xFF333333),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

/* Widget showErrorMessage() {
    if (_errorMessage.length > 0 && _errorMessage != null) {
      return new Text(
        _errorMessage,
        style: TextStyle(
            fontSize: 13.0,
            color: Colors.red,
            height: 1.0,
            fontWeight: FontWeight.w300),
      );
    } else {
      return new Container(
        height: 0.0,
      );
    }
  }*/

  @override
  Widget showLogo() {
    return new Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 00.0, 0.0, 30.0),
        child: Stack(

          children: <Widget>[
          Container(
            width: 130.0,
            height: 130.0,
       // radius: 70.0,
            decoration: new BoxDecoration(
            shape: BoxShape.circle,
            image: new DecorationImage(
            fit: BoxFit.fill,
            image: new AssetImage("images/logo.jpg"),
           )
    )),
    ],
    ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(

          onTap: () => FocusScope.of(context).unfocus(),
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
                      Color(0xFF3F2AB2),
                      Color(0xFF9250F7),
                      Color(0xFFB027F0),
                    ],
                  ),

                ),

              ),

              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 60.0,
                  ),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      showLogo(),
                      Text(
                        'LOG IN',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      //SizedBox(height: 30.0),
                      //_buildEmailTF(),

                      SizedBox(
                        height: 30.0,
                      ),


                      showEmailInput(),
                      showPasswordInput(),
                      _buildRememberMeCheckbox(),
                      _buildLoginBtn(),
                      _buildForgotPasswordBtn(),


                     // showErrorMessage()
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
