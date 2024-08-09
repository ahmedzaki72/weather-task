// import 'package:hive/hive.dart';
// import 'package:inews/constant/my_follow_local/base_local_storage_my_local.dart';
//
// class LocalStorageMyFollow extends BaseLocalStorageRepositoryMyFollow {
//   String productName = "my_follow";
//
//   @override
//   Future<Box> openBox() async {
//     Box box = await Hive.openBox<int>(productName);
//     return box;
//   }
//
//   @override
//   List<int> getMyFollow(Box box) {
//     return box.values.toList() as List<int>;
//   }
//
//   @override
//   Future<void> addProductToMyFollow(Box box, int id) async {
//     box.put(id, id);
//   }
//
//   @override
//   Future<void> removeAllMyFollow(Box box, List<int> ids) async {
//     await box.deleteAll(ids);
//   }
//
//   @override
//   Future<void> removeProductToMyFollow(Box box, int id) async {
//     await box.delete(id);
//   }
//
//   @override
//   Future<void> clearMyFollow(Box box) async {
//     await box.clear();
//   }
// }
