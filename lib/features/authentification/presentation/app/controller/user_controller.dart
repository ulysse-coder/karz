
import 'package:get/get.dart';
import 'package:ulysse_app/features/authentification/data/models/user_model.dart';

class UserController extends GetxController {

  final Rx<UserModel> _currentUser = const UserModel.empty().obs;

  UserModel get currentUser => _currentUser.value;
  set currentUser(value) => _currentUser.value = value;

}