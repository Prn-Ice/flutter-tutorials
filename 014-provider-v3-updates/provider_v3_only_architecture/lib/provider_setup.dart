// provider_setup.dart

import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:provider_arc/core/models/user.dart';
import 'package:provider_arc/core/services/api.dart';
import 'package:provider_arc/core/services/authentication_service.dart';

List<SingleChildWidget> providers = [
  ...independentServices,
  ...dependentServices,
  ...uiConsumableProviders,
];

List<SingleChildWidget> independentServices = [
  Provider<Api>(
    create: (_) => Api(),
  ),
];

List<SingleChildWidget> dependentServices = [
  ProxyProvider<Api, AuthenticationService>(
    update: (context, api, authenticationService) =>
        AuthenticationService(api: api),
  ),
];

List<SingleChildWidget> uiConsumableProviders = [
  ProxyProvider<AuthenticationService, User>(
    update: (context, authenticationService, user) {
//      print(authenticationService.user);
      return authenticationService.user;
    },
  ),
  /*StreamProvider<User>(
    create: (context) {
      return Provider.of<AuthenticationService>(context, listen: false).user;
    },
  ),*/
];
