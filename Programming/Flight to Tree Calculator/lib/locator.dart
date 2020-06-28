import 'package:get_it/get_it.dart';
import 'package:sustainibility_project/providers/crud_models/admin_crud_model.dart';
import 'package:sustainibility_project/providers/crud_models/profile_crud_model.dart';

import 'package:sustainibility_project/services/admin_api.dart';
import 'package:sustainibility_project/services/profile_api.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => ProfileApi('profile_entries'));
  locator.registerLazySingleton(() => AdminApi('admin_entries'));
  locator.registerLazySingleton(() => ProfileCRUDModel());
  locator.registerLazySingleton(() => AdminCRUDModel());
}
