import 'package:flutter/material.dart';
import 'package:instagramclone/src/containers/user_container.dart';
import 'package:instagramclone/src/models/auth/app_user.dart';
import 'package:instagramclone/src/presentation/home_page.dart';
import 'package:instagramclone/src/presentation/login_page.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UserContainer(
      builder: (BuildContext context, AppUser user) {
        return user != null ? const HomePage() : const LoginPage();
      },
    );
  }
}
