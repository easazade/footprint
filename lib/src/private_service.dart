import 'dart:io';


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
    for(var i=0;i<_cache.length;i++){
      var element = _cache[i];
      content = content + '############################### $i ###############################' + '\n' + element + '\n';
    }
    await reportFile.writeAsString(content);
    await _uploadData(reportFile);
  }

  void addEntry(String entry) {
    if (_cache.length >= maxLogsAndReports) {
      _cache.removeAt(0);
    }
    _cache.add(DateTime.now().toString() + '\n' + entry);
  }
}
