import 'package:flutter/material.dart';
import 'package:kalkulator_app/app.dart';
import 'package:kalkulator_app/controllers/prime_notifier.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => PrimeNotifier(),
          ),
        ],
        child: KalkulatorApp(),
      ),
    );
