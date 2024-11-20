import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String username;

  HomeScreen({super.key, required this.username});

  // Daftar data untuk setiap kategori
  final List<Map<String, String>> recommendation = [
    {'image': 'assets/images/RC.jpeg', 'category': 'Teenfiction'},
    {'image': 'assets/images/RC2.jpeg', 'category': 'Fiksi'},
    {'image': 'assets/images/RC3.jpeg', 'category': 'Romance'},
  ];

  final List<Map<String, String>> bestSeller = [
    {'image': 'assets/images/B1.jpeg', 'category': 'Romance', 'readers': '10.M'},
    {'image': 'assets/images/B2.jpeg', 'category': 'Fiksi Remaja', 'readers': '11.8M'},
  ];

  // Widget untuk menampilkan kategori cerita
  Widget buildCategory(String title, List<Map<String, String>> novels, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ),
        SizedBox(
          height: 320, // Disesuaikan untuk menampung gambar dan teks
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: novels.length,
            itemBuilder: (context, index) {
              final novel = novels[index];
              return GestureDetector(
                child: Container(
                  width: 150,
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                        child: Image.asset(
                          novel['image']!,
                          height: 210,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.orange.shade300,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            novel['category']!,
                            style: const TextStyle(
                              fontSize: 10,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      // Add icons and readers count for Best Seller category
                      if (novels == bestSeller) 
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.visibility,
                                    size: 16,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    novel['readers']!,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pilihan Terbaik Untukmu"),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/BE.jpeg'), // Replace with your image path
            fit: BoxFit.cover, // This will make the image cover the entire screen
            colorFilter: ColorFilter.mode(const Color.fromARGB(255, 255, 255, 255).withOpacity(0.3), BlendMode.darken), // Optional: to add a dark overlay
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildCategory('Recommendation', recommendation, context),
                SizedBox(height: 10),
                buildCategory('Best Seller', bestSeller, context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
