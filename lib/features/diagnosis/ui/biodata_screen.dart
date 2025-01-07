import 'package:flutter/material.dart';
import 'package:psikitech_diagnos/common/widgets/appBar/app_bar_diagnos.dart';
import 'package:psikitech_diagnos/constants/colors.dart';

class BiodataScreen extends StatefulWidget {
  static const String route = '/biodata';

  const BiodataScreen({super.key});

  @override
  State<BiodataScreen> createState() => _BiodataScreenState();
}

class _BiodataScreenState extends State<BiodataScreen> {
  // Controllers untuk TextField
  final TextEditingController umurController = TextEditingController();
  final TextEditingController tinggiController = TextEditingController();
  final TextEditingController beratController = TextEditingController();

  // Nilai awal dropdown
  String? jenisKelamin;

  // Fungsi untuk reset form
  void resetForm() {
    setState(() {
      umurController.clear();
      tinggiController.clear();
      beratController.clear();
      jenisKelamin = null;
    });
  }

  // Fungsi untuk validasi apakah semua form terisi
  bool isFormValid() {
    return umurController.text.isNotEmpty &&
        tinggiController.text.isNotEmpty &&
        beratController.text.isNotEmpty &&
        jenisKelamin != null;
  }

  // Fungsi untuk menampilkan pesan error jika form belum lengkap
  void showErrorDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Data Belum Lengkap"),
        content: const Text("Harap isi semua data sebelum melanjutkan."),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: const AppBarDiagnosWidget(label: "Pengisian Data Pasien"),
      body: Padding(
        padding: const EdgeInsets.only(top: 32.0),
        child: Column(
          children: [
            Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Pengisian Data Pasien",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: umurController,
                      decoration: InputDecoration(
                        labelText: "Umur Pasien",
                        suffixText: "tahun",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: tinggiController,
                      decoration: InputDecoration(
                        labelText: "Tinggi Badan Pasien",
                        suffixText: "cm",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: beratController,
                      decoration: InputDecoration(
                        labelText: "Berat Badan Pasien",
                        suffixText: "kg",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 16),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: "Jenis Kelamin Pasien",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      value: jenisKelamin,
                      dropdownColor: AppColors.backgroundColor, // Warna latar belakang dropdown
                      style: const TextStyle(
                        fontSize: 16, // Ukuran teks
                        fontWeight: FontWeight.bold,
                        color: Colors.black, // Warna teks
                      ),
                      items: const [
                        DropdownMenuItem(
                          value: "Laki-laki",
                          child: Text("Laki-laki"),
                        ),
                        DropdownMenuItem(
                          value: "Perempuan",
                          child: Text("Perempuan"),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          jenisKelamin = value;
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Pengisian data dilakukan di awal untuk mempermudah proses diagnosamu :)",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    // Tombol Reset
                    Align(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        onPressed: resetForm,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange[300],
                        ),
                        child: const Text(
                          "Reset",
                          style: TextStyle(color: Colors.black54),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            // Tombol di luar card (Lanjut dan Kembali ke Homepage)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/home');
                    },
                    style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.secondaryColor,
                        ),
                    child: const Text("Kembali", style: TextStyle(color: Colors.black)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (isFormValid()) {
                        Navigator.pushReplacementNamed(context, '/diagnosis');
                      } else {
                        showErrorDialog();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.secondaryColor,
                        ),
                    child: const Text("Lanjut", style: TextStyle(color: Colors.black)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
