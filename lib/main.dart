import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:instagramclone/src/actions/bootstrap.dart';
import 'package:instagramclone/src/data/auth_api.dart';
import 'package:instagramclone/src/data/comments_api.dart';
import 'package:instagramclone/src/data/likes_api.dart';
import 'package:instagramclone/src/data/post_api.dart';
import 'package:instagramclone/src/epics/app_epics.dart';
import 'package:instagramclone/src/models/app_state.dart';
import 'package:instagramclone/src/presentation/comments/comments_page.dart';
import 'package:instagramclone/src/presentation/forgot_password.dart';
import 'package:instagramclone/src/presentation/home.dart';
import 'package:instagramclone/src/presentation/home_page.dart';
import 'package:instagramclone/src/presentation/login_page.dart';
import 'package:instagramclone/src/presentation/post_details.dart';
import 'package:instagramclone/src/presentation/sign_up/signup_page.dart';
import 'package:instagramclone/src/reducer/reducer.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:redux/redux.dart';
import 'package:instagramclone/src/presentation/profile/users_lists.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:algolia/algolia.dart';
import 'package:instagramclone/src/data/chats_api.dart';
import 'package:cloud_functions/cloud_functions.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  const Algolia algolia = Algolia.init(applicationId: 'J754OR2W4U', apiKey: '77f3205ba1b7efbbbf7f4dff470b9feb');
  final AlgoliaIndexReference index = algolia.index('users');

  final AuthApi authApi = AuthApi(
    auth: FirebaseAuth.instance,
    firestore: Firestore.instance,
    cloudFunctions: CloudFunctions.instance,
    index: index,
  );
  final PostApi postApi = PostApi(firestore: Firestore.instance, storage: FirebaseStorage.instance);
  final CommentsApi commentsApi = CommentsApi(firestore: Firestore.instance);
  final LikesApi likesApi = LikesApi(firestore: Firestore.instance);
  final ChatsApi chatsApi = ChatsApi(firestore: Firestore.instance);

  final AppEpics epics = AppEpics(
    authApi: authApi,
    postApi: postApi,
    commentsApi: commentsApi,
    likesApi: likesApi,
    chatsApi: chatsApi,
  );
  final Store<AppState> store = Store<AppState>(
    reducer,
    initialState: AppState(),
    middleware: <Middleware<AppState>>[
      EpicMiddleware<AppState>(epics.epics),
    ],
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
          '/postDetails': (_) => const PostDetails(),
          '/commentsPage': (_) => const CommentsPage(),
          '/usersList': (_) => const UsersList(),
        },
      ),
    );
  }
}
