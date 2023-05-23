import 'package:flutter/material.dart';

class AppBottomSheet {
  static Future<void> showCustomsheet(BuildContext context,
      {required Widget widget}) async {
    await showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        isScrollControlled: true,
        isDismissible: true,
        builder: (BuildContext context) {
          return DraggableScrollableSheet(
              initialChildSize: 0.93, //set this as you want
              maxChildSize: 0.93, //set this as you want
              minChildSize: 0.93, //set this as you want
              expand: false,
              builder: (context, scrollController) {
                return widget; //whatever you're returning, does not have to be a Container
              });
        });
  }
}
