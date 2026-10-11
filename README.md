# Elegance — Flutter E-Commerce Shop

A modern **Flutter e-commerce mobile application** for browsing fashion products, managing a shopping bag, placing orders, maintaining wishlists, handling user profiles, and completing checkout with both local persistence and cloud-backed data.

This project was built as an open-source portfolio application and demonstrates Flutter app architecture, state management, local storage, backend integration, and polished mobile UI design.

---

## ✨ Overview

**Elegance** is a fashion-focused shopping application built with Flutter.

The app includes:

- User authentication
- Product browsing
- Category filtering
- Search
- Product details
- Wishlist management
- Shopping bag/cart
- Checkout flow
- Order management
- Product reviews
- Profile management
- Address management
- Map/location support
- Local persistence
- Cloud-backed data handling

The project is designed as a practical end-to-end mobile commerce experience rather than a simple UI-only demo.

---

## 📱 App Preview

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

### Main Architectural Ideas

- **`lib/core/`**
  - Common constants
  - Local database helpers
  - Internet utilities
  - Data-source abstractions and implementations

- **`lib/features/`**
  - Application functionality grouped by feature
  - Each feature contains the files relevant to that domain
  - Examples include `auth`, `home`, `search`, `wishlist`, `checkout`, `orders`, and `profile`

- **BLoC / Cubit state management**
  - Features manage their own state where appropriate
  - Helps keep UI and state transitions organized

- **Dependency injection**
  - `get_it` is used to register and access shared services and data sources

- **Hybrid data flow**
  - Local storage for persistence and cached application data
  - Remote backend operations through Appwrite

This structure keeps the application easier to navigate and maintain than placing unrelated functionality inside a single large `lib/` directory.

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

Authentication flow, onboarding-related screens, and authentication widgets.

### `home/`

Home screen, product discovery, featured products, discounts, and highlighted collections.

### `search/`

Search input, search results, product categories, recent searches, and filtering UI.

### `product_details/`

Product information, reviews, similar items, color/size selection, and add-to-cart interactions.

### `wishlist/`

Wishlist screens and product-saving behavior.

### `shopping_bag/`

Cart state, shopping-bag UI, quantity handling, product variants, and pricing information.

### `checkout/`

Address handling, delivery/payment method selection, checkout steps, and order review.

### `orders/`

Order list, order details, ratings, and product-review functionality.

### `profile/`

Personal details, profile management, shopping addresses, and related user settings.

### `maps/`

Map-based location functionality used by the address and delivery flows.

### `main_navigation/`

Main authenticated application shell and navigation container.

### `settings/`

Application settings interface.

---

## 💾 Data Handling

The app combines **local persistence** with **remote cloud operations**.

### Local

Used for:

- Caching product and order-related data
- Persisting app data between sessions
- Storing lightweight application preferences
- Supporting restart-friendly app behavior

Main local technologies:

- SQLite (`sqflite`)
- SharedPreferences

### Remote

Used for:

- Product retrieval
- User/profile updates
- Reviews
- Addresses and locations
- Orders
- Cloud-backed application data
- Profile image storage

Main remote technology:

- Appwrite

---

## 🖼️ Assets

The application uses:

- Product images
- Icons
- App branding
- Custom fonts

Configured asset groups include:

```text
assets/images/
assets/icons/
assets/products_images/Jackets/
assets/products_images/Pants/
assets/products_images/Shirts/
assets/products_images/Shorts/
assets/products_images/Sportwears/
assets/products_images/Suits/
assets/products_images/T-Shirts/
```

Custom fonts include:

- Bentham
- Tiro Gurmukhi
- DM Sans
- Tenor Sans
- Poppins

---

## ⚙️ Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/Mahmoudmnb/flutter-ecommerce-shop.git
cd flutter-ecommerce-shop
```

### 2. Install Dependencies

```bash
flutter pub get
```

### 3. Run the Application

```bash
flutter run
```

---

## 🔧 Configuration Notes

Before running the complete application experience, review the following configuration requirements.

### Appwrite

The project uses Appwrite for remote data operations.

If you want to run the application using your own backend, you may need to configure:

- Appwrite project ID
- Database IDs
- Collection IDs
- Storage bucket IDs

These values are referenced primarily in the remote data-source layer.

> Some backend identifiers are part of the original project configuration and may need to be replaced with your own Appwrite resources.

### Google Maps

To use map/location functionality, configure the required Google Maps API keys for the target platform.

Depending on the platform, this may include:

- Android Google Maps API key
- iOS Google Maps configuration

### Local Database / Persistence

The application uses:

- SQLite
- SharedPreferences

These are initialized locally by the application and generally do not require separate external configuration.

---

## 🧪 Code Quality & Refactoring

The repository has been refactored to improve:

- Folder naming
- File naming
- Feature organization
- Import consistency
- Readability
- Maintainability
- Separation of shared and feature-specific code

The refactor was intentionally performed without changing the application's core behavior, UI flow, state-management behavior, backend contracts, or persisted data structures.

Additional implementation details and refactor notes are available in:

```text
REFACTOR_NOTES.md
```

---

## 📌 Project Status

**Open-source portfolio project**

This repository represents a practical Flutter e-commerce application developed as a portfolio and learning project.

It demonstrates:

- Flutter mobile application development
- Feature-based project organization
- BLoC / Cubit state management
- Local persistence
- Appwrite backend integration
- Dependency injection
- Product search and filtering
- Shopping cart and wishlist flows
- Checkout and order management
- Location and address handling

The project should be considered a **portfolio/demo application rather than a production-ready commercial e-commerce platform** without additional security, testing, backend, and release hardening.

---

## 🔮 Possible Future Improvements

Potential future improvements include:

- Stronger backend abstraction
- Improved offline synchronization
- Expanded payment integration
- Push notifications
- Enhanced recommendation features
- Better automated test coverage
- CI/CD integration
- Dark mode
- Admin dashboard and product-management tools
- Improved error handling
- More comprehensive security configuration

---

## 👨‍💻 Author

**Mahmoud Bannan**

Flutter Developer & Audio AI Engineer

- GitHub: [@Mahmoudmnb](https://github.com/Mahmoudmnb)
- Portfolio: [mahmoudbannan.com](https://mahmoudbannan.com)

---

## 📄 License

This project is licensed under the MIT License. See the [`LICENSE`](LICENSE) file for details.
