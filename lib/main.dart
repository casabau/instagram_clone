import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:instagramclone/src/actions/bootstrap.dart';
import 'package:instagramclone/src/data/auth_api.dart';
import 'package:instagramclone/src/data/post_api.dart';
import 'package:instagramclone/src/middleware/app_middleware.dart';
import 'package:instagramclone/src/models/app_state.dart';
import 'package:instagramclone/src/presentation/forgot_password.dart';
import 'package:instagramclone/src/presentation/home.dart';
import 'package:instagramclone/src/presentation/home_page.dart';
import 'package:instagramclone/src/presentation/login_page.dart';
import 'package:instagramclone/src/presentation/sign_up/signup_page.dart';
import 'package:instagramclone/src/reducer/reducer.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:redux/redux.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final AuthApi authApi = AuthApi(auth: FirebaseAuth.instance, firestore: Firestore.instance);
  final PostApi postApi = PostApi(firestore: Firestore.instance);
  final AppMiddleware middleware = AppMiddleware(authApi: authApi, postApi: postApi);
  final Store<AppState> store = Store<AppState>(
    reducer,
    initialState: AppState(),
    middleware: middleware.middleware,
  );

  runApp(InstagramClone(store: store));
  store.dispatch(Bootstrap());
}

class InstagramClone extends StatelessWidget {
  const InstagramClone({Key key, @required this.store}) : super(key: key);

  final Store<AppState> store;

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Instagram Clone',
        theme: ThemeData.dark(),
        //.copyWith(visualDensity: VisualDensity.adaptivePlatformDensity)
        home: const Home(),
        onGenerateTitle: (BuildContext context) {
          initializeDateFormatting(Localizations.localeOf(context).toString());
          return 'Instagram Clone';
        },
        localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        routes: <String, WidgetBuilder>{
          '/login': (_) => const LoginPage(),
          '/signUp': (_) => const SignUpPage(),
          '/home': (_) => const HomePage(),
          '/forgotPassword': (_) => const ForgotPassword(),
        },
      ),
    );
  }
}
