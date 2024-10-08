import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:practica_1/screens/profile_screen.dart';
import 'package:practica_1/settings/colors_settings.dart';
import 'package:practica_1/settings/global_values.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  final _key = GlobalKey<ExpandableFabState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsSettings.navColor,
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.access_alarm_outlined)),
          GestureDetector(
              onTap: () {},
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Image.asset(
                  'assets/auriculares.png',
                  height: 21.5,
                ),
              ))
        ],
      ),
      body: Builder(
        builder: (context) {
          switch (index) {
            case 1:
              return const ProfileScreen();
            default:
              return const ProfileScreen();
          }
        },
      ),
      drawer: myDrawer(),
      //endDrawer: const Drawer(),
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: const Color.fromARGB(255, 199, 157, 141),
        items: const [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.person, title: 'Profile'),
          TabItem(icon: Icons.exit_to_app, title: 'Exit')
        ],
        onTap: (int i) => setState(() {
          index = i;
        }),
      ),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFab(key: _key, children: [
        FloatingActionButton.small(
            heroTag: "btn1",
            onPressed: () {
              GlobalValues.banThemeDark.value = false;
            },
            child: const Icon(Icons.light_mode)),
        FloatingActionButton.small(
            heroTag: "btn2",
            onPressed: () {
              GlobalValues.banThemeDark.value = true;
            },
            child: const Icon(Icons.dark_mode))
      ]),
    );
  }

  Widget myDrawer() {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                //PREGUNTA DE EXAMEN
                backgroundImage:
                    NetworkImage('https://i.pravatar.cc/150?img=3'),
              ),
              accountName: Text('Leonardo Torres'),
              accountEmail: Text('ilove.lilchoko@gmail.com')),
          ListTile(
            onTap: () => Navigator.pushNamed(context, '/db'),
            title: Text('Movies List'),
            subtitle: Text('Database Movies'),
            leading: Icon(Icons.movie),
            trailing: Icon(Icons.chevron_right),
          )
        ],
      ),
    );
  }
}
