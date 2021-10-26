import 'package:pastq/core/services/service_exports.dart';

class ServiceInjector {
  DropDownHelper dropDownHelper = DropDownHelper();
  DatabaseService databaseService = DatabaseService();
  FilePickerHelper filePickerHelper = FilePickerHelper();

  RouterService routerService = RouterService();
  DialogInfoService dialogInfoService = DialogInfoService();
  PersistenceStorageservice persistenceStorageservice =
      PersistenceStorageservice();
  TimerService timerService = TimerService();
  ShareService shareService = ShareService();
  ScreenshotService screenshotService = ScreenshotService();
  UtilityService utilityService = UtilityService();
}

ServiceInjector pastQservice = ServiceInjector();
