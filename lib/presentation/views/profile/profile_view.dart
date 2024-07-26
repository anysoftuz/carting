import 'package:carting/assets/assets/icons.dart';
import 'package:carting/assets/assets/images.dart';
import 'package:carting/assets/colors/colors.dart';
import 'package:carting/presentation/routes/route_name.dart';
import 'package:carting/presentation/views/profile/call_view.dart';
import 'package:carting/presentation/views/profile/info_view.dart';
import 'package:carting/presentation/views/profile/lenguage_view.dart';
import 'package:carting/presentation/views/profile/quest_view.dart';
import 'package:carting/presentation/views/profile/theme_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        actions: [
          TextButton(
            onPressed: () {
              context.go(AppRouteName.auth);
            },
            child: Row(
              children: [
                AppIcons.leftIcon.svg(color: red),
                const SizedBox(width: 6),
                const Text(
                  "Chiqish",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: red,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              height: 80,
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 12, 0, 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: whiteSmoke,
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: blue.withOpacity(.5),
                    radius: 28,
                  ),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "R. Abdullaev",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "+998 91 008 43 48",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      context.push(AppRouteName.profileInfo);
                    },
                    icon: AppIcons.chevronRight.svg(),
                  )
                ],
              ),
            ),
            const SizedBox(height: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    color: whiteSmoke,
                    child: ListTile(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ThemeView(),
                        ));
                      },
                      contentPadding: EdgeInsets.zero,
                      leading: AppImages.theme.imgAsset(height: 32, width: 32),
                      title: const Text(
                        "Mavzu",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: AppIcons.chevronRight.svg(),
                    ),
                  ),
                  const Divider(height: 1),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    color: whiteSmoke,
                    child: ListTile(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const LenguageView(),
                        ));
                      },
                      contentPadding: EdgeInsets.zero,
                      leading: AppImages.lenguage.imgAsset(
                        height: 32,
                        width: 32,
                      ),
                      title: const Text(
                        "Til",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: AppIcons.chevronRight.svg(),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Column(
                children: [
                  WListTile(
                    title: "Ko’p so’raladigan savollar",
                    leadingImage: AppImages.quest,
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const QuestView(),
                      ));
                    },
                  ),
                  const Divider(height: 1),
                  WListTile(
                    title: "Ilovani baholang",
                    leadingImage: AppImages.ballOrder,
                    onTap: () {},
                  ),
                  const Divider(height: 1),
                  WListTile(
                    title: "Qo’llab-quvvatlash markazi",
                    leadingImage: AppImages.callCentr,
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const CallView(),
                      ));
                    },
                  ),
                  const Divider(height: 1),
                  WListTile(
                    title: "Biz haqimizda",
                    leadingImage: AppImages.info,
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const InfoView(),
                      ));
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class WListTile extends StatelessWidget {
  const WListTile({
    super.key,
    required this.title,
    required this.leadingImage,
    required this.onTap,
    this.trailing,
  });
  final String title;
  final String leadingImage;
  final Function() onTap;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      color: whiteSmoke,
      child: ListTile(
        onTap: onTap,
        contentPadding: EdgeInsets.zero,
        leading: leadingImage.imgAsset(height: 32, width: 32),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: trailing ?? AppIcons.chevronRight.svg(),
      ),
    );
  }
}
