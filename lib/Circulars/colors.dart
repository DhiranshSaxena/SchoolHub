import 'package:flutter/material.dart';
import 'dart:ui';

const appOrange = const Color(0xFFFB8C00);
const primaryAppColor= Colors.black12;

const primaryColor = const Color(0xFFFF5252);
const primaryLight = const Color(0xFFFF5252);
const primaryDark = const Color(0xFFFF5252);

const secondaryColor = const Color(0xFFFF5252);
const secondaryLight = const Color(0xFFFF5252);
const secondaryDark = const Color(0xFFFF5252);

const Color gradientStart = const Color(0xFF485563);
const Color gradientEnd = const Color(0xFF29323C);

const primaryGradient = const LinearGradient(
  colors: const [gradientStart, gradientStart, gradientEnd],
  stops: const [0.0,0.5 ,1.0],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

const chatBubbleGradient = const LinearGradient(
  colors: const [Color(0xFFFD60A3), Color(0xFFFF5252)],
  begin: Alignment.topRight,
  end: Alignment.bottomLeft,
);

const chatBubbleGradient2 = const LinearGradient(
  colors: const [Color(0xFFf4e3e3), Color(0xFFf4e3e3)],
  begin: Alignment.topRight,
  end: Alignment.bottomLeft,
);