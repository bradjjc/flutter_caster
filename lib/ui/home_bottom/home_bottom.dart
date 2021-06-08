import 'package:flutter/material.dart';
import 'package:flutter_jetcaster/provider/provider.dart';
import 'package:provider/provider.dart';

class HomeBottom extends StatefulWidget {
  const HomeBottom({Key key}) : super(key: key);

  @override
  _HomeBottomState createState() => _HomeBottomState();
}

class _HomeBottomState extends State<HomeBottom> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TextButton(
          onPressed: () {
            setState(() {
              context.read<CasterProvider>().press();
            });
          },
          child: Column(
            children: [
              Text('Your library',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),),
              SizedBox(height: 8.0,),
              Container(
                color: context.read<CasterProvider>().onPressed
                    ? context.read<CasterProvider>().colors[context.read<CasterProvider>().onPageChanged]
                    : Colors.transparent,
                height: 5,
                width: 150,
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(0.5)
                // ),
              )
            ],
          ),
        ),
        TextButton(
          onPressed: () {
            setState(() {
              context.read<CasterProvider>().press();
            });
          },
          child: Column(
            children: [
              Text('Discover',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),),
              SizedBox(height: 8.0,),
              Container(
                color: context.read<CasterProvider>().onPressed
                    ? Colors.transparent
                    : context.read<CasterProvider>().colors[context.read<CasterProvider>().onPageChanged],
                height: 5,
                width: 150,
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(0.5)
                // ),
              )
            ],
          ),
        ),
      ],
    );
  }
}