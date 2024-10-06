import 'package:flutter/material.dart';
import 'package:rocket/features/rocket/chatbot/exoplanet_service.dart';
import 'package:rocket/features/rocket/chatbot/widgets/message_bar.dart';
import 'package:rocket/features/rocket/chatbot/widgets/single_message_container.dart';

class Chatbot extends StatefulWidget {
  const Chatbot({super.key});

  @override
  _ChatbotState createState() => _ChatbotState();
}

class _ChatbotState extends State<Chatbot> {
  final List<Map<String, dynamic>> messages = [];
  final TextEditingController _controller = TextEditingController();
  final ExoplanetService _exoplanetService = ExoplanetService();

  void _sendMessage() {
    final String text = _controller.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        messages.add({'text': text, 'user': true});
      });

      // Check if the user input is a number for exoplanet details
      final int? index = int.tryParse(text);
      if (index != null && index > 0) {
        // Get the exoplanet corresponding to the number
        final exoplanets = _exoplanetService.fetchExoplanets();
        if (index <= exoplanets.length) {
          final exoplanetDetails = _exoplanetService.getExoplanetDetails(exoplanets[index - 1].name);
          messages.add({'text': exoplanetDetails, 'user': false});
        } else {
          messages.add({'text': 'There is no exoplanet with that number. Please specify a number between 1 and ${exoplanets.length}.', 'user': false});
        }
      } else if (text.toLowerCase() == 'exoplanet') {
        // Get the list of exoplanets
        final exoplanets = _exoplanetService.fetchExoplanets();

        // Create a formatted list of exoplanets with numbering
        final exoplanetNames = exoplanets.asMap().entries.map((entry) {
          int index = entry.key + 1; // +1 to start numbering from 1
          String name = entry.value.name;
          return '$index. $name';
        }).join('\n');

        messages.add({
          'text': 'Exoplanets:\n$exoplanetNames',
          'user': false,
        });
      } else {
        // Get exoplanet details if the name is specified
        final responseText = _exoplanetService.getExoplanetDetails(text);
        messages.add({'text': responseText, 'user': false});
      }

      _controller.clear();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Exoplanet Chatbot")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return SingleMessageContainer(
                  text: messages[index]['text'],
                  user: messages[index]['user'],
                );
              },
            ),
          ),
          MessageBar(
            controller: _controller,
            onSend: _sendMessage,
          ),
        ],
      ),
    );
  }
}
