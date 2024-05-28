import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:panda_map/core/models/map_place.dart';
import 'package:panda_map/panda_map.dart';
import 'package:panda_map/panda_map_options.dart';
import 'package:panda_map/panda_map_widget.dart';
import 'package:panda_map/widgets/search_bar/map_seach_button.dart';

Future<void> main() async {
  await PandaMap.init(
    // Here map
    options: MapOptions(
      mapAPIKey: 'bb6rs_Rbb7Vz0qOXSaF_CnVL7Z3rJ53N4uJ8-fUjEM-TBSGPU6hUsWxAocMuZ1cB57oJ_v8QaXpdWEmKVCgNFg',
      mapAPIKeyId: 'GWunhRPgdFdBJcKsfrCaqg',
      mapType: PandaMapType.heremap,
    ),

    // Google map
    // options: MapOptions(
    //   mapAPIKey: 'AIzaSyALbPC2ZoNXKr_OTXLxD_wY-348rPXwDw4',
    //   mapType: PandaMapType.google,
    // ),

    // MapBox
    // options: MapOptions(
    //   mapAPIKey: '', // public map box key
    //   mapType: PandaMapType.mapBox,
    // ),
  );
  runApp(const PandaMapDemoApp());
}

class PandaMapDemoApp extends StatelessWidget {
  const PandaMapDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      debugShowCheckedModeBanner: false,
      home: const MapScreen(title: 'Flutter Demo Home Page'),
    );
  }
}

class MapScreen extends StatefulWidget {
  const MapScreen({super.key, required this.title});

  final String title;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: PandaMapWidget(),
          ),
          Positioned(
            top: 32,
            right: 16,
            child: MapSearchButton(
              onSelected: (MapPlace place) {
                log(place.location.lat.toString());
              },
            ),
          ),
        ],
      ),
    );
  }
}
