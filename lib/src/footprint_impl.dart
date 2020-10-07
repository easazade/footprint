import 'package:footprint/src/prettifier.dart';
import 'package:footprint/src/private_service.dart';

import 'footprint_config.dart';

class Footprint {
  Footprint._();

  static FootprintConfig _config = DefaultFootprintConfig();
  static FootprintPrettifier _prettifier = DefaultFootprintPrettifier();
  static PrivateService _privateService;

  static set privateService(PrivateService service) {
    _privateService = service;
  }

  static set config(FootprintConfig config) {
    _config = config;
  }

  static set prettifier(FootprintPrettifier prettifier) {
    _prettifier = prettifier;
  }

  static void report(e, stacktrace) {
    _privateService?.addEntry(e.toString() + '\n' + stacktrace.toString());
    _config.report(e, stacktrace);
  }

  static void log(anything) {
    var prettified = _prettifier.prettifyLog(anything.toString());
    _privateService?.addEntry(prettified);
    _config.log(prettified);
  }

  static void footprint(anything) {
    var prettified = _prettifier.prettifyFootprint(anything.toString());
    _privateService?.addEntry(prettified);
    _config.footprint(prettified);
  }

  static Future uploadReportsToPrivateService() async {
    if (_privateService != null) {
      await _privateService.uploadToPrivateService();
    } else {
      throw Exception('private service cannot be null. please add a PrivateService to Footprint first');
    }
  }
}
