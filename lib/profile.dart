import 'package:flutter/material.dart';
import 'settings.dart';
import 'login.dart'; // Pastikan file login.dart diimport

class Profile extends StatelessWidget {
  const Profile({super.key});

  void _onMenuSelected(BuildContext context, String option) {
    switch (option) {
      case 'Change Username':
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Change Username selected')),
        );
        break;
      case 'Change Password':
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Change Password selected')),
        );
        break;
      case 'Privacy Settings':
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Privacy Settings selected')),
        );
        break;
      case 'Notifications':
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Notifications selected')),
        );
        break;
      case 'Logout':
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const Login()),
          (route) => false,
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Setting(),
                ),
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          // Latar belakang gambar
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/BE.jpeg'), // Path gambar latar belakang
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
                // Foto Profil, Nama Pengguna, dan PopupMenu
                Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage(
                          'assets/images/profile.jpeg'), // Gunakan AssetImage untuk gambar lokal
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Expanded(
                                child: Text(
                                  'Bunga Aliyya',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white, // Warna teks
                                  ),
                                ),
                              ),
                              PopupMenuButton<String>(
                                onSelected: (option) =>
                                    _onMenuSelected(context, option),
                                itemBuilder: (BuildContext context) => [
                                  const PopupMenuItem(
                                    value: 'Change Username',
                                    child: Text('Change Username'),
                                  ),
                                  const PopupMenuItem(
                                    value: 'Change Password',
                                    child: Text('Change Password'),
                                  ),
                                  const PopupMenuItem(
                                    value: 'Privacy Settings',
                                    child: Text('Privacy Settings'),
                                  ),
                                  const PopupMenuItem(
                                    value: 'Notifications',
                                    child: Text('Notifications'),
                                  ),
                                  const PopupMenuItem(
                                    value: 'Logout',
                                    child: Text('Logout'),
                                  ),
                                ],
                                icon: const Icon(
                                  Icons.settings,
                                  color: Colors.white, // Warna ikon
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'Penulis | Book Lover',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white, // Warna teks
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'Pengikut: 1200',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white, // Warna teks
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Bio Pengguna
                const Text(
                  'Tentang Saya:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Warna teks
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Perkenalkan saya Bunga Aliyya Lestari, dengan NIM 22552011244. '
                  'Saya dari kelas TIF RP 22 CID',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white, // Warna teks
                  ),
                ),
                const SizedBox(height: 20),

                // Daftar Cerita Pengguna
                const Text(
                  'Cerita Saya:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Warna teks
                  ),
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: ListView(
                    children: const [
                      ProfileStoryCard(
                        title: 'Langgeng',
                        description: 'Baru aja mau move on, eh malah dijodohin',
                        status: 'Published',
                      ),
                      ProfileStoryCard(
                        title: 'Feel Blue',
                        description: 'Dia itu seperti air, aku tidak bisa tanpanya, tapi aku juga bisa mati karenanya.',
                        status: 'Draft',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Card untuk setiap cerita yang dipublikasikan atau dalam draf
class ProfileStoryCard extends StatelessWidget {
  final String title;
  final String description;
  final String status;

  const ProfileStoryCard({
    super.key,
    required this.title,
    required this.description,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Text(description),
        trailing: Chip(
          label: Text(status),
          backgroundColor: status == 'Published' ? Colors.green : Colors.orange,
        ),
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Opening $title')),
          );
        },
      ),
    );
  }
}
