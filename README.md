# 🎵 SongSync – Live Recording and Playback App

**SongSync** is an iOS app that allows users to **record**, **store**, and **playback** songs, while offering features like a **metronome** synchronized with playback, and **tempo adjustment** for performance analysis.

## 📚 Features

### 1. **Live Song Recording**
- **User Story 1: Record a Song**
  - **As a user**, I want to record a live performance using the app, so that I can store it with a custom song name and timestamp for future playback.
  
  #### 🎯 **Acceptance Criteria**:
  - Users can navigate to the **RecordView** and input a **custom song name** before starting the recording.
  - Once recording starts, the audio is saved dynamically to the **Documents directory**.
  - When the recording is stopped, it is saved to **Core Data** with the song name, file URL, and timestamp.
  - After saving, the app returns to the **SongLibraryView**, where the new recording is listed.

### 2. **Song Library**
- **User Story 2: Store Recorded Songs**
  - **As a user**, I want to view my list of recorded songs in the library, so that I can manage and access them easily.
  
  #### 🎯 **Acceptance Criteria**:
  - All saved recordings are listed in the **SongLibraryView**.
  - Each recording displays:
    - **Custom song name**
    - **Timestamp** (date and time of recording)
  - Users can **delete** a recording.
  - Users can **tap** on a recording to navigate to the playback screen.

### 3. **Playback with Metronome and Tempo Adjustment**
- **User Story 3: Playback with Metronome**
  - **As a user**, I want to play back my recorded songs with a metronome, so that I can analyze the timing of my performance.

  #### 🎯 **Acceptance Criteria**:
  - The user can select a recording in the **SongLibraryView** to navigate to the **PlaybackView**.
  - The app plays the recorded song using **AVAudioPlayer**, dynamically loading from the file URL.
  - A visual **metronome (pulse)** is synchronized with the song’s tempo.
  
- **User Story 4: Adjust the Tempo**
  - **As a user**, I want to adjust the metronome’s BPM (beats per minute), so that I can change the speed of the playback for analysis.
  
  #### 🎯 **Acceptance Criteria**:
  - Users can adjust the **tempo (BPM)** using a slider, allowing tempo adjustments between 60 and 180 BPM.
  - The tempo slider dynamically updates the metronome without affecting audio playback.

### 4. **Song Deletion and Library Management**
- **User Story 5: Delete a Song**
  - **As a user**, I want to be able to delete a recording from my library, so that I can manage my storage and remove unwanted recordings.
  
  #### 🎯 **Acceptance Criteria**:
  - Users can **swipe to delete** any recording from the **SongLibraryView**.
  - Deleting a recording removes it from **Core Data**.
  - The **SongLibraryView** updates in real-time to reflect the changes.

## 📂 Project Structure

```bash
SongSync/
├── CoreDataModel/
│   ├── SongSyncModel.xcdatamodeld/          # Core Data model
│   │   └── RecordingEntity.xcdatamodel      # RecordingEntity with attributes (name, fileURL, date, id)
│   ├── RecordingEntity.swift                # Core Data entity subclass
│   └── RecordingEntity+CoreDataProperties.swift  # Generated Core Data properties
├── Audio/
│   └── example_audio.mp3                    # Optional static audio file for testing playback
├── ViewModels/
│   └── AudioManager.swift                   # Manages audio recording, playback, and Core Data
├── Views/
│   ├── PlaybackView.swift                   # Plays recordings with metronome and tempo control
│   ├── RecordView.swift                     # Records songs and saves them to Core Data
│   └── SongLibraryView.swift                # Displays the list of recorded songs, enables navigation
├── Persistence/
│   └── PersistenceController.swift          # Core Data stack (NSPersistentContainer)
├── SongSyncApp.swift                         # Main entry point for the app
├── Info.plist                                # App configuration
└── Assets.xcassets/                          # Assets (icons, images)

🚀 Getting Started

Requirements

    •    Xcode 12+
    •    iOS 14.0+

Steps to Run

    1.    Clone this repository.
    2.    Open the project in Xcode.
    3.    Build and run on a device or simulator.
    4.    Start recording, playing back, and analyzing your songs!

📅 Future Features

    •    Song Analysis: Analyze the timing accuracy of the recording and provide performance insights.
    •    Advanced Library Management: Implement search, sorting, and filtering features in the song library.
    •    Cloud Sync: Enable iCloud integration for backing up and syncing recordings across devices.

🤝 Contributing

Reach out to contribute!

📝 License

This project is licensed under the MIT License. See the LICENSE file for details.
