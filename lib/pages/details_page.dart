import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsPage extends StatefulWidget {
  final String newsImage,
      newsTitle,
      newsDate,
      author,
      description,
      content,
      source;

  const DetailsPage(
      {required this.newsImage,
      required this.newsTitle,
      required this.author,
      required this.newsDate,
      required this.source,
      required this.description,
      required this.content,
      super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width * 1;
    final height = MediaQuery.sizeOf(context).height * 1;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Image.network(widget.newsImage),
          Container(
            alignment: Alignment.center,
            width: width,
            height: height * 0.05,
            decoration: const BoxDecoration(boxShadow: [
              BoxShadow(color: Colors.white, spreadRadius: 2, blurRadius: 2)
            ]),
            child: Text(
              widget.newsTitle,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            widget.content,
            style:
                GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
