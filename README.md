# Black Sigatoka Detector

## Overview
The **Black Sigatoka Detector** is a mobile application designed to identify and classify banana leaves affected by Black Sigatoka, a destructive fungal disease that impacts banana crops worldwide. This app leverages machine learning models to detect diseased leaves and provide actionable insights for farmers and agricultural professionals.

## Features
- **Image Detection**: Upload or capture images of banana leaves to detect the presence of Black Sigatoka.
- **Disease Classification**: Determine whether the object is a banana leaf and check if it shows signs of Black Sigatoka disease.
- **History Tracking**: View past scans and results for monitoring purposes.
- **User-Friendly Interface**: Intuitive design for seamless use by farmers and agronomists.

## Technologies Used
- **Flutter**: For building the cross-platform mobile application.
- **TensorFlow Lite**: For running machine learning models on the device.
- **Image Picker**: To enable image capture and selection.

## Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/johnpaulocumen/black-sigatoka-detector.git
   ```
2. Navigate to the project directory:
   ```bash
   cd black-sigatoka-detector
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Run the app:
   ```bash
   flutter run
   ```

## Usage
1. Launch the app on your device.
2. Choose to capture an image using the camera or upload one from your gallery.
3. The app will analyze the image to detect if it contains banana leaves and identify signs of Black Sigatoka.
4. View the results and take necessary action based on the recommendations.

If you'd like to try the mobile app, an APK file is available for download [here](https://drive.google.com/file/d/1xB7FtFkqJ7s19rmoNTLxGXCD43to6q1v/view?usp=drive_link).

## File Structure
```
black-sigatoka-detector/
├── assets/
│   ├── model_leaves.tflite
│   ├── labels_leaves.txt
│   ├── model_disease.tflite
│   ├── labels_disease.txt
├── lib/
│   ├── home.dart
│   ├── history.dart
│   ├── detection_model.dart
├── pubspec.yaml
```

## Contribution
Contributions are welcome! Please follow these steps:

1. Fork the repository.
2. Create a new branch:
   ```bash
   git checkout -b feature-name
   ```
3. Commit your changes:
   ```bash
   git commit -m "Add feature-name"
   ```
4. Push the branch:
   ```bash
   git push origin feature-name
   ```
5. Open a Pull Request.

## License
This project is licensed under the MIT License. See the LICENSE file for details.

## Contact
For any inquiries or issues, please contact the developer:

- **Email**: [[paulzkie67@gmail.com](mailto\:paulzkie67@gmail.com)]
- **GitHub**: [johnpaulocumen](https://github.com/johnpaulocumen)

---

Thank you for using the Black Sigatoka Detector!

