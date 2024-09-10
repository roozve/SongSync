import SwiftUI
import AVFoundation

struct PlaybackView: View {
    var recording: RecordingEntity
    
    @State private var audioPlayer: AVAudioPlayer?
    
    var body: some View {
        VStack {
            Text("Playing: \(recording.name ?? "Unknown Name")")
                .font(.title)
                .padding()
            
            Button(action: {
                playRecording()
            }) {
                Text("Play Recording")
                    .font(.headline)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .onAppear {
            setupAudioSessionForPlayback()
            setupAudioPlayer()
        }
    }

    // Configure the audio session to play audio through the loudspeaker
    private func setupAudioSessionForPlayback() {
        let audioSession = AVAudioSession.sharedInstance()
        do {
            // Use playback category to ensure the audio plays through the speaker
            try audioSession.setCategory(.playback, mode: .default, options: [.defaultToSpeaker])
            try audioSession.setActive(true)
            print("Audio session configured for loudspeaker playback.")
        } catch {
            print("Failed to set up audio session for playback: \(error)")
        }
    }

    private func setupAudioPlayer() {
        guard let fileURLString = recording.fileURL, let fileURL = URL(string: fileURLString) else {
            print("Error: Invalid file URL for the recording.")
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: fileURL)
            audioPlayer?.prepareToPlay()
            print("Audio player set up successfully with file: \(fileURL)")
        } catch {
            print("Error loading audio file: \(error)")
        }
    }

    private func playRecording() {
        audioPlayer?.play()
    }
}
