import 'package:flutter/material.dart';

class Explore extends StatelessWidget {
  // Daftar genre untuk kategori
  final List<String> genres = [
    'Fantasy', 'Romance', 'Horror',
  ];

  // Daftar gambar untuk genre
  final List<String> genreImages = [
    'assets/images/Fantasy.jpeg',  // Gambar untuk Fantasy
    'assets/images/Romance.jpeg',  // Gambar untuk Romance
    'assets/images/Horor.jpeg',   // Gambar untuk Horror
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Gambar latar belakang umum
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/BE.jpeg'), // Path gambar latar belakang umum
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Konten halaman
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Search Bar
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Search for novels...',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.8), // Transparansi latar belakang
                  ),
                ),
                SizedBox(height: 15),

                // Kategori Genre
                Text(
                  'Select Genre',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Warna teks
                  ),
                ),
                SizedBox(height: 10),

                // GridView untuk menampilkan kategori genre
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, // Tiga kolom
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                    ),
                    itemCount: genres.length,
                    itemBuilder: (context, index) {
                      return GenreCard(
                        genre: genres[index],
                        image: genreImages[index],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Widget untuk menampilkan genre dengan gambar latar belakang
class GenreCard extends StatelessWidget {
  final String genre;
  final String image;

  const GenreCard({super.key, required this.genre, required this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: InkWell(
        onTap: () {
          // Logika untuk memilih genre
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Selected: $genre')),
          );
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Gambar latar belakang untuk genre
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.asset(
                image,  // Menampilkan gambar berdasarkan genre
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            // Overlay transparan untuk memastikan teks terlihat
            Container(
              color: Colors.black.withOpacity(0.4), // Transparansi hitam untuk memastikan teks jelas
            ),
            // Teks genre di tengah
            Center(
              child: Text(
                genre,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Warna teks putih agar kontras dengan gambar
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
