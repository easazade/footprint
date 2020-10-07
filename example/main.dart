import 'dart:io';

import 'package:footprint/src/footprint_impl.dart';
import 'package:footprint/src/private_service.dart';

void main() async {
  var saveDir = Directory('C:' + Platform.pathSeparator + 'Footprint');
  var uploadDir = Directory('C:' +
      Platform.pathSeparator +
      'Footprint' +
      Platform.pathSeparator +
      'Uploads');
  Footprint.privateService = PrivateService(8, saveDir, (file) async {
    var fileName = (file.path.split(Platform.pathSeparator).last);
    var uploadFile =
        await File(uploadDir.path + Platform.pathSeparator + fileName)
            .create(recursive: true);
    String content = await file.readAsString();
    await uploadFile.writeAsString(content);
  });

  try {
    throw OutOfMemoryError();
  } catch (e, stacktrace) {
    Footprint.report(e, stacktrace);
  }
  Footprint.log('logging');
  Footprint.footprint('footprint');

  for (var i = 0; i < 100; i++) {
    Footprint.log('logging $i');
    await Future.delayed(const Duration(milliseconds: 500));
  }

  await Footprint.uploadReportsToPrivateService();
}
