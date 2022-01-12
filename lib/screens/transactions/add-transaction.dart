import 'package:flutter/material.dart';
import 'package:money_management_app/db/category/category_db.dart';
import 'package:money_management_app/models/category/category_model.dart';

class AddTransaction extends StatelessWidget {
  static const routeName = 'add-transaction';

  const AddTransaction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Purpose',
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Amount',
                ),
              ),
              TextButton.icon(
                onPressed: () {},
                icon: Icon(Icons.calendar_today),
                label: Text('Select Date'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Radio(
                        value: false,
                        groupValue: CategoryType.income,
                        onChanged: (newValue) {},
                      ),
                      Text('Income'),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        value: false,
                        groupValue: CategoryType.expense,
                        onChanged: (newValue) {},
                      ),
                      Text('Expense'),
                    ],
                  ),
                ],
              ),
              DropdownButton(
                  items: CategoryDb.instance.incomeCategoryListListener.value
                      .map((e) {})
                      .toList(),
                  onChanged: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
