import 'dart:convert';

import 'package:flutter/material.dart';

class BannerList extends StatefulWidget {
  @override
  _BannerListState createState() => _BannerListState();
}

class _BannerListState extends State<BannerList> {
  List banner;

   readData() async {
    await DefaultAssetBundle.of(context)
        .loadString("JSON/banner.json")
        .then((s) {
      setState(() {
        banner = json.decode(s);
      });
    });
  }


  @override
  void initState(){
    super.initState();
    readData();

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 10,
            right: 0,
            child: Container(
              height: 170,
              child: PageView.builder(
                  controller: PageController(viewportFraction: 1.0),
                  itemCount: banner == null ? 0 : banner.length,
                  itemBuilder: (_, i) {
                    return Container(
                      height: 170,
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: AssetImage(banner[i]["Image"]),
                          fit: BoxFit.fill,
                        ),
                      ),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
