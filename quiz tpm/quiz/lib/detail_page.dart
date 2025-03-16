import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final Map<String, String> post;
  const DetailPage({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Civitas')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(post['id']!, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(post['text']!),
            const SizedBox(height: 16),
            post['id'] == '123210000'
                ? Image.network(
                    'https://via.placeholder.com/150',
                    errorBuilder: (context, error, stackTrace) {
                      return const Row(
                        children: [
                          Icon(Icons.error, color: Colors.red),
                          SizedBox(width: 8),
                          Text('Gambar gagal dimuat'),
                        ],
                      );
                    },
                  )
                : Container(),
            const SizedBox(height: 16),
            Row(
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_upward)),
                const Text('10K'),
                IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_downward)),
                const Text('5K'),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: const [
                  ListTile(title: Text('123210131'), subtitle: Text('Iya sih sangat mewah banget, siapa sih ini?')),
                  ListTile(title: Text('123210111'), subtitle: Text('Engga Cuy, Sekarang udah ada lift.')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}