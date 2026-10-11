import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/core/constant.dart';
import 'package:shop_app/core/data_sources/data_source_paths.dart';
import 'package:shop_app/core/internet_info.dart';
import 'package:shop_app/features/auth/bloc/email_text_bloc/email_text_bloc.dart';
import 'package:shop_app/features/auth/bloc/sign_in_loading/sign_in_loading_bloc.dart';
import 'package:shop_app/features/auth/bloc/sign_up_bloc/sign_up_bloc.dart';
import 'package:shop_app/features/auth/bloc/visible_password_bloc/visible_password_bloc.dart';
import 'package:shop_app/features/auth/models/user_model.dart';
import 'package:shop_app/features/auth/screens/splash_screen.dart';
import 'package:shop_app/features/checkout/cubit/checkout_cubit.dart';
import 'package:shop_app/features/drawer/cubit/drawer_cubit.dart';
import 'package:shop_app/features/home/bloc/discount/discount_products_bloc.dart';
import 'package:shop_app/features/main_navigation/cubit/main_page_cubit.dart';
import 'package:shop_app/features/main_navigation/main_page.dart';
import 'package:shop_app/features/orders/cubit/orders_cubit.dart';
import 'package:shop_app/features/product_details/cubit/product_cubit.dart';
import 'package:shop_app/features/profile/cubit/profile_cubit.dart';
import 'package:shop_app/features/search/cubit/search_cubit.dart';
import 'package:shop_app/features/shopping_bag/cubit/item_product_cubit/item_product_cubit.dart';
import 'package:shop_app/features/shopping_bag/cubit/products_cubit/products_cubit.dart';
import 'package:shop_app/features/wishlist/cubit/wishlist_cubit.dart';
import 'package:shop_app/injection.dart';
import 'package:sqflite/sqflite.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  // await Supabase.initialize(
  //   url: Constant.supabaseUrl,
  //   anonKey: Constant.supabaseAnonkey,
  // );
  init();
  bool isConnected = await InternetInfo.isConnected();
  if (isConnected) {
    await sl.get<DataSource>().updateDataBase();
    await sl.get<DataSource>().updateReviews();
    await sl.get<SharedPreferences>().setString(
      'lastUpdate',
      DateTime.now().millisecondsSinceEpoch.toString(),
    );
    log('done updating data');
  }
  SharedPreferences db = await SharedPreferences.getInstance();
  String? user = db.getString('currentUser');
  if (user != null) {
    Constant.currentUser = UserModel.fromJson(user);
  }
  String? baseUrl = db.getString('baseUrl');
  if (baseUrl == null) {
    baseUrl = await getDatabasesPath();
    db.setString('baseUrl', baseUrl);
    Constant.baseUrl = baseUrl;
  }

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => VisiblePasswordBloc()),
        BlocProvider(create: (context) => EmailTextBloc()),
        BlocProvider(create: (context) => SignUpBloc()),
        BlocProvider(create: (context) => SignInLoadingBloc()),
        BlocProvider(create: (context) => DiscountProductsBloc()),
        BlocProvider(create: (context) => SearchCubit()),
        BlocProvider(create: (context) => ProductCubit()),
        BlocProvider(create: (context) => MainPageCubit()),
        BlocProvider(create: (context) => OrdersCubit()),
        BlocProvider(create: (context) => ProfileCubit()),
        BlocProvider(create: (context) => AddToCartCubit()),
        BlocProvider(create: (context) => ItemProductCubit()),
        BlocProvider(create: (context) => CheckOutCubit()),
        BlocProvider(create: (context) => WishListCubit()),
        BlocProvider(create: (context) => DrawerCubit()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // debugInvertOversizedImages = true;
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      builder: (context, child) => MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.black,
          colorScheme: ColorScheme(
            brightness: Brightness.light,
            primary: Colors.black,
            onPrimary: Theme.of(context).colorScheme.onPrimary,
            secondary: Theme.of(context).colorScheme.secondary,
            onSecondary: Theme.of(context).colorScheme.onSecondary,
            error: Theme.of(context).colorScheme.error,
            onError: Theme.of(context).colorScheme.onError,
            surface: Theme.of(context).colorScheme.surface,
            onSurface: Theme.of(context).colorScheme.onSurface,
          ),
          scaffoldBackgroundColor: Colors.white,
        ),
        debugShowCheckedModeBanner: false,
        home: sl.get<SharedPreferences>().getBool('isFirstTime') == null
            ? SplashScreen(deviceHeight: 852.h, deviceWidth: 393.w)
            : const MainPage(),
      ),
    );
  }
}
