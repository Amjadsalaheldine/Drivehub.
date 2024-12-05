import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class EmergencyPage extends StatefulWidget {
  @override
  _EmergencyPageState createState() => _EmergencyPageState();
}

class _EmergencyPageState extends State<EmergencyPage> {
  String? _selectedIssueType;
  TextEditingController _locationController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  // القائمة الخاصة بأنواع الأعطال
  final List<String> issueTypes = ['حادث', 'عطل ميكانيكي', 'عطل كهربائي'];

  // دالة للحصول على الموقع الحالي
  Future<void> _getCurrentLocation() async {
    // التأكد من صلاحية الأذونات
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      // إذا كانت الأذونات مرفوضة
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('يرجى منح الأذونات للوصول إلى الموقع')));
      return;
    }

    // الحصول على الموقع الحالي
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _locationController.text =
          'Lat: ${position.latitude}, Long: ${position.longitude}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('خدمة الطوارئ'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // اختيار نوع العطل
              Text(
                'اختار نوع العطل:',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              ...issueTypes.map((issue) {
                return RadioListTile<String>(
                  title: Text(issue),
                  value: issue,
                  groupValue: _selectedIssueType,
                  onChanged: (value) {
                    setState(() {
                      _selectedIssueType = value;
                    });
                  },
                );
              }).toList(),

              SizedBox(height: 20.0),

              // زر للحصول على الموقع
              TextButton(
                onPressed: _getCurrentLocation,
                child: Text('تحديد الموقع الحالي',
                    style: TextStyle(color: Colors.blue)),
              ),

              // إدخال الموقع
              Text(
                'الموقع:',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: _locationController,
                decoration: InputDecoration(
                  hintText: 'أدخل موقعك أو سيتم تحديده تلقائيًا',
                  border: OutlineInputBorder(),
                ),
                readOnly:
                    true, // لا يمكن للمستخدم تعديل هذا الحقل لأنه يتم تحديده تلقائيًا
              ),

              SizedBox(height: 20.0),

              // إدخال رقم الهاتف
              Text(
                'رقم الهاتف للتواصل:',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: _phoneController,
                decoration: InputDecoration(
                  hintText: 'أدخل رقم هاتفك',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
              ),

              SizedBox(height: 30.0),

              // زر إرسال البلاغ
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // هنا يمكنك إضافة منطق إرسال البيانات (مثلاً، إرسال البيانات إلى الخادم)
                    if (_selectedIssueType != null &&
                        _locationController.text.isNotEmpty &&
                        _phoneController.text.isNotEmpty) {
                      // عرض رسالة تأكيد
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('تم إرسال بلاغ الطوارئ!')),
                      );
                    } else {
                      // عرض رسالة خطأ إذا لم يتم ملء البيانات بالكامل
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('يرجى ملء جميع الحقول')),
                      );
                    }
                  },
                  child: Text('إرسال البلاغ'),
                ),
              ),

              // زر العودة إلى الصفحة الرئيسية
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // العودة إلى الصفحة الرئيسية
                    Navigator.pushReplacementNamed(context, '/userhome');
                  },
                  child: Text('العودة إلى الصفحة الرئيسية'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
