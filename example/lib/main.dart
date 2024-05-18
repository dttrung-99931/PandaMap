import 'package:flutter/material.dart';
import 'package:panda_map/panda_map.dart';
import 'package:panda_map/panda_map_options.dart';
import 'package:panda_map/panda_map_widget.dart';
import 'package:panda_map/widgets/search_bar/map_seach_button.dart';

Future<void> main() async {
  await PandaMap.init(
    options: const MapOptions(
      mapAPIKey: 'AIzaSyALbPC2ZoNXKr_OTXLxD_wY-348rPXwDw4',
      mapType: PandaMapType.google,
    ),
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
          const Positioned(
            top: 32,
            right: 16,
            child: MapSearchButton(),
          ),
        ],
      ),
    );
  }
}
