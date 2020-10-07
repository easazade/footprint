abstract class FootprintPrettifier {
  dynamic prettifyLog(anything);

  dynamic prettifyFootprint(anything);
}

class DefaultFootprintPrettifier extends FootprintPrettifier {
  @override
  dynamic prettifyFootprint(anything) {
    return anything.toString();
  }

  @override
  dynamic prettifyLog(anything) {
    return anything.toString();
  }
}
