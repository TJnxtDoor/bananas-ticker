import UIKit
import Messages
class StickersViewController: MSStickerBrowserViewController {
    
    var stickers = [MSSticker]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadStickers()
        stickerBrowserView.reloadData()
    }
    
    func loadStickers() {
        createSticker(asset: "Xbox", localizedDescription: "Xbox Emoji")
        createSticker(asset: "Playstation", localizedDescription: "Playstation Emoji")
        createSticker(asset: "Xbox", localizedDescription: "Controller Emoji")
        createSticker(asset: "Xbox", localizedDescription: "Forza Horizon 5Emoji")
    }
    
    func createSticker(asset: String, localizedDescription: String) {
        guard let stickerPath = Bundle.main.path(forResource: asset, ofType: "png") else {
            print("Couldn't find the sticker image")
            return
        }
        let stickerURL = URL(fileURLWithPath: stickerPath)
        
        do {
            let sticker = try MSSticker(contentsOfFileURL: stickerURL, localizedDescription: localizedDescription)
            stickers.append(sticker)
        } catch {
            print("Error creating sticker: \(error)")
        }
    }
    
    // MARK: - MSStickerBrowserViewDataSource
    
    override func numberOfStickers(in stickerBrowserView: MSStickerBrowserView) -> Int {
        return stickers.count
    }
    
    override func stickerBrowserView(_ stickerBrowserView: MSStickerBrowserView, stickerAt index: Int) -> MSSticker {
        return stickers[index]
    }
}

extension StickersViewController {
    // Animate the sticker browser view when stickers are loaded
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateStickers()
    }
    
    func animateStickers() {
        // Simple fade-in animation for the sticker browser view
        stickerBrowserView.alpha = 0
        UIView.animate(withDuration: 0.8, delay: 0, options: [.curveEaseInOut], animations: {
            self.stickerBrowserView.alpha = 1
        }, completion: nil)
    }
}


func createBananaImage() -> UIImage? {
    let renderer = UIGraphicsImageRenderer(size: CGSize(width: 300, height: 300))
    
    let image = renderer.image { ctx in
        let rectangle = CGRect(x: 0, y: 0, width: 300, height: 300)
        
        // Yellow banana shape
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 150, y: 50))
        path.addCurve(to: CGPoint(x: 250, y: 150), 
                     controlPoint1: CGPoint(x: 200, y: 30), 
                     controlPoint2: CGPoint(x: 270, y: 80))
        path.addCurve(to: CGPoint(x: 150, y: 250), 
                     controlPoint1: CGPoint(x: 230, y: 220), 
                     controlPoint2: CGPoint(x: 200, y: 270))
        path.addCurve(to: CGPoint(x: 50, y: 150), 
                     controlPoint1: CGPoint(x: 100, y: 230), 
                     controlPoint2: CGPoint(x: 30, y: 180))
        path.addCurve(to: CGPoint(x: 150, y: 50), 
                     controlPoint1: CGPoint(x: 70, y: 120), 
                     controlPoint2: CGPoint(x: 100, y: 70))
        path.close()
        
        UIColor.yellow.setFill()
        path.fill()
        
        UIColor.brown.setStroke()
        path.lineWidth = 2
        path.stroke()
    }
    
        return image
        return image
    }
