import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main.dart'; // Ensure this import is correct

class CommonDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: Text('Home'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              Navigator.pushNamed(context, '/'); // Navigate to the home page
            },
          ),
          ListTile(
            title: Text('Calculator'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              Navigator.pushNamed(context, '/calculator'); // Navigate to the calculator page
            },
          ),
          ListTile(
            title: Text('About'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              Navigator.pushNamed(context, '/about'); // Navigate to the about page
            },
          ),
          ListTile(
            title: Text('Toggle Theme'),
            onTap: () {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
              Navigator.pop(context); // Close the drawer
            },
          ),
        ],
      ),
    );
  }
}

class CommonBottomNavigationBar extends StatelessWidget {
  final int currentIndex;

  const CommonBottomNavigationBar({required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        String routeName;
        switch (index) {
          case 0:
            routeName = '/';
            break;
          case 1:
            routeName = '/calculator';
            break;
          case 2:
            routeName = '/about';
            break;
          default:
            routeName = '/';
        }

        // Check if we're already on the selected route
        if (ModalRoute.of(context)?.settings.name != routeName) {
          Navigator.pushNamed(context, routeName);
        }
      },
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calculate),
          label: 'Calculator',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.info),
          label: 'About',
        ),
      ],
      selectedItemColor: Theme.of(context).colorScheme.secondary,
    );
  }
}

