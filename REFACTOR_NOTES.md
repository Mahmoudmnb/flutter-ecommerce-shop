# Refactor Summary

## Architecture Before

The app used a feature-based structure, but most application features were nested under `lib/featurs/main_page/featurs/`. The `main_page` folder mixed the authenticated navigation shell, feature screens, and a shared data layer. Folder names were inconsistent across `pages`, `screen`, `widget`, `model`, `blocs`, and `cubits`, and several files had spelling mistakes.

## Architecture After

The app keeps the same feature-based architecture and state-management approach, but the feature folders are now flattened under `lib/features/`. Shared Appwrite/SQLite data-source code was moved to `lib/core/data_sources/`. The authenticated shell now lives in `lib/features/main_navigation/`, and the Google Maps address picker now lives in `lib/features/maps/`.

## Files Renamed

- `lib/featurs/auth/data.dart` -> `lib/features/auth/auth_view_data.dart`  
  Clarifies that this file stores static auth screen copy/assets.
- `lib/featurs/auth/widgets/switch_between_two_text_wiht_rotatoin.dart` -> `lib/features/auth/widgets/switch_between_two_text_with_rotation.dart`  
  Fixes spelling.
- `lib/featurs/auth/blocs/auth_blocs.dart` -> `lib/features/auth/bloc/auth_bloc.dart`  
  Renames the auth BLoC barrel file and normalizes the folder name.
- `lib/featurs/auth/pages/steper_screen.dart` -> `lib/features/auth/screens/stepper_screen.dart`  
  Fixes spelling and aligns with screen folder naming.
- `lib/featurs/main_page/data_source/remot_data_source.dart` -> `lib/core/data_sources/remote_data_source.dart`  
  Fixes spelling.
- `lib/featurs/main_page/featurs/check_out/widget/code_textfild.dart` -> `lib/features/checkout/widgets/code_text_field.dart`  
  Fixes spelling.
- `lib/featurs/main_page/featurs/check_out/cubit/check_out_cubit.dart` -> `lib/features/checkout/cubit/checkout_cubit.dart`  
  Uses the normalized checkout feature name.
- `lib/featurs/main_page/featurs/check_out/cubit/check_out_state.dart` -> `lib/features/checkout/cubit/checkout_state.dart`  
  Uses the normalized checkout feature name.
- `lib/featurs/main_page/featurs/check_out/widget/check_out_address.dart` -> `lib/features/checkout/widgets/checkout_address_card.dart`  
  Matches the widget responsibility.
- `lib/featurs/main_page/featurs/check_out/widget/check_out_method.dart` -> `lib/features/checkout/widgets/checkout_method_card.dart`  
  Matches the widget responsibility.
- `lib/featurs/main_page/featurs/search/cubit/sreach_cubit.dart` -> `lib/features/search/cubit/search_cubit.dart`  
  Fixes spelling.
- `lib/featurs/main_page/featurs/search/cubit/sreach_state.dart` -> `lib/features/search/cubit/search_state.dart`  
  Fixes spelling.
- `lib/featurs/main_page/featurs/products_view/cubits/product_screen/cubit.dart` -> `lib/features/product_details/cubit/product_cubit.dart`  
  Replaces a generic filename with the Cubit responsibility.
- `lib/featurs/main_page/featurs/products_view/cubits/product_screen/states.dart` -> `lib/features/product_details/cubit/product_state.dart`  
  Replaces a generic filename with the state responsibility.
- `lib/featurs/main_page/featurs/products_view/screens/product_view_secreens.dart` -> `lib/features/product_details/screens/product_view_screens.dart`  
  Fixes spelling.
- `lib/gogole_map.dart` -> `lib/features/maps/google_map_screen.dart`  
  Fixes spelling and places the map screen in a feature folder.

## Files Moved

- `lib/featurs/auth/` -> `lib/features/auth/`  
  Fixes root feature spelling.
- `lib/featurs/auth/pages/` -> `lib/features/auth/screens/`  
  Uses consistent screen folder naming.
- `lib/featurs/auth/blocs/` -> `lib/features/auth/bloc/`  
  Uses consistent state-management folder naming.
- `lib/featurs/main_page/main_page.dart` -> `lib/features/main_navigation/main_page.dart`  
  `MainPage` is the authenticated navigation shell.
