import 'package:share/share.dart';

class ShareService {
  Future<void> shareFile(String filePath,
      {required String title, required String info}) async {
    Share.shareFiles([filePath], subject: title, text: info);
  }
}
