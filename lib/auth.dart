import 'package:flutter/material.dart';
class Auth extends StatelessWidget {
  const Auth({super.key, required this.logo, this.email, this.password});
  // Authentication related code will go here
  final String title = "Authentication";
  final Image logo;

  final String? email;
  final String? password;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: <String, WidgetBuilder>{
        '/login': (BuildContext context) => Scaffold(
          appBar: AppBar(
            title: Text('Login'),
          ),
          body: Padding(
            padding: EdgeInsets.all(16.0),
            child: LoginPage(),
          ),
        ),
        '/register': (BuildContext context) => Scaffold(
          appBar: AppBar(
            title: Text('Register'),
          ),
          body: Padding(
            padding: EdgeInsets.all(16.0),
            child: RegisterPage(),
          ),
        ),
      },
      initialRoute: '/login',
    );
  }

}



class LoginPage extends StatelessWidget {
  LoginPage({super.key, this.logo});
  final Image? logo;
  RegExp emailRegex = RegExp(r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$');
  @override
  Widget build(BuildContext context) {
    String email = "";
    String password = "";

    return Form(
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Email',
            ),
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) {
              email = value;
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              else if (!emailRegex.hasMatch(value)) {
                return 'Please enter a valid email address';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Password',
            ),
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            onChanged: (value) {
              password = value;
            },
          ),
          TextButton(
            onPressed: () {
              print("user has logged in");
            },
            child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.login),
                    SizedBox(width: 8),
                    Text("Login"),
                  ],
                ), 
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/register');
            }, 
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.login),
                SizedBox(width: 8),
                Text("Register"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RegisterPage extends StatelessWidget {
  final RegExp emailRegex = RegExp(r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$');

  @override
  Widget build(BuildContext context) {
    String email = "";
    String password = "";
    String confirmPassword = "";

    return Form(
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Email',
              helperText: '',
              errorText: null,

            ),
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) {
              email = value;
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              else if (!emailRegex.hasMatch(value)) {
                return 'Please enter a valid email address';
              }
              return null;
            },
            onEditingComplete: () => {
              FormFieldState().validate()
            },
          ),
          
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Password',
              helperText: '',
            ),
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            onChanged: (value) {
              password = value;
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Confirm Password',
              helperText: '',
              errorText: null,
            ),
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            onChanged: (value) {
              confirmPassword = value;
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please confirm your password';
              }
              else if (value != password) {
                return 'Passwords do not match';
              }
              return null;
            },
            onEditingComplete: () => {
              FormFieldState().validate()
            },
          ),
          TextButton(onPressed: () {
            print("user has registered");
          }, child: Row(children: [
            Icon(Icons.app_registration),
            SizedBox(width: 8),
            Text("Register"
            ),
          ],
          ),
          )
        ],
      ),
    );
  }
}