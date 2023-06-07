import UIKit
import AVFoundation
import CocoaAsyncSocket

class SendVC: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {
    @IBOutlet weak var addressTextFiled: UITextField!
    
    @IBOutlet weak var m_lab: UILabel!
    let videoClient = VideoClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        guard let ipAddress = addressTextFiled.text else { return }
        
        do {
            try videoClient.connect(to: ipAddress, with: 12005)
            try videoClient.startSendingVideoToServer()
        } catch {
            print("error occured : \(error.localizedDescription)")
        }
    }
}
