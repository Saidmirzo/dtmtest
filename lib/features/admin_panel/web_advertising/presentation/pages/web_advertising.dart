import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dtmtest/common/costomaizable.dart';
import 'package:dtmtest/common/enums/bloc_status.dart';
import 'package:dtmtest/common/enums/edit_add.dart';
import 'package:dtmtest/common/extentions.dart';
import 'package:dtmtest/common/gradient_button.dart';
import 'package:dtmtest/common/res/dialog_mixin.dart';
import 'package:dtmtest/common/ui.dart';
import 'package:dtmtest/features/admin_panel/web_advertising/data/models/advertising_model.dart';
import 'package:dtmtest/features/admin_panel/web_advertising/presentation/bloc/bloc/web_advertising_bloc.dart';
import 'package:dtmtest/features/admin_panel/widgets/custom_table_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class WebAdvrtisingPage extends StatefulWidget {
  const WebAdvrtisingPage({super.key});

  @override
  State<WebAdvrtisingPage> createState() => _WebAdvrtisingPageState();
}

class _WebAdvrtisingPageState extends State<WebAdvrtisingPage>
    with DialogMixin {
  @override
  void initState() {
    super.initState();
    context.read<WebAdvertisingBloc>().add(GetAllAdvertisingEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
          boxShadow: [AppShadow.defShadow],
          borderRadius: BorderRadius.circular(30),
          color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: 110,
                child: GradientButton(
                  replaceTextVSIcon: true,
                  radius: 50,
                  onPressed: () {
                    addAdvertisingDialog(context, EditAdd.add);
                  },
                  text: "Add",
                  icon: Assets.icons.add.svg(),
                ),
              )
            ],
          ),
          10.h,
          Expanded(
            child: BlocConsumer<WebAdvertisingBloc, WebAdvertisingState>(
              listener: (context, state) {
                if (state.getAllAdvertisingStatus == BlocStatus.failed) {
                  showSnackBar(context, text: "Error");
                }
              },
              builder: (context, state) {
                if (state.getAllAdvertisingStatus.isProgress) {
                  return UI.spinner();
                }
                final List<AdvertisingModel> listAdvertising =
                    state.listAdvertising ?? [];
                final TextStyle tableTextStyle = AppTextStyles.body14w4;
                return CustomTable(
                  columnNames: const [
                    '№',
                    'Image',
                    'Title',
                    'Description',
                    'Link',
                    ''
                  ],
                  columnList: List.generate(
                    listAdvertising.length,
                    (index) => [
                      Text((index + 1).toString(), style: tableTextStyle),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: ColorName.backgroundColor,
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                            image: CachedNetworkImageProvider(
                              state.listAdvertising?[index].image ?? '',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: CachedNetworkImage(
                          imageUrl: listAdvertising[index].image ?? "",
                        ),
                      ),
                      Text(
                        listAdvertising[index].title ?? 'Unk',
                        style: tableTextStyle,
                      ),
                      Text(
                        listAdvertising[index].description ?? 'Unk',
                        style: tableTextStyle,
                      ),
                      Text(
                        listAdvertising[index].link ?? 'Unk',
                        style: tableTextStyle,
                      ),
                    ],
                  ),
                  onDelete: (index) {
                    context.read<WebAdvertisingBloc>().add(
                          DeleteAdvertisingEvent(
                            id: listAdvertising[index].id ?? '',
                          ),
                        );
                  },
                  onEdit: (index) {
                    addAdvertisingDialog(
                      context,
                      EditAdd.edit,
                      advertisingModel: listAdvertising[index],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
