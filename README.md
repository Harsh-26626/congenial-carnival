

# 💱Universal Currency Converter

A simple Flutter app that converts between different world currencies using **live exchange rates**.

Built with Flutter’s Material UI, HTTP networking, and dropdown menus for smooth user experience.

---

## ✨ Features

- 🔄 Convert between 100+ currencies (USD, INR, EUR, JPY, and many more)

- ⌨️ Clean input field with validation

- 📱 Modern Material UI design with dropdown menus

- 🌐 Live rates fetched from [ExchangeRate API](https://www.exchangerate-api.com/)

- 🎨 Dark-themed interface

---

## 📸 Screenshots



---

## 🛠️ Tech Stack

- **Flutter (Dart)**

- **HTTP package for API requests**

- **ExchangeRate API for live rates**



---

## ⚙️ Setup & Installation

1. **Clone the repo**
```
git clone https://github.com/harsh-26626/congenial-canival.git

cd congenial-canival
```

2. **Change branch to `master`**
```
git checkout master
```

3. **Install dependencies**

```
flutter pub get
```

4. **Get an API key**
- Follow these steps to get your API key:
  - Sign up at [ExchangeRate API](https://www.exchangerate-api.com/)
  - Copy your API key

5. **Run the app**
- **Option A: With .env (local development)**
  1. Create a `.env` file in the root:
     ```
     API_KEY=your_api_key_here
     ```
  2. Load it using [flutter_dotenv](https://pub.dev/packages/flutter_dotenv)
- **Option B: With --dart-define (production / builds)**
  1. Pass the key at runtime:
     ```
     flutter run --dart-define=API_KEY=your_api_key_here
     ```
## 🚀 Deployment (GitHub Pages)
1. 
