import 'package:flutter/foundation.dart';
import 'package:provider_arc/core/services/authentication_service.dart';
import 'package:provider_arc/core/viewmodels/base_model.dart';

class LoginViewModel extends BaseModel {
  LoginViewModel({@required AuthenticationService authenticationService})
      : _authenticationService = authenticationService;

  final AuthenticationService _authenticationService;

  Future<bool> login(String userIdText) async {
    setBusy(true);
    var userId = int.tryParse(userIdText);
    var success = await _authenticationService.login(userId);
    setBusy(false);
    return success;
  }
}
