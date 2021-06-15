import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:kalkulator_app/model/calc_history_model.dart';

class PrimeNotifier extends ChangeNotifier {
  List<CalcHistory> _primeList = [];

  UnmodifiableListView<CalcHistory> get primeResultList =>
      UnmodifiableListView(_primeList);

  addPrimeResult(CalcHistory calcHistory) {
    print(calcHistory.id);
    _primeList.add(calcHistory);
    notifyListeners();
  }

  removePrimeResult(int index) {
    _primeList.removeWhere((prime) => prime.id == _primeList[index].id);
    notifyListeners();
  }

  getLast() {
    return _primeList.last;
  }

  int getLastId() {
    return _primeList.length == 0 ? 0 : _primeList.last.id;
  }
}
