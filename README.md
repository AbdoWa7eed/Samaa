# Samaa ☁️

**Samaa'** is an iOS weather application for checking current conditions, a 3-day forecast, and hourly breakdowns for your GPS location and saved cities. Built with SwiftUI and MVVM, Samaa focuses on a clean, swipeable home experience and fast city search.

*Your Sky, Your Weather.*

Developed by **Abdelrahman Waheed**.

## 📸 App Screenshots

| Splash (Light) | Splash (Dark) | Home (Light) | Search (Light) |
|----------------|---------------|--------------|----------------|
| <img src="https://github.com/user-attachments/assets/723fbb32-0739-49c5-aaed-f481d329961f" width="220" height="480" style="object-fit: cover;" alt="Splash light"/> | <img src="https://github.com/user-attachments/assets/54bf48ba-1f2a-4d01-9be5-c8d24b99c613" width="220" height="480" style="object-fit: cover;" alt="Splash dark"/> | <img src="https://github.com/user-attachments/assets/2af7bf70-6d24-43b5-afb1-d5fe3fea679c" width="220" height="480" style="object-fit: cover;" alt="Home light"/> | <img src="https://github.com/user-attachments/assets/30c60bdf-c114-4ed2-b6c7-3f5e68bf4bd8" width="220" height="480" style="object-fit: cover;" alt="Search light"/> |

| Search (Dark) | Hourly Forecast | Saved Delete Alert (Dark) | Home (Dark) |
|---------------|-----------------|--------------------------|-------------|
| <img src="https://github.com/user-attachments/assets/cdedb4c5-145e-4dd8-aa41-0d7d58a7ed81" width="220" height="480" style="object-fit: cover;" alt="Search dark"/> | <img src="https://github.com/user-attachments/assets/611ce5d6-2bda-4253-9489-08e0a74b8769" width="220" height="480" style="object-fit: cover;" alt="Hourly forecast"/> | <img src="https://github.com/user-attachments/assets/86e0075c-ab3c-4ebd-b0d3-44f3684926df" width="220" height="480" style="object-fit: cover;" alt="Saved delete alert dark"/> | <img src="https://github.com/user-attachments/assets/1bec2e81-a29d-4502-85ba-2ac3d9d812ef" width="220" height="480" style="object-fit: cover;" alt="Home dark"/> |

---

## ✨ Features

### 🏠 Home & weather

- **Swipeable multi-city home:** The home screen shows your current GPS location plus every saved city — swipe between pages to compare conditions.
- **Weather hero:** Large temperature display with condition badge, high/low, and location name.
- **3-day forecast:** Tomorrow and the next days in a forecast card; tap any day to open the hourly breakdown.
- **Metrics grid:** Visibility, humidity, feels-like, and pressure at a glance.
- **Day & night backgrounds:** `AppTheme` switches background imagery by time of day (day from 5:00 to 18:00, night otherwise).

### 🔍 Search

- **Debounced city search:** Type a city name and results load from WeatherAPI `search.json` without hammering the network.
- **Clear states:** Empty query, loading, and no-results screens guide you through the flow.
- **Quick drill-down:** Tap a result to open full weather detail for that city.

### ⭐ Saved locations

- **One-tap saves:** Save cities from the weather detail screen and keep them on device with Core Data.
- **Manage easily:** Open the saved list from the home toolbar, tap a city for detail, or remove with a confirmation alert.

### 🕐 Hourly forecast

- **Day-level breakdown:** Hero summary plus a 2-hour interval list for the selected forecast day.
- **Open from home:** Tap today's hero or any forecast row on a weather page to jump in.

### 🚀 Launch & reliability

- **Animated splash:** Branded splash screen.
- **Error handling:** Network and location failures show a retry screen instead of a blank page.
- **Location-aware:** CoreLocation powers current-location weather with a clear permission prompt.

---

## 🏗️ Project Architecture

Samaa follows **MVVM** separation for features, with a small **composition root** for wiring dependencies.

### UI layer (MVVM)

- **Views:** SwiftUI views under `Samaa/Modules/` and shared components in `Samaa/Views/` handle layout and user actions.
- **ViewModels:** `HomeViewModel`, `WeatherViewModel`, `SearchViewModel`, and `SavedLocationsViewModel` hold presentation logic, call services, and publish state via `@Published` properties.
- **Reactive updates:** Combine drives debounced search and live saved-locations updates.

