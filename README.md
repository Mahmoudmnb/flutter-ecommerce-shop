# Elegance — Flutter E-Commerce Shop

A modern **Flutter e-commerce mobile application** for browsing fashion products, managing a shopping bag, placing orders, maintaining wishlists, handling user profiles, and completing checkout with both local persistence and cloud-backed data.

This project was built as an open-source portfolio application and demonstrates Flutter app architecture, state management, local storage, backend integration, and polished mobile UI design.

---

## ✨ Overview

**Elegance** is a fashion-focused shopping application built with Flutter.

The app includes:

- user authentication
- product browsing
- category filtering
- search
- product details
- wishlist management
- shopping bag/cart
- checkout flow
- order management
- product reviews
- profile management
- address management
- map/location support
- local persistence
- cloud-backed data handling

The project is designed as a practical end-to-end mobile commerce experience rather than a simple UI-only demo.

---

## 📱 App Preview

> Add the screens overview image to:
>
> `docs/images/app-screens-overview.png`

<p align="center">
  <img src="docs/images/app-screens-overview.png" alt="Elegance app screens overview" width="100%">
</p>

---

## 🎥 Demo Video

A full walkthrough of the Elegance Flutter e-commerce application is available in the project release:

[▶️ Watch the Elegance App Demo](https://github.com/Mahmoudmnb/flutter-ecommerce-shop/releases/tag/demo-video)

---



## 🚀 Features

### Authentication
- Sign in / sign up flow
- Password visibility toggle
- Email validation support
- Splash screen and onboarding/initial flow

### Product Browsing
- Home page with featured and discounted products
- Browse product categories
- View product collections
- Explore recommended and trendy items

### Search & Discovery
- Search for products
- Recent searches
- Popular search suggestions
- Category-based filtering
- Filter drawer for refining results

### Product Details
- View full product details
- Select product size and color
- Add products to shopping bag
- Browse similar items
- Read customer reviews
- View all reviews for a product

### Wishlist
- Save favorite products
- Manage wishlist items
- Switch between wishlist presentation modes

### Shopping Bag / Cart
- Add and remove products
- Update selected item variants
- Manage cart quantities
- View pricing details before checkout

### Checkout
- Multi-step checkout flow
- Manage delivery addresses
- Select payment and delivery methods
- Review order summary before confirming purchase

### Orders & Reviews
- View placed orders
- Open order details
- Rate completed orders
- Submit reviews

### Profile & Settings
- View and edit personal details
- Manage shopping addresses
- Access profile-related order views
- Settings screen

### Maps & Location
- Google Maps integration
- Geolocation support
- Address/location selection for delivery

### Persistence & Backend
- Local storage using SQLite
- SharedPreferences for lightweight persisted settings/state
- Cloud-backed data operations with Appwrite
- Dependency injection using `get_it`

---

## 🧱 Tech Stack

### Framework
- Flutter
- Dart

### State Management
- `flutter_bloc`
- Cubit / BLoC

### Local Persistence
- `sqflite`
- `shared_preferences`

### Backend / Cloud
- `appwrite`

### Maps / Location
- `google_maps_flutter`
- `geolocator`
- `geocoding`

### Networking / Utilities
- `http`
- `dartz`
- `get_it`
- `cached_network_image`

### UI / UX
- `flutter_screenutil`
- `flutter_staggered_animations`
- `animated_text_kit`
- `smooth_page_indicator`
- `syncfusion_flutter_sliders`
- `smooth_star_rating_null_safety`

### Extra Integrations
- `image_picker`
- `flutter_paypal_checkout`
- `better_open_file`

---

## 🏛️ Project Architecture

The project follows a **feature-based Flutter structure** with shared core services and data sources.

### Main architectural ideas

- **`lib/core/`**
  - common constants
  - local database helpers
  - internet utilities
  - data-source abstractions and implementations

- **`lib/features/`**
  - app functionality grouped by feature
  - each feature contains only the files relevant to that domain
  - examples: `auth`, `home`, `search`, `wishlist`, `checkout`, `orders`, `profile`

- **BLoC / Cubit state management**
  - each feature manages its own state where appropriate
  - keeps UI and state transitions organized

- **Dependency injection**
  - `get_it` is used to register and access shared services and data sources

- **Hybrid data flow**
  - local storage for app persistence and cached data
  - remote backend operations through Appwrite

This architecture keeps the app easier to scale and navigate than a single large `lib/` folder with unrelated files mixed together.

---

## 📂 Project Structure

```text
lib/
├── core/
│   ├── constant.dart
│   ├── data_base.dart
│   ├── internet_info.dart
│   └── data_sources/
│       ├── data_source.dart
│       ├── data_source_paths.dart
│       ├── get_data_local_data_source.dart
│       ├── insert_data_local_data_source.dart
│       ├── remote_data_source.dart
│       ├── search_local_data_source.dart
│       └── update_delete_local_data_source.dart
│
├── features/
│   ├── auth/
│   ├── checkout/
│   ├── drawer/
│   ├── home/
│   ├── main_navigation/
│   ├── maps/
│   ├── orders/
│   ├── product_details/
│   ├── profile/
│   ├── search/
│   ├── settings/
│   ├── shopping_bag/
│   └── wishlist/
│
├── injection.dart
└── main.dart
```

---

## 🧩 Feature Modules

### `auth/`
Authentication flow, onboarding-related screens, and auth widgets.

### `home/`
Home screen, product discovery, and highlighted collections.

### `search/`
Search input, results screen, categories, and filter UI.

### `product_details/`
Product information, reviews, similar items, and add-to-cart interactions.

### `wishlist/`
Wishlist screens and product-saving behavior.

### `shopping_bag/`
Cart state, bag UI, quantity handling, and pricing display.

### `checkout/`
Address handling, method selection, payment flow, and order review.

### `orders/`
Orders list, order details, and order rating/review functionality.

### `profile/`
Personal details, profile screens, and shopping address management.

### `maps/`
Map-based location features used by the shopping/address flow.

### `main_navigation/`
Main app shell / navigation container after authentication.

---

## 💾 Data Handling

The app combines **local persistence** and **remote cloud operations**.

### Local
Used for:
- caching product/order-related data
- local app persistence
- supporting offline-friendly or restart-friendly behavior

Main local tools:
- SQLite (`sqflite`)
- SharedPreferences

### Remote
Used for:
- product retrieval
- profile-related updates
- reviews
- addresses/locations
- cloud-backed user and order data

Main remote tool:
- Appwrite

---

## 🖼️ Assets

The app uses:
- product images
- icons
- app branding
- custom fonts

Configured asset groups include:

- `assets/images/`
- `assets/icons/`
- `assets/products_images/Jackets/`
- `assets/products_images/Pants/`
- `assets/products_images/Shirts/`
- `assets/products_images/Shorts/`
- `assets/products_images/Sportwears/`
- `assets/products_images/Suits/`
- `assets/products_images/T-Shirts/`

Custom fonts include:
- Bentham
- Tiro Gurmukhi
- DM Sans
- Tenor Sans
- Poppins

---

## ⚙️ Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/Mahmoudmnb/flutter-ecommerce-shop.git
cd flutter-ecommerce-shop
```

### 2. Install dependencies

```bash
flutter pub get
```

### 3. Run the app

```bash
flutter run
```

---

## 🔧 Configuration Notes

Before running the full app experience, review the following:

### Appwrite
This project uses Appwrite for some remote operations.

If you want to run the app with your own backend, you may need to update:
- Appwrite project configuration
- database IDs
- collection IDs
- storage bucket IDs

These values are referenced in the remote data source layer.

### Google Maps
If you run the maps functionality, you may need to configure:
- Android Google Maps API key
- iOS Google Maps setup (if building for iOS)

### Local Database / Persistence
The app also uses:
- SQLite
- SharedPreferences

No extra setup is usually needed beyond dependency installation, but platform support must be available.

---

## 🧪 Code Quality / Refactor Notes

This repository has been refactored to improve:

- folder naming
- file naming
- feature grouping
- import organization
- readability
- maintainability

The refactor was intended to preserve the app’s existing behavior while making the project easier to understand and present professionally.

If needed, additional implementation notes can be found in:

```text
REFACTOR_NOTES.md
```

---

## 📌 Project Status

**Open-source portfolio project**

This repository represents a practical Flutter e-commerce application and is intended as a portfolio/demo project.

It demonstrates:

- Flutter mobile UI development
- BLoC/Cubit state management
- local persistence
- backend integration
- modular feature organization

It should be considered a strong application project, but not necessarily a production-ready commercial app without further backend/security/release hardening.

---

## 🔮 Possible Future Improvements

- stronger backend abstraction
- payment workflow expansion
- better offline synchronization
- push notifications
- favorites/recommendation improvements
- unit and widget test coverage
- CI/CD integration
- dark mode support
- admin dashboard/backend management tools

---

## 👨‍💻 Author

**Mahmoud Bannan**

Flutter Developer & Audio AI Engineer

- GitHub: [@Mahmoudmnb](https://github.com/Mahmoudmnb)
- Portfolio: [mahmoudbannan.com](https://mahmoudbannan.com)

---

## 📄 License

Add your preferred license in a `LICENSE` file and update this section if needed.
