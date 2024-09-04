import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:practica_1/screens/profile_screen.dart';
import 'package:practica_1/settings/colors_settings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsSettings.navColor,
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.access_alarm_outlined)),
          GestureDetector(
              child: Image.asset(
            'assets/auriculares.png',
            height: 21.5,
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
      drawer: const Drawer(),
      endDrawer: const Drawer(),
      bottomNavigationBar: ConvexAppBar(
        items: const [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.person, title: 'Profile'),
          TabItem(icon: Icons.exit_to_app, title: 'Exit')
        ],
        onTap: (int i) => setState(() {
          index = i;
        }),
      ),
    );
  }
}
