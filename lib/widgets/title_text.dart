import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleText extends StatelessWidget {
  final String text;
  final Color? textColor;
  final TextAlign? align;
  final FontWeight? weight;
  final String? fontFamily;
  final double? size;

  const TitleText({
    Key? key,
    required this.text,
    this.textColor,
    this.align,
    this.weight,
    this.fontFamily,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: GoogleFonts.getFont(
        fontFamily ?? 'Rubik',
        fontSize: size,
        fontWeight: weight,
        color: textColor,
      ),
    );
  }
}
