import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kalkulator_app/controllers/prime_notifier.dart';
import 'package:provider/provider.dart';

class HistoryListPage extends StatelessWidget {
  const HistoryListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PrimeNotifier primeNotifier = Provider.of<PrimeNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('History Page'),
      ),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: primeNotifier.primeResultList.length != 0
            ? ListView.builder(
                itemCount: primeNotifier.primeResultList.length,
                itemBuilder: (BuildContext context, int index) => Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Consumer<PrimeNotifier>(
                                  builder: (_, notifier, __) => Text(
                                      'ID : ${notifier.primeResultList[index].id}')),
                              Consumer<PrimeNotifier>(
                                  builder: (_, notifier, __) {
                                String currentTime =
                                    DateFormat('yyyy-MM-dd – kk:mm').format(
                                        notifier
                                            .primeResultList[index].createdAt);
                                return Text('DateTime : $currentTime');
                              }),
                              Consumer<PrimeNotifier>(
                                builder: (_, notifier, __) => Text(
                                    'Result : ${notifier.primeResultList[index].result}'),
                              )
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            primeNotifier.removePrimeResult(index);
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            : Center(
                child: Text(
                  'No Content',
                  style: TextStyle(fontSize: 50.0),
                ),
              ),
      ),
    );
  }
}
