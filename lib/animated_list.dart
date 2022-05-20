import 'package:flutter/material.dart';

class AnimatedListScreen extends StatefulWidget {
  const AnimatedListScreen({Key? key}) : super(key: key);
  @override
  State<AnimatedListScreen> createState() => _AnimatedListScreenState();
}

class _AnimatedListScreenState extends State<AnimatedListScreen> {
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  final List<int> _items = [
    1,
    2,
    3,
    4,
    5,
  ];
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated List'),
      ),
      body: AnimatedList(
          key: listKey,
          initialItemCount: _items.length,
          itemBuilder: (
            BuildContext context,
            int index,
            Animation<double> animation,
          ) {
            return fadeListTile(context, index, animation);
          }),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            insertPizza();
          }),
    );
  }

  Widget fadeListTile(
      BuildContext context, int index, Animation<double> animation) {
    int item = _items[index];
    return FadeTransition(
      opacity: Tween(
        begin: 0.0,
        end: 1.0,
      ).animate(animation),
      child: Card(
        child: ListTile(
          title: Text('Pizza ' + item.toString()),
          onTap: () {
            removePizza(index);
          },
        ),
      ),
    );
  }

  void removePizza(int index) {
    int animationIndex = index;
    if (index == _items.length - 1) animationIndex--;
    listKey.currentState!.removeItem(
        index,
        (context, animation) =>
            fadeListTile(context, animationIndex, animation),
        duration: const Duration(seconds: 1));
    _items.removeAt(index);
  }

  void insertPizza() {
    listKey.currentState!.insertItem(
      _items.length,
      duration: Duration(seconds: 1),
    );
    _items.add(++counter);
  }
}
