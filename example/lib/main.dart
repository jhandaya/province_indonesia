import 'package:flutter/material.dart';
import 'dart:async';

import 'package:province_indonesia/data_model.dart';
import 'package:province_indonesia/province_indonesia.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  ProvinceIndonesia pi = ProvinceIndonesia();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    // String platformVersion;
    // // Platform messages may fail, so we use a try/catch PlatformException.
    // // We also handle the message potentially returning null.
    // try {
    //   platformVersion =
    //       await ProvinceIndonesia.platformVersion ?? 'Unknown platform version';
    // } on PlatformException {
    //   platformVersion = 'Failed to get platform version.';
    // }

    // // If the widget was removed from the tree while the asynchronous platform
    // // message was in flight, we want to discard the reply rather than calling
    // // setState to update our non-existent appearance.
    // if (!mounted) return;

    // setState(() {
    //   _platformVersion = platformVersion;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Plugin example app'),
          ),
          body: ListView(
            children: [
              Center(
                child: Text('Running on: $_platformVersion\n'),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  FutureBuilder(
                      future: ProvinceIndonesia.getProvince(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData)
                          return ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                DataModel a = snapshot.data[index];
                                var text = Text("${a.id} - ${a.name}");
                                return ListTile(title: text);
                              });
                        else
                          return Container();
                      }),
                  FutureBuilder(
                      future:
                          ProvinceIndonesia.getKabupaten(provinceId: "11"),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData)
                          return ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                DataModel a = snapshot.data[index];
                                var text = Text("${a.id} - ${a.name}");
                                return ListTile(title: text);
                              });
                        else
                          return Container();
                      }),
                  FutureBuilder(
                      future: ProvinceIndonesia.getKecamatan(kabupatenId: "1102"),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData)
                          return ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                DataModel a = snapshot.data[index];
                                var text = Text("${a.id} - ${a.name}");
                                return ListTile(title: text);
                              });
                        else
                          return Container();
                      }),
                  FutureBuilder(
                      future:
                          ProvinceIndonesia.getKelurahan(kecamatanId: "110111"),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData)
                          return ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                DataModel a = snapshot.data[index];
                                var text = Text("${a.id} - ${a.name}");
                                return ListTile(title: text);
                              });
                        else
                          return Container();
                      }),
                ],
              )
            ],
          )),
    );
  }
}
