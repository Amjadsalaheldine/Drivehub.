import 'package:flutter/material.dart';

class UserHomePage extends StatelessWidget {
  final List<Map<String, String>> cars = [
    {
      'image': 'images/images.jpg',
      'name': 'سيارة 1',
      'price': '150\$',
    },
    {
      'image': 'images/images.jpg',
      'name': 'سيارة 2',
      'price': '200\$',
    },
    {
      'image': 'images/images.jpg',
      'name': 'سيارة 3',
      'price': '180\$',
    },
    // أضف المزيد من السيارات حسب الحاجة
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('سيارات للحجز'),
        centerTitle: true,
        actions: [
          // زر البروفايل
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              // انتقل إلى صفحة البروفايل
              Navigator.pushNamed(context, '/profile');
            },
          ),
          // زر تعلم القيادة
          IconButton(
            icon: Icon(Icons.drive_eta),
            onPressed: () {
              // انتقل إلى صفحة تعلم القيادة
              Navigator.pushNamed(context, '/driving_lesson');
            },
          ),
          // زر الطوارئ
          IconButton(
            icon: Icon(Icons.local_hospital),
            onPressed: () {
              // انتقل إلى صفحة الطوارئ
              Navigator.pushNamed(context, '/emergency');
            },
          ),
          // زر حجوزاتي
          IconButton(
            icon: Icon(Icons.bookmark),
            onPressed: () {
              // انتقل إلى صفحة الحجوزات
              Navigator.pushNamed(context, '/my_booking');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // لعرض 2 سيارات في كل صف
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            childAspectRatio: 0.75, // لتحديد أبعاد الصورة
          ),
          itemCount: cars.length,
          itemBuilder: (context, index) {
            final car = cars[index];
            return Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.0),
                      topRight: Radius.circular(12.0),
                    ),
                    child: Image.asset(
                      car['image']!,
                      width: double.infinity,
                      height: 150.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          car['name']!,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          'السعر: ${car['price']}',
                          style: TextStyle(fontSize: 14.0),
                        ),
                        SizedBox(height: 8.0),
                        ElevatedButton(
                          onPressed: () {
                            // هنا يمكنك إضافة المنطق لعملية الحجز
                          },
                          child: Text('احجز الآن'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
