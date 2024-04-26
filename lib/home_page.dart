import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:project_go_tech/data/data.dart';
import 'package:project_go_tech/sub_menu_page.dart';



class HomePage extends StatelessWidget {
  final Map<String, dynamic> jsonData = jsonDecode(menuJson);

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
    return SizedBox();
  }
}
