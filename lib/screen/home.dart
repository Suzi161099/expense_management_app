import 'package:flutter/material.dart';
import 'package:expense_management_app/screen/listexpense.dart';
import 'package:expense_management_app/screen/login.dart';
import 'package:expense_management_app/screen/newexpense.dart';
import 'package:expense_management_app/screen/newscanexpense.dart';
import 'package:expense_management_app/screen/infomation.dart';
import 'package:expense_management_app/screen/changepass.dart';

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
        backgroundColor: Colors.pink.shade900,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
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
              _showAccountOptions(context);
              break;
            case 1:
              _showAddExpenseOptions(context);
              break;
            case 2:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ExpenseListScreen()));
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'User',
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

  void _showAccountOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.person),
                title: Text("Thông tin cá nhân"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProfileScreen()));
                },
              ),
              ListTile(
                leading: Icon(Icons.lock),
                title: Text("Đổi mật khẩu"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChangePasswordScreen()));
                },
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text("Đăng xuất"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showAddExpenseOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.edit),
                title: Text("Thêm thủ công"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddExpenseScreen()));
                },
              ),
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text("Scan hóa đơn"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ReceiptScannerScreen()));
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBalanceCard() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.pink.shade900,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Tổng chi tiêu", style: TextStyle(color: Colors.white70)),
          SizedBox(height: 8),
          Text(
            "2.548.000 VND",
            style: TextStyle(
                color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Thu nhập: 1.840.000 VND",
                  style: TextStyle(color: Colors.white70)),
              Text("Chi tiêu: 284.000 VND",
                  style: TextStyle(color: Colors.white70)),
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
        Text("Lịch sử chi tiêu",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        _buildTransactionItem(
            "Mua sắm", "Hôm nay", "284.000 VND", Colors.green),
        _buildTransactionItem(
            "Sửa chữa", "Hôm nay", "-284.000 VND", Colors.red),
        _buildTransactionItem("Paypal", "Hôm nay", "284.000 VND", Colors.green),
        _buildTransactionItem("Youtube", "Hôm nay", "-284.000 VND", Colors.red),
      ],
    );
  }

  Widget _buildTransactionItem(
      String title, String date, String amount, Color color) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey[200],
        child: Icon(Icons.attach_money, color: Colors.black),
      ),
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(date),
      trailing: Text(amount,
          style: TextStyle(color: color, fontWeight: FontWeight.bold)),
    );
  }
}
