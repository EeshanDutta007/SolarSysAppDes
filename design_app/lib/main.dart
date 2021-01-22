import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'constants.dart';
import 'data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Design Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gradientEndColor,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [gradientStartColor,gradientEndColor],
            stops: [0.3,0.7],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  children: [
                    Text(
                      "Explore",
                      style: TextStyle(
                        fontSize: 44,
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    DropdownButton(
                      items: [
                        DropdownMenuItem(
                          child: Text(
                            'Solar System',
                            style: TextStyle(
                              fontSize: 24,
                              color: const Color(0x7cdbf1ff),
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                      onChanged: (value) {},
                      icon: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Image.asset("assets/drop_down_icon.png"),
                      ),
                      underline: SizedBox(),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 32),
                height: 500,
                child: Swiper(
                  itemCount: planets.length,
                  layout: SwiperLayout.STACK,
                  itemWidth: MediaQuery.of(context).size.width - 2 * 64,
                  pagination: SwiperPagination(
                    builder: DotSwiperPaginationBuilder(
                      space: 8,
                      activeSize: 20,
                      activeColor: Colors.white,
                    ),
                  ),
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Column(
                          children: [
                            SizedBox(height: 100),
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32.0),
                              ),
                              elevation: 8,
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(32.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 100),
                                    Text(
                                      planets[index].name,
                                      style: TextStyle(
                                        fontSize: 44,
                                        fontWeight: FontWeight.w900,
                                        color: Color(0xff47455f),
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      'Solar System',
                                      style: TextStyle(
                                        fontSize: 23,
                                        fontWeight: FontWeight.w900,
                                        color: primaryTextColor,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                    SizedBox(
                                      height: 32,
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          'Know more',
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: secondaryTextColor,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                        Icon(
                                          Icons.arrow_forward,
                                          color: secondaryTextColor,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Image.asset(planets[index].iconImage),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(36.0),
          ),
          color: navigationColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Image.asset('assets/menu_icon.png'),
              onPressed: () {},
            ),
            IconButton(
              icon: Image.asset('assets/search_icon.png'),
              onPressed: () {},
            ),
            IconButton(
              icon: Image.asset('assets/profile_icon.png'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
