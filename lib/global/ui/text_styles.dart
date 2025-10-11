import 'package:flutter/material.dart';

abstract class TextStyles {
  // Heading
  static const TextStyle headingH1ExtraBold = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w800,
    fontFamily: 'Inter',
  );
  static const TextStyle headingH2ExtraBold = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w800,
    fontFamily: 'Inter',
  );
  static const TextStyle headingH3ExtraBold = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w800,
    fontFamily: 'Inter',
  );
  static const TextStyle headingH4Bold = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    fontFamily: 'Inter',
  );
  static const TextStyle headingH5Bold = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    fontFamily: 'Inter',
  );

  // Body
  static const TextStyle bodyXlRegular = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.normal,
    fontFamily: 'Inter',
  );
  static const TextStyle bodyLRegular = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    fontFamily: 'Inter',
  );
  static const TextStyle bodyMRegular = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    fontFamily: 'Inter',
  );
  static const TextStyle bodySRegular = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    fontFamily: 'Inter',
  );
  static const TextStyle bodyXsMedium = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    fontFamily: 'Inter',
  );

  // Action
  static const TextStyle actionLSemiBold = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    fontFamily: 'Inter',
  );
  static const TextStyle actionMSemiBold = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    fontFamily: 'Inter',
  );
  static const TextStyle actionSSemiBold = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w600,
    fontFamily: 'Inter',
  );

  // Caption
  static const TextStyle captionMSemiBold = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w600,
    fontFamily: 'Inter',
  );
}
