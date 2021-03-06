import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:instagramclone/src/actions/auth/update_registration_info.dart';
import 'package:instagramclone/src/containers/registration_info_container.dart';
import 'package:instagramclone/src/models/app_state.dart';
import 'package:instagramclone/src/models/auth/registration_info.dart';

class PasswordPart extends StatefulWidget {
  const PasswordPart({Key key, @required this.onNext}) : super(key: key);

  final VoidCallback onNext;

  @override
  _PasswordPartState createState() => _PasswordPartState();
}

class _PasswordPartState extends State<PasswordPart> {
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: RegistrationInfoContainer(
        builder: (BuildContext context, RegistrationInfo info) {
          return Column(
            children: <Widget>[
              const Text(
                'Create a password',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(height: 24.0),
              Container(
                padding: const EdgeInsetsDirectional.only(start: 16.0),
                child: const Text(
                  'We\'ll remember the login info, so you won\'t need to enter it on your iCloud® devices.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.white70,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Container(
                padding: const EdgeInsetsDirectional.only(start: 16.0),
                child: TextFormField(
                  controller: password,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'password',
                  ),
                  onChanged: (String value) {
                    final RegistrationInfo newInfo = info.rebuild((RegistrationInfoBuilder b) => b.password = value);
                    StoreProvider.of<AppState>(context).dispatch(UpdateRegistrationInfo(newInfo));
                  },
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Can you please try something more secure?';
                    }
                    return null;
                  },
                ),
              ),
              Row(
                children: <Widget>[
                  Checkbox(
                      value: info.savePassword,
                      onChanged: (bool value) {
                        if (Form.of(context).validate()) {
                          final RegistrationInfo newInfo =
                              info.rebuild((RegistrationInfoBuilder b) => b.savePassword = value);
                          StoreProvider.of<AppState>(context).dispatch(UpdateRegistrationInfo(newInfo));
                        }
                      }),
                  const Text('Save password'),
                ],
              ),
              const SizedBox(height: 8.0),
              Container(
                constraints: const BoxConstraints.expand(height: 48.0),
                padding: const EdgeInsetsDirectional.only(start: 16.0),
                child: RaisedButton(
                  elevation: 0.0,
                  color: Theme.of(context).accentColor,
                  colorBrightness: Brightness.light,
                  onPressed: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    widget.onNext();
                  },
                  child: const Text('Next'),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
