import 'dart:io'; // إضافة هذه المكتبة لتمكين استخدام Image.file
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // لتحميل صورة

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // متغيرات لتخزين بيانات المستخدم
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _licenseNumberController = TextEditingController();
  TextEditingController _idNumberController = TextEditingController();

  // متغير لتحديد إذا كان المستخدم في وضع التعديل أو العرض فقط
  bool _isEditing = false;

  // متغير لتخزين صورة الهوية
  XFile? _identityImage;

  @override
  void initState() {
    super.initState();
    // هنا يمكن تحميل بيانات المستخدم من الخادم أو قاعدة البيانات
    _nameController.text = "Amjad Salah El Dine"; // مثال على البيانات
    _emailController.text = "amjadsalaheldine@gmail.com";
    _phoneController.text = "+96176348399";
    _licenseNumberController.text = "123456789";
    _idNumberController.text = "ID-987654321";
  }

  // دالة لاختيار صورة الهوية
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _identityImage = pickedFile;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('البروفايل'),
        centerTitle: true,
        actions: [
          // زر التعديل
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              setState(() {
                _isEditing = !_isEditing;
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // حقل الاسم
            Text(
              'الاسم:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _nameController,
              enabled: _isEditing,
              decoration: InputDecoration(
                hintText: 'أدخل اسمك',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),

            // حقل البريد الإلكتروني
            Text(
              'البريد الإلكتروني:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _emailController,
              enabled: _isEditing,
              decoration: InputDecoration(
                hintText: 'أدخل بريدك الإلكتروني',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),

            // حقل رقم الهاتف
            Text(
              'رقم الهاتف:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _phoneController,
              enabled: _isEditing,
              decoration: InputDecoration(
                hintText: 'أدخل رقم هاتفك',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 20.0),

            // حقل رقم رخصة القيادة
            Text(
              'رقم رخصة القيادة:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _licenseNumberController,
              enabled: _isEditing,
              decoration: InputDecoration(
                hintText: 'أدخل رقم رخصة القيادة',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),

            // حقل رقم بطاقة الهوية
            Text(
              'رقم بطاقة الهوية:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _idNumberController,
              enabled: _isEditing,
              decoration: InputDecoration(
                hintText: 'أدخل رقم بطاقة الهوية',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),

            // اختيار صورة الهوية
            Text(
              'صورة الهوية:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            GestureDetector(
              onTap: _isEditing ? _pickImage : null,
              child: Container(
                width: double.infinity,
                height: 200.0,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: _identityImage == null
                    ? Center(child: Text('اضغط لاختيار صورة الهوية'))
                    : Image.file(
                        File(_identityImage!
                            .path), // يجب استخدام File لعرض الصورة
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            SizedBox(height: 30.0),

            // زر حفظ التعديلات إذا كان في وضع التعديل
            if (_isEditing)
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // هنا يمكنك إضافة منطق لحفظ البيانات المعدلة (مثلاً إرسال البيانات إلى الخادم)
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('تم حفظ التعديلات!')),
                    );
                  },
                  child: Text('حفظ التعديلات'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
