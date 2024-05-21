import 'package:flutter/material.dart';

class Profile_screen extends StatelessWidget {
  const Profile_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).viewPadding.top;
    return Scaffold(
      backgroundColor: Color(0x010310),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(-statusBarHeight),
        child: Container(),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0,30,0,0),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF282a57).withOpacity(0.5), Colors.black],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileAppBar(),
                SizedBox(height: 60),
                ProfileHeader(),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  child: ProfileOptionsList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BackButtonWidget(),
        SizedBox(width: 60),
        ProfileTitle(),
      ],
    );
  }
}

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0,50,0,0),
      child: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        iconSize: 30,
        onPressed: () {
          Navigator.pop(context);
        },
        color: Colors.orange,
      ),
    );
  }
}

class ProfileTitle extends StatelessWidget {
  const ProfileTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0,50,0,0),
      child: Text(
        'Profile',
        style: TextStyle(
          color: Colors.white,
          fontSize: 50,
          fontWeight: FontWeight.bold,
          fontFamily: 'Matrix',
        ),
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF193548),
            Color(0xFF203A43),
            Color(0xFF2C5364),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/avatar.png'),
            radius: 30,
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'John Doe',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'User Info',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ProfileOptionsList extends StatelessWidget {
  const ProfileOptionsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProfileOptionButton(
          title: 'Language',
          icon: Icons.language,
          color: Colors.green,
          onPressed: () {},
        ),
        SizedBox(height: 20),
        ProfileOptionButton(
          title: 'Trasnsaction',
          icon: Icons.list_outlined,
          color: Colors.orangeAccent,
          onPressed: () {
            Navigator.pushNamed(context, '/Transaction_History_screen');
          },
        ),
        SizedBox(height: 20),
        ProfileOptionButton(
          title: 'Log Out',
          icon: Icons.exit_to_app,
          color: Colors.red,
          onPressed: () {},
        ),
      ],
    );
  }
}


class ProfileOptionButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPressed;
  final Color? color;

  const ProfileOptionButton({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPressed,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 24,
          ),
          SizedBox(width: 10),
          Text(
            title,
            style: TextStyle(
              color: color ?? Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
      ),
    );
  }
}


