import 'package:carting/app/auth/auth_bloc.dart';
import 'package:carting/infrastructure/core/context_extension.dart';
import 'package:carting/l10n/localizations.dart';
import 'package:carting/presentation/routes/route_name.dart';
import 'package:carting/presentation/views/announcements/create_info_view.dart';
import 'package:carting/utils/my_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import 'package:carting/app/advertisement/advertisement_bloc.dart';
import 'package:carting/assets/assets/icons.dart';
import 'package:carting/presentation/views/announcements/announcements_type_view.dart';
import 'package:carting/presentation/views/announcements/widgets/announcements_iteam.dart';
import 'package:carting/presentation/views/common/filter_view.dart';
import 'package:carting/presentation/views/home/deliver_info_view.dart';
import 'package:carting/presentation/widgets/custom_text_field.dart';
import 'package:carting/presentation/widgets/w_button.dart';
import 'package:carting/presentation/widgets/w_shimmer.dart';
import 'package:carting/presentation/widgets/w_tabbar.dart';
import 'package:go_router/go_router.dart';

class AnnouncementsView extends StatefulWidget {
  const AnnouncementsView({super.key});

  @override
  State<AnnouncementsView> createState() => _AnnouncementsViewState();
}

class _AnnouncementsViewState extends State<AnnouncementsView>
    with SingleTickerProviderStateMixin {
  String selectedUnit = 'Barchasi';
  String selectedUnit2 = 'Barchasi';

  late TabController _tabController;
  ValueNotifier<int> tabIndex = ValueNotifier(0);

  @override
  void initState() {
    context.read<AdvertisementBloc>().add(GetAdvertisementsEvent());
    context.read<AdvertisementBloc>().add(GetAdvertisementsProvideEvent());
    context.read<AdvertisementBloc>().add(GetAdvertisementsReceiveEvent());
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
    _tabController.addListener(() {
      tabIndex.value = _tabController.index;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
              builder: (context) => const FilterView(),
            ));
          },
          icon: AppIcons.filter.svg(color: context.color.iron),
        ),
        title: Text(AppLocalizations.of(context)!.announcements),
        bottom: PreferredSize(
          preferredSize: const Size(double.infinity, 72),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
            child: CustomTextField(
              prefixIcon: AppIcons.searchNormal.svg(color: context.color.iron),
              hintText: AppLocalizations.of(context)!.searchAnnouncement,
            ),
          ),
        ),
        actions: [
          ValueListenableBuilder(
            valueListenable: tabIndex,
            builder: (context, value, __) {
              return AnimatedCrossFade(
                firstChild: WButton(
                  onTap: () {
                    if (value == 2) {
                      MyFunction.authChek(
                        context: context,
                        onTap: () {
                          final bloc = context.read<AdvertisementBloc>();
                          Navigator.of(context, rootNavigator: true)
                              .push(MaterialPageRoute(
                            builder: (context) => AnnouncementsTypeView(
                              bloc: bloc,
                            ),
                          ));
                        },
                        isFull: true,
                      );
                    } else if (value == 1) {
                      context.go(AppRouteName.home);
                    }
                  },
                  height: 40,
                  width: 40,
                  borderRadius: 12,
                  child: AppIcons.addCircle.svg(),
                ),
                secondChild: const SizedBox(),
                alignment: Alignment.center,
                crossFadeState: value == 0
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                duration: const Duration(milliseconds: 200),
                reverseDuration: const Duration(milliseconds: 200),
              );
            },
          ),
          const SizedBox(width: 12),
        ],
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  WTabBar(
                    isScrollable: true,
                    tabController: _tabController,
                    tabs: [
                      Text(AppLocalizations.of(context)!.all),
                      Text(AppLocalizations.of(context)!.myOrders),
                      Text(AppLocalizations.of(context)!.myServices),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
        body: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state.status == AuthenticationStatus.unauthenticated) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  spacing: 16,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppIcons.emptyFile.svg(),
                    Text(AppLocalizations.of(context)!.register),
                    WButton(
                      onTap: () {
                        context.go(AppRouteName.auth);
                      },
                      text: AppLocalizations.of(context)!.enter,
                    ),
                    const SizedBox(height: 60)
                  ],
                ),
              );
            }
            return TabBarView(
              controller: _tabController,
              children: [
                BlocBuilder<AdvertisementBloc, AdvertisementState>(
                  builder: (context, state) {
                    if (state.status.isInProgress) {
                      return ListView.separated(
                        padding: const EdgeInsets.all(16).copyWith(bottom: 100),
                        itemBuilder: (context, index) => const WShimmer(
                          height: 152,
                          width: double.infinity,
                        ),
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 16),
                        itemCount: 12,
                      );
                    }
                    return RefreshIndicator.adaptive(
                      onRefresh: () async {
                        context
                            .read<AdvertisementBloc>()
                            .add(GetAdvertisementsEvent());
                        Future.delayed(Duration.zero);
                      },
                      child: ListView.separated(
                        padding: const EdgeInsets.all(16).copyWith(bottom: 100),
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            final bloc = context.read<AdvertisementBloc>();
                            Navigator.of(context, rootNavigator: true)
                                .push(MaterialPageRoute(
                              builder: (context) => BlocProvider.value(
                                value: bloc,
                                child: DeliverInfoView(
                                  model: state.advertisement[index],
                                  isMe: false,
                                ),
                              ),
                            ));
                          },
                          child: AnnouncementsIteam(
                            isPrice: true,
                            model: state.advertisement[index],
                          ),
                        ),
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 16),
                        itemCount: state.advertisement.length,
                      ),
                    );
                  },
                ),
                BlocBuilder<AdvertisementBloc, AdvertisementState>(
                  builder: (context, state) {
                    if (state.statusRECEIVE.isInProgress) {
                      return ListView.separated(
                        padding: const EdgeInsets.all(16).copyWith(bottom: 100),
                        itemBuilder: (context, index) => const WShimmer(
                          height: 152,
                          width: double.infinity,
                        ),
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 16),
                        itemCount: 12,
                      );
                    }
                    return RefreshIndicator.adaptive(
                      onRefresh: () async {
                        context
                            .read<AdvertisementBloc>()
                            .add(GetAdvertisementsReceiveEvent());
                        Future.delayed(Duration.zero);
                      },
                      child: ListView.separated(
                        padding: const EdgeInsets.all(16).copyWith(bottom: 100),
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            final bloc = context.read<AdvertisementBloc>();
                            Navigator.of(context, rootNavigator: true)
                                .push(MaterialPageRoute(
                              builder: (context) => BlocProvider.value(
                                value: bloc,
                                child: DeliverInfoView(
                                  model: state.advertisementRECEIVE[index],
                                ),
                              ),
                            ));
                          },
                          child: AnnouncementsIteam(
                            model: state.advertisementRECEIVE[index],
                          ),
                        ),
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 16),
                        itemCount: state.advertisementRECEIVE.length,
                      ),
                    );
                  },
                ),
                BlocBuilder<AdvertisementBloc, AdvertisementState>(
                  builder: (context, state) {
                    if (state.statusPROVIDE.isInProgress) {
                      return ListView.separated(
                        padding: const EdgeInsets.all(16).copyWith(bottom: 100),
                        itemBuilder: (context, index) => const WShimmer(
                          height: 152,
                          width: double.infinity,
                        ),
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 16),
                        itemCount: 12,
                      );
                    }
                    return RefreshIndicator.adaptive(
                      onRefresh: () async {
                        context
                            .read<AdvertisementBloc>()
                            .add(GetAdvertisementsProvideEvent());
                        Future.delayed(Duration.zero);
                      },
                      child: ListView.separated(
                        padding: const EdgeInsets.all(16).copyWith(bottom: 100),
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            final bloc = context.read<AdvertisementBloc>();
                            Navigator.of(context, rootNavigator: true)
                                .push(MaterialPageRoute(
                              builder: (context) => BlocProvider.value(
                                value: bloc,
                                child: CreateInfoView(
                                  model: state.advertisementPROVIDE[index],
                                ),
                              ),
                            ));
                          },
                          child: AnnouncementsIteam(
                            model: state.advertisementPROVIDE[index],
                          ),
                        ),
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 16),
                        itemCount: state.advertisementPROVIDE.length,
                      ),
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
