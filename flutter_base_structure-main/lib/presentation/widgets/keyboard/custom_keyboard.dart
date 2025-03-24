import 'package:flutter_svg/svg.dart';

import '../../base/base_page_mixin.dart';
import 'keyboard_key.dart';

class CustomKeyboard extends StatefulWidget {
  CustomKeyboard({Key? key, required this.onTextChange}) : super(key: key);
  Function onTextChange;

  @override
  CustomKeyboardState createState() => CustomKeyboardState();
}

class CustomKeyboardState extends State<CustomKeyboard> {
  late List<List<dynamic>> keys;
  late String amount;

  @override
  void initState() {
    super.initState();
    keys = [
      ['1', '2', '3'],
      ['4', '5', '6'],
      ['7', '8', '9'],
      [
        '',
        '0',
        SvgPicture.asset(
          AppImages.icKeyboardDelete,
        )
      ],
    ];
    amount = '';
  }

  resetKeyBoard(){
    setState(() {
      amount = '';
    });
  }

  onKeyTap(val) {
    if (amount.length < 6) {
      setState(() {
        amount = amount + val;
        widget.onTextChange(amount);
      });
    }
  }

  onBackspacePress() {
    if (amount.isEmpty) {
      return;
    }
    setState(() {
      amount = amount.substring(0, amount.length - 1);
      widget.onTextChange(amount);
    });
  }

  renderKeyboard() {
    return keys.map(
          (x) => Row(
            children: x.map(
              (y) {
                return Expanded(
                  child: KeyboardKey(
                    label: y,
                    value: y,
                    onTap: (val) {
                      if (val is Widget) {
                        onBackspacePress();
                      } else {
                        onKeyTap(val);
                      }
                    },
                  ),
                );
              },
            ).toList(),
          ),
        ).toList();
  }

  renderAmount() {
    String display = 'Enter Phone Number';
    TextStyle style = const TextStyle(
      fontSize: 30.0,
      fontWeight: FontWeight.bold,
      color: Colors.grey,
    );

    if (amount.isNotEmpty) {
      // NumberFormat f = NumberFormat('#,###');
      display = amount;
      // display = f.format(int.parse(amount));
      style = style.copyWith(
        color: Colors.black,
      );
    }

    return Center(
      child: Text(
        display,
        style: style,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
      color: const Color(0xFFD1D5DB),
      child: Column(
        children: [
          // renderAmount(),
          ...renderKeyboard(),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
