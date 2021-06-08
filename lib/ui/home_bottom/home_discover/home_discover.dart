import 'package:flutter/material.dart';
import 'package:flutter_jetcaster/provider/provider.dart';
import 'package:flutter_jetcaster/ui/home_bottom/home_discover/home_discover_slider.dart';
import 'package:provider/provider.dart';

class HomeDiscover extends StatefulWidget {
  const HomeDiscover({Key key}) : super(key: key);

  @override
  _HomeDiscoverState createState() => _HomeDiscoverState();
}

class _HomeDiscoverState extends State<HomeDiscover> {
  int _selectedIndex = 0;

  _onSelected(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    var list = context.read<CasterProvider>();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 0.0),
          child: Container(
            height: 75,
            child: new ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: list.listMusic.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    child: Container(
                      child: Text(
                        '${list.listMusic[index]}',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      margin: const EdgeInsets.all(8.0),
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                        border: Border.all(
                          color: _selectedIndex != null &&
                                  _selectedIndex == index
                              ? list.colors[
                                  context.read<CasterProvider>().onPageChanged]
                              : Colors.white,
                          width: 4.0,
                        ),
                      ),
                    ),
                    onTap: () => _onSelected(index),
                  );
                }),
          ),
        ),
        Container(
          child: HomeDiscoverSlider(),
        ),
        Divider(
          color: Colors.white70,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          '22 - Android II Beta 2,Andoriox,\n article vidos, Traning,blablabla',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text(
                            'News in Australia',
                            style:
                                TextStyle(color: Colors.white70, fontSize: 15),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 0.0),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage('${list.url[3]}'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
