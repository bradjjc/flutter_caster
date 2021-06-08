import 'package:flutter/material.dart';
import 'package:flutter_jetcaster/provider/provider.dart';
import 'package:flutter_jetcaster/ui/home_bottom/home_discover/home_discover.dart';
import 'package:flutter_jetcaster/ui/home_bottom/home_your_library/home_your_library.dart';
import 'package:provider/provider.dart';

class HomeBottom extends StatefulWidget {
  const HomeBottom({Key key}) : super(key: key);

  @override
  _HomeBottomState createState() => _HomeBottomState();
}

class _HomeBottomState extends State<HomeBottom>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = new TabController(length: 2, vsync: this);
  }

  // @override
  // void dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Added
      initialIndex: 0, //Added
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
            //This is responsible for the background of the tabbar, does the magic
            decoration: BoxDecoration(
                //This is for background color
                color: Colors.white.withOpacity(0.0),
                //This is for bottom border that is needed
                border: Border(
                    bottom: BorderSide(
                  color: Colors.grey,
                  width: 0.8,
                ))),
            child: TabBar(
                labelColor: Colors.white,
                indicatorColor: context
                    .read<CasterProvider>()
                    .colors[context.read<CasterProvider>().onPageChanged],
                controller: _controller,
                tabs: [
                  Tab(text: "Your Library"),
                  Tab(text: "Discover"),
                ])),
        Container(
            height: MediaQuery.of(context).size.height / 2.3,
            child: new TabBarView(
              controller: _controller,
              children: <Widget>[
                HomeYourLibrary(),
                HomeDiscover(),
              ],
            ))
      ]),
    );
  }
}
