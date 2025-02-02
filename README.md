# Scholar Chat

## Overview
**Scholar Chat** is a Flutter-based messaging application designed to connect users and enable real-time communication. The app allows users to sign up, log in, and send messages to other users. It leverages **Firebase** for authentication, real-time database, and validation, ensuring a secure and seamless user experience. The app also supports **dark mode** and **light mode**, providing a customizable user interface. State management is handled using **Cubit**, making the app efficient and scalable.

## Features
- **User Authentication**: Sign up and log in using Firebase Authentication.
- **Real-Time Messaging**: Send and receive messages in real-time using Firebase Firestore.
- **Validation**: Input validation for forms (e.g., email, password).
- **Dark Mode & Light Mode**: Switch between dark and light themes for a personalized experience.
- **State Management**: Uses **Cubit** for efficient state management.

## Technologies Used
- **Backend**: Firebase (Authentication, Firestore)
- **State Management**: Cubit (from the `flutter_bloc` package)
- **Theming**: Dark mode and light mode using **ThemeData**
- **Dependency Management**: Pub (Flutter's package manager)

## How It Works
1. **Authentication**: Users sign up or log in using Firebase Authentication.
2. **Real-Time Messaging**: Messages are sent and received in real-time using Firebase Firestore.
3. **Validation**: Input fields (e.g., email, password) are validated before submission.
4. **Theming**: Users can switch between dark mode and light mode for a personalized UI experience.
5. **State Management**: The **Cubit** manages the app's state, ensuring smooth updates and error handling.nce.
