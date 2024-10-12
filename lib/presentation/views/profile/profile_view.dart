import 'package:carting/assets/assets/icons.dart';
import 'package:carting/assets/colors/colors.dart';
import 'package:carting/presentation/routes/route_name.dart';
import 'package:carting/presentation/views/profile/call_view.dart';
import 'package:carting/presentation/views/profile/info_view.dart';
import 'package:carting/presentation/views/profile/quest_view.dart';
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
        actions: [
          IconButton(
            onPressed: () {
              context.push(AppRouteName.notification);
            },
            icon: AppIcons.notifications.svg(),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16).copyWith(top: 0),
        child: Column(
          children: [
            SizedBox(
              height: 300,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    height: 260,
                    width: double.infinity,
                    padding: const EdgeInsets.fromLTRB(12, 12, 12, 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      color: white,
                    ),
                    child: Column(
                      children: [
                        const Spacer(),
                        const Text(
                          "Asror Imomqulov",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Text(
                          "+998 99 844 13 54",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 24),
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  context.push(AppRouteName.profileInfo);
                                },
                                child: Container(
                                  height: 84,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24),
                                    color: scaffoldSecondaryBackground,
                                  ),
                                  padding: const EdgeInsets.all(12),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      AppIcons.user.svg(),
                                      const Text(
                                        "Shaxsiy ma'lumotlar",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const CallView(),
                                  ));
                                },
                                child: Container(
                                  height: 84,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24),
                                    color: scaffoldSecondaryBackground,
                                  ),
                                  padding: const EdgeInsets.all(12),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      AppIcons.support.svg(),
                                      const Text(
                                        "Qo'llab quvvatlash",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const QuestView(),
                                  ));
                                },
                                child: Container(
                                  height: 84,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24),
                                    color: scaffoldSecondaryBackground,
                                  ),
                                  padding: const EdgeInsets.all(12),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      AppIcons.question.svg(),
                                      const Text(
                                        "Ko'p beriladigan savollar",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const Positioned(
                    top: 0,
                    child: Hero(
                      tag: "avatar",
                      child: CircleAvatar(radius: 56),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            WListTile(
              title: "Sozlamalar",
              leading: AppIcons.setting.svg(height: 28, width: 28),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const QuestView(),
                ));
              },
            ),
            const SizedBox(height: 8),
            WListTile(
              title: "Ilovani baholang",
              leading: AppIcons.lovely.svg(height: 28, width: 28),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const QuestView(),
                ));
              },
            ),
            const SizedBox(height: 8),
            WListTile(
              title: "Mavzu",
              leading: AppIcons.moon.svg(height: 28, width: 28),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const QuestView(),
                ));
              },
            ),
            const SizedBox(height: 8),
            WListTile(
              title: "Til",
              leading: AppIcons.language.svg(height: 28, width: 28),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const QuestView(),
                ));
              },
            ),
            const SizedBox(height: 8),
            WListTile(
              title: "Biz haqimizda",
              leading: AppIcons.info.svg(height: 28, width: 28),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const InfoView(),
                ));
              },
            ),
            const SizedBox(height: 8),
            WListTile(
              title: "Chiqish",
              leading: AppIcons.turnOff.svg(height: 28, width: 28),
              onTap: () {
                context.go(AppRouteName.auth);
              },
            ),
            const SizedBox(height: 8),
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
    required this.leading,
    required this.onTap,
    this.trailing,
  });
  final String title;
  final Widget leading;
  final Function() onTap;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: white,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListTile(
        onTap: onTap,
        contentPadding: EdgeInsets.zero,
        minVerticalPadding: 0,
        leading: leading,
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
