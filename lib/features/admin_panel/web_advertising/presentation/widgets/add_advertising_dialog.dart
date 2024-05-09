import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:dtmtest/common/custom_textfield.dart';
import 'package:dtmtest/common/enums/bloc_status.dart';
import 'package:dtmtest/common/enums/edit_add.dart';
import 'package:dtmtest/common/extentions.dart';
import 'package:dtmtest/common/gradient_button.dart';
import 'package:dtmtest/common/res/dialog_mixin.dart';
import 'package:dtmtest/common/ui.dart';
import 'package:dtmtest/core/widgets/custom_network_image.dart';
import 'package:dtmtest/features/admin_panel/web_advertising/data/models/advertising_model.dart';
import 'package:dtmtest/features/admin_panel/web_advertising/presentation/bloc/bloc/web_advertising_bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddAdvertisingDialog extends StatefulWidget {
  const AddAdvertisingDialog({
    super.key,
    required this.editAdd,
    this.advertisingModel,
  });

  final EditAdd editAdd;
  final AdvertisingModel? advertisingModel;

  @override
  State<AddAdvertisingDialog> createState() => _AddAdvertisingDialogState();
}

class _AddAdvertisingDialogState extends State<AddAdvertisingDialog>
    with DialogMixin {
  final titleController = TextEditingController();

  final linkController = TextEditingController();

  final desciptionController = TextEditingController();
  Widget? image;
  Uint8List? byte;
  String? fileName;

  @override
  void initState() {
    super.initState();
    if (widget.advertisingModel != null) {
      titleController.text = widget.advertisingModel?.title ?? '';
      linkController.text = widget.advertisingModel?.link ?? '';
      desciptionController.text = widget.advertisingModel?.description ?? '';
      image = CustomNetworkImage(networkImage: widget.advertisingModel?.image);
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(widget.editAdd == EditAdd.add ? "Add advertising" : "Edit"),
          IconButton(
            onPressed: () => context.maybePop(),
            icon: const Icon(Icons.close),
          ),
        ],
      ),
      backgroundColor: ColorName.white,
      content: SizedBox(
        width: size.width * .25,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Image"),
            10.h,
            GestureDetector(
              onTap: () async {
                FilePickerResult? result =
                    await FilePicker.platform.pickFiles();

                if (result?.files.single.bytes != null) {
                  byte = result!.files.single.bytes;
                  image = Image.memory(byte!);
                  fileName = result.files.single.name;
                  setState(() {});
                }
              },
              child: Container(
                width: 100,
                height: 100,
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: ColorName.grey,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: image,
              ),
            ),
            20.h,
            const Text("Title"),
            10.h,
            CustomTextField(
              controller: titleController,
              backgroundColor: ColorName.backgroundColor,
              hintText: "title",
              leading: const Padding(
                padding: EdgeInsets.only(left: 25, right: 10),
                child: Icon(Icons.search),
              ),
              borderColor: Colors.transparent,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 25, vertical: 17),
            ),
            20.h,
            const Text("Description"),
            10.h,
            CustomTextField(
              controller: desciptionController,
              backgroundColor: ColorName.backgroundColor,
              hintText: "Description",
              leading: const Padding(
                padding: EdgeInsets.only(left: 25, right: 10),
                child: Icon(Icons.search),
              ),
              borderColor: Colors.transparent,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 25, vertical: 17),
            ),
            20.h,
            const Text("Link"),
            10.h,
            CustomTextField(
              controller: linkController,
              backgroundColor: ColorName.backgroundColor,
              hintText: "Link",
              leading: const Padding(
                padding: EdgeInsets.only(left: 25, right: 10),
                child: Icon(Icons.search),
              ),
              borderColor: Colors.transparent,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 25, vertical: 17),
            ),
            20.h,
            BlocConsumer<WebAdvertisingBloc, WebAdvertisingState>(
              listenWhen: (previous, current) {
                if (widget.editAdd == EditAdd.add) {
                  return previous.addNewadvertisingStatus !=
                      current.addNewadvertisingStatus;
                } else {
                  return previous.editAdvertisingStatus !=
                      current.editAdvertisingStatus;
                }
              },
              listener: (context, state) {
                if (state.addNewadvertisingStatus.isComplated ||
                    state.editAdvertisingStatus.isComplated) {
                  context.maybePop();
                  showSnackBar(context, text: "Success");
                } else if (state.addNewadvertisingStatus == BlocStatus.failed ||
                    state.editAdvertisingStatus == BlocStatus.failed) {
                  showSnackBar(context, text: "Error");
                }
              },
              builder: (context, state) {
                return GradientButton(
                  radius: 20,
                  isLoading: state.addNewadvertisingStatus.isProgress ||
                      state.editAdvertisingStatus.isProgress,
                  onPressed: () {
                    if (desciptionController.text.isNotEmpty &&
                        linkController.text.isNotEmpty &&
                        titleController.text.isNotEmpty &&
                        widget.editAdd == EditAdd.add &&
                        byte != null) {
                      context.read<WebAdvertisingBloc>().add(
                            AddNewAdvertising(
                              fileName: fileName ?? "",
                              byte: byte!,
                              advertisingModel: AdvertisingModel(
                                description: desciptionController.text,
                                link: linkController.text,
                                title: titleController.text,
                              ),
                            ),
                          );
                    } else if (widget.editAdd == EditAdd.edit) {
                      context.read<WebAdvertisingBloc>().add(
                            EditAdvertisingEvent(
                              byte: byte,
                              fileName: fileName,
                              advertisingModel: AdvertisingModel(
                                id: widget.advertisingModel?.id,
                                description: desciptionController.text,
                                link: linkController.text,
                                title: titleController.text,
                                image: widget.advertisingModel?.image,
                              ),
                            ),
                          );
                    } else {
                      showSnackBar(context, text: "Some fields are empty");
                    }
                  },
                  text: widget.editAdd == EditAdd.add ? "Add" : "Update",
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
