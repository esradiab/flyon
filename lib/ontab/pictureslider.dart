import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PictureSlider extends StatefulWidget {
  int? index;

  PictureSlider(int index) {
    this.index = index;
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PictureSlider(index!);
  }
}

class _PictureSlider extends State<PictureSlider> {
  int? index;

  _PictureSlider(int index) {
    this.index = index;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        width: MediaQuery.of(context).size.width,
        child: FutureBuilder(
            future:
                DefaultAssetBundle.of(context).loadString('json/hotels.json'),
            builder: (context, snapshot) {
              // Decode the JSON
              var data = json.decode(snapshot.data.toString());
              if (data == null) {
                return Center(
                  child: Text("Loading..."),
                );
              } else
                return CarouselSlider.builder(
                  itemCount: data?[index]["photos"].length,
                  itemBuilder: (context, itemIndex, realindex) {
                    int counter=itemIndex+1;
                    int datalength = data?[index]["photos"].length ;
                    final assetimage =
                        AssetImage(data[index]["photos"][itemIndex]);
                    return Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: assetimage, fit: BoxFit.cover)),
                        ),
                        Positioned(
                          bottom: 2,
                          left: 2,
                          child: Container(
                            width: 50,
                            height: 30,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Color(906167043),
                            ),
                            child: Text("$counter / $datalength " , style: TextStyle(
                              color: Colors.white
                            ),)
                          ),
                        )
                      ],
                    );
                  },
                  options: CarouselOptions(
                      height: 250,
                      aspectRatio: 3,
                    viewportFraction: 1,
                  ),
                );
            }));
  }
}
