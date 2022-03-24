import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:latif_shopping/produk_detail.dart';

final List<String> imgList = ['1', '2', '3'];
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Widget> imageSliders = imgList
      .map((item) => Padding(
            padding: const EdgeInsets.all(20.0),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(45),
                child: Image.asset("assets/images/page1/heading.png")),
          ))
      .toList();
  final CarouselController _controller = CarouselController();
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromRGBO(254, 249, 249, 1),
            title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Container(
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(240, 240, 240, 1),
                    border: Border.all(),
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                constraints: const BoxConstraints(maxWidth: 300),
                child: const TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Cari dengan mengetik barang'),
                ),
              ),
              const Icon(
                Icons.ac_unit_sharp,
                color: Color.fromRGBO(100, 161, 244, 1),
              ),
              const Icon(
                Icons.ac_unit_sharp,
                color: Color.fromRGBO(223, 174, 29, 1),
              ),
              const Icon(
                Icons.ac_unit_sharp,
                color: Color.fromRGBO(255, 72, 90, 1),
              ),
            ]),
          ),
          body: ListView(
            children: [
              Column(
                children: [
                  CarouselSlider(
                    items: imageSliders,
                    carouselController: _controller,
                    options: CarouselOptions(
                        autoPlay: true,
                        enlargeCenterPage: true,
                        aspectRatio: 2.0,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        }),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: imgList.asMap().entries.map((entry) {
                        return GestureDetector(
                          onTap: () => _controller.animateToPage(entry.key),
                          child: Container(
                            width: 50,
                            height: 12.0,
                            margin: const EdgeInsets.symmetric(horizontal: 4.0),
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                    Radius.elliptical(90, 90)),
                                // shape: BoxShape.circle,
                                color: (Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? const Color.fromRGBO(60, 125, 217, 1)
                                        : const Color.fromRGBO(
                                            100, 161, 244, 1))
                                    .withOpacity(
                                        _current == entry.key ? 0.9 : 0.4)),
                          ),
                        );
                      }).toList())
                ],
              ),
              GridView.builder(
                  itemCount: 10,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 8.0 / 10.0, crossAxisCount: 2),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ProdukDetail()));
                      },
                      child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Card(
                              semanticContainer: true,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              clipBehavior: Clip.antiAlias,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                      child: Stack(
                                    children: [
                                      Container(
                                        decoration: const BoxDecoration(
                                          color:
                                              Color.fromRGBO(223, 174, 29, 1),
                                          borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(10),
                                              topRight: Radius.circular(10)),
                                        ),
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .30,
                                        height: 20,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            Icon(
                                              Icons.star,
                                              size: 15,
                                              color: Colors.white,
                                            ),
                                            Text(
                                              '5.0 | 200+ rating',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.white),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/page1/audio1.png'),
                                              fit: BoxFit.fill),
                                        ),
                                      ),
                                    ],
                                  )),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: const [
                                            Text(
                                              "Rp 6.000",
                                              style: TextStyle(
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.w300,
                                                  color: Color.fromRGBO(
                                                      100, 161, 244, 1),
                                                  decoration: TextDecoration
                                                      .lineThrough),
                                            ),
                                            Text("Rp 4500",
                                                style: TextStyle(
                                                    fontSize: 15.0,
                                                    fontWeight: FontWeight.w800,
                                                    color: Color.fromRGBO(
                                                        100, 161, 244, 1))),
                                          ],
                                        ),
                                        Container(
                                          decoration: const BoxDecoration(
                                            color:
                                                Color.fromRGBO(60, 125, 217, 1),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: const [
                                              Padding(
                                                padding: EdgeInsets.all(2.0),
                                                child: Text(
                                                  'Diskon 10%',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.white),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Text(
                                        "Lorem Ipsum",
                                        style: TextStyle(fontSize: 18.0),
                                      )),
                                ],
                              ))),
                    );
                  })
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.task,
                  color: Color.fromRGBO(198, 196, 196, 1),
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.swap_horiz,
                  color: Color.fromRGBO(198, 196, 196, 1),
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Color.fromRGBO(198, 196, 196, 1),
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.assessment,
                  color: Color.fromRGBO(198, 196, 196, 1),
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color: Color.fromRGBO(198, 196, 196, 1),
                ),
                label: 'Home',
              ),
            ],
          )),
    );
  }
}
