import 'package:province_indonesia/data_model.dart';
import 'package:province_indonesia/province_indonesia.dart';

class Testing {
  static int totalProvince = 0;

  static List<DataModel> listProvince = [];
  static List<DataModel> listKabupaten = [];
  static List<DataModel> listKecamatan = [];
  static List<DataModel> listKelurahan = [];

  static Future loadAll() async {
    listProvince = await ProvinceIndonesia.getProvince();
    totalProvince = listProvince.length;

    listProvince.forEach((province) async {
      List<DataModel> tempKabupaten =
          await ProvinceIndonesia.getKabupaten(provinceId: province.id);
      tempKabupaten.forEach((kabupaten) async {
        listKabupaten.add(kabupaten);
        List<DataModel> tempKecamatan =
            await ProvinceIndonesia.getKecamatan(kabupatenId: kabupaten.id);
        tempKecamatan.forEach((kecamatan) async {
          listKecamatan.add(kecamatan);
          List<DataModel> tempKelurahan =
              await ProvinceIndonesia.getKelurahan(kecamatanId: kecamatan.id);
          tempKelurahan.forEach((kelurahan) {
            listKelurahan.add(kelurahan);
          });
        });
      });
    });
  }
}
