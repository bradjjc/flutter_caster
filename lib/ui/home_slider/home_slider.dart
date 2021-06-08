import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_jetcaster/provider/provider.dart';
import 'package:provider/provider.dart';

class HomeSlider extends StatefulWidget {
  const HomeSlider({Key key}) : super(key: key);

  @override
  _HomeSliderState createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: context.read<CasterProvider>().url.asMap().entries.map((url) => buildItems(url)).toList(),
        options: CarouselOptions(
            enableInfiniteScroll: false,
            height: 200,
            aspectRatio: 1,
            viewportFraction: 0.45,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              setState(() {
                context.read<CasterProvider>().onPageChanged = index;
              });
            }

        ));
  }

  Widget buildItems(MapEntry<int, String> url) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            width: 200,
            height: 250,
            child: Stack(
              clipBehavior: Clip.hardEdge,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.network(
                    "${url.value}",
                    width: 200,
                    height: 200,
                  ),
                ),
                Positioned(
                    bottom: 2,
                    right: (url.key == context.read<CasterProvider>().onPageChanged) ? 13 : 20,
                    child: IconButton(
                      icon: Icon(context.read<CasterProvider>().isChecked.contains(url.key) ? Icons.check_circle_sharp : Icons.add_circle),
                      onPressed: () {
                        setState(() {
                          if (context.read<CasterProvider>().isChecked.contains(url.key)) {
                            context.read<CasterProvider>().isChecked.remove(url.key);
                          } else {
                            context.read<CasterProvider>().isChecked.add(url.key);
                          }
                        });
                      },
                      iconSize: (url.key == context.read<CasterProvider>().onPageChanged) ? 35 : 30,
                    ))
              ],
            ),
          ),
        ),
        SizedBox(height: 8.0,),
        Text('${context.read<CasterProvider>().upDate[context.read<CasterProvider>().onPageChanged]}',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.grey,
              fontSize: 16
          ),)
      ],
    );
  }
}
