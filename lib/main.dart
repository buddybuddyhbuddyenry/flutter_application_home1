import 'package:flutter/material.dart';

void main() {
  runApp(const BookingApp());
}

class BookingApp extends StatelessWidget {
  const BookingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Booking App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HotelListScreen(),
    );
  }
}

class HotelListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hotel List'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(  //=> ListTile的用法
            //title: Text('Hotel ${index + 1}'),
            //subtitle: Text('Description of Hotel ${index + 1}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HotelDetailScreen(hotelIndex: index),
                ),
              );
            },
            child: ListTile(
              title: Text('Hotel ${index + 1}'),
              subtitle: Text('Description of Hotel ${index + 1}'),
            ),
          );
        },
      ),
    );
  }
}

class HotelDetailScreen extends StatelessWidget {
  final int hotelIndex;

  HotelDetailScreen({required this.hotelIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hotel ${hotelIndex + 1}'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Details of Hotel ${hotelIndex + 1}'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookingScreen(hotelIndex: hotelIndex),
                  ),
                );
              },
              child: Text('Book Now'),
            ),
          ],
        ),
      ),
    );
  }
}

class BookingScreen extends StatelessWidget {
  final int hotelIndex;

  BookingScreen({required this.hotelIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Select Date'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement date picker
              },
              child: Text('Pick Date'),
            ),
            SizedBox(height: 20),
            Text('Select Room Type'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement room type selection
              },
              child: Text('Select Room'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement booking confirmation
              },
              child: Text('Confirm Booking'),
            ),
          ],
        ),
      ),
    );
  }
}
