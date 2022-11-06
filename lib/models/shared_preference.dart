import 'package:shared_preferences/shared_preferences.dart';


class Preferensi {
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();




  // Future<void> simpanPrinterTerpilih(String namaPrinter) async {
  //   final SharedPreferences prefs = await _prefs;
  //   await prefs.setString('printerTerpilih', namaPrinter);
  //   print('Data disimpan :' + namaPrinter);
  // }

  // bacaPrinterTerpilih() async {
  //   final SharedPreferences prefs = await _prefs;
  //   print('AMBIL DATA');
  //   return prefs.getString('printerTerpilih');
    
  // }

  //String get namaPerangkat => _perangkatDipilih;
}
