import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list/colors.dart';
import 'package:list/controller.dart';
import 'package:list/dime.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class ListApp extends GetView<ListController> {
  ListApp({super.key});

  @override
  final ListController controller = Get.put(ListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const _BuildAppBar(),
      body: _BuildBody(
        controller: controller,
      ),
      bottomNavigationBar: const MyBottomNavBar(),
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
                _BuildActionIcons(),
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
  Row _BuildActionIcons() {
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
          child: Radio(
            value: "hello",
            groupValue: "hello",
            onChanged: (value) {},
            focusColor: AppColors.primary,
            activeColor: AppColors.primary,
            autofocus: false,
          ),
        ),
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
            _BuildActionIcons(),
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

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(1000), color: Colors.redAccent),
      child: const GNav(
        color: Colors.grey,
        backgroundColor: Colors.transparent,
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        tabBorderRadius: 15,
        activeColor: Colors.white,
        mainAxisAlignment: MainAxisAlignment.center,
        tabs: [
          GButton(icon: Icons.home),
          GButton(icon: Icons.favorite),
          GButton(icon: Icons.search),
        ],
      ),
    );
  }
}
