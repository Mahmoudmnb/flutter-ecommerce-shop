import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:shop_app/features/auth/bloc/auth_bloc.dart';
import 'package:shop_app/features/auth/widgets/auth_widgets.dart';

class AlternativeSignIn extends StatelessWidget {
  const AlternativeSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpBlocState>(
      builder: (context, state) {
        bool isSignUp = false;
        if (state is SignUpBlocInitial) {
          isSignUp = true;
        } else if (state is IsSignUp) {
          isSignUp = state.isSignUp;
        }
        return Column(
          children: [
            SizedBox(height: 9.h),
            HideItem(
              maxHight: 25.5.h,
              visabl: !isSignUp,
              child: GestureDetector(
                onTap: () {},
                child: Center(
                  child: Text(
                    'Or sign In with',
                    style: TextStyle(
                      fontFamily: 'DM Sans',
                      color: Colors.black.withValues(alpha: 0.6),
                      fontSize: 10.sp,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 25.h),
            HideItem(
              maxHight: 100.h,
              visabl: !isSignUp,
              child: Padding(
                padding: EdgeInsets.only(bottom: 42.5.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SocialButton(
                      onTap: () {},
                      imageUrl: 'assets/images/linkedin_logo.png',
                    ),
                    SocialButton(
                      onTap: () {},
                      imageUrl: 'assets/images/google_logo.png',
                    ),
                    SocialButton(
                      onTap: () {},
                      imageUrl: 'assets/images/facebook_logo.png',
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

// Comment
