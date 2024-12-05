import 'package:flutter/material.dart';

class MyBookingPage extends StatelessWidget {
  // بيانات الحجز مع السعر والصورة
  final List<Map<String, dynamic>> bookings = [
    {
      'car_name': 'nissan',
      'date': '2024-12-01',
      'status': 'مؤكد',
      'price': 100, // السعر
      'image': 'images/images.jpg', // المسار الصحيح للصورة
    },
    {
      'car_name': ' bmw',
      'date': '2024-12-05',
      'status': 'مؤكد',
      'price': 150,
      'image': 'images/images.jpg',
    },
    {
      'car_name': ' mercedes',
      'date': '2024-12-10',
      'status': 'مؤكد',
      'price': 120,
      'image': 'images/images.jpg',
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
                contentPadding: EdgeInsets.all(12.0),
                leading: Image.asset(
                  booking['image'], // عرض صورة السيارة
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                title: Text(booking['car_name']!),
                subtitle: Text('التاريخ: ${booking['date']}'),
                trailing: Text(
                  booking['status']!,
                  style: TextStyle(color: Colors.green),
                ),
                onTap: () {
                  // عرض تفاصيل الحجز والفاتورة عند الضغط على الحجز
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('تفاصيل الحجز'),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(booking['image'],
                              width: 150, height: 150, fit: BoxFit.cover),
                          SizedBox(height: 10),
                          Text('اسم السيارة: ${booking['car_name']}'),
                          Text('التاريخ: ${booking['date']}'),
                          Text('الحالة: ${booking['status']}'),
                          Text('السعر: \$${booking['price']}'), // عرض السعر
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // إغلاق النافذة
                          },
                          child: Text('إغلاق'),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
