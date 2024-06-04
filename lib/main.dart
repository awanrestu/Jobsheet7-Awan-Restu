import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    title: 'JOBSHEET 7 AWAN',
    theme: ThemeData(
      primarySwatch: Colors.green,
    ),
    home: Scaffold(
      appBar: AppBar(
        title: const Text(
          'JOBSHEET 7 AWAN',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 19, 212, 183), // Harmonized background color
        elevation: 10,
      ),
      body: const StateTeksUtama(),
    ),
  ));
}

class StateTeksUtama extends StatefulWidget {
  const StateTeksUtama({super.key});

  @override
  _StateTeksUtamaState createState() => _StateTeksUtamaState();
}

class _StateTeksUtamaState extends State<StateTeksUtama> with SingleTickerProviderStateMixin {
  final List<String> listNama = [
    'Awan Restu Listyanto',
    'Deni Setiadi',
    'Yusuf Jauhar A.',
    'Latif Kamaludin',
    'Arif Ardi Antoro'
  ];
  final List<String> listNIM = [
    'STI202102395',
    'STI202102464',
    'STI202102390',
    'STI202102264',
    'STI202102246'
  ];
  final List<Color> listWarna = [
    Colors.cyan,
    Colors.purple,
    Colors.amber,
    Colors.brown,
    Colors.pink // Adjusted to match better
  ];

  int currentIndex = 0;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  void changeName() {
    setState(() {
      currentIndex = (currentIndex + 1) % listNama.length;
    });
    _controller.forward(from: 0.0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Color getRandomColor() {
    final random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Color.fromARGB(255, 0, 150, 136), Color.fromARGB(255, 3, 169, 244)],
        ),
      ),
      child: Center(
        child: FadeTransition(
          opacity: _animation,
          child: Container(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: const Color.fromARGB(200, 255, 255, 255), // Lightened the container color
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 10,
                   offset: Offset.fromDirection(-15, -51), // Adjusted shadow offset for a more natural look
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  listNama[currentIndex],
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: listWarna[currentIndex],
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'NIM: ${listNIM[currentIndex]}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: changeName,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 0, 150, 136),
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                    textStyle: const TextStyle(fontSize: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    side: const BorderSide(
                      color: Colors.white24, // Border color
                      width: 2.0, // Border width
                    ),
                  ),
                  child: const Text(
                    'Ganti Nama',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
