import 'package:pastq/core/services/service_exports.dart';

class ServiceInjector {
  DropDownHelper dropDownHelper = DropDownHelper();
  DatabaseService databaseService = DatabaseService();
  FilePickerHelper filePickerHelper = FilePickerHelper();

  RouterService routerService = RouterService();
}

ServiceInjector pastQservice = ServiceInjector();
