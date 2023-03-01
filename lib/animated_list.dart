// ignore_for_file: library_private_types_in_public_api, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class MyListView extends StatefulWidget {
  const MyListView({super.key});

  @override
  _MyListViewState createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  final GlobalKey<AnimatedListState> _key = GlobalKey();
  final List<String> _items = [];

  void _addItem() {
    _items.insert(0, "Item ${_items.length + 1}");
    _key.currentState!.insertItem(0, duration: const Duration(seconds: 1));
  }

  void _removeItem(int index) {
    _key.currentState!.removeItem(
      index,
      (_, animation) {
        return SizeTransition(
          sizeFactor: animation,
          child: const Card(
            margin: EdgeInsets.all(10),
            elevation: 10,
            color: Colors.red,
            child: ListTile(
              contentPadding: EdgeInsets.all(10),
              title: Text(
                "Deleted",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
          ),
        );
      },
      duration: const Duration(milliseconds: 500),
    );

    _items.removeAt(index);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      // ignore: prefer_const_constructors
      backgroundColor: Color.fromARGB(255, 39, 39, 39),
      appBar: AppBar(
        // title: const Text('Animated List'),
        centerTitle: true,
        leading: Container(),
        elevation: 0,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Padding(
            padding: EdgeInsets.only(bottom: 15),
            child: Text(
              'Animated List',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          //   child: IconButton(
          //     onPressed: () => _addItem(),
          //     icon: const Icon(Icons.add),
          //     color: Colors.white,
          //   ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 70,
            child: IconButton(
              onPressed: () => _addItem(),
              icon: const Icon(Icons.add),
              color: Colors.white,
            ),
          ),
          Expanded(
            child: AnimatedList(
              key: _key,
              initialItemCount: 0,
              itemBuilder: (_, index, animation) {
                return SizeTransition(
                  sizeFactor: animation,
                  child: Card(
                    margin: const EdgeInsets.all(10),
                    elevation: 10,
                    color: Colors.orange,
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(10),
                      title: Text(
                        _items[index],
                        style: const TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.white),
                        onPressed: () => _removeItem(index),
                      ),
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
