import 'package:flutter/material.dart';
import 'package:whatsapp_clone/colors.dart';
import 'package:whatsapp_clone/widgets/chat_list.dart';
import 'package:whatsapp_clone/widgets/contacts_list.dart';
import 'package:whatsapp_clone/widgets/web_chat_appbar.dart';
import 'package:whatsapp_clone/widgets/web_profile_bar.dart';
import 'package:whatsapp_clone/widgets/web_search_bar.dart';

class WebScreenLayout extends StatelessWidget {
  const WebScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        // appBar: AppBar(
        //   title: const Text(
        //     "WhatsApp",
        //     style: TextStyle(
        //       fontSize: 20,
        //       fontWeight: FontWeight.bold,
        //     ),
        //   ),
        //   centerTitle: false,
        //   backgroundColor: backgroundColor,
        //   actions: [
        //     IconButton(
        //       onPressed: () {},
        //       icon: const Icon(
        //         Icons.search,
        //         color: Colors.white,
        //       ),
        //     ),
        //     IconButton(
        //       onPressed: () {},
        //       icon: const Icon(
        //         Icons.more_vert,
        //         color: Colors.white,
        //       ),
        //     )
        //   ],
        // ),
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //Web Profile Bar
            const Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    WebProfileBar(),
                    WebSearchBar(),
                    ContactsList(),
                  ],
                ),
              ),
            ),

            Container(
              width: MediaQuery.of(context).size.width * 0.75,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('backgroundImage.png'),
                ),
              ),
              child: Column(
                children: [
                  const WebChatAppbar(),
                  const Expanded(child: ChatList()),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.07,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: dividerColor,
                        ),
                      ),
                      color: chatBarMessage,
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.emoji_emotions_outlined,
                            color: Colors.grey,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.attach_file,
                            color: Colors.grey,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 15),
                            child: TextField(
                              decoration: InputDecoration(
                                fillColor: searchBarColor,
                                filled: true,
                                hintText: 'Type a message here',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                                contentPadding: const EdgeInsets.only(left: 20),
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.mic,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
