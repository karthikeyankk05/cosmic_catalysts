import 'package:flutter/material.dart';
import 'package:rocket/utils/constant/rocket_color.dart';

class MessageBar extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;

  const MessageBar({
    super.key,
    required this.controller,
    required this.onSend,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(width: 1.0, color: RocketColor.primary),
              ),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {}, // Add emoji functionality here
                      icon: const Icon(Icons.emoji_emotions_outlined)),
                  Flexible(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        minHeight: 20.0,
                        maxHeight: 135.0,
                      ),
                      child: Scrollbar(
                        child: TextField(
                          controller: controller,
                          cursorColor: Colors.white,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 5),
                            hintText: "Message",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {}, // Add attachment functionality here
                      icon: const Icon(Icons.attach_file)),
                  IconButton(
                      onPressed: () {}, // Add camera functionality here
                      icon: const Icon(Icons.camera_alt_outlined)),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          IconButton(
              style: IconButton.styleFrom(
                  backgroundColor: RocketColor.primary),
              onPressed: onSend, // Call the send function
              icon: Icon(
                Icons.send,
                color: Colors.white,
              )),
        ],
      ),
    );
  }
}
