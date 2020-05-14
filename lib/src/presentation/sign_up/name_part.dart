import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:instagramclone/src/actions/auth/reserve_username.dart';
import 'package:instagramclone/src/actions/auth/update_registration_info.dart';
import 'package:instagramclone/src/containers/registration_info_container.dart';
import 'package:instagramclone/src/models/app_state.dart';
import 'package:instagramclone/src/models/auth/registration_info.dart';

class NamePart extends StatefulWidget {
  const NamePart({Key key, @required this.onNext}) : super(key: key);

  final VoidCallback onNext;

  @override
  _NamePartState createState() => _NamePartState();
}

class _NamePartState extends State<NamePart> {
  final TextEditingController name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        children: <Widget>[
          const Text(
            'Add your name',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w300,
            ),
          ),
          const SizedBox(height: 24.0),
          const Text(
            'Add your name so that friends can find you.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.white70,
              fontWeight: FontWeight.w300,
            ),
          ),
          const SizedBox(height: 24.0),
          RegistrationInfoContainer(
            builder: (BuildContext context, RegistrationInfo info) {
              return TextFormField(
                controller: name,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'name',
                ),
                validator: (String value) {
                  if (value.trim().length < 3) {
                    return 'The name is too short.';
                  } else {
                    return null;
                  }
                },
                onChanged: (String value) {
                  final RegistrationInfo newInfo = info.rebuild((RegistrationInfoBuilder b) => b.displayName = value);
                  StoreProvider.of<AppState>(context).dispatch(UpdateRegistrationInfo(newInfo));
                },
              );
            },
          ),
          const SizedBox(height: 24.0),
          Container(
            constraints: const BoxConstraints.expand(height: 48.0),
            child: RaisedButton(
              elevation: 0.0,
              color: Theme.of(context).accentColor,
              colorBrightness: Brightness.light,
              onPressed: () {
                if (Form.of(context).validate()) {
                  StoreProvider.of<AppState>(context).dispatch(ReserveUsername());
                  FocusScope.of(context).requestFocus(FocusNode());
                  widget.onNext();
                }
              },
              child: const Text('Next'),
            ),
          ),
        ],
      ),
    );
  }
}
