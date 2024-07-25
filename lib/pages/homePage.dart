// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:intl/intl.dart';
import 'package:newss_app/model/fetchData.dart';
import 'package:newss_app/pages/details_page.dart';
import 'package:newss_app/api/viewNews.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ViewNews viewNews = ViewNews();
  // final format = DateFormat('MMM DD YYY');
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width * 1;
    final height = MediaQuery.sizeOf(context).height * 1;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'BBC News',
            style:
                GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w700),
          ),
          centerTitle: true,
        ),
        body: ListView(children: [
          SizedBox(
            // if sizedbox  does not work then replace it with container
            width: width,
            height: height,
            child: FutureBuilder<FetchData>(
                future: viewNews.fetchDataApi(),
                builder: (BuildContext context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: SpinKitFadingCircle(
                        color: Colors.black,
                        size: 44,
                      ),
                    );
                  } else {
                    return ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data!.articles!.length,
                        itemBuilder: (context, index) {
                          return SizedBox(
                              // height: height * 0.55,
                              width: width,
                              child: Column(
                                children: [
                                  GestureDetector(
                                      onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => DetailsPage(
                                                    newsImage: snapshot
                                                        .data!
                                                        .articles![index]
                                                        .urlToImage
                                                        .toString(),
                                                    author: snapshot.data!
                                                        .articles![index].author
                                                        .toString(),
                                                    newsTitle: snapshot.data!
                                                        .articles![index].title
                                                        .toString(),
                                                    source: snapshot.data!
                                                        .articles![index].source
                                                        .toString(),
                                                    description: snapshot
                                                        .data!
                                                        .articles![index]
                                                        .description
                                                        .toString(),
                                                    content: snapshot
                                                        .data!
                                                        .articles![index]
                                                        .content
                                                        .toString(),
                                                    newsDate: snapshot
                                                        .data!
                                                        .articles![index]
                                                        .publishedAt
                                                        .toString(),
                                                  ))),
                                      child: Stack(
                                        children: [
                                          Image.network(
                                            snapshot.data!.articles![index]
                                                .urlToImage
                                                .toString(),
                                          ),
                                          Positioned(
                                              left: 0,
                                              right: 0,
                                              bottom: 0,
                                              child: Container(
                                                height: 50,
                                                decoration: const BoxDecoration(
                                                    color: Color.fromARGB(
                                                        66, 34, 33, 33)),
                                                child: Text(
                                                    snapshot.data!
                                                        .articles![index].title
                                                        .toString(),
                                                    maxLines: 2,
                                                    style:
                                                        GoogleFonts.creteRound(
                                                            fontSize: 18,
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                              )),
                                        ],
                                      )),
                                ],
                              ));
                        });
                  }
                }),
          )
        ]));
  }
}
