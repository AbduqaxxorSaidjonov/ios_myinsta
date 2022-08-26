
import Foundation
import SwiftUI

class Utils{
    static var color1 = Color(red: 252/255, green: 175/255, blue: 69/255)
    static var color2 = Color(red: 245/255, green: 96/255, blue: 64/255)
    static var image1 = "https://lh6.googleusercontent.com/-9lzOk_OWZH0/URquoo4xYoI/AAAAAAAAAbs/AwgzHtNVCwU/s1024/Frantic.jpg"
    static var image2 = "https://lh4.googleusercontent.com/-JhFi4fb_Pqw/URquuX-QXbI/AAAAAAAAAbs/IXpYUxuweYM/s1024/Horseshoe%252520Bend.jpg"
    static var image3 = "https://instagram.ftas2-1.fna.fbcdn.net/v/t51.2885-19/278962779_1005099470113067_8548239319357226869_n.jpg?stp=dst-jpg_s320x320&_nc_ht=instagram.ftas2-1.fna.fbcdn.net&_nc_cat=111&_nc_ohc=vp3bCIWUXR0AX_BUARK&edm=ABfd0MgBAAAA&ccb=7-4&oh=00_AT92bRkG2zAub4bIxUf_imis0Tw0f6vDFrIEMfMOv0BUCg&oe=628B08F9&_nc_sid=7bff83"
  
    static func currentDate() -> String{
        let date = Date()
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd HH:mm"
        let dateString = df.string(from: date)
        return dateString
    }
}

extension UIScreen{
    static let width = UIScreen.main.bounds.size.width
    static let height = UIScreen.main.bounds.size.height
    static let size = UIScreen.main.bounds.size
}

struct ShareSheet: UIViewControllerRepresentable{
    
    var items: [Any]
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: items, applicationActivities: nil)
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
        
    }
}
