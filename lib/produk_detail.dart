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
            body: ListView(
              shrinkWrap: true,
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
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 100,
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(255, 72, 90, 1),
                              border: Border.all(
                                  color: const Color.fromRGBO(255, 72, 90, 1)),
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(85))),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 15.0,
                          ),
                          child: Container(
                            constraints: BoxConstraints(
                                minHeight:
                                    MediaQuery.of(context).size.height * .50),
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(255, 255, 255, 1),
                                // color: Colors.amber,
                                border: Border.all(
                                    color:
                                        const Color.fromRGBO(255, 255, 255, 1)),
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(75))),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 35.0, top: 25, right: 25),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text('Tas Gucci'),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                            decoration: const BoxDecoration(
                                              color: Color.fromRGBO(
                                                  223, 174, 29, 1),
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
                                                    'Barang Bekas',
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
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                            decoration: const BoxDecoration(
                                              color: Color.fromRGBO(
                                                  60, 125, 217, 1),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: const [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 2.0),
                                                  child: Text(
                                                    'Stok 100',
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
                                          const SizedBox(
                                            width: 10,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: const [
                                          Text(
                                            "Rp 126.000",
                                            style: TextStyle(
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.w300,
                                                color: Color.fromRGBO(
                                                    100, 161, 244, 1),
                                                decoration:
                                                    TextDecoration.lineThrough),
                                          ),
                                          Text(
                                            "Rp 100.500",
                                            style: TextStyle(
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.w800,
                                              color: Color.fromRGBO(
                                                  100, 161, 244, 1),
                                            ),
                                          ),
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
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.white),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Divider(),
                                  const Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Text('Vendor')),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: const [
                                            CircleAvatar(
                                              backgroundImage: AssetImage(
                                                  ("assets/images/produk_detail/eiger.png")),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text('Eiger Store')
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              decoration: const BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.only(
                                                    bottomRight:
                                                        Radius.circular(10),
                                                    topRight:
                                                        Radius.circular(10)),
                                              ),
                                              height: 20,
                                              child: Row(
                                                children: const [
                                                  Icon(Icons.star,
                                                      size: 18,
                                                      color: Color.fromRGBO(
                                                          60, 125, 217, 1)),
                                                  Text(
                                                    '5.0 | 200 terjual',
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: Color.fromRGBO(
                                                            60, 125, 217, 1)),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Text('Deskripsi')),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    'Deskripsi In publishing and graphic design,'
                                    ' Lorem ipsum is a placeholder text commonly '
                                    'used to demonstrate the visual form of a '
                                    'document or a typeface without relying on '
                                    'meaningful content. Lorem ipsum may be used'
                                    ' as a placeholder before final copy is'
                                    ' available.',
                                    textAlign: TextAlign.justify,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Text('Ulasan dan Penilaian')),
                                  const Divider(),
                                  for (var i = 0; i < 5; i++)
                                    Card(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          ListTile(
                                            title: Row(
                                              children: const [
                                                CircleAvatar(
                                                  backgroundImage: AssetImage(
                                                      ("assets/images/produk_detail/eiger.png")),
                                                ),
                                                Text(
                                                    'The Enchanted Nightingale'),
                                              ],
                                            ),
                                            subtitle: const Text(
                                                'Music by Julie Gable. Lyrics by Sidney Stein.'),
                                            trailing: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: const [
                                                Icon(Icons.star,
                                                    size: 18,
                                                    color: Color.fromRGBO(
                                                        60, 125, 217, 1)),
                                                Text(
                                                  '5.0',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Color.fromRGBO(
                                                          60, 125, 217, 1)),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
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
