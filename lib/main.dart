import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(' Venago Login Page'),
        ),
        body: Center(
          child: LoginForm(),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyTextField(label: 'Username'),
          SizedBox(height: 20.0),
          MyPasswordField(
            label: 'Password',
            isPasswordVisible: _isPasswordVisible,
            togglePasswordVisibility: () {
              setState(() {
                _isPasswordVisible = !_isPasswordVisible;
              });
            },
          ),
          SizedBox(height: 20.0),
          MyLoginButton(),
          SizedBox(height: 10.0),
          GestureDetector(
            onTap: () {
              // Add your "Forgot Password" logic here
              print('Forgot Password pressed');
            },
            child: Text(
              'Forgot Password?',
              style: TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          SizedBox(height: 20.0),
          MyCreateAccountButton(),
          SizedBox(height: 20.0),
          Text(
            'Create a page for celebrities, brands, or businesses',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 12.0,
            ),
          ),
        ],
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  final String label;

  const MyTextField({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.0,
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}

class MyPasswordField extends StatelessWidget {
  final String label;
  final bool isPasswordVisible;
  final VoidCallback togglePasswordVisibility;

  const MyPasswordField({
    required this.label,
    required this.isPasswordVisible,
    required this.togglePasswordVisibility,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.0,
      child: TextField(
        obscureText: !isPasswordVisible,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
          suffixIcon: IconButton(
            icon: Icon(
              isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: togglePasswordVisibility,
          ),
        ),
      ),
    );
  }
}

class MyLoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.0,
      child: ElevatedButton(
        onPressed: () {
          // Add your login logic here
          print('Login button pressed');
          // Navigate to the 'Venago' page on successful login
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => VenagoPage()),
          );
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.blue, // Set the background color to blue
          onPrimary: Colors.white, // Set the text color to white
        ),
        child: Text('Log in'),
      ),
    );
  }
}

class MyCreateAccountButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.0,
      child: ElevatedButton(
        onPressed: () {
          // Add your logic to navigate to the 'CreateAccount' page
          print('Create Account button pressed');
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.green, // Set the background color to green
          onPrimary: Colors.white, // Set the text color to white
        ),
        child: Text('Create a New Account'),
      ),
    );
  }
}

class VenagoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Venago Page'),
      ),
      body: Center(
        child: Text('Welcome to Venago !'),
      ),
    );
  }
}
