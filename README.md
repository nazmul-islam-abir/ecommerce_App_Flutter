# 👔 Menvogue - Men's Fashion E-Commerce App

<div align="center">
  <img src="assets/1.png.png" width="200" alt="Splash Screen"/>
  <img src="assets/2.png" width="200" alt="Dashboard Screen"/>
  <img src="assets/3.png" width="200" alt="Flash Sale Screen"/>
  <br/>
  <img src="assets/4.png" width="200" alt="Search Screen"/>
  <img src="assets/5.png" width="200" alt="Profile Screen"/>
  <img src="assets/6.png" width="200" alt="Products Grid"/>
  <img src="assets/7.png" width="200" alt="Flash Sale Details"/>
  <br/>
  <em>Menvogue - Modern Men's Fashion E-Commerce App</em>
</div>

## 📱 Overview

**Menvogue** is a feature-rich e-commerce mobile application built with **Flutter** that provides a seamless shopping experience for men's fashion products, including shoes, watches, wallets, clothing, and accessories. The app integrates with **Supabase** backend for real-time data fetching and offers a modern, intuitive user interface.

## ✨ Features

### 🚀 Splash/Onboarding Screen
- Horizontal scrolling categories (Fashion, Wallets, Perfumes, Shoes)
- Rotated text design for modern aesthetics
- Brand name "Menvogue" prominently displayed
- Discover button for navigation to dashboard

### 📊 Dashboard Screen
- Custom header with menu icon, brand name, and shopping bag
- Search bar for product discovery
- **Flash Sales Section** - Horizontal scroll of discounted products with discount badges
- **Category Filters** - Trending, Shoes, Watches, Wallet, Cloths, Shirts, Bags, Pants
- **Product Grid** - Responsive two-column grid layout
- **Bottom Navigation** - Home, Search, Favorites, Profile

### 🔥 Flash Sale Screen
- Dedicated page for all discounted products
- Percentage-off discount badges
- Special header with flash sale branding

### 🔍 Search Screen
- Dedicated product search interface
- Back navigation to dashboard

### 👤 Profile Screen
- User profile display (name, email, profile picture)
- Account sections (Orders, Favorites, Shipping Address, Cards, Vouchers)
- Logout option

## 🛠️ Tech Stack

| Technology | Purpose |
|------------|---------|
| Flutter | Frontend framework |
| Dart | Programming language |
| Supabase | Backend database & API |
| HTTP Package | API calls & data fetching |
| Google Fonts | Custom typography |
| Cupertino Icons | iOS-style icons |

## 📡 API Integration

### Supabase Connection

The app connects to a **Supabase** backend with two main tables:

**Products Table** (`/rest/v1/products`)
- Fetch all available products
- Fields: `id`, `name`, `price`, `image`, `category`

**Flash Sale Table** (`/rest/v1/flashsale`)
- Fetch discounted products
- Fields: `id`, `name`, `price`, `image_url`, `discount`

### How API Calls Work

```dart
// API Headers with Supabase Key
headers: {
  "apikey": "YOUR_SUPABASE_API_KEY"
}

// Fetch Products Example
Future<void> fetchProducts() async {
  final response = await http.get(
    Uri.parse('URL/products'),
    headers: { "apikey": "KEY" },
  );
  
  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body);
    setState(() => allProducts = jsonData);
  }
}