import 'package:flutter/material.dart';
import 'package:flutter_qualification/pages/home_page.dart';
import 'package:flutter_qualification/pages/login_page.dart';
import 'package:flutter_qualification/pages/movies_page.dart';

// ignore: must_be_immutable
class MainPage extends StatefulWidget {
  String email;

  MainPage({
    super.key,
    required this.email
  });

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedPage = 0;

  List<Widget> pages = [
    const HomePage(),
    const MoviesPage()
  ];

  void handleLogOut() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello, ${widget.email}"),
        automaticallyImplyLeading: false,
        actions: [
          TextButton(
            onPressed: handleLogOut, 
            child: const Text(
              "Logout",
              style: TextStyle(
                color: Colors.white
              ),
            )
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              pages[selectedPage]
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            selectedPage = value;
          });
        },
        currentIndex: selectedPage,
        items: const [
          BottomNavigationBarItem(
            tooltip: "Home",
            label: "Home",
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
            tooltip: "Movies",
            label: "Movies",
            icon: Icon(Icons.movie_outlined),
            activeIcon: Icon(Icons.movie)
          ),
        ],
      ),
    );
  }
}