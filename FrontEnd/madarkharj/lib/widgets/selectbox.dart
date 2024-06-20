import 'package:flutter/material.dart';

class Item {
  final String name;

  Item({required this.name});
}

class SelectableListScreen extends StatefulWidget {
  @override
  _SelectableListScreenState createState() => _SelectableListScreenState();
}

class _SelectableListScreenState extends State<SelectableListScreen> {
  List<Item> items = [
    Item(name: 'Item 1'),
    Item(name: 'Item 2'),
    Item(name: 'Item 3'),
    Item(name: 'Item 4'),
    Item(name: 'Item 5'),
    // Add more items as needed
  ];

  List<String> selectedItems = [];

  void _onItemSelected(bool selected, String itemName) {
    setState(() {
      if (selected) {
        selectedItems.add(itemName);
      } else {
        selectedItems.remove(itemName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Selectable List')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return _buildSelectableItem(items[index]);
        },
      ),
    );
  }

  Widget _buildSelectableItem(Item item) {
    return ListTile(
      title: Text(item.name),
      trailing: Checkbox(
        value: selectedItems.contains(item.name),
        onChanged: (bool? selected) {
          if (selected != null) {
            _onItemSelected(selected, item.name);
          }
        },
      ),
    );
  }
}
