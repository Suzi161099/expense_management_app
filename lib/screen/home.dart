import 'package:flutter/material.dart';
import 'package:expense_management_app/screen/listexpense.dart';
import 'package:expense_management_app/screen/login.dart';
import 'package:expense_management_app/screen/newexpense.dart';
class ExpenseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: MainScreen(), 
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Trang chủ"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: Center(child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildBalanceCard(),
            SizedBox(height: 20),
            _buildTransactions(),
            Spacer(),
          ],
        ),
      ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
              break;
            case 1:
              Navigator.push(context, MaterialPageRoute(builder: (context) => AddExpenseScreen()));
              break;
            case 2:
              Navigator.push(context, MaterialPageRoute(builder: (context) => ExpenseListScreen()));
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.login),
            label: 'Đăng nhập',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_alarm_sharp),
            label: 'Thêm chi tiêu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Danh sách chi tiêu',
          ),
        ],
      ),
    );
  }
    Widget _buildBalanceCard() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Tổng chi tiêu", style: TextStyle(color: Colors.white70)),
          SizedBox(height: 8),
          Text(
            "\2.548.000 VND",
            style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Thu nhập: \1.840.000 VND", style: TextStyle(color: Colors.white70)),
              Text("Chi tiêu: \284.000 VND", style: TextStyle(color: Colors.white70)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTransactions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Lịch sử chi tiêu", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        _buildTransactionItem("Mua sắm", "Hôm nay", "\284.000 VND", Colors.green),
        _buildTransactionItem("Sửa chữa", "Hôm nay", "-\284.000 VND", Colors.red),
        _buildTransactionItem("Paypal", "Hôm nay", "\284.000 VND", Colors.green),
        _buildTransactionItem("Youtube", "Hôm nay", "-\284.000 VND", Colors.red),
      ],
    );
  }

  Widget _buildTransactionItem(String title, String date, String amount, Color color) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey[200],
        child: Icon(Icons.attach_money, color: Colors.black),
      ),
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(date),
      trailing: Text(amount, style: TextStyle(color: color, fontWeight: FontWeight.bold)),
    );
  }

}