### Composition and navigation

- **`AppContainer`:** Shared singleton that builds view models and injects services (`WeatherService`, `SavedLocationsService`), networking (`ApiClient`), `PersistenceController`, and `LocationManager`.
- **`AppRouter`:** Controls the root flow (`splash` → `home`). In-screen navigation uses SwiftUI `NavigationLink` for search, saved locations, weather detail, and hourly forecast.

### Data layer

- **Remote:** `WeatherService` calls the WeatherAPI.com v1 HTTP API through `ApiClient` (`forecast.json` for 4 days, `search.json` for city lookup).
- **Local:** **Core Data** stores saved cities (`SavedLocationEntity`) via `PersistenceController` and `SavedLocationsService`.
- **Mappers:** Decodable response models and mappers translate API payloads into app entities (`WeatherEntity`, `SearchLocation`, etc.).

### Navigation flow

```
Splash → Home (swipeable weather pages)
              ├── Toolbar → Saved Locations → Weather detail
              ├── Toolbar → Search → Weather detail
              └── Forecast tap → Hourly forecast
```

---

## 🛠️ Technology Stack

- **Language:** Swift
- **Minimum iOS (deployment target):** 15.2 — set in the Xcode project; run on a device or simulator with **iOS 15.2 or newer**.
- **UI:** SwiftUI
- **Architecture:** MVVM modules, lightweight service locator (`AppContainer`)
- **Networking:** Native `URLSession` (`ApiClient`)
- **Reactive:** Combine (`@Published`, debounced search, saved-locations publisher)
- **Concurrency:** `async/await` for API calls
- **Persistence:** Core Data (`Samaa.xcdatamodeld`)
- **Location:** CoreLocation (`LocationManager`)
- **API:** [WeatherAPI.com v1](https://api.weatherapi.com/v1) — base URL in `ApiConstants`
- **Dependencies:** None (no Swift Package Manager, CocoaPods, or Carthage)
- **Tests:** No test target in this repository

---

## 🚀 Getting Started

### Prerequisites

- macOS with **Xcode** that supports an **iOS 15.2+** SDK.
- A **[WeatherAPI.com](https://www.weatherapi.com/)** API key (the app calls the [v1 API](https://api.weatherapi.com/v1) for forecast and search).
- Apple Developer Program membership only if you deploy to a physical device outside of free personal provisioning.

### Clone the repository

```bash
git clone https://github.com/AbdoWa7eed/Samaa.git
cd Samaa
```

Ongoing work often lives on **`development`**. After cloning, switch if needed:

```bash
git checkout development
```

## API Key (Build Time)

This project requires a **WeatherAPI.com** API key.

1. Create a free account at https://www.weatherapi.com/
2. Generate an API key from your dashboard.
3. Add the key to your local configuration as described below.

The app uses the WeatherAPI v1 endpoints for weather forecasts and location search: [Docs](https://www.weatherapi.com/docs/)

---
The app reads `WEATHER_API_KEY` from the bundled `Info.plist`, which contains `$(WEATHER_API_KEY)` as a placeholder. You must provide this value at **build time** so Xcode can substitute it into the final app bundle.
### Setup Steps

1. Open `Samaa.xcodeproj` in Xcode.
2. Create a local `Config.xcconfig` file in the project root (or add a **User-Defined Setting** named `WEATHER_API_KEY` to the **Samaa** target).
3. Add the following line:

   WEATHER_API_KEY = your_key_here

4. Ensure `Config.xcconfig` is excluded from version control (it should be in .gitignore).

If the key is missing or empty at runtime, `ApiConstants` will return a clear error.

---

## Open and Run

1. Open `Samaa.xcodeproj`.
2. Ensure your local configuration contains a valid `WEATHER_API_KEY`.
3. Select the **Samaa** scheme and a simulator or device.
4. Run the app (⌘R).
5. 
## Privacy Note

The app communicates with WeatherAPI.com over HTTPS to retrieve weather and location data. Never commit API keys to source control or include them in the README.

---
## 👤 Author

**Abdelrahman Waheed**

- **LinkedIn:** [Abdelrahman Waheed](https://www.linkedin.com/in/abdelrahmanwa7eed-dev/)
- **GitHub:** [@AbdoWa7eed](https://github.com/AbdoWa7eed)

---

## 📄 License

This project was developed as part of the **Native Mobile App Development Track** at **ITI (Information Technology Institute)**.
