import 'package:carting/app/advertisement/advertisement_bloc.dart';
import 'package:carting/assets/assets/icons.dart';
import 'package:carting/data.dart';
import 'package:carting/presentation/views/announcements/announcement_create_view.dart';
import 'package:carting/presentation/views/auto_repair/masters_list_view.dart';
import 'package:carting/presentation/widgets/w_shimmer.dart';
import 'package:carting/utils/enum_filtr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class MastersTypeView extends StatefulWidget {
  const MastersTypeView({super.key, this.isCreate = false});
  final bool isCreate;

  @override
  State<MastersTypeView> createState() => _MastersTypeViewState();
}

class _MastersTypeViewState extends State<MastersTypeView> {
  @override
  void initState() {
    context.read<AdvertisementBloc>().add(GetTransportSpecialists());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ustalar")),
      body: BlocBuilder<AdvertisementBloc, AdvertisementState>(
        builder: (context, state) {
          if (state.statusFuels.isInProgress) {
            return ListView.separated(
              itemBuilder: (context, index) => const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: WShimmer(
                  height: 60,
                  width: double.infinity,
                ),
              ),
              separatorBuilder: (context, index) => const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Divider(),
              ),
              itemCount: AppData.mastersType.length,
            );
          }
          return ListView.separated(
            itemBuilder: (context, index) => ListTile(
              title: Text(state.transportSpecialists[index].name),
              subtitle: Text(state.transportSpecialists[index].majority),
              trailing: AppIcons.arrowForward.svg(),
              onTap: () {
                final bloc = context.read<AdvertisementBloc>();
                if (widget.isCreate) {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => BlocProvider.value(
                      value: bloc,
                      child: AnnouncementCreateView(
                        filter: TypeOfServiceEnum.masters,
                        carId: state.transportSpecialists[index].id,
                      ),
                    ),
                  ));
                } else {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => BlocProvider.value(
                      value: bloc,
                      child: MastersListView(
                        title: state.transportSpecialists[index].name,
                        id: state.transportSpecialists[index].id,
                      ),
                    ),
                  ));
                }
              },
            ),
            separatorBuilder: (context, index) => const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Divider(height: 1),
            ),
            itemCount: state.transportSpecialists.length,
          );
        },
      ),
    );
  }
}
