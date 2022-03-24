import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

final List<String> imgList = ['1', '2', '3'];

class ProdukDetail extends StatefulWidget {
  const ProdukDetail({Key? key}) : super(key: key);

  @override
  _ProdukDetailState createState() => _ProdukDetailState();
}

class _ProdukDetailState extends State<ProdukDetail> {
  final List<Widget> imageSliders = imgList
      .map((item) => Padding(
            padding: const EdgeInsets.all(20.0),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(45),
                child: Image.asset("assets/images/page1/audio1.png")),
          ))
      .toList();
  final CarouselController _controller = CarouselController();
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Color.fromRGBO(100, 161, 244, 1),
                  )),
              backgroundColor: const Color.fromRGBO(254, 249, 249, 1),
              title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'PRODUK DETAIL',
                      style: TextStyle(color: Color.fromRGBO(100, 161, 244, 1)),
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.shopping_bag_rounded,
                          color: Color.fromRGBO(100, 161, 244, 1),
                        ),
                        Icon(
                          Icons.notifications,
                          color: Color.fromRGBO(255, 72, 90, 1),
                        ),
                      ],
                    ),
                  ]),
            ),
            body: Column(
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
                                      : const Color.fromRGBO(100, 161, 244, 1))
                                  .withOpacity(
                                      _current == entry.key ? 0.9 : 0.4)),
                        ),
                      );
                    }).toList()),
                const SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(255, 72, 90, 1),
                            border: Border.all(
                                color: const Color.fromRGBO(255, 72, 90, 1)),
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(85))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Container(
                          decoration: BoxDecoration(
                              // color: const Color.fromRGBO(255, 255, 255, 1),
                              color: Colors.amber,
                              border: Border.all(
                                  color:
                                      const Color.fromRGBO(255, 255, 255, 1)),
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(75))),
                        ),
                      )
                    ],
                  ),
                )
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
            )));
  }
}
