
abstract class FootprintConfig {
  void report(e, stacktrace);

  void log(anything);

  void footprint(anything);
}

class DefaultFootprintConfig extends FootprintConfig {
  @override
  void report(e, stacktrace) {
    print(e);
    print(stacktrace);
  }

  @override
  void log(anything) {
    print(anything);
  }

  @override
  void footprint(anything) {
    print(anything);
  }
}
