import SwiftUI
import AVFoundation

struct PlaybackView: View {
    let recording: RecordingEntity // The dynamic recording from Core Data
    @State private var audioPlayer: AVAudioPlayer?
    @State private var isPlaying = false
    @State private var bpm: Double = 120.0 // Set initial BPM here
    @State private var beatIndicatorOpacity = 0.3
    @State private var metronomeTimer: Timer?

    var body: some View {
        VStack {
            // Display the recording's name
            Text("Now Playing: \(recording.name ?? "Unknown Name")")
                .font(.headline)
                .padding()

            // Beat visualization: This circle will "pulse" with the beat
            Circle()
                .frame(width: 100, height: 100)
                .foregroundColor(.blue)
                .opacity(beatIndicatorOpacity)
                .animation(.easeInOut(duration: 0.25), value: beatIndicatorOpacity)

            // Play/Pause Button
            Button(action: {
                if isPlaying {
                    stopAudio()
                } else {
                    playAudio()
                }
            }) {
                Text(isPlaying ? "Pause" : "Play")
                    .font(.title)
                    .padding()
                    .background(isPlaying ? Color.red : Color.green)
                    .foregroundColor(.white)
                    .clipShape(Capsule())
            }
            .padding()

            // Slider to Adjust BPM (tempo)
            VStack {
                Text("Adjust Tempo: \(Int(bpm)) BPM")
                Slider(value: $bpm, in: 60...180, step: 1) {
                    Text("BPM")
                }
                .padding()
                .onChange(of: bpm, perform: { value in
                    updateMetronome()
                })
            }

            Spacer()
        }
        .onAppear {
            setupAudioPlayer()
        }
        .onDisappear {
            stopMetronome()
        }
    }

    // Setup the audio player with the recorded file
    private func setupAudioPlayer() {
        if let fileURL = recording.fileURL {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: fileURL)
                audioPlayer?.prepareToPlay()
            } catch {
                print("Error loading audio file: \(error)")
            }
        } else {
            print("Audio file URL not available for this recording.")
        }
    }

    // Play audio and start metronome
    private func playAudio() {
        audioPlayer?.play()
        isPlaying = true
        print("Playing audio")
        startMetronome()
    }

    // Stop audio and metronome
    private func stopAudio() {
        audioPlayer?.pause()
        isPlaying = false
        print("Audio paused")
        stopMetronome()
    }

    // Start the metronome based on BPM
    private func startMetronome() {
        stopMetronome() // Stop any existing metronome timer before starting a new one

        let beatInterval = 60.0 / bpm
        metronomeTimer = Timer.scheduledTimer(withTimeInterval: beatInterval, repeats: true) { _ in
            self.triggerBeat()
        }
    }

    // Stop the metronome timer
    private func stopMetronome() {
        metronomeTimer?.invalidate()
        metronomeTimer = nil
    }

    // Update the metronome when BPM changes
    private func updateMetronome() {
        if isPlaying {
            startMetronome() // Restart the metronome with the new BPM
        }
    }

    // Trigger visual beat indicator
    private func triggerBeat() {
        // Pulse the circle to simulate a "beat"
        withAnimation {
            beatIndicatorOpacity = 1.0
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            withAnimation {
                beatIndicatorOpacity = 0.3
            }
        }
        print("Beat triggered at \(bpm) BPM")
    }
}
