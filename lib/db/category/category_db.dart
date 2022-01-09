import 'package:hive_flutter/adapters.dart';
import 'package:money_management_app/models/category/category_model.dart';

const CATEGORY_DB_NAME = 'category_db';

abstract class CategoryDbFunctions {
  Future<List<CategoryModel>> getCategories();
  Future<void> insertCategory(CategoryModel value);
}

class CategoryDb implements CategoryDbFunctions {
  @override
  Future<void> insertCategory(CategoryModel value) async {
    final _categoryDb = await Hive.openBox<CategoryModel>(CATEGORY_DB_NAME);
    _categoryDb.add(value);
  }

  @override
  Future<List<CategoryModel>> getCategories() async {
    final _categoryDb = await Hive.openBox<CategoryModel>(CATEGORY_DB_NAME);
    return _categoryDb.values.toList();
  }
}
