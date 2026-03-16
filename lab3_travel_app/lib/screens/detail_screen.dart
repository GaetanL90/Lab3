import 'package:flutter/material.dart';
import '../data/travel_data.dart';
import 'booking_screen.dart';

class DetailScreen extends StatelessWidget {
  final Destination destination;
  const DetailScreen({super.key, required this.destination});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverAppBar(expandedHeight: 400, pinned: true, leading: const BackButton(color: Colors.white), flexibleSpace: FlexibleSpaceBar(background: Hero(tag: 'img-${destination.id}', child: Image.asset(destination.imageAsset, fit: BoxFit.cover)))),
                SliverToBoxAdapter(
                  child: Container(
                    padding: const EdgeInsets.all(25),
                    decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(35))),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                        Text(destination.title, style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                        Row(children: [const Icon(Icons.star, color: Colors.amber, size: 20), Text(" ${destination.rating}")])
                      ]),
                      const SizedBox(height: 8),
                      Row(children: [const Icon(Icons.location_on, color: Colors.blue, size: 18), Text(" ${destination.location}", style: const TextStyle(color: Colors.grey))]),
                      const SizedBox(height: 25),
                      const Text("About Trip", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      Text(destination.description, style: const TextStyle(fontSize: 16, color: Colors.black54, height: 1.5)),
                      const SizedBox(height: 25),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                        _DetailInfoTile(Icons.nights_stay, "Duration", "${destination.nights} Nights"),
                        _DetailInfoTile(Icons.monetization_on, "Price", "\$${destination.price}"),
                        _DetailInfoTile(Icons.map, "Type", destination.tags[0]),
                      ]),
                      const SizedBox(height: 120),
                    ]),
                  ),
                )
              ],
            ),
            Positioned(
              bottom: 0, left: 0, right: 0,
              child: Container(
                padding: const EdgeInsets.fromLTRB(25, 20, 25, 30),
                decoration: BoxDecoration(color: Colors.white, boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 20)]),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [const Text("Total Price", style: TextStyle(color: Colors.grey)), Text("\$${destination.price}", style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.blueAccent))]),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent, foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => BookingScreen(destination: destination))),
                    child: const Text("Book Now", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  )
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _DetailInfoTile extends StatelessWidget {
  final IconData icon; final String title, value;
  const _DetailInfoTile(this.icon, this.title, this.value);
  @override
  Widget build(BuildContext context) {
    return Column(children: [Icon(icon, color: Colors.blueAccent), const SizedBox(height: 5), Text(title, style: const TextStyle(color: Colors.grey, fontSize: 12)), Text(value, style: const TextStyle(fontWeight: FontWeight.bold))]);
  }
}