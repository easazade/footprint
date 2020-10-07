import 'dart:io';

import 'package:footprint/footprint.dart';

class PrivateService {
  List<String> _cache = [];
  int maxLogsAndReports;
  Directory _saveDir;
  Future Function(File file) _uploadData;

  PrivateService(this.maxLogsAndReports, this._saveDir, this._uploadData);

  Future uploadToPrivateService() async {
    var t = DateTime.now();
    var reportFileName = 'report' + '${t.hour}-${t.minute}-${t.second}' + '.txt';
    var reportFile = await File(_saveDir.path + Platform.pathSeparator + reportFileName).create(recursive: true);
    String content = '';
    _cache.forEach((element) {
      content = content + element + '\n' + '##############################################################' + '\n';
    });
    reportFile.writeAsString(content);
    await _uploadData(reportFile);
  }

  void addEntry(String entry) {
    if (_cache.length >= maxLogsAndReports) {
      Footprint.log('!! -> Footprint private service cache size is FULL removing old entries');
      _cache.removeAt(0);
    }
    _cache.add(DateTime.now().toString() + '\n' + entry);
  }
}
