import 'package:app_login_screen/wind/hot_page.dart';
import 'package:app_login_screen/wind/sidebar_menu.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        drawer: const SidebarMenu(),
        appBar: AppBar(
          title: const Text('WIND'),
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.search_rounded)),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications_none_rounded)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.person)),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(
                child: Text(
                  'Hot',
                  style: TextStyle(fontSize: 16.0),

                ),
              ),
              Tab(
                child: Text(
                  'Trending',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              Tab(
                child: Text(
                  'Fresh',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              Tab(
                child: Text(
                  'Boards',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            HotPage(),
            DummyPage('Trending'),
            DummyPage('Fresh'),
            DummyPage('Boards'),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {},
        ),
      ),
    );
  }
}

Widget DummyPage(String text) {
  return Center(
    child: Text(
      text,
      style: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}