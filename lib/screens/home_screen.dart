import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meet/utils/colors.dart';
import 'package:meet/widgets/home_meeting_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;
  onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Meet & Chat'),
        centerTitle: true,
        backgroundColor: backgroundColor,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HomeMeetingButton(
                text: 'New Meeting',
                icon: Icons.videocam,
                onPressed: () => {},
              ),
              HomeMeetingButton(
                text: 'Jpin Meeting',
                icon: Icons.add_box_rounded,
                onPressed: () => {},
              ),
              HomeMeetingButton(
                text: 'Schedule',
                icon: Icons.calendar_today,
                onPressed: () => {},
              ),
              HomeMeetingButton(
                text: 'Share Screen',
                icon: Icons.arrow_upward_rounded,
                onPressed: () => {},
              ),
            ],
          ),
          const Expanded(
            child: Center(
              child: Text('Create/Join meetings with just a click!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18
              ),),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: footerColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: onPageChanged,
        currentIndex: _page,
        type: BottomNavigationBarType.fixed,
        unselectedFontSize: 14,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.comment_bank),
            label: 'Meet & chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lock_clock),
            label: 'Meeting',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Contacts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'Meet & chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.comment_bank),
            label: 'Meet & chat',
          ),
        ],
      ),
    );
  }
}
