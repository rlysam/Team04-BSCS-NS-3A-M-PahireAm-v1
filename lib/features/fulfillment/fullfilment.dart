import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter_svg/svg.dart';

class FulfillmentPage extends StatelessWidget {
  const FulfillmentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator TestingF - FRAME
    return Scaffold(
      body: ListView(
        children: [
          Container(
              width: 1440,
              height: 1024,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 1),
              ),
              child: Stack(children: <Widget>[
                Positioned(
                    top: 618,
                    left: 194,
                    child: Container(
                        width: 35,
                        height: 35,
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(255, 255, 255, 1),
                        ),
                        child: Stack(children: <Widget>[
                          Positioned(
                              top: 4.375,
                              left: 2.9166667461395264,
                              child: SizedBox(
                                  width: 27.401975631713867,
                                  height: 26.25,
                                  child: Stack(children: <Widget>[
                                    Positioned(
                                        top: 5.8333330154418945,
                                        left: 4.375,
                                        child: SvgPicture.asset(
                                            'assets/images/vector.svg',
                                            semanticsLabel: 'vector')),
                                    Positioned(
                                        top: 0,
                                        left: 0,
                                        child: SvgPicture.asset(
                                            'assets/images/vector.svg',
                                            semanticsLabel: 'vector')),
                                    Positioned(
                                        top: 26.25,
                                        left: 8.75,
                                        child: SvgPicture.asset(
                                            'assets/images/vector.svg',
                                            semanticsLabel: 'vector')),
                                    Positioned(
                                        top: 26.25,
                                        left: 20.416667938232422,
                                        child: SvgPicture.asset(
                                            'assets/images/vector.svg',
                                            semanticsLabel: 'vector')),
                                  ]))),
                        ]))),
                Positioned(
                    top: 246,
                    left: 194,
                    child: Container(
                        width: 35,
                        height: 35,
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(255, 255, 255, 1),
                        ),
                        child: Stack(children: <Widget>[
                          Positioned(
                              top: 2.9166667461395264,
                              left: 5.833333492279053,
                              child: SizedBox(
                                  width: 23.333332061767578,
                                  height: 29.166669845581055,
                                  child: Stack(children: <Widget>[
                                    Positioned(
                                        top: 7.291666030883789,
                                        left: 7.291666507720947,
                                        child: SvgPicture.asset(
                                            'assets/images/vector.svg',
                                            semanticsLabel: 'vector')),
                                    Positioned(
                                        top: 0,
                                        left: 0,
                                        child: SvgPicture.asset(
                                            'assets/images/vector.svg',
                                            semanticsLabel: 'vector')),
                                  ]))),
                        ]))),
                const Positioned(
                    top: 105,
                    left: 31,
                    child: Text(
                      'Checkout',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontFamily: 'Nunito',
                          fontSize: 50,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1),
                    )),
                const Positioned(
                    top: 248,
                    left: 244,
                    child: Text(
                      'Delivery Address',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontFamily: 'Nunito',
                          fontSize: 25,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1),
                    )),
                const Positioned(
                    top: 621,
                    left: 243,
                    child: Text(
                      'Delivery Information',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontFamily: 'Nunito',
                          fontSize: 25,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1),
                    )),
                const Positioned(
                    top: 686,
                    left: 272,
                    child: Text(
                      'Items',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontFamily: 'Nunito',
                          fontSize: 25,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1),
                    )),
                const Positioned(
                  top: 736,
                  left: 272,
                  child: Text('insert data here'),
                ),
                const Positioned(
                    top: 686,
                    left: 671,
                    child: Text(
                      'Quantity',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontFamily: 'Nunito',
                          fontSize: 25,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1),
                    )),
                const Positioned(
                    top: 686,
                    left: 1120,
                    child: Text(
                      'Price',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontFamily: 'Nunito',
                          fontSize: 25,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1),
                    )),
                const Positioned(
                  top: 337,
                  left: 584,
                  child: Text('insert address here'),
                ),
                Positioned(
                    top: 203,
                    left: 152,
                    child: Container(
                        width: 1135,
                        height: 301,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(45),
                            topRight: Radius.circular(45),
                            bottomLeft: Radius.circular(45),
                            bottomRight: Radius.circular(45),
                          ),
                          border: Border.all(
                            color: const Color.fromRGBO(38, 196, 164, 1),
                            width: 5,
                          ),
                        ))),
                Positioned(
                    top: 587,
                    left: 152,
                    child: Container(
                        width: 1135,
                        height: 332,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(45),
                            topRight: Radius.circular(45),
                            bottomLeft: Radius.circular(45),
                            bottomRight: Radius.circular(45),
                          ),
                          border: Border.all(
                            color: const Color.fromRGBO(38, 196, 164, 1),
                            width: 5,
                          ),
                        ))),
                Positioned(
                    top: 351,
                    left: 974,
                    child: Container(
                        width: 347,
                        height: 194,
                        decoration: const BoxDecoration(),
                        child: Stack(children: <Widget>[
                          Positioned(
                              top: 30,
                              left: 30,
                              child: Container(
                                decoration: const BoxDecoration(),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Container(
                                      decoration: const BoxDecoration(),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Container(
                                            decoration: const BoxDecoration(),
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 10),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                Container(
                                                  decoration: const BoxDecoration(),
                                                  padding: const EdgeInsets.symmetric(
                                                      horizontal: 10, vertical: 10),
                                                  child: Column(
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: <Widget>[
                                                      Container(
                                                        decoration:
                                                            const BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(9),
                                                            topRight:
                                                                Radius.circular(9),
                                                            bottomLeft:
                                                                Radius.circular(9),
                                                            bottomRight:
                                                                Radius.circular(9),
                                                          ),
                                                          boxShadow: [
                                                            BoxShadow(
                                                                color: Color.fromRGBO(
                                                                    0, 0, 0, 0.25),
                                                                offset: Offset(0, 4),
                                                                blurRadius: 4)
                                                          ],
                                                          color: Color.fromRGBO(
                                                              251, 244, 220, 1),
                                                        ),
                                                        padding: const EdgeInsets
                                                                .symmetric(
                                                            horizontal: 10,
                                                            vertical: 10),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: const <Widget>[
                                                            Text(
                                                              'Change Address',
                                                              textAlign:
                                                                  TextAlign.left,
                                                              style: TextStyle(
                                                                  color:
                                                                      Color.fromRGBO(
                                                                          254,
                                                                          167,
                                                                          17,
                                                                          1),
                                                                  fontFamily:
                                                                      'Nunito',
                                                                  fontSize: 25,
                                                                  letterSpacing:
                                                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  height: 1),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ]))),
                Positioned(
                    top: 850,
                    left: 229,
                    child: Transform.rotate(
                      angle: -0.000005008956130975318 * (math.pi / 180),
                      child: const Divider(
                          color: Color.fromRGBO(0, 0, 0, 1), thickness: 1),
                    )),
              ])),
        ],
      ),
    );
  }
}
