# ☁️ Weather App ☀️



## 🌍 About The Project

This is a **Weather App** built using **Flutter** that fetches real-time weather data from the **AccuWeather API**. It provides users with current weather conditions, a 12-hour forecast, and a 5-day forecast for any location.

## ✨ Features

- ☁️ **Real-time weather updates**
- ⏳ **12-hour weather forecast**
- 🌍 **5-day weather forecast**
- ⚖️ **Accurate temperature, humidity, wind speed, and UV index**
- 🔍 **Detailed weather conditions with icons**
- 📖 **Clickable links to AccuWeather for more details**
- 🎨 **Beautiful UI with a smooth user experience**

## ⚙️ Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/yourusername/weather_app.git
   cd weather_app
   ```
2. **Install dependencies:**
   ```bash
   flutter pub get
   ```
3. **Run the app:**
   ```bash
   flutter run
   ```

## 🔍 API Key Setup

To fetch real-time weather data, you need an API key from **AccuWeather**.

1. Sign up at [AccuWeather Developer](https://developer.accuweather.com/)
2. Get your API key
3. Replace `apikey` in `Mainscreen.dart` with your key:
   ```dart
   final url = 'http://dataservice.accuweather.com/currentconditions/v1/204844?apikey=YOUR_API_KEY&details=true';
   ```

## 🛠️ Technologies Used

- **Flutter** - UI Framework
- **Dart** - Programming Language
- **HTTP** - API Requests
- **AccuWeather API** - Weather Data Provider

## 🎉 Screenshots
https://github.com/Niyar07/weather_app/blob/main/Output.png


## ✨ Future Improvements

- 🌍 Support for multiple locations
- 📅 Weekly & monthly forecasts
- 🔔 Weather alerts and notifications

## 👥 Developed By

- **Niyar Rane**

## ✨ Contributing

Contributions are welcome! Feel free to submit a pull request.

---

Made  by **Niyar Rane**

