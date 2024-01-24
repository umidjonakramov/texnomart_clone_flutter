import 'package:flutter/material.dart';import 'package:flutter_bloc/flutter_bloc.dart';import 'package:flutter_svg/flutter_svg.dart';import 'package:loading_animation_widget/loading_animation_widget.dart';import 'package:page_transition/page_transition.dart';import '../dashboard/dashboard_page.dart';import 'bloc/splash_bloc.dart';class SplashPage extends StatelessWidget {  const SplashPage({super.key});  @override  Widget build(BuildContext context) {    return Scaffold(      backgroundColor: const Color(0xFFfbc100),      body: BlocProvider(        create: (context) => SplashBloc()..add(SplashInitialEvent()),        child: BlocConsumer<SplashBloc, SplashState>(          listener: (context, state) {            if (state is SplashInitialState) {              Navigator.pushReplacement(                  context,                  PageTransition(                      type: PageTransitionType.fade,                      child: const DashboardPage(currentPage: 0)));            }          },          builder: (context, state) {            return Stack(              children: [                Align(                  alignment: Alignment.center,                  child: Padding(                    padding: const EdgeInsets.symmetric(horizontal: 100),                    child: SvgPicture.asset(                      'assets/icons/logo_tm.svg',                      fit: BoxFit.fitWidth,                      width: MediaQuery.of(context).size.width,                    ),                  ),                ),                Align(                  alignment: Alignment.bottomCenter,                  child: Padding(                      padding: const EdgeInsets.symmetric(vertical: 70),                      child: LoadingAnimationWidget.twoRotatingArc(                        color: Colors.white,                        size: 30,                      )),                )              ],            );          },        ),      ),    );  }}