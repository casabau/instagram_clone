import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:instagramclone/src/actions/auth/reset_password.dart';
import 'package:instagramclone/src/models/app_state.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController email = TextEditingController();

  Future<void> _onResult(dynamic action) async {
    if (action is ResetPasswordSuccessful) {
      await showDialog<void>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Email sent'),
          content: const Text(
              'An email was send to the email address that you entered. Please check an click on the link you received.'),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            TextField(
              controller: email,
              decoration: const InputDecoration(
                hintText: 'Email address',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24.0),
            RaisedButton(
              elevation: 0.0,
              color: Theme.of(context).accentColor,
              colorBrightness: Brightness.light,
              onPressed: () async {
                final String email = this.email.text;

                if (email != null) {
                  StoreProvider.of<AppState>(context).dispatch(ResetPassword(email, _onResult));
                }
              },
              child: const Text('Send email'),
            ),
          ],
        ),
      ),
    );
  }
}
