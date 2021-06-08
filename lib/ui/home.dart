import 'package:flutter/material.dart';
import 'package:flutter_jetcaster/provider/provider.dart';
import 'package:flutter_jetcaster/ui/appbar_ui/appbar_ui.dart';
import 'package:flutter_jetcaster/ui/home_bottom/home_bottom.dart';
import 'package:flutter_jetcaster/ui/home_slider/home_slider.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CasterProvider>(
      builder: (BuildContext context, value, Widget child) => AnimatedContainer(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              value.colors[value.onPageChanged],
              Colors.black,
            ])),
        duration: Duration(milliseconds: 800),
        child: Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Color(0x00000000),
            elevation: 0,
            title: AppbarUi(),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 150,
                ),
                HomeSlider(),
                SizedBox(
                  height: 32.0,
                ),
                Stack(
                  children: [
                    HomeBottom(),
                    Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Divider(color: Colors.grey))
                  ],
                ),
                // MyDiscovers(),
                // DiscoverAlbumDetail(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
