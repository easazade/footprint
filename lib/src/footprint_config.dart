
abstract class FootprintConfig {
  void report(e, stacktrace);

  void log(anything);

  void footprint(anything);
}

class DefaultFootprintConfig extends FootprintConfig {
  @override
  void report(e, stacktrace) {
    print(e.toString());
    print(stacktrace.toString());
  }

  @override
  void log(anything) {
    print(anything.toString());
  }

  @override
  void footprint(anything) {
    print(anything.toString());
  }
}
