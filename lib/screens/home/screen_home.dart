import 'package:flutter/material.dart';
import 'package:money_management_app/db/category/category_db.dart';
import 'package:money_management_app/models/category/category_model.dart';
import 'package:money_management_app/screens/category/screen_category.dart';
import 'package:money_management_app/screens/category/widget/category_add_popup.dart';
import 'package:money_management_app/screens/transactions/screen_transaction.dart';
import 'package:money_management_app/screens/transactions/widgets/bottom_nav.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  static ValueNotifier<int> selectedIndexNotifier = ValueNotifier(0);
  final _pages = const [
    ScreenTransactions(),
    ScreenCategory(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: const Text('Money Manager'),
        centerTitle: true,
      ),
      bottomNavigationBar: const MoneyManagerBottomNavigation(),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: selectedIndexNotifier,
          builder: (BuildContext context, int updatedIndex, _) {
            return _pages[updatedIndex];
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (selectedIndexNotifier.value == 0) {
            print('add transaction');
          } else {
            ShowCategoryAddPopup(context);

            // final _sample = CategoryModel(
            //     id: DateTime.now().microsecondsSinceEpoch.toString(),
            //     name: 'Travel',
            //     type: CategoryType.expense);
            // CategoryDb().insertCategory(_sample);
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
