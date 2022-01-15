import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_management_app/db/category/category_db.dart';
import 'package:money_management_app/db/transactions/transaction_db.dart';
import 'package:money_management_app/models/category/category_model.dart';
import 'package:money_management_app/models/transaction/transaction_model.dart';

class ScreenTransactions extends StatelessWidget {
  const ScreenTransactions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TransactionDB.instance.refresh();
    CategoryDb.instance.refreshUI();
    return ValueListenableBuilder(
      valueListenable: TransactionDB.instance.transactionListNotifier,
      builder: (BuildContext ctx, List<TransactionModel> newList, Widget? _) {
        return ListView.separated(
          padding: const EdgeInsets.all(10),
          //values
          itemBuilder: (ctx, index) {
            final _value = newList[index];
            return Card(
              child: ListTile(
                leading: CircleAvatar(
                  radius: 50,
                  child: Text(
                    parseDate(_value.date),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: _value.type == CategoryType.income
                      ? Colors.green
                      : Colors.red,
                ),
                title: Text('Rs.${_value.amount}'),
                subtitle: Text(_value.category.name),
                trailing: IconButton(
                  color: Colors.red,
                  onPressed: () {},
                  icon: const Icon(Icons.delete),
                ),
              ),
            );
          },
          separatorBuilder: (ctx, index) {
            return const SizedBox(
              height: 10,
            );
          },
          itemCount: newList.length,
        );
      },
    );
  }

  String parseDate(DateTime date) {
    final _date = DateFormat.MMMd().format(date);
    final _splitedDate = _date.split(' ');
    return '${_splitedDate.last}\n${_splitedDate.first}';
    //return '${date.day}\n${date.month}';
  }
}
