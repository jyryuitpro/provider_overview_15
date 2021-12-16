import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Counter with ChangeNotifier {
  int counter = 0;

  void incremnet() {
    counter++;
    notifyListeners();
  }
}

class Translations {
  final int _value;

  Translations(this._value);

  String get title => 'You clicked $_value times';
}

class ChangeNotifierProviderProxyProvider extends StatefulWidget {
  const ChangeNotifierProviderProxyProvider({Key? key}) : super(key: key);

  @override
  _ChangeNotifierProviderProxyProviderState createState() =>
      _ChangeNotifierProviderProxyProviderState();
}

class _ChangeNotifierProviderProxyProviderState
    extends State<ChangeNotifierProviderProxyProvider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChangeNotifierProvider ProxyProvider'),
      ),
      body: Center(
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider<Counter>(
              create: (_) => Counter(),
            ),
            ProxyProvider<Counter, Translations>(
              update: (_, counter, __) => Translations(counter.counter),
            ),
          ],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShowTranslations(),
              SizedBox(
                height: 20.0,
              ),
              IncreaseButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class ShowTranslations extends StatelessWidget {
  const ShowTranslations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = context.watch<Translations>().title;
    return Text(
      title,
      style: TextStyle(fontSize: 28.0),
    );
  }
}

class IncreaseButton extends StatelessWidget {
  const IncreaseButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => context.read<Counter>().incremnet(),
      child: Text(
        'INCREASE',
        style: TextStyle(fontSize: 20.0),
      ),
    );
  }
}
