import 'package:mobile/Data_Layer/Models/user_model.dart';

import 'user_db.dart';

class UserDao {
  final dbProvider = DatabaseProvider.dbProvider;

  Future<int> createUser(User user) async {
    final db = await dbProvider.database;

    var result = db!.insert(userTable, user.toDatabaseJson());
    return result;
  }

  Future<int> updateUserAfterProfileCreated(User user) async {
    final db = await dbProvider.database;
    var result = await db!.update(userTable, user.toDatabaseJson(),
        where: "id =?", whereArgs: [user.id]);
    return result;
  }

  Future<int> deleteUser(int id) async {
    final db = await dbProvider.database;
    var result = await db!.delete(userTable, where: "id = ?", whereArgs: [id]);
    return result;
  }

  Future<User?> getCurrentUser(int id) async {
    final db = await dbProvider.database;
    var result = await db!.query(userTable, where: "id=?", whereArgs: [id]);
    if (result.length > 0) {
      return new User.fromDatabaseJson(result.first);
    } else {
      return null;
    }
  }

  Future<bool> updateProfile() async {
    final db = await dbProvider.database;
    int doit = await db!.rawUpdate('''
    UPDATE userTable
    SET hasProfile = ?
    WHERE id = ?
    ''', [1, 0]);
    if (doit == 1) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> checkIfProfileComplete() async {
    final db = await dbProvider.database;
    try {
      List<Map> res =
          await db!.rawQuery("SELECT * FROM User  WHERE hasProfile=1");
      if (res.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool> checkUser(int id) async {
    final db = await dbProvider.database;
    try {
      List<Map> users =
          await db!.query(userTable, where: 'id = ?', whereArgs: [id]);
      if (users.length > 0) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      return false;
    }
  }
}
