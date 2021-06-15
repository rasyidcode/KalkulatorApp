import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:kalkulator_app/controllers/prime_notifier.dart';
import 'package:kalkulator_app/model/calc_history_model.dart';
import 'package:kalkulator_app/page/about_page.dart';
import 'package:kalkulator_app/page/history_list_page.dart';
import 'package:kalkulator_app/page/last_count_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _num1 = TextEditingController();
  final TextEditingController _num2 = TextEditingController();
  final TextEditingController _result = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    PrimeNotifier primeNotifier = Provider.of<PrimeNotifier>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        constraints: BoxConstraints(),
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Kalkulator App',
                      style: TextStyle(fontSize: 32.0),
                    ),
                    SizedBox(
                      height: 32.0,
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(32.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      width: 100.0,
                                      child: TextFormField(
                                        controller: _num1,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          labelText: 'First Num',
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 100.0,
                                      child: TextFormField(
                                        controller: _num2,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          labelText: 'Second Num',
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 16.0),
                              ElevatedButton(
                                onPressed: () {
                                  List<int> primes = List.empty(growable: true);

                                  int a = int.parse(_num1.text);
                                  int b = int.parse(_num2.text);

                                  if (a < b) {
                                    for (int i = a; i < b; i++) {
                                      if (isPrime(i)) primes.add(i);
                                    }
                                  } else {
                                    for (int i = a; i > b; i--) {
                                      if (isPrime(i)) primes.add(i);
                                    }
                                  }

                                  // _num1.clear();
                                  // _num2.clear();

                                  primeNotifier.addPrimeResult(CalcHistory(
                                      primeNotifier.getLastId() + 1,
                                      DateTime.now(),
                                      primes.toString()));

                                  FocusScope.of(context).unfocus();
                                  _result.text = primes.toString();
                                },
                                child: Text('Submit'),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 32.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Result',
                          style: TextStyle(fontSize: 20.0),
                        ),
                        SizedBox(height: 8.0),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
                              border: Border.all(
                                  width: 1.0, color: Colors.white30)),
                          height: 180,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: TextField(
                              maxLines: null,
                              controller: _result,
                              enabled: false,
                              showCursor: false,
                              readOnly: true,
                              keyboardType: TextInputType.multiline,
                              decoration:
                                  InputDecoration(border: InputBorder.none),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.orange),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    HistoryListPage(),
                              ),
                            );
                          },
                          child: Text(
                            'Count History',
                          ),
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.grey),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) => AboutPage(),
                              ),
                            );
                          },
                          child: Text(
                            'About Me',
                          ),
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blueGrey),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    LastCountPage(),
                              ),
                            );
                          },
                          child: Text(
                            'Last Count',
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            )),
      ),
    );
  }

  bool isPrime(int num) {
    if (num == 1) return false;

    for (int i = 2; i < num / 2; i++) {
      if (num % i == 0) return false;
    }

    return true;
  }

  void buttonClick(BuildContext context) {
    PrimeNotifier primeNotifier = Provider.of<PrimeNotifier>(context);
    List<int> primes = List.empty(growable: true);

    int a = int.parse(_num1.text);
    int b = int.parse(_num2.text);

    if (a < b) {
      for (int i = a; i < b; i++) {
        if (isPrime(i)) primes.add(i);
      }
    } else {
      for (int i = a; i > b; i--) {
        if (isPrime(i)) primes.add(i);
      }
    }

    // _num1.clear();
    // _num2.clear();

    // primeNotifier.addPrimeResult(CalcHistory(
    //     primeNotifier.getLastId() + 1, DateTime.now(), primes.toString()));

    FocusScope.of(context).unfocus();
    _result.text = primes.toString();
  }
}
