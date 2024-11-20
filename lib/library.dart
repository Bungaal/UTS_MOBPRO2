import 'package:flutter/material.dart';

class Library extends StatelessWidget {
  // Daftar novel yang akan ditampilkan di library
  final List<Map<String, String>> libraryBooks = [
    {
      'image': 'assets/images/LB.jpeg',
      'title': 'Not Your Princess ',
      'author': 'Killmill77',
      'status': 'Completed',
    },
    {
      'image': 'assets/images/LB2.jpeg',
      'title': 'ESPOIR',
      'author': 'Wayan ',
      'status': 'In Progress',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Tambahkan gambar latar belakang
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/BE.jpeg'), // Gambar latar belakang
            fit: BoxFit.cover, // Membuat gambar memenuhi seluruh layar
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.3), // Warna overlay untuk gelap
              BlendMode.darken, // Mode blending
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Tambahkan tanda "Perpustakaan" di atas
              const Text(
                'Perpustakaan',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Ubah warna teks agar terlihat jelas
                ),
              ),
              const SizedBox(height: 20), // Jarak antara header dan konten
              Expanded(
                child: ListView.builder(
                  itemCount: libraryBooks.length,
                  itemBuilder: (context, index) {
                    final book = libraryBooks[index];
                    return LibraryBookCard(book: book);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LibraryBookCard extends StatelessWidget {
  final Map<String, String> book;

  const LibraryBookCard({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            book['image']!, // Gunakan Image.asset untuk memuat gambar lokal
            width: 60,
            height: 80,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          book['title']!,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          '${book['author']} \nStatus: ${book['status']}',
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
        isThreeLine: true,
        trailing: IconButton(
          icon: const Icon(Icons.remove_circle_outline),
          onPressed: () {
            // Logika untuk menghapus buku dari library
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('${book['title']} removed from library')),
            );
          },
        ),
      ),
    );
  }
}
