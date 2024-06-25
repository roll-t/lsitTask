import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list/core/configs/colors.dart';
import 'package:list/core/configs/dime.dart';
import 'package:list/features/list/list_controller.dart';

class ListPage extends GetView<ListController> {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const _BuildAppBar(),
      body: _BuildBody(
        controller: controller,
      ),
    );
  }
}

class _BuildBody extends StatelessWidget {
  const _BuildBody({required this.controller});

  final ListController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppDime.space4, vertical: AppDime.space2),
        child: Column(
          children: [
            _BuildHeadList(),
            GetBuilder<ListController>(
                id: "fetchMainList",
                builder: (_) {
                  return !controller.showMainList.value
                      ? const SizedBox()
                      : _BuildBodyList(quantityItem: 4);
                })
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Column _BuildBodyList({required int quantityItem}) {
    return Column(
      children: [
        for (var i = 1; i <= quantityItem; i++)
          _BuildItemsList(
            controller: controller,
            idList: '$i',
            numberChilid: Random().nextInt(6) + 1,
          ),
      ],
    );
  }

  // ignore: non_constant_identifier_names
  Container _BuildHeadList() {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.semiPrimary,
          borderRadius: BorderRadius.circular(AppDime.radius2)),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppDime.space1, vertical: AppDime.space1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                controller.showMainList.value = controller.toggleList(
                    idList: "fetchMainList",
                    state: controller.showMainList.value);
              },
              child: Row(
                children: [
                  Obx(() {
                    return Icon(
                      controller.showMainList.value
                          ? Icons.arrow_drop_down
                          : Icons.arrow_drop_up,
                      size: 35,
                    );
                  }),
                  const Icon(
                    Icons.folder,
                    color: AppColors.primary,
                  ),
                  const SizedBox(
                    width: AppDime.space1,
                  ),
                  const Text(
                    "Chọn thư mục lưu trữ câu hỏi",
                    style: TextStyle(
                        color: AppColors.primary,
                        fontSize: AppDime.textSize16,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.add_circle,
              color: AppColors.primary,
              size: 35,
            )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class _BuildItemsList extends StatelessWidget {
  _BuildItemsList(
      {required this.controller,
      required this.idList,
      required this.numberChilid});

  final int numberChilid;
  final ListController controller;
  final String idList;
  final double sizeIconsDropDownBox = 30.0;
  bool showChildList = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: AppDime.space1, bottom: AppDime.space1, top: AppDime.space2),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: AppColors.black.withOpacity(.2), width: 1))),
            padding: const EdgeInsets.only(bottom: AppDime.space2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    showChildList = controller.toggleList(
                        idList: "fetchListchild$idList", state: showChildList);
                  },
                  child: Row(
                    children: [
                      SizedBox(
                          width: sizeIconsDropDownBox,
                          child: GetBuilder<ListController>(
                            id: "fetchListchild$idList",
                            builder: (_) {
                              return Icon(
                                showChildList
                                    ? Icons.arrow_drop_down
                                    : Icons.arrow_drop_up,
                                size: 35,
                              );
                            },
                          )),
                      Text(
                        "Thư mục con thứ ${idList.toString()} (${numberChilid.toString()})",
                        style: const TextStyle(
                            fontSize: AppDime.textSize14,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                _BuildActionIcons(id:" Thư mục con thứ ${idList.toString()} (${numberChilid.toString()})"),
              ],
            ),
          ),
          GetBuilder<ListController>(
              id: "fetchListchild$idList",
              builder: (_) {
                return showChildList
                    ? Column(
                        children: [
                          for (var i = 1; i <= numberChilid; i++)
                            _buildDropDownItem(i, i + i)
                        ],
                      )
                    : const SizedBox();
              }),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Row _BuildActionIcons({required String id}) {
    return Row(
      children: [
        const Icon(
          Icons.edit_square,
          size: 24,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Icon(
            Icons.delete,
            size: 24,
          ),
        ),
        SizedBox(
            width: 20,
            height: 20,
            child: GetBuilder<ListController>(
              id: id,
              builder: (_) {
                return Radio(
                  value: controller.valueRadiobox,
                  groupValue: id,
                  onChanged: (value) {
                    controller.valueRadiobox = id;
                    if(controller.behindId!=""){
                       controller.update([controller.behindId]);
                    }
                    controller.update([id]);
                    controller.behindId=controller.valueRadiobox;
                  },
                  focusColor: AppColors.primary,
                  activeColor: AppColors.primary,
                  autofocus: false,
                );
              },
            )),
      ],
    );
  }

  Padding _buildDropDownItem(int index, int quantityItemSave) {
    return Padding(
      padding: EdgeInsets.only(
          left: AppDime.space1 + sizeIconsDropDownBox, top: AppDime.space2),
      child: Container(
        padding: const EdgeInsets.only(bottom: AppDime.space2),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: 1, color: AppColors.black.withOpacity(.2)))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(
                  "Phần tử lưu trữ $index (${quantityItemSave.toString()})",
                  style: const TextStyle(
                      fontSize: AppDime.textSize14,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            _BuildActionIcons(id: "Phần tử lưu trữ $index (${quantityItemSave.toString()})"),
          ],
        ),
      ),
    );
  }
}

class _BuildAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _BuildAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const Padding(
        padding: EdgeInsets.only(left: 10),
        child: Icon(Icons.arrow_back_ios),
      ),
      title: const Text(
        "Chọn nơi lưu câu hỏi",
        style: TextStyle(color: AppColors.black, fontWeight: FontWeight.w600),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}

