import 'package:flutter/material.dart';
import '../data/travel_data.dart';
import '../widgets/destination_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String _query = '';
  String _selectedCat = 'All';
  final List<String> _cats = ['All', 'Beach', 'City', 'Adventure', 'Romantic'];

  @override
  Widget build(BuildContext context) {
    var filtered = popularDestinations.where((d) => 
      (d.title.toLowerCase().contains(_query.toLowerCase())) && 
      (_selectedCat == 'All' || d.tags.contains(_selectedCat))).toList();

    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: Column(children: [
          const UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.blueAccent),
            accountName: Text("Traveler"), accountEmail: Text("traveler@lab.com"),
            currentAccountPicture: CircleAvatar(backgroundImage: AssetImage('assets/images/logo.jpg')),
          ),
          ListTile(leading: const Icon(Icons.home), title: const Text("Home"), onTap: () => Navigator.pop(context)),
          ListTile(leading: const Icon(Icons.favorite), title: const Text("Favorites"), onTap: () {}),
        ]),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(height: 15),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              IconButton(icon: const Icon(Icons.sort_rounded, size: 30), onPressed: () => _scaffoldKey.currentState?.openDrawer()),
              const CircleAvatar(backgroundImage: AssetImage('assets/images/logo.jpg')),
            ]),
            const SizedBox(height: 25),
            const Text('Explore the\nBeautiful World', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800, height: 1.2)),
            const SizedBox(height: 25),
            TextField(onChanged: (v) => setState(() => _query = v), decoration: InputDecoration(hintText: 'Search destinations...', prefixIcon: const Icon(Icons.search), filled: true, fillColor: Colors.white, border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none))),
            const SizedBox(height: 25),
            SizedBox(height: 40, child: ListView.builder(scrollDirection: Axis.horizontal, itemCount: _cats.length, itemBuilder: (context, i) => Padding(padding: const EdgeInsets.only(right: 10), child: ChoiceChip(label: Text(_cats[i]), selected: _selectedCat == _cats[i], onSelected: (_) => setState(() => _selectedCat = _cats[i]))))),
            const SizedBox(height: 25),
            GridView.builder(shrinkWrap: true, physics: const NeverScrollableScrollPhysics(), gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 15, mainAxisSpacing: 15, childAspectRatio: 0.8), itemCount: filtered.length, itemBuilder: (context, i) => DestinationCard(destination: filtered[i])),
            const SizedBox(height: 25),
          ]),
        ),
      ),
    );
  }
}