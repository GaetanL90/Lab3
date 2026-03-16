import 'package:flutter/material.dart';
import '../data/travel_data.dart';
import '../screens/detail_screen.dart';

class DestinationCard extends StatefulWidget {
  final Destination destination;
  const DestinationCard({super.key, required this.destination});

  @override
  State<DestinationCard> createState() => _DestinationCardState();
}

class _DestinationCardState extends State<DestinationCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => DetailScreen(destination: widget.destination))),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(24), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10, offset: const Offset(0, 5))]),
        child: Stack(
          children: [
            Positioned.fill(child: Hero(tag: 'img-${widget.destination.id}', child: ClipRRect(borderRadius: BorderRadius.circular(24), child: Image.asset(widget.destination.imageAsset, fit: BoxFit.cover)))),
            Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(24), gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.transparent, Colors.black.withOpacity(0.7)]))),
            
            // Toggable Favorite Icon
            Positioned(
              top: 12, right: 12,
              child: GestureDetector(
                onTap: () => setState(() => widget.destination.isFavorite = !widget.destination.isFavorite),
                child: CircleAvatar(
                  backgroundColor: Colors.white.withOpacity(0.3),
                  child: Icon(widget.destination.isFavorite ? Icons.favorite : Icons.favorite_border, color: widget.destination.isFavorite ? Colors.red : Colors.white, size: 20),
                ),
              ),
            ),
            Padding(padding: const EdgeInsets.all(15), child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.end, children: [
              Text(widget.destination.title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
              Row(children: [const Icon(Icons.location_on, color: Colors.white70, size: 14), Text(widget.destination.location, style: const TextStyle(color: Colors.white70, fontSize: 11))]),
            ])),
          ],
        ),
      ),
    );
  }
}