import 'package:flutter/material.dart';
import 'package:provider_overview_15/pages/changenotifier_changenotifierproxyprovider.dart';
import 'package:provider_overview_15/pages/changenotifierprovider_proxyprovider.dart';
import 'package:provider_overview_15/pages/proxyprovider_create_update.dart';
import 'package:provider_overview_15/pages/proxyprovider_proxyprovider.dart';
import 'package:provider_overview_15/pages/proxyprovider_update.dart';
import 'package:provider_overview_15/pages/why_proxyprovider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ProxyProvider Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: ListView(
            shrinkWrap: true,
            children: [
              ElevatedButton(
                child: Text(
                  'Why\nProxyProvider',
                  style: TextStyle(fontSize: 20.0),
                  textAlign: TextAlign.center,
                ),
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => WhyProxyProvider(),
                    )),
              ),
              SizedBox(height: 20.0,),
              ElevatedButton(
                child: Text(
                  'ProxyProvider\nupdate',
                  style: TextStyle(fontSize: 20.0),
                  textAlign: TextAlign.center,
                ),
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ProxyProviderUpdate(),
                    )),
              ),
              SizedBox(height: 20.0,),
              ElevatedButton(
                child: Text(
                  'ProxyProvider\ncreate/update',
                  style: TextStyle(fontSize: 20.0),
                  textAlign: TextAlign.center,
                ),
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ProxyProviderCreateUpdate(),
                    )),
              ),
              SizedBox(height: 20.0,),
              ElevatedButton(
                child: Text(
                  'ProxyProvider\nProxyProvider',
                  style: TextStyle(fontSize: 20.0),
                  textAlign: TextAlign.center,
                ),
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ProxyProviderProxyProvider(),
                    )),
              ),
              SizedBox(height: 20.0,),
              ElevatedButton(
                child: Text(
                  'ChangeNotifierProvider\nChangeNotifierProxyProvider',
                  style: TextStyle(fontSize: 20.0),
                  textAlign: TextAlign.center,
                ),
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ChangeNotifierProviderChangeNotifierProxyProvider(),
                    )),
              ),
              SizedBox(height: 20.0,),
              ElevatedButton(
                child: Text(
                  'ChangeNotifierProvider\nProxyProvider',
                  style: TextStyle(fontSize: 20.0),
                  textAlign: TextAlign.center,
                ),
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ChangeNotifierProviderProxyProvider(),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
