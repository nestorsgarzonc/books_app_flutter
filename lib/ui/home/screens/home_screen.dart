import 'package:flutter/material.dart';
import 'package:flutter_library/core/utils/date_utils.dart';

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
                const SizedBox(height: 15),
                TextFormField(
                  decoration: const InputDecoration(
                    label: Text('Search...'),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
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
          const SizedBox(height: 12),
          SizedBox(
            height: 360,
            width: double.infinity,
            child: ListView.separated(
              separatorBuilder: (context, _) => const SizedBox(width: 8),
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, i) {
                if (i == 0) {
                  return const SizedBox(width: 8);
                }
                return InkWell(
                  onTap: () {},
                  child: Ink(
                    width: 190,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 1, spreadRadius: 0.5)
                      ],
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Image.asset(
                            'assets/images/book_cover.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        const Text(
                          'Title',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
