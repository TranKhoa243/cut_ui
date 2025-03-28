import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class FDiaLog extends StatelessWidget {
    String? title;
    String? subTitle;
    FDiaLog({super.key,this.title,this.subTitle});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Text(title??'Bạnc có chắc chắn muốn thực hiện hành động không?',style: const TextStyle(
                          fontSize: 16,
                          color: Color(0xff1E293B),
                          fontWeight: FontWeight.w700,
                          height: 24 / 16),
                        softWrap: true,),
                    ),
                  ],
                ),
              ),
              Gap(16),
              Text(title??'No action',style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xff1E293B),
                  height: 24 / 16),
                softWrap: true,),
              const Gap(16),

            ],
          ),
        ),
      ),
    );
  }
}
