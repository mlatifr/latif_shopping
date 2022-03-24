import 'package:flutter/material.dart';

class ProdukDetail extends StatefulWidget {
  const ProdukDetail({Key? key}) : super(key: key);

  @override
  _ProdukDetailState createState() => _ProdukDetailState();
}

class _ProdukDetailState extends State<ProdukDetail> {
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
                          Icons.ac_unit_sharp,
                          color: Color.fromRGBO(255, 72, 90, 1),
                        ),
                        Icon(
                          Icons.ac_unit_sharp,
                          color: Color.fromRGBO(223, 174, 29, 1),
                        ),
                      ],
                    ),
                  ]),
            ),
            body: Stack(
              children: const [Positioned(child: Text('body'))],
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
                    Icons.repeat,
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
                    Icons.align_vertical_bottom_sharp,
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
