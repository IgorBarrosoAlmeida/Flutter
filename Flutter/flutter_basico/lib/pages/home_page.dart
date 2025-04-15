import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController = PageController();
  int indexBottomNavigationBar = 0;

  void drawerChangePage(int newPage) {
    setState(() {
      indexBottomNavigationBar = newPage;
    });
    _pageController.jumpToPage(newPage);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "AppBar",
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
        actions: [Icon(Icons.ac_unit_outlined)],
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Igoba"),
              accountEmail: Text("IgorBa867@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text("I"),
              ),
            ),
            ListTile(
              title: Text("Pagina 1"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () => drawerChangePage(0),
            ),
            ListTile(
              title: Text("Pagina 2"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () => drawerChangePage(1),
            ),
            ListTile(
              title: Text("Pagina 3"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () => drawerChangePage(2),
            ),
          ],
        ),
      ),
      body: PageView(
        controller: _pageController,
        children: [
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Colors.blue),
            child: Center(
              child: Text(
                "Hello world!",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
          ),
          Container(color: Colors.yellow),
          Container(color: Colors.green),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexBottomNavigationBar,
        onTap: (int page) {
          setState(() {
            indexBottomNavigationBar = page;
          });

          _pageController.animateToPage(
            page,
            duration: Duration(milliseconds: 300),
            curve: Curves.ease,
          );
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.access_alarms),
            label: "item 1",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.girl_rounded),
            label: "item 2",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.zoom_out_sharp),
            label: "item 2",
          ),
        ],
      ),
    );
  }
}
