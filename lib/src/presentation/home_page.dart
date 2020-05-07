import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:instagramclone/src/actions/auth/logout.dart';
import 'package:instagramclone/src/models/app_state.dart';
import 'package:instagramclone/src/presentation/add_post_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  TabController tabController;

  int page = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () async {
              StoreProvider.of<AppState>(context).dispatch(LogOut());
            },
          ),
        ],
      ),
      body: TabBarView(
        controller: tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          Container(color: Colors.red),
          Container(color: Colors.orange),
          Container(color: Colors.blue),
          Container(color: Colors.green),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          if (index == 2) {
            print('Show post dialog');
            Navigator.push(
                context,
                MaterialPageRoute<void>(
                    fullscreenDialog: true,
                    builder: (BuildContext context) {
                      return AddPostPage();
                    }));
          } else {
            setState(() => page = index);
            if (index > 2) {
              index--;
            }
            tabController.animateTo(index);
          }
        },
        currentIndex: page,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: const Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: const Text('Search'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box),
            title: const Text('Add post'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            title: const Text('Favorites'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            title: const Text('Profile'),
          ),
        ],
      ),
    );
  }
}
