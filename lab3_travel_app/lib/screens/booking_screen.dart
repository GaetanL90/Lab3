import 'package:flutter/material.dart';
import '../data/travel_data.dart';

class BookingScreen extends StatefulWidget {
  final Destination destination;
  const BookingScreen({super.key, required this.destination});
  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  int _travellers = 1;
  String _room = 'Standard';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Confirm Booking")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(children: [
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)]),
              child: Row(children: [
                ClipRRect(borderRadius: BorderRadius.circular(15), child: Image.asset(widget.destination.imageAsset, width: 70, height: 70, fit: BoxFit.cover)),
                const SizedBox(width: 15),
                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(widget.destination.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)), Text(widget.destination.location, style: const TextStyle(color: Colors.grey))])),
              ]),
            ),
            const SizedBox(height: 30),
            Expanded(child: SingleChildScrollView(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text("Traveler Details", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const TextField(decoration: InputDecoration(labelText: "Full Name")),
              const TextField(decoration: InputDecoration(labelText: "Email")),
              const SizedBox(height: 30),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const Text("Travellers"),
                Row(children: [
                  IconButton(onPressed: () => setState(() => _travellers > 1 ? _travellers-- : null), icon: const Icon(Icons.remove_circle_outline)),
                  Text("$_travellers", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  IconButton(onPressed: () => setState(() => _travellers++), icon: const Icon(Icons.add_circle_outline)),
                ])
              ]),
              const SizedBox(height: 20),
              const Text("Room Type"),
              Wrap(spacing: 10, children: ['Standard', 'Deluxe', 'Suite'].map((r) => ChoiceChip(label: Text(r), selected: _room == r, onSelected: (_) => setState(() => _room = r))).toList()),
            ]))),
            SizedBox(width: double.infinity, height: 55, child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent, foregroundColor: Colors.white),
              onPressed: () {
                showDialog(context: context, builder: (context) => AlertDialog(
                  title: const Text("Confirmed!"), content: const Text("Your adventure is booked."),
                  actions: [TextButton(onPressed: () => Navigator.popUntil(context, (r) => r.isFirst), child: const Text("Finish"))],
                ));
              },
              child: const Text("Confirm Booking"),
            ))
          ]),
        ),
      ),
    );
  }
}