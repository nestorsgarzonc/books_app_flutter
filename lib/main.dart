import 'package:flutter/material.dart';
import 'package:flutter_library/core/navigator/navigator.dart';
import 'package:flutter_library/core/scroll/custom_scroll_behavior.dart';
import 'package:flutter_library/core/utils/date_utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NW Library',
      scrollBehavior: CustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          fillColor: Colors.white.withOpacity(.9),
          filled: true,
        ),
      ),
      onGenerateRoute: CustomNavigator.onGenerateRoute,
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const route = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 140,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 2, spreadRadius: 2)],
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  CustomDateUtils.getGreeting(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  decoration: const InputDecoration(
                    label: Text('Search...'),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          TextButton(
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'My favourites',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18, color: Colors.black),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 300,
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.only(left: 16),
                color: Colors.red,
                height: 250,
                width: 250,
              ),
            ),
          ),
          const Spacer(),
          Text(
            'By Sebastián Garzón',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 14,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
