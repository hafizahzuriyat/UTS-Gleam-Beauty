import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const ProductPage(),
    const CartPage(),
    const ProfilePage(
        username: 'User123'), // Ganti 'User123' dengan username yang sesuai
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.deepPurple,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Keranjang',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}

// Halaman Produk
class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Produk Skincare'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio:
                2 / 3, // Atur aspect ratio agar kartu lebih pendek
          ),
          itemCount: 8, // Ganti dengan jumlah produk yang Anda inginkan
          itemBuilder: (context, index) {
            return ProductCard(
              name: 'Produk ${index + 1}',
              price: 'Rp${(index + 1) * 50000}',
            );
          },
        ),
      ),
    );
  }
}

// Kartu Produk
class ProductCard extends StatelessWidget {
  final String name;
  final String price;

  const ProductCard({
    super.key,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Ganti Image dengan Icon atau Container
          Container(
            height: 100, // Atur tinggi kontainer
            width: double.infinity,
            color: Colors.grey[300], // Latar belakang kontainer
            child: const Center(
              child: Icon(
                Icons.local_offer, // Ikon yang diinginkan
                size: 70, // Ukuran ikon
                color: Colors.deepPurple,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              price,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                // Tambahkan logika untuk tombol beli
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                minimumSize: const Size.fromHeight(30),
              ),
              child: const Text(
                'Beli',
                style: TextStyle(
                    color: Colors
                        .white), // Mengubah warna teks tombol menjadi putih
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Placeholder untuk halaman Keranjang
class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Keranjang'),
        backgroundColor: Colors.deepPurple,
      ),
      body: const Center(
        child: Text('Ini adalah halaman Keranjang'),
      ),
    );
  }
}

// Halaman Profil
class ProfilePage extends StatelessWidget {
  final String username;

  const ProfilePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Saya'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        // Menggunakan Center untuk menengahkan seluruh konten
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Menengahkan konten secara vertikal
          crossAxisAlignment:
              CrossAxisAlignment.center, // Menengahkan konten secara horizontal
          children: [
            Text(
              'Hai, $username!', // Warna teks ini akan tetap hitam
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Mengubah warna teks menjadi hitam
              ),
              textAlign: TextAlign.center, // Menengahkan teks
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
              ),
              child: const Text(
                'Change Username',
                style: TextStyle(
                    color: Colors
                        .white), // Mengubah warna teks tombol menjadi putih
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
              ),
              child: const Text(
                'Change Password',
                style: TextStyle(
                    color: Colors
                        .white), // Mengubah warna teks tombol menjadi putih
              ),
            ),
            const SizedBox(height: 10), // Jarak antar elemen
            ElevatedButton(
              onPressed: () {
                // Logika untuk pengaturan
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
              ),
              child: const Text(
                'Settings',
                style: TextStyle(
                    color: Colors
                        .white), // Mengubah warna teks tombol menjadi putih
              ),
            ),
            const SizedBox(height: 10), // Jarak antar elemen
            ElevatedButton(
              onPressed: () {
                // Logika untuk keluar
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
              ),
              child: const Text(
                'Logout',
                style: TextStyle(
                    color: Colors
                        .white), // Mengubah warna teks tombol menjadi putih
              ),
            ),
            // Tambahkan lebih banyak tombol sesuai kebutuhan
          ],
        ),
      ),
    );
  }
}
