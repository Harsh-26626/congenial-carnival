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

<img width="227" height="500" alt="Screenshot 2025-09-14 141730" src="https://github.com/user-attachments/assets/7a0f7652-7d5d-4efd-bfe4-d0805f81b3ae" /> <img width="227" height="500" alt="Screenshot 2025-09-14 141816" src="https://github.com/user-attachments/assets/da1ad3f0-873a-45c2-87ef-52c44ea34295" /> <img width="227" height="500" alt="Screenshot 2025-09-14 141844" src="https://github.com/user-attachments/assets/9988edf3-1bc1-4b13-9001-461aed54c0bf" />

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

---

## 📂 Project Structure
```
lib/
 └── currency_converter.dart   # Main app widget
pubspec.yaml                  # Dependencies & metadata
.env                          # API key (local only, don’t commit!)
```
