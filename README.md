# ai_chat_flutter
## Library Stack
- [flutter_bloc](https://pub.dev/packages/flutter_bloc): A Flutter package that helps implement the BLoC design pattern. It provides a way to separate presentation from business logic, making your code fast, easy to test, and reusable. In this application, it's used for managing the state of the application theme.

- [shared_preferences](https://pub.dev/packages/shared_preferences): A Flutter plugin for reading and writing simple key-value pairs to disk. It's used for persisting the user's theme choice across app launches.

- [flutter_screenutil](https://pub.dev/packages/flutter_screenutil): A Flutter plugin that provides a way to design your app layout for different screen sizes. It uses logical pixels, ensuring that your layout looks good on all devices.

- [dynamic_color](https://pub.dev/packages/dynamic_color): A Flutter package that can generate dynamic colors based on the user's theme. This ensures a better user experience as the app's colors adapt to the system theme.

## Getting Started
Before running the app, make sure you have Flutter installed on your machine. After that, you can clone this repository and run flutter pub get to install the necessary dependencies.

You can run the app using the flutter run command.

## Usage
Once the application is running, you can select between light, dark, and custom themes. Your theme selection will be saved and used the next time the application is launched, thanks to shared_preferences.

## Testing
To run the tests for this application, use the flutter test command.