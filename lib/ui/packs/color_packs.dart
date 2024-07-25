import 'package:flutter/material.dart';

class ColorPack {
  ColorPack({
    required this.defaultColor,
    required this.colors,
  });

  final Color defaultColor;
  final List<Color> colors;
}

class ColorPacks {
  static final List<ColorPack> allPacks = <ColorPack>[
    blackPack,
    whitePack,
    pinkPack,
    redPack,
    deepOrangePack,
    orangePack,
    amberPack,
    yellowPack,
    limePack,
    lightGreenPack,
    greenPack,
    tealPack,
    cyanPack,
    lightBluePack,
    bluePack,
    indigoPack,
    purplePack,
    deepPurplePack,
    blueGreyPack,
    brownPack,
    greyPack,
  ];

  static final ColorPack blackPack = ColorPack(
    defaultColor: Colors.black,
    colors: <Color>[
      Colors.black,
    ],
  );

  static final ColorPack whitePack = ColorPack(
    defaultColor: Colors.white,
    colors: <Color>[
      Colors.white,
    ],
  );

  static final ColorPack pinkPack = ColorPack(
    defaultColor: Colors.pink,
    colors: <Color>[
      Colors.pink[100]!,
      Colors.pink[200]!,
      Colors.pink[300]!,
      Colors.pink[400]!,
      Colors.pink,
      Colors.pink[600]!,
      Colors.pink[700]!,
      Colors.pink[800]!,
      Colors.pink[900]!,
    ],
  );

  static final ColorPack redPack = ColorPack(
    defaultColor: Colors.red,
    colors: <Color>[
      Colors.red[100]!,
      Colors.red[200]!,
      Colors.red[300]!,
      Colors.red[400]!,
      Colors.red,
      Colors.red[600]!,
      Colors.red[700]!,
      Colors.red[800]!,
      Colors.red[900]!,
    ],
  );

  static final ColorPack deepOrangePack = ColorPack(
    defaultColor: Colors.deepOrange,
    colors: <Color>[
      Colors.deepOrange[100]!,
      Colors.deepOrange[200]!,
      Colors.deepOrange[300]!,
      Colors.deepOrange[400]!,
      Colors.deepOrange,
      Colors.deepOrange[600]!,
      Colors.deepOrange[700]!,
      Colors.deepOrange[800]!,
      Colors.deepOrange[900]!,
    ],
  );

  static final ColorPack orangePack = ColorPack(
    defaultColor: Colors.orange,
    colors: <Color>[
      Colors.orange[100]!,
      Colors.orange[200]!,
      Colors.orange[300]!,
      Colors.orange[400]!,
      Colors.orange,
      Colors.orange[600]!,
      Colors.orange[700]!,
      Colors.orange[800]!,
      Colors.orange[900]!,
    ],
  );

  static final ColorPack amberPack = ColorPack(
    defaultColor: Colors.amber,
    colors: <Color>[
      Colors.amber[100]!,
      Colors.amber[200]!,
      Colors.amber[300]!,
      Colors.amber[400]!,
      Colors.amber,
      Colors.amber[600]!,
      Colors.amber[700]!,
      Colors.amber[800]!,
      Colors.amber[900]!,
    ],
  );

  static final ColorPack yellowPack = ColorPack(
    defaultColor: Colors.yellow,
    colors: <Color>[
      Colors.yellow[100]!,
      Colors.yellow[200]!,
      Colors.yellow[300]!,
      Colors.yellow[400]!,
      Colors.yellow,
      Colors.yellow[600]!,
      Colors.yellow[700]!,
      Colors.yellow[800]!,
      Colors.yellow[900]!,
    ],
  );

  static final ColorPack limePack = ColorPack(
    defaultColor: Colors.lime,
    colors: <Color>[
      Colors.lime[100]!,
      Colors.lime[200]!,
      Colors.lime[300]!,
      Colors.lime[400]!,
      Colors.lime,
      Colors.lime[600]!,
      Colors.lime[700]!,
      Colors.lime[800]!,
      Colors.lime[900]!,
    ],
  );

  static final ColorPack lightGreenPack = ColorPack(
    defaultColor: Colors.lightGreen,
    colors: <Color>[
      Colors.lightGreen[100]!,
      Colors.lightGreen[200]!,
      Colors.lightGreen[300]!,
      Colors.lightGreen[400]!,
      Colors.lightGreen,
      Colors.lightGreen[600]!,
      Colors.lightGreen[700]!,
      Colors.lightGreen[800]!,
      Colors.lightGreen[900]!,
    ],
  );

