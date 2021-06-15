import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kalkulator_app/controllers/prime_notifier.dart';
import 'package:provider/provider.dart';

class LastCountPage extends StatelessWidget {
  const LastCountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PrimeNotifier primeNotifier = Provider.of<PrimeNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Last Counter'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: primeNotifier.primeResultList.length != 0
              ? Card(
                  semanticContainer: true,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Consumer<PrimeNotifier>(
                            builder: (_, notifier, __) =>
                                Text('ID : ${notifier.getLast().id}')),
                        Consumer<PrimeNotifier>(builder: (_, notifier, __) {
                          String currentTime = DateFormat('yyyy-MM-dd – kk:mm')
                              .format(notifier.getLast().createdAt);
                          return Text('DateTime : $currentTime');
                        }),
                        Consumer<PrimeNotifier>(
                          builder: (_, notifier, __) =>
                              Text('Result : ${notifier.getLast().result}'),
                        )
                      ],
                    ),
                  ),
                )
              : Text(
                  'No Content',
                  style: TextStyle(fontSize: 50.0),
                ),
        ),
      ),
    );
  }
}
