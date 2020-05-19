import 'package:get_it/get_it.dart';
import 'package:provider_architecture/core/services/api.dart';
import 'package:provider_architecture/core/services/authentication_service.dart';
import 'package:provider_architecture/core/services/posts_service.dart';
import 'package:provider_architecture/core/viewmodels/comments_model.dart';
import 'package:provider_architecture/core/viewmodels/home_model.dart';
import 'package:provider_architecture/core/viewmodels/like_button_model.dart';
import 'package:provider_architecture/core/viewmodels/login_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => PostsService());
  locator.registerLazySingleton(() => Api());

  locator.registerLazySingleton(() => LoginModel());
  locator.registerFactory(() => HomeModel());
  locator.registerFactory(() => LikeButtonModel());
  locator.registerFactory(() => CommentsModel());
}
