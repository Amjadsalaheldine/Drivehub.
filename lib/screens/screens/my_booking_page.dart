import 'package:flutter/material.dart';

class MyBookingPage extends StatelessWidget {
  final List<Map<String, String>> bookings = [
    {
      'car_name': 'سيارة 1',
      'date': '2024-12-01',
      'status': 'مؤكد',
    },
    {
      'car_name': 'سيارة 2',
      'date': '2024-12-05',
      'status': 'مؤكد',
    },
    {
      'car_name': 'سيارة 3',
      'date': '2024-12-10',
      'status': 'مؤكد',
    },
    // أضف المزيد من الحجوزات حسب الحاجة
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('حجوزاتي'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: bookings.length,
          itemBuilder: (context, index) {
            final booking = bookings[index];
            return Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: ListTile(
                title: Text(booking['car_name']!),
                subtitle: Text('التاريخ: ${booking['date']}'),
                trailing: Text(
                  booking['status']!,
                  style: TextStyle(color: Colors.green),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
