import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CasterProvider with ChangeNotifier{

  List<String> url = [
    'https://image.shutterstock.com/image-vector/lp-record-vinyl-disc-cover-260nw-1168701541.jpg',
    'https://image.freepik.com/free-vector/electro-music-album_53876-67225.jpg',
    'https://westernnews.media.clients.ellingtoncms.com/img/photos/2020/12/29/OneRepublic_t715.jpg?529764a1de2bdd0f74a9fb4f856b01a9d617b3e9',
    'https://www.evanericson.com/wp-content/uploads/2015/07/iwontfall_snowlab-768x768.jpg',
    'https://www.evanericson.com/wp-content/uploads/2015/07/samii-1-768x768.jpg'
  ];
  List<String> upDate = [
    'Updateted 5 weeks ago',
    'Updateted 4 weeks ago',
    'Updateted 5 weeks ago',
    'Updateted 3 days ago',
    'Updateted yesterday',
  ];


  List<Color> colors = [
    Color.fromRGBO(233, 140, 137, 1),
    Color.fromRGBO(161, 168, 178, 1),
    Color.fromRGBO(75, 84, 165, 1),
    Color.fromRGBO(142, 134, 240, 1),
    Color.fromRGBO(154, 46, 89, 1),
  ];

  int _onPageChanged = 1;

  bool _onPressed = true;

  Set<int> _isChecked = {};

  Set<int> get isChecked => _isChecked;

  bool get onPressed => _onPressed;

  int get onPageChanged => _onPageChanged;

  void press() {
    _onPressed = !_onPressed;
  }


  set onPageChanged(int value) {
    _onPageChanged = value;
    notifyListeners();
  }
}