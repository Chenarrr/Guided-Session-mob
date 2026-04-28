import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fruit Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const FruitShopPage(),
    );
  }
}

class FruitShopPage extends StatelessWidget {
  const FruitShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: AppBar(
        title: const Text('Fruit Shop', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(16),
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        children: const [
          _FruitTile(emoji: '🍊', name: 'Orange',     subtitle: 'Fresh & juicy'),
          _FruitTile(emoji: '🍌', name: 'Banana',     subtitle: 'Ripe & sweet'),
          _FruitTile(emoji: '🍎', name: 'Apple',      subtitle: 'Crisp & red'),
          _FruitTile(emoji: '🍇', name: 'Grapes',     subtitle: 'Seedless'),
          _FruitTile(emoji: '🍉', name: 'Watermelon', subtitle: 'Big & cool'),
          _FruitTile(emoji: '🍓', name: 'Strawberry', subtitle: 'Garden fresh'),
        ],
      ),
    );
  }
}

class _FruitTile extends StatefulWidget {
  final String emoji;
  final String name;
  final String subtitle;

  const _FruitTile({required this.emoji, required this.name, required this.subtitle});

  @override
  State<_FruitTile> createState() => _FruitTileState();
}

class _FruitTileState extends State<_FruitTile> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6, offset: const Offset(0, 2))],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(widget.emoji, style: const TextStyle(fontSize: 52)),
          Column(
            children: [
              Text(widget.name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Text(widget.subtitle, style: const TextStyle(color: Colors.grey, fontSize: 12)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _Btn(icon: Icons.remove, onTap: () { if (count > 0) setState(() => count--); }),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text('$count', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              _Btn(icon: Icons.add, onTap: () => setState(() => count++)),
            ],
          ),
        ],
      ),
    );
  }
}

class _Btn extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _Btn({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: const Color(0xFFF0F0F0),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, size: 18),
      ),
    );
  }
}