- `lib/featurs/main_page/cubit/` -> `lib/features/main_navigation/cubit/`  
  Keeps navigation shell state with the shell.
- `lib/featurs/main_page/data_source/` -> `lib/core/data_sources/`  
  Data sources are shared by multiple features.
- `lib/featurs/main_page/featurs/home/` -> `lib/features/home/`  
  Flattens nested feature structure.
- `lib/featurs/main_page/featurs/products_view/` -> `lib/features/product_details/`  
  Reflects product detail/review/similar-product responsibility.
- `lib/featurs/main_page/featurs/search/` -> `lib/features/search/`  
  Flattens nested feature structure.
- `lib/featurs/main_page/featurs/shopping_bag/` -> `lib/features/shopping_bag/`  
  Flattens nested feature structure.
- `lib/featurs/main_page/featurs/check_out/` -> `lib/features/checkout/`  
  Normalizes checkout feature naming.
- `lib/featurs/main_page/featurs/wishlist/` -> `lib/features/wishlist/`  
  Flattens nested feature structure.
- `lib/featurs/main_page/featurs/orders/` -> `lib/features/orders/`  
  Flattens nested feature structure.
- `lib/featurs/main_page/featurs/profile/` -> `lib/features/profile/`  
  Flattens nested feature structure.
- `lib/featurs/main_page/featurs/drawer/` -> `lib/features/drawer/`  
  Flattens nested feature structure.
- `lib/featurs/main_page/featurs/setting.dart` -> `lib/features/settings/setting_page.dart`  
  Gives the settings screen an explicit feature location.

## Naming Fixes

- `featurs` -> `features`
- `gogole` -> `google`
- `remot` -> `remote`
- `sreach` -> `search`
- `wiht` -> `with`
- `rotatoin` -> `rotation`
- `textfild` -> `text_field`
- `secreens` -> `screens`
- `steper` -> `stepper`
- Normalized folder names to `screens`, `widgets`, `models`, `bloc`, `cubit`, and `data_sources`.

## Code Readability Improvements

- Converted local project imports to `package:shop_app/...` imports.
- Replaced generic Cubit filenames with responsibility-specific names.
- Updated `pubspec.yaml` project description.
- Ran `dart format lib test`.

## Behavior Preserved

This refactor did not intentionally change:

- UI behavior
- navigation
- BLoC/Cubit behavior
- Appwrite integration
- SQLite behavior
- SharedPreferences behavior
- business logic

Persisted SQLite table/column names, SharedPreferences keys, Appwrite database IDs, collection IDs, and document field names were intentionally left unchanged.

## Analyzer / Test Results

- `dart format lib test`: completed successfully. It warned that `package:flutter_lints/flutter.yaml` could not resolve because package resolution is currently unavailable.
- `flutter pub get`: attempted with network permission, but dependency resolution hung at `Resolving dependencies...`; the process was stopped after several minutes and reported `Failed to update packages.`
- `flutter pub get --offline`: failed because `smooth_page_indicator` is not available in the local cache.
- `flutter analyze --no-pub`: failed because `.dart_tool/package_config.json` is absent, so Flutter, third-party packages, and even `package:shop_app/...` imports cannot be resolved in this environment.
- Existing tests were not run because dependency resolution did not complete.

## Potential Issues Requiring Manual Review

- The project currently cannot complete dependency resolution in this environment. Review dependency constraints, especially packages declared without explicit versions.
- `test/widget_test.dart` still appears to be the default Flutter counter test and likely does not match this e-commerce app.
- Backend and persistence identifiers include typos such as `Loaction`, `Cloude`, `broder`, `quntities`, `Favorate`, and `discription`; these were not changed because they may be persisted/API contracts.
- There are many Appwrite database/collection IDs embedded directly in source code.
- The large asset collection has inconsistent file names; assets were intentionally not renamed to avoid noisy and risky changes.
- The removed duplicate `lib/features/search/search_cubit/sreach_cubit.dart` was unreferenced and duplicated the real search Cubit.
- The removed duplicate `lib/features/search/pages/category_view_page.dart` was unreferenced and diverged from the active `screens/category_view_page.dart`.
- Some class names still preserve existing wording such as `CheckOutCubit`, `WishListCubit`, and `VisiblePsswordBloc` to avoid broad public API churn in this refactor.
