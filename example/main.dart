
import 'package:footprint/src/footprint_impl.dart';

void main() {
  try{
    throw OutOfMemoryError();
  }catch(e,stacktrace){
    Footprint.report(e, stacktrace);
  }
  Footprint.log('logging');
  Footprint.footprint('footprint');
}