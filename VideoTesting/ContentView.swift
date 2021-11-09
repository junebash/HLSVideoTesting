import SwiftUI
import AVKit
import UIKit

struct ContentView: View {
    @State private var showingPlayer: Bool = false

    var body: some View {
        Button("Play") {
            showingPlayer = true
        }.sheet(isPresented: $showingPlayer, onDismiss: nil) {
            VideoPlayer(item: self.item)
        }
    }

    private var item: AVPlayerItem {
        let item = AVPlayerItem(url: URL(string: "https://devstreaming-cdn.apple.com/videos/streaming/examples/bipbop_16x9/bipbop_16x9_variant.m3u8")!)
        return item
    }
}

struct VideoPlayer: UIViewControllerRepresentable {
    let item: AVPlayerItem

    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        controller.player = .init(playerItem: item)
        return controller
    }

    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
