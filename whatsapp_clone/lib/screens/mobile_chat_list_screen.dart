import 'package:flutter/material.dart';
import 'package:whatsapp_clone/colors.dart';
import 'package:whatsapp_clone/widgets/chat_list.dart';

class MobileChatListScreen extends StatelessWidget {
  final String name;
  const MobileChatListScreen({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          name,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.video_call,
              color: Colors.grey,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.call,
              color: Colors.grey,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
              color: Colors.grey,
            ),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("backgroundImage.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const Expanded(
              child: ChatList(),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                decoration: InputDecoration(
                  fillColor: mobileChatBoxColor,
                  filled: true,
                  prefixIcon: const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Icon(
                      Icons.emoji_emotions,
                      color: Colors.grey,
                    ),
                  ),
                  suffixIcon: const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.camera_alt,
                          color: Colors.grey,
                        ),
                        Icon(
                          Icons.attach_file,
                          color: Colors.grey,
                        ),
                        Icon(
                          Icons.money,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                  hintText: 'Type a message here',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  contentPadding: const EdgeInsets.all(10),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
