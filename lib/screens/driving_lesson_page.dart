import 'package:flutter/material.dart';

class DrivingLessonPage extends StatefulWidget {
  @override
  _DrivingLessonPageState createState() => _DrivingLessonPageState();
}

class _DrivingLessonPageState extends State<DrivingLessonPage> {
  // المتغيرات لتخزين الاختيارات
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  String? _selectedRegion;
  bool _hasLicense = false; // الحالة الخاصة بالرخصة

  final List<String> regions = ['Akkar', 'Tripoli', 'Beirut']; // قائمة المناطق

  // دالة لاختيار التاريخ
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  // دالة لاختيار الوقت
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('حجز درس قيادة'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // اختيار التاريخ
              ListTile(
                title: Text('اختيار التاريخ'),
                subtitle: Text(_selectedDate == null
                    ? 'لم يتم تحديد التاريخ'
                    : '${_selectedDate!.toLocal()}'.split(' ')[0]),
                trailing: Icon(Icons.calendar_today),
                onTap: () => _selectDate(context),
              ),

              // اختيار الوقت
              ListTile(
                title: Text('اختيار الوقت'),
                subtitle: Text(_selectedTime == null
                    ? 'لم يتم تحديد الوقت'
                    : _selectedTime!.format(context)),
                trailing: Icon(Icons.access_time),
                onTap: () => _selectTime(context),
              ),

              // اختيار رخصة القيادة
              Row(
                children: [
                  Text('هل لديك رخصة قيادة؟'),
                  Radio<bool>(
                    value: true,
                    groupValue: _hasLicense,
                    onChanged: (value) {
                      setState(() {
                        _hasLicense = value!;
                      });
                    },
                  ),
                  Text('نعم'),
                  Radio<bool>(
                    value: false,
                    groupValue: _hasLicense,
                    onChanged: (value) {
                      setState(() {
                        _hasLicense = value!;
                      });
                    },
                  ),
                  Text('لا'),
                ],
              ),

              // اختيار المنطقة
              DropdownButton<String>(
                hint: Text('اختيار المنطقة'),
                value: _selectedRegion,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedRegion = newValue;
                  });
                },
                items: regions.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),

              // عرض السعر
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  'السعر: 300\$',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // زر الحجز
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // المنطق هنا: تحقق من صحة المدخلات وحجز الدرس
                    if (_selectedDate != null &&
                        _selectedTime != null &&
                        _selectedRegion != null &&
                        _hasLicense != null) {
                      // إجراء الحجز (يمكنك هنا إضافة منطق الحجز)
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('تم حجز درس القيادة!')),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('يرجى ملء جميع الحقول')),
                      );
                    }
                  },
                  child: Text('احجز الآن'),
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
