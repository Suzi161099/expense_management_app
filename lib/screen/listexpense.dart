import 'package:flutter/material.dart';

class ExpenseListScreen extends StatefulWidget {
  @override
  _ExpenseListScreenState createState() => _ExpenseListScreenState();
}

class _ExpenseListScreenState extends State<ExpenseListScreen> {
  List<Map<String, String>> _expenses = [
    {"title": "Mua sắm", "amount": "500,000 VNĐ"},
    {"title": "Ăn uống", "amount": "200,000 VNĐ"},
    {"title": "Giải trí", "amount": "150,000 VNĐ"},
  ];

  void _deleteExpense(int index) {
    setState(() {
      _expenses.removeAt(index);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Đã xoá chi tiêu!")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Danh sách chi tiêu"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: _expenses.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 5),
            child: ListTile(
              title: Text(_expenses[index]["title"]!, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              subtitle: Text(_expenses[index]["amount"]!, style: TextStyle(fontSize: 16, color: Colors.red)),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () => _deleteExpense(index),
              ),
            ),
          );
        },
      ),
    );
  }
}
