import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  final List<Map<String, dynamic>> categories = [
    {"name": "Food & Drink", "color": Colors.red},
    {"name": "Shopping", "color": Colors.blue},
    {"name": "Housing", "color": Colors.orange},
    {"name": "Transportation", "color": Colors.grey},
    {"name": "Life & Entertainment", "color": Colors.green},
    {"name": "Income", "color": Colors.orange},
    {"name": "Other", "color": Colors.brown},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Category",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.pink.shade900,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: Colors.white70),
                hintText: "Search",
                hintStyle: TextStyle(color: Colors.white70),
                filled: true,
                fillColor: Colors.black54,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 16),
            Text("All category",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white)),
            Divider(color: Colors.white),
            Expanded(
              child: ListView.builder(
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: categories[index]["color"],
                    ),
                    title: Text(categories[index]["name"],
                        style: TextStyle(color: Colors.white)),
                    trailing:
                        Icon(Icons.arrow_forward_ios, color: Colors.white),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailCategoryScreen(category: categories[index]),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}

class DetailCategoryScreen extends StatelessWidget {
  final Map<String, dynamic> category;

  DetailCategoryScreen({required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category["name"],
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: category["color"],
      ),
      body: Center(
        child: Text(
          "Details of ${category["name"]}",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
