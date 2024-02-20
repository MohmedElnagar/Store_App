import 'package:advance_notification/advance_notification.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/features/home/data/app_data.dart';
import 'package:shop_app/features/home/data/model/base_model.dart';

class AddToCard {
  static void addtocard(BaseModel baseModel, BuildContext context) {
    bool cantains = itemOncard.contains(baseModel);
    if (cantains == true) {
      const AdvanceSnackBar(
              message: 'You have added this item to card before',
              duration: Duration(seconds: 5),
              bgColor: Colors.red,
              textSize: 14,
              mode: Mode.ADVANCE)
          .show(context);
    } else {
      itemOncard.add(baseModel);
      const AdvanceSnackBar(
              message: 'Successfully added to your card',
              duration: Duration(seconds: 5),
              bgColor: Colors.blueAccent,
              textSize: 14,
              mode: Mode.ADVANCE)
          .show(context);
    }
  }
}
