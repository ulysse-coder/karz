
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ulysse_app/core/utilities/enum.dart';
import 'package:ulysse_app/features/authentification/data/models/conductor_model.dart';
import 'package:ulysse_app/features/authentification/data/models/security_model.dart';

class UserController extends GetxController {

  final Rx<ConductorModel> _currentConductor = ConductorModel.empty().obs;
  final Rx<SecurityModel> _currentSecurity = const SecurityModel.empty().obs;
  final Rx<UserRole> _currentUserRole = UserRole.defaultRole.obs;

  @override
  void onInit() async {
    super.onInit();
    _currentUserRole.value = await getCurrentUserRole();
    debugPrint("====== current role: ${_currentUserRole.value}");
  }

  ConductorModel get currentConductor => _currentConductor.value;
  set currentConductor(ConductorModel value) => _currentConductor.value = value;

  SecurityModel get currentSecurity => _currentSecurity.value;
  set currentSecurity(SecurityModel value) => _currentSecurity.value = value;

  UserRole get currentUserRole => _currentUserRole.value;
  set currentUserRole(UserRole value) => _currentUserRole.value = value;


  void saveCurrentUserRole() async {
    final sp = await SharedPreferences.getInstance();

    final role = switch (_currentUserRole.value) {
      UserRole.conducteur => "conducteur",
      UserRole.gardien => "gardien",
      UserRole.defaultRole => "defaultRole",
    };

    await sp.setString("role", role);
  }

  Future<UserRole> getCurrentUserRole() async {
    final sp = await SharedPreferences.getInstance();

    final userRole = sp.getString('role');

    if(userRole == null) return UserRole.defaultRole;
    if(userRole == 'conducteur') return UserRole.conducteur;
    if(userRole == 'gardien') return UserRole.gardien;

    return UserRole.defaultRole;
  }
}