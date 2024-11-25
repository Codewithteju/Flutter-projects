import 'package:flutter/material.dart';
import 'package:whatsapp_clone/colors.dart';
import 'package:whatsapp_clone/widgets/contacts_list.dart';

class MobileScreenLayout extends StatelessWidget {
  const MobileScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "WhatsApp",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: false,
          elevation: 0,
          backgroundColor: appBarColor,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
            )
          ],
          bottom: const TabBar(
              indicatorColor: tabColor,
              indicatorWeight: 4,
              labelColor: tabColor,
              unselectedLabelColor: Colors.grey,
              labelStyle: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              tabs: [
                Tab(
                  text: "CHATS",
                ),
                Tab(
                  text: "STATUS",
                ),
                Tab(
                  text: "CALLS",
                )
              ]),
        ),
        body: const ContactsList(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: tabColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: const Icon(
            Icons.comment,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
