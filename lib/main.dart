import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Audio Player',
      home: AudioPlayerScreen(),
    );
  }
}

class AudioPlayerScreen extends StatefulWidget {
  const AudioPlayerScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AudioPlayerScreenState createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  AudioPlayer audioPlayer = AudioPlayer();

  String audioUrl =
      "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3";
  IconData playBtn = Icons.play_arrow;

  void playAudio() async {
    int result = await audioPlayer.play(audioUrl);
    if (result == 1) {
      setState(() {
        playBtn = Icons.pause;
      });
    }
  }

  void pauseAudio() async {
    int result = await audioPlayer.pause();
    if (result == 1) {
      setState(() {
        playBtn = Icons.play_arrow;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    audioPlayer.stop();
    audioPlayer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Audio Player'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(playBtn),
              iconSize: 50.0,
              onPressed: () {
                if (playBtn == Icons.play_arrow) {
                  playAudio();
                } else {
                  pauseAudio();
                }
              },
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Click the button to play/pause the audio',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
