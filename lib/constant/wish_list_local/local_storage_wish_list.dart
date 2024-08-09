// import 'package:hive/hive.dart';
// import 'package:inews/constant/wish_list_local/base_local_storage_wish_list.dart';
//
// class LocalStorageWishList extends BaseLocalStorageRepositoryWishList {
//   String productName = "wishList_post";
//
//   @override
//   Future<Box> openBox() async {
//     Box box = await Hive.openBox<int>(productName);
//     return box;
//   }
//
//   @override
//   List<int> getWishList(Box box) {
//     return box.values.toList() as List<int>;
//   }
//
//   @override
//   Future<void> addProductToWishList(Box box, int id) async {
//     box.put(id, id);
//   }
//
//   @override
//   Future<void> removeProductToWishList(Box box, int id) async {
//     await box.delete(id);
//   }
//
//   @override
//   Future<void> removePostAll(Box box, List<int> ids) async {
//     await box.deleteAll(ids);
//   }
//
//   @override
//   Future<void> clearWishList(Box box) async {
//     await box.clear();
//   }
// }
