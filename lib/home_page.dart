import 'package:flutter/material.dart';
import 'order_page.dart';
import 'login_page.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> foods = [
    {'name': 'Nasi Goreng', 'price': 15000, 'image': 'assets/nasi_goreng.jpeg'},
    {'name': 'Bakmi Jawa', 'price': 25000, 'image': 'assets/bakmi_jawa.jpeg'},
    {'name': 'Mie Ayam', 'price': 12000, 'image': 'assets/mie_ayam.jpeg'},
    {'name': 'Sate Ayam', 'price': 20000, 'image': 'assets/sate_ayam.jpeg'},
    {'name': 'Sate Padang', 'price': 25000, 'image': 'assets/sate_padang.jpeg'},
    {'name': 'Sate Lilit', 'price': 25000, 'image': 'assets/sate_lilit.jpeg'},
    {'name': 'Bakso', 'price': 10000, 'image': 'assets/bakso.jpeg'},
    {'name': 'Rendang', 'price': 18000, 'image': 'assets/rendang.jpeg'},
    {'name': 'Rawon', 'price': 18000, 'image': 'assets/rawon.jpeg'},
    {'name': 'Soto Ayam', 'price': 10000, 'image': 'assets/soto_ayam.jpeg'},
    {'name': 'Soto Daging', 'price': 15000, 'image': 'assets/soto_daging.jpeg'},
    {'name': 'Nasi Putih', 'price': 4000, 'image': 'assets/nasi_putih.jpeg'},
    {'name': 'Nasi Merah', 'price': 5000, 'image': 'assets/nasi_merah.jpeg'},
    {'name': 'Es Teh', 'price': 8000, 'image': 'assets/es_teh.jpeg'},
    {'name': 'Lemon Tea', 'price': 10000, 'image': 'assets/lemon_tea.jpeg'},
    {'name': 'Es Campur', 'price': 15000, 'image': 'assets/es_campur.jpeg'},
    {'name': 'Es Buah', 'price': 15000, 'image': 'assets/es_buah.jpeg'},
    {'name': 'Kelapa Muda', 'price': 15000, 'image': 'assets/es_kelapa.jpeg'},
    {'name': 'Air Es', 'price': 1000, 'image': 'assets/air_es.jpeg'},

  ];

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selamat Datang, Silahkan dipilih'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 140,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/makanan.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Daftar Menu:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),

            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.85, 
                  ),
                  itemCount: foods.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                foods[index]['image'],
                                width: 120,
                                height: 120,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 12),

                            Text(
                              foods[index]['name'],
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 10),

                            Text(
                              'Rp ${foods[index]['price']}',
                              style: TextStyle(fontSize: 14, color: Colors.redAccent),
                            ),
                            SizedBox(height: 20),

                      
                            SizedBox(
                              width: 100,
                              height: 40,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => OrderPage(food: foods[index]),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(vertical: 8),
                                  textStyle: TextStyle(fontSize: 14),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: Text('Pesan'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
