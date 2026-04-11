# 🤖 Flutter AI Chat App

A simple Flutter chat application that integrates **OpenAI API** and a **free AI API (OpenRouter)** with authentication, theme switching, and chat history.

---

## 🚀 Features

- 🔐 Simple Login System (SharedPreferences)
- 💬 AI Chat Interface
- 🤖 OpenAI API Integration
- 🔁 Free AI API fallback (OpenRouter)
- 🌙 Dark / Light Theme Toggle
- ⏳ Typing Indicator
- 💾 Local message storage (in memory)
- ⚡ Clean Provider State Management
- ❌ Proper Error Handling (401, 404, 429, network errors)

---

## 🛠️ Tech Stack

- Flutter
- Dart
- Provider (State Management)
- HTTP package
- SharedPreferences
- Lottie Animations
- OpenAI API
- OpenRouter API (Free AI models)

---

## 📁 Project Structure


lib/
│
├── main.dart
├── root.dart
│
├── providers/
│ ├── auth_provider.dart
│ ├── chat_provider.dart
│ ├── theme_provider.dart
│
├── services/
│ ├── openai_service.dart
│ ├── openrouter_service.dart
│
├── screens/
│ ├── login_screen.dart
│ ├── chat_screen.dart
│
├── widgets/
│ ├── message_bubble.dart


---

## 🔑 API Setup

### 1. OpenAI API Key
Get from:
https://platform.openai.com/api-keys

### 2. OpenRouter API Key (Free AI)
Get from:
https://openrouter.ai

---

## ▶️ Run Project

### Step 1: Install dependencies
flutter pub get
Step 2: Run app with API keys
flutter run --dart-define=OPENAI_API_KEY=api-key --dart-define=OPENROUTER_API_KEY=api_key
⚙️ Features Explanation
🤖 AI Switching
Toggle switch in app bar
ON → OpenAI
OFF → Free AI API
❌ Error Handling
Error Code	Meaning
401	Invalid API key
404	API/model not found
429	Rate limit exceeded
500	Server error

👨‍💻 Developer
Tasnima Akther Tisha
