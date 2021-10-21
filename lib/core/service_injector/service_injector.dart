import 'package:pastq/core/services/service_exports.dart';

class ServiceInjector {
  DropDownHelper dropDownHelper = DropDownHelper();
  DatabaseService databaseService = DatabaseService();
  FilePickerHelper filePickerHelper = FilePickerHelper();

  RouterService routerService = RouterService();
  DialogInfoService dialogInfoService = DialogInfoService();
  PersistenceStorageservice persistenceStorageservice =
      PersistenceStorageservice();
}

ServiceInjector pastQservice = ServiceInjector();
