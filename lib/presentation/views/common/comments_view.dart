import 'package:animated_rating_bar/widgets/animated_rating_bar.dart';
import 'package:carting/assets/assets/icons.dart';
import 'package:carting/assets/colors/colors.dart';
import 'package:carting/data/models/advertisement_model.dart';
import 'package:carting/l10n/localizations.dart';
import 'package:carting/presentation/widgets/custom_text_field.dart';
import 'package:carting/presentation/widgets/w_button.dart';
import 'package:flutter/material.dart';

class CommentsView extends StatefulWidget {
  const CommentsView({super.key, required this.comments});
  final List<Comment> comments;

  @override
  State<CommentsView> createState() => _CommentsViewState();
}

class _CommentsViewState extends State<CommentsView> {
  final ValueNotifier<double> ratingInfo = ValueNotifier(0);
  late TextEditingController controller;
  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.comments)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  AnimatedRatingBar(
                    activeFillColor:
                        Theme.of(context).colorScheme.inversePrimary,
                    strokeColor: Colors.green,
                    initialRating: 0,
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    animationColor: Colors.red,
                    onRatingUpdate: (rating) {
                      debugPrint(rating.toString());
                      ratingInfo.value = rating;
                    },
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    title: AppLocalizations.of(context)!.description,
                    hintText: 'O‘z fikringizni yozib qoldiring!',
                    noHeight: true,
                    minLines: 5,
                    maxLines: 6,
                    expands: false,
                    controller: controller,
                  ),
                  const SizedBox(height: 16),
                  WButton(
                    onTap: () {},
                    text: 'Publikatsiya qilish',
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ],
          body: ListView.separated(
            itemBuilder: (context, index) => Column(
              children: [
                Row(
                  children: [
                    const CircleAvatar(),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.comments[index].createdBy,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            widget.comments[index].createdAt,
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ...List.generate(
                      5,
                      (index) => (index + 1) <= widget.comments[index].rating
                          ? AppIcons.star.svg()
                          : AppIcons.star.svg(
                              color: dark.withValues(alpha: .2),
                            ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  widget.comments[index].commentText,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            separatorBuilder: (context, index) => const SizedBox(height: 24),
            itemCount: widget.comments.length,
          ),
        ),
      ),
    );
  }
}
