import 'package:footprint/src/prettifier.dart';

import 'footprint_config.dart';

class Footprint {
  Footprint._();

  static FootprintConfig _config = DefaultFootprintConfig();
  static FootprintPrettifier _prettifier = DefaultFootprintPrettifier();

  set config(FootprintConfig config) {
    _config = config;
  }

  set prettifier(FootprintPrettifier prettifier) {
    _prettifier = prettifier;
  }

  static void report(e, stacktrace) {
    _config.report(e, stacktrace);
  }

  static void log(anything) {
    _config.log(_prettifier.prettifyLog(anything));
  }

  static void footprint(anything) {
    _config.footprint(_prettifier.prettifyFootprint(anything));
  }
}
