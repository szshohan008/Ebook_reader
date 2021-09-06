import 'dart:convert';

import 'package:ebook_reader/Colors/colors.dart';
import 'package:flutter/material.dart';

class BooksList extends StatefulWidget {
  @override
  _BooksListState createState() => _BooksListState();
}

class _BooksListState extends State<BooksList> {
  List books;

  readData() async {
    await DefaultAssetBundle.of(context)
        .loadString("JSON/books.json")
        .then((s) {
      setState(() {
        books = json.decode(s);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    readData();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: books==null?0:books.length,
        itemBuilder: (_, i) {
      return Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: cardColor,
              boxShadow: [
                BoxShadow(
                  blurRadius: 2,
                  offset: Offset(0, 0),
                  color: Colors.grey.withOpacity(0.2),
                ),
              ]),
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Container(
                  width: 90,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(books[i]["BookImage"]),
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.star, size: 24, color: starColor),
                        SizedBox(width: 6,),
                        Text(books[i]["rating"], style: TextStyle(
                          color: menuColor2,
                        ),),
                      ],
                    ),
                    Text(books[i]["title"], style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                    Text(books[i]["author"], style: TextStyle(fontSize: 12, color: subTextColor, fontWeight: FontWeight.bold),),
                    Container(
                      width: 50,
                      height: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: menuColor3,
                      ),
                      child: Text("Love", style: TextStyle(fontSize: 15 , color: Colors.white, fontWeight: FontWeight.bold)),
                      alignment: Alignment.center,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
