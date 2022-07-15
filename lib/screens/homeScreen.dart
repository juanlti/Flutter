import 'dart:math';

import 'package:flutter/material.dart';

import 'background.dart';
import 'card_table.dart';
import 'customBottonNavigation.dart';
import 'pageTitle.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavigationBar(),
      body: Stack(
        children: const [
          Background(),
          Positioned(top: -100, left: -20, child: BoxPink()),
          _HomeBody(),
        ],
      ),
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      reverse: true,
      child: Column(
        children: const [
          //Scrren superior and botton
          pageTitle(),
          //cards
          CardTable(),
        ],
      ),
    );
  }
}

class BoxPink extends StatelessWidget {
  const BoxPink({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -pi / 5,
      child: Container(
        height: 360,
        width: 360,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(80),
          color: Colors.red,
        ),
      ),
    );
  }
}
