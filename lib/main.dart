import 'dart:convert';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dynamic Menu Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: HomePage(
        jsonData: jsonDecode(menuJson), // Parse JSON data
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final Map<String, dynamic> jsonData;

  const HomePage({Key? key, required this.jsonData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dynamic Menu',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: jsonData.length,
        itemBuilder: (context, index) {
          final menuKey = jsonData.keys.elementAt(index);
          final submenuData = jsonData[menuKey] as Map<String, dynamic>;
          return Card(
            elevation: 4,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ExpansionTile(
              title: Text(
                menuKey,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              children: submenuData.entries
                  .map((entry) => buildSubMenu(context, entry.key, entry.value))
                  .toList(),
            ),
          );
        },
      ),
    );
  }

  Widget buildSubMenu(BuildContext context, String key, dynamic value) {
    if (value is Map<String, dynamic>) {
      return Card(
        elevation: 2,
        margin: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: ExpansionTile(
          title: Text(
            key,
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          children: value.entries
              .map((entry) => buildSubMenu(context, entry.key, entry.value))
              .toList(),
        ),
      );
    } else if (value is String) {
      return ListTile(
        title: Text(
          key,
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SubMenuPage(
                title: key,
                body: value,
              ),
            ),
          );
        },
      );
    }
    return SizedBox(); // Placeholder for handling other types if needed
  }
}

class SubMenuPage extends StatelessWidget {
  final String title;
  final String body;

  const SubMenuPage({Key? key, required this.title, required this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          body,
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}

const String menuJson = '''
{
  "Menu1": {
    "submenu1": {
      "innersub1": {
        "Title": "inner title",
        "body": "inner page description"
      },
      "innersub2": {
        "Title": "inner title 2",
        "body": "inner page 2 description"
      }
    },
    "submenu2": {
      "innersub": {
        "Title": "inner title",
        "body": "inner page description"
      }
    }
  },
  "Menu2": {
    "submenu1": {
      "Title": "inner title",
      "body": "inner page description"
    }
  },
  "Menu3": {
    "submenu1": {
      "Title": "inner title",
      "body": "inner page description"
    }
  },
  "Menu4": {
    "submenu1": {
      "Title": "inner title",
      "body": "inner page description"
    }
  },
  "Menu6": {
    "submenu1": {
      "Title": "inner title",
      "body": "inner page description"
    }
  },
  "Menu7": {
    "submenu1": {
      "Title": "inner title",
      "body": "inner page description"
    }
  },
  "Menu8": {
    "submenu1": {
      "Title": "inner title",
      "body": "inner page description"
    }
  }
}
''';
