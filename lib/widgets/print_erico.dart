import 'dart:async';
import 'dart:convert';
import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:flutter/material.dart';
import 'package:thermal_printer/theme/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TextToPrint extends StatefulWidget {
  const TextToPrint({super.key});

  @override
  State<TextToPrint> createState() => _TextToPrintState();
}

class _TextToPrintState extends State<TextToPrint> {
  // TextField controller
  late TextEditingController textC = TextEditingController();

  // ** Shared Preference **
  //late String namaPrinter;
  Future<void> setPreferences(BluetoothDevice device) async {
    final pref = await SharedPreferences.getInstance();
    if (pref.containsKey('data')) {
      pref.clear(); // jika ada isisnya di clear dulu
    }
    pref.setString('data', json.encode(device.toMap()));
  }

  Future getPreferences() async {
    final pref = await SharedPreferences.getInstance();
    if (pref.containsKey('data')) {
      final myData = json.decode(pref.getString('data') ?? 'Data Null');
      var map = json.decode(myData['data']);
      perangkatDipilih = BluetoothDevice.fromMap(map);
      print('Data berhasil diambil' + perangkatDipilih.toString());
    } else print('Gagagl ambil data');
  }

  // simpanPrinter() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  //   setDevice(BluetoothDevice device) async{
  //     final SharedPreferences prefs = await _prefs;
  //     prefs.setString("bluetooth", jsonEncode(device.toMap()));
  //   }

  //   BluetoothDevice? getDevice() {
  //     String? device = prefs.getString("bluetooth");
  //     if (device != null && device.length > 0) {
  //       var map = jsonDecode(device);
  //       BluetoothDevice bluetoothDevice = new BluetoothDevice.fromMap(map);
  //       return bluetoothDevice;
  //     } else {
  //       return null;
  //     }
  //   }
  // }

  // dispose controller TextFiled
  @override
  void dispose() {
    textC.dispose();
    super.dispose();
  }

  List<String> data = [
    "panjul",
    "cupia",
    "habib",
    "ipeh",
  ];

  // inisialisati Bluetooh Thermal Printer
  List<BluetoothDevice> perangkat = [];
  BluetoothDevice? perangkatDipilih;
  BlueThermalPrinter printer = BlueThermalPrinter.instance;
  bool tersambung = false;

  // dijalankan saat aplikasi dibuka
  @override
  void initState() {
    super.initState();
    getDevices();
    getPreferences();
  }

  // ambil device buletooth yang terdaftar di hape
  void getDevices() async {
    try {
      perangkat = await printer.getBondedDevices();
      //print(perangkat);
      setState(() {});
    } catch (e) {
      //print("Tidak ada perangkat terdaftar");
      return;
    }
  }

  // *** WIDGET Printer ***
  @override
  Widget build(BuildContext context) {
    print('BUILD');
    return FutureBuilder(
      future: getPreferences(),
      builder: (context, _) => Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Printer :',
              style: textLabel,
            ),
            const SizedBox(height: 5),
            DropdownButtonFormField(
              value: perangkatDipilih,
              onChanged: ((perangkat) {
                perangkatDipilih = perangkat;
                setPreferences(perangkatDipilih!);
                setState(() {
                  
                });
                print('Printer dipilih di dropdown');
              }),
              items: perangkat
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(e.name!),
                      ))
                  .toList(),
              dropdownColor: colorInputFiled,
              icon: Icon(
                Icons.arrow_drop_down_circle,
                color: colorBackgroundDark,
              ),
              decoration: decorDropDown,
            ),
            const SizedBox(height: 20),
            Text(
              'Text to print :',
              style: textLabel,
            ),
            const SizedBox(height: 5),
            TextField(
              controller: textC,
              maxLines: 10,
              minLines: 10,
              textAlign: TextAlign.center,
              style: textInput,
              decoration: decorTextField,
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: buttonDecoration,
              child: TextButton(
                  onPressed: () async {
                    printer.connect(perangkatDipilih!);  // CONNECT PRINTER
                    await Future.delayed(const Duration(seconds: 1));
                    //printer.printNewLine();
                    setState(() {
                      tersambung = true;
                    });
                    printer.printCustom(textC.text, 1, 1);

                  },
                  style: buttonStyle,
                  child: Text(
                    'Print Text',
                    style: textLabel,
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: buttonDecoration,
              child: TextButton(
                  onPressed: () {
                    printer.disconnect();
                    setState(() {
                      tersambung = false;
                      //dataPrinter = sharedPref.bacaPrinterTerpilih();
                    });
                  },
                  style: buttonStyle,
                  child: Text(
                    'Disconnect',
                    style: textLabel,
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                tersambung
                    ? const Icon(
                        Icons.bolt,
                        color: Colors.green,
                      )
                    : const Icon(
                        Icons.bolt,
                        color: Colors.red,
                      ),
                Text(perangkatDipilih.toString(), style: textLabel,),
              ],
            )
          ],
        ),
      ),
    );
  }
}
