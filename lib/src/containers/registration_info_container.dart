import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:instagramclone/src/models/app_state.dart';
import 'package:instagramclone/src/models/registration_info.dart';
import 'package:redux/redux.dart';

class RegistrationInfoContainer extends StatelessWidget {
  const RegistrationInfoContainer({Key key, @required this.builder}) : super(key: key);

  final ViewModelBuilder<RegistrationInfo> builder;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, RegistrationInfo>(
      converter: (Store<AppState> store) => store.state.info,
      builder: builder,
    );
  }
}
