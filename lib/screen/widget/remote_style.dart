import 'package:crypto_ui_web/constant/color.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RemoteStyle{
  static Widget remoteText(String hintText, TextEditingController textController){
    return TextField(
      controller: textController,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: AppColors.black, height: 1.1),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        hintText: hintText,
        hintStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.grey1, height: 1.5),
        fillColor: AppColors.mint_light,
        filled: true,
        border: const OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.all(Radius.circular(10))),
        focusedBorder: const OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.all(Radius.circular(10))),
        enabledBorder: const OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
    );
  }

  static Widget remoteDropdown(List<String> itemList, RxString selectedItem){
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        barrierColor: Colors.transparent,
        dropdownStyleData: DropdownStyleData(
          elevation: 0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            border: Border.all(color: AppColors.grey2, width: 1),
          ),
          // width: 200,
          offset: const Offset(0, 44),
          direction: DropdownDirection.left,
          padding: const EdgeInsets.all(0),
        ),
        menuItemStyleData: MenuItemStyleData(
          height: 45,
          padding: const EdgeInsets.all(0),
          overlayColor: WidgetStateProperty.all(
            Colors.transparent,
          ),
        ),
        iconStyleData: const IconStyleData(
          iconDisabledColor: Colors.transparent,
          iconEnabledColor: Colors.transparent,
        ),
        customButton: Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              border: Border.all(color: AppColors.grey2, width: 1),
            ),
            // color: Colors.transparent,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(() => Text(selectedItem.value,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.black, height: 1.1),
                )),
                Image.asset(
                  'assets/images/ic_arrow_down.png',
                  width: 16,
                  height: 16,
                  color: AppColors.grey2,
                ),
              ],
            ),
          ),
        ),
        items: itemList
            .map((item) => DropdownMenuItem<String>(
          value: item,
          child: Column(
            children: [
              if (item != itemList.first)
                Container(
                    height: 1.5,
                    color: AppColors.grey2
                ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      item,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.black),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ))
            .toList(),
        onChanged: (value) async {
          selectedItem.value = value as String;
          // controller.selectedUnitCode.value = value as String;
          // selectedValue = value as String;
          // if (selectedValue == controller.routineAddText) {
          //   controller.popUpSelectRoutineType();
          // } else if (selectedValue == controller.editMealTimeText) {
          //   controller.editMealTime();
          // }
        },
      ),
    );
  }
}
