import 'package:flutter/material.dart';

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
          body: Column(
            children: [
              Card(
                child: Image.asset("assets/images/page1/heading.png"),
              ),
              Expanded(
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 8.0 / 10.0, crossAxisCount: 2),
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
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
                                      child: Container(
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/page1/audio1.png'),
                                          fit: BoxFit.fill),
                                    ),
                                  )),
                                  const Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: const Text(
                                        "Name",
                                        style: TextStyle(fontSize: 18.0),
                                      )),
                                ],
                              )));
                    }),
              )
            ],
          )),
    );
  }
}
