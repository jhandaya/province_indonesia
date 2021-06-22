import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import 'testing.dart';

void main() async {
  const MethodChannel channel = MethodChannel('province_indonesia');
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('Total Province, Kabupatan, Kecamatan, Kelurahan in indonesia',
      () async {
    await Testing.loadAll().then((value) {
      print('Province: $Testing.totalProvince');
      print('Kabupaten : ${Testing.listKabupaten.length}');
    });

    //expect(totalKabupaten, 514);
    //expect(totalKecamatan, 7094); // as ada per 2017
    //expect(totalKelurahan, 83931);
  });
}
