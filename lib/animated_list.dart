// // ignore_for_file: camel_case_types

// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

// class Animated_List extends StatefulWidget {
//   const Animated_List({super.key});

//   @override
//   State<Animated_List> createState() => _Animated_ListState();
// }

// class _Animated_ListState extends State<Animated_List> {
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 39, 39, 39),
//       appBar: AppBar(
//         title: const Text('Animated List'),
//         centerTitle: true,
//         leading: Container(),
//         elevation: 0,
//       ),
//       body: AnimationLimiter(
//         child: ListView.builder(
//           itemBuilder: (context, index) {
//             return AnimationConfiguration.staggeredList(
//               position: index,
//               delay: const Duration(milliseconds: 200),
//               child: SlideAnimation(
//                 delay: const Duration(milliseconds: 2500),
//                 curve: Curves.fastLinearToSlowEaseIn,
//                 horizontalOffset: -300,
//                 verticalOffset: -850,
//                 child: Container(
//                   height: size.height / 10,
//                   width: size.width * 0.9,
//                   margin:
//                       const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
//                   decoration: BoxDecoration(
//                     color: Colors.orange,
//                     borderRadius: BorderRadius.circular(10),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.5),
//                         spreadRadius: 5,
//                         blurRadius: 7,
//                         offset: const Offset(0, 3),
//                       )
//                     ],
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.only(top: 25, left: 10),
//                     child: Text(
//                       'Animation $index',
//                       style: const TextStyle(
//                         fontSize: 20,
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             );
//           },
//           itemCount: 20,
//         ),
//       ),
//     );
//   }
// }

class MyListView extends StatefulWidget {
  const MyListView({super.key});

  @override
  _MyListViewState createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  final List<String> _items = [];

  void _addItem() {
    final newFirstItem = 'New Item ${_items.length + 1}';
    setState(() {
      _items.insert(0, newFirstItem);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      // ignore: prefer_const_constructors
      backgroundColor: Color.fromARGB(255, 39, 39, 39),
      appBar: AppBar(
        title: const Text('Animated List'),
        centerTitle: true,
        // leading: Container(),
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: IconButton(
            onPressed: () => _addItem(),
            icon: const Icon(Icons.add),
            color: Colors.white,
          ),
        ),
      ),

      body: AnimationLimiter(
        child: ListView.builder(
          itemCount: _items.length,
          itemBuilder: (BuildContext context, int index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              child: SlideAnimation(
                // delay: const Duration(milliseconds: 2500),
                curve: Curves.fastLinearToSlowEaseIn,
                duration: Duration.zero,
                child: Container(
                  height: size.height / 10,
                  width: size.width * 0.9,
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      )
                    ],
                  ),
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text(
                        _items[index],
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    trailing: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            _items.removeAt(index);
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
// Container(
//   height: size.height / 10,
//   width: size.width * 0.9,
//   margin:
//       const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
//   decoration: BoxDecoration(
//     color: Colors.orange,
//     borderRadius: BorderRadius.circular(10),
//     boxShadow: [
//       BoxShadow(
//         color: Colors.grey.withOpacity(0.5),
//         spreadRadius: 5,
//         blurRadius: 7,
//         offset: const Offset(0, 3),
//       )
//     ],
//   ),
//   child: Padding(
//     padding: const EdgeInsets.only(top: 25, left: 10),
//     child: Text(
//       'Animation $index',
//       style: const TextStyle(
//         fontSize: 20,
//         color: Colors.white,
//         fontWeight: FontWeight.bold,
//       ),
//     ),
//   ),
// );

// ListView.builder(
//   itemCount: _items.length,
//   itemBuilder: (BuildContext context, int index) {
//     return ListTile(
//       title: Text(_items[index]),
//       trailing: IconButton(
//         icon: const Icon(Icons.delete),
//         onPressed: () {
//           setState(() {
//             _items.removeAt(index);
//           });
//         },
//       ),
//     );
//   },
// ),
// floatingActionButton: FloatingActionButton(
//   onPressed: () => _addItem(),
//   child: const Icon(Icons.add),
// ),
