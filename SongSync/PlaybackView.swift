import SwiftUI
import AVFoundation
import CoreData

struct PlaybackView: View {
    let recording: RecordingEntity
    @State private var audioPlayer: AVAudioPlayer?

    var body: some View {
        VStack {
            Text("Playing: \(recording.name ?? "Unknown Name")")
                .font(.title)
                .padding()

            Button(action: {
                if let fileURL = recording.fileURL {
                    print("Trying to play file at URL: \(fileURL)") // Debug: Print the file URL
                    self.playRecording(from: fileURL)
                } else {
                    print("No valid file URL for the recording.")
                }
            }) {
                Text("Play Recording")
                    .font(.title2)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()

            Spacer()
        }
        .navigationTitle("Playback")
    }

    let localFilePath = "/Users/rusbeh/Projects/SongSync/SongSync/Songs/New Recording.m4a"
    
    private func playRecording(from fileURL: URL) {
        do {
            
            let fileURL = URL(fileURLWithPath: localFilePath)
            audioPlayer = try AVAudioPlayer(contentsOf: fileURL)
            audioPlayer?.play()
            print("Playing audio from: \(fileURL)")
        } catch {
            print("Failed to play recording: \(error)")
        }
    }
}
