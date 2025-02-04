import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class AddExpenseScreen extends StatefulWidget {
  @override
  _AddExpenseScreenState createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  String selectedInputMethod = "Manual input";
  TextEditingController dateController = TextEditingController();
  TextEditingController merchantController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  String selectedCategory = "Food";
  
  @override
  void initState() {
    super.initState();
    dateController.text = DateFormat('dd/MM/yyyy').format(DateTime.now());
  }
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Thêm chi tiêu"),
        centerTitle: true,
        backgroundColor: Colors.pink.shade900,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("How do you want to input your expense?", style: TextStyle(fontSize: 16)),
              ListTile(
                title: Text("Manual input"),
                leading: Radio(
                  value: "Manual input",
                  groupValue: selectedInputMethod,
                  onChanged: (value) {
                    setState(() {
                      selectedInputMethod = value.toString();
                    });
                  },
                ),
              ),
              ListTile(
                title: Text("Scan receipt"),
                leading: Radio(
                  value: "Scan receipt",
                  groupValue: selectedInputMethod,
                  onChanged: (value) {
                    setState(() {
                      selectedInputMethod = value.toString();
                    });
                  },
                ),
              ),
              ListTile(
                title: Text("Voice recognition"),
                leading: Radio(
                  value: "Voice recognition",
                  groupValue: selectedInputMethod,
                  onChanged: (value) {
                    setState(() {
                      selectedInputMethod = value.toString();
                    });
                  },
                ),
              ),
              TextField(
                controller: merchantController,
                decoration: InputDecoration(labelText: "Merchant Name"),
              ),
              TextField(
                controller: amountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Amount", prefixText: "GBP "),
              ),
              TextField(
                controller: dateController,
                readOnly: true,
                decoration: InputDecoration(labelText: "Date"),
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      dateController.text = DateFormat('dd/MM/yyyy').format(pickedDate);
                    });
                  }
                },
              ),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: "Description"),
              ),
              DropdownButtonFormField<String>(
                value: selectedCategory,
                items: ["Food", "Travel", "Furniture and Equipment", "Lodging", "Meals and Entertainment"]
                    .map((category) => DropdownMenuItem(value: category, child: Text(category)))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedCategory = value!;
                  });
                },
                decoration: InputDecoration(labelText: "Category"),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Handle expense submission
                },
                child: Text("Save Expense"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
