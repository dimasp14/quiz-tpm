import 'package:flutter/material.dart';
import 'detail_page.dart';
import 'profile_page.dart';

class HomePage extends StatefulWidget {
  final String username;
  const HomePage({super.key, required this.username});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Map<String, String>> posts = [
    {'id': '123210131', 'text': 'Hari Ini Mokel Ga ya??'},
    {'id': '123210131', 'text': 'Kok UKT MAHAL BANGET SIH?'},
    {'id': '123210000', 'text': 'UKT ELIT FASILITAS SULIT'},
    {'id': '123210000', 'text': 'IF 98 NIM 10 KOK CAKEP BANGET, Single GA YA???'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Civitas')),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              return PostTile(post: posts[index]);
            },
          ),
          ProfilePage(username: widget.username),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

class PostTile extends StatelessWidget {
  final Map<String, String> post;
  const PostTile({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(post['text']!),
      subtitle: Text(post['id']!),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailPage(post: post)),
        );
      },
    );
  }
}
