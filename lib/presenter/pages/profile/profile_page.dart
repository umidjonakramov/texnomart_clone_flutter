import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:texnomart_clone_flutter/presenter/pages/maplist/map_list_page.dart';
import 'package:texnomart_clone_flutter/utils/profile.dart';

import '../branch/branchs_screen.dart';
import '../map/mapScreen.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
                child: Row(
                  children: [
                    Icon(Icons.person_2_outlined, size: 24),
                    SizedBox(
                      width: 5,
                    ),
                    Text('Umidjon Akramov'),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.chevron_right,
                      size: 18,
                    )
                  ],
                ),
              ),
              Card(
                color: Colors.white,
                child: Column(
                  children: [
                    ProfileCard(
                        icon: Icons.timelapse,
                        data: 'Mening muddatli to`lovlarim'),
                    ProfileCard(icon: Icons.percent, data: 'Aksiya'),
                    ProfileCard(
                        icon: Icons.favorite_border_outlined,
                        data: 'Sevimlilar'),
                    ProfileCard(icon: Icons.balance, data: 'Taqqoslash'),
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Card(
                color: Colors.white,
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) =>  const BranchScreen()));
                      },
                      child: ProfileCard(
                          icon: Icons.location_on_outlined,
                          data: 'Shahar tanlash'),
                    ),
                    ProfileCard(icon: Icons.language, data: 'Ilova tili')
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Card(
                color: Colors.white,
                child: Column(
                  children: [
                    ProfileCard(icon: Icons.remove_red_eye, data: 'Ko`rildi'),
                    ProfileCard(
                        icon: Icons.add_card, data: 'Mening bonusli kartam')
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Card(
                color: Colors.white,
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  const MapListPage()));
                      },
                      child: ProfileCard(
                          icon: Icons.shopping_bag_outlined,
                          data: 'Bizning do`konlarimiz'),
                    ),
                    ProfileCard(
                        icon: Icons.support_agent_outlined,
                        data: 'Qo`llab-quvvatlash markazi'),
                    ProfileCard(icon: Icons.info_outline, data: 'Ma`lumot'),
                    ProfileCard(
                        icon: Icons.phone_android_outlined,
                        data: 'Ilova haqida'),
                    ProfileCard(icon: Icons.logout_outlined, data: 'Chiqish'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