  static final ColorPack greenPack = ColorPack(
    defaultColor: Colors.green,
    colors: <Color>[
      Colors.green[100]!,
      Colors.green[200]!,
      Colors.green[300]!,
      Colors.green[400]!,
      Colors.green,
      Colors.green[600]!,
      Colors.green[700]!,
      Colors.green[800]!,
      Colors.green[900]!,
    ],
  );

  static final ColorPack tealPack = ColorPack(
    defaultColor: Colors.teal,
    colors: <Color>[
      Colors.teal[100]!,
      Colors.teal[200]!,
      Colors.teal[300]!,
      Colors.teal[400]!,
      Colors.teal,
      Colors.teal[600]!,
      Colors.teal[700]!,
      Colors.teal[800]!,
      Colors.teal[900]!,
    ],
  );

  static final ColorPack cyanPack = ColorPack(
    defaultColor: Colors.cyan,
    colors: <Color>[
      Colors.cyan[100]!,
      Colors.cyan[200]!,
      Colors.cyan[300]!,
      Colors.cyan[400]!,
      Colors.cyan,
      Colors.cyan[600]!,
      Colors.cyan[700]!,
      Colors.cyan[800]!,
      Colors.cyan[900]!,
    ],
  );

  static final ColorPack lightBluePack = ColorPack(
    defaultColor: Colors.lightBlue,
    colors: <Color>[
      Colors.lightBlue[100]!,
      Colors.lightBlue[200]!,
      Colors.lightBlue[300]!,
      Colors.lightBlue[400]!,
      Colors.lightBlue,
      Colors.lightBlue[600]!,
      Colors.lightBlue[700]!,
      Colors.lightBlue[800]!,
      Colors.lightBlue[900]!,
    ],
  );

  static final ColorPack bluePack = ColorPack(
    defaultColor: Colors.blue,
    colors: <Color>[
      Colors.blue[100]!,
      Colors.blue[200]!,
      Colors.blue[300]!,
      Colors.blue[400]!,
      Colors.blue,
      Colors.blue[600]!,
      Colors.blue[700]!,
      Colors.blue[800]!,
      Colors.blue[900]!,
    ],
  );

  static final ColorPack indigoPack = ColorPack(
    defaultColor: Colors.indigo,
    colors: <Color>[
      Colors.indigo[100]!,
      Colors.indigo[200]!,
      Colors.indigo[300]!,
      Colors.indigo[400]!,
      Colors.indigo,
      Colors.indigo[600]!,
      Colors.indigo[700]!,
      Colors.indigo[800]!,
      Colors.indigo[900]!,
    ],
  );

  static final ColorPack purplePack = ColorPack(
    defaultColor: Colors.purple,
    colors: <Color>[
      Colors.purple[100]!,
      Colors.purple[200]!,
      Colors.purple[300]!,
      Colors.purple[400]!,
      Colors.purple,
      Colors.purple[600]!,
      Colors.purple[700]!,
      Colors.purple[800]!,
      Colors.purple[900]!,
    ],
  );

  static final ColorPack deepPurplePack = ColorPack(
    defaultColor: Colors.deepPurple,
    colors: <Color>[
      Colors.deepPurple[100]!,
      Colors.deepPurple[200]!,
      Colors.deepPurple[300]!,
      Colors.deepPurple[400]!,
      Colors.deepPurple,
      Colors.deepPurple[600]!,
      Colors.deepPurple[700]!,
      Colors.deepPurple[800]!,
      Colors.deepPurple[900]!,
    ],
  );

  static final ColorPack blueGreyPack = ColorPack(
    defaultColor: Colors.blueGrey,
    colors: <Color>[
      Colors.blueGrey[100]!,
      Colors.blueGrey[200]!,
      Colors.blueGrey[300]!,
      Colors.blueGrey[400]!,
      Colors.blueGrey,
      Colors.blueGrey[600]!,
      Colors.blueGrey[700]!,
      Colors.blueGrey[800]!,
      Colors.blueGrey[900]!,
    ],
  );

  static final ColorPack brownPack = ColorPack(
    defaultColor: Colors.brown,
    colors: <Color>[
      Colors.brown[100]!,
      Colors.brown[200]!,
      Colors.brown[300]!,
      Colors.brown[400]!,
      Colors.brown,
      Colors.brown[600]!,
      Colors.brown[700]!,
      Colors.brown[800]!,
      Colors.brown[900]!,
    ],
  );

  static final ColorPack greyPack = ColorPack(
    defaultColor: Colors.grey,
    colors: <Color>[
      Colors.grey[100]!,
      Colors.grey[200]!,
      Colors.grey[300]!,
      Colors.grey[400]!,
      Colors.grey,
      Colors.grey[600]!,
      Colors.grey[700]!,
      Colors.grey[800]!,
      Colors.grey[900]!,
    ],
  );
}
