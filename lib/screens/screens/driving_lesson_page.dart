import 'package:flutter/material.dart';

class DrivingLessonPage extends StatelessWidget {
  final List<Map<String, String>> lessons = [
    {
      'name': 'دورة تعلم القيادة للمبتدئين',
      'duration': '4 ساعات',
      'price': '100\$',
    },
    {
      'name': 'دورة تعلم القيادة المتقدمة',
      'duration': '6 ساعات',
      'price': '150\$',
    },
    {
      'name': 'دورة قيادة سيارات آلية',
      'duration': '5 ساعات',
      'price': '120\$',
    },
    // أضف المزيد من الدورات حسب الحاجة
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('دورات تعلم القيادة'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: lessons.length,
          itemBuilder: (context, index) {
            final lesson = lessons[index];
            return Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: ListTile(
                title: Text(lesson['name']!),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('المدة: ${lesson['duration']}'),
                    Text('السعر: ${lesson['price']}'),
                  ],
                ),
                trailing: ElevatedButton(
                  onPressed: () {
                    // منطق حجز الدورة
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text('تم الحجز لدورة: ${lesson['name']}')),
                    );
                  },
                  child: Text('احجز الآن'),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
