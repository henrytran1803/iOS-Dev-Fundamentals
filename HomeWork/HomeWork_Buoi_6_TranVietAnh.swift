import Foundation

// homework 1
class DowloadManager {
    var dowloadDelegate: DownloadManagerDelegate?
    func startDownload() {
        dowloadDelegate?.downloadDidStart()
    }
    func inprogressDowload() {
        for i in stride(from: 0, through: 100, by: 25) {
            Thread.sleep(forTimeInterval: 0.1)
            dowloadDelegate?.downloadDidProgress(percent: Double(i) )

        }
    }
    func finishDowload(_ data: String) {
        dowloadDelegate?.downloadDidFinish(data: data )
    }

}
protocol DownloadManagerDelegate {
    func downloadDidStart()
    func downloadDidProgress(percent: Double)
    func downloadDidFinish(data: String)
}
class DownloadObserver: DownloadManagerDelegate {
    func downloadDidStart() {
        print("Download started.")
    }
    
    func downloadDidProgress(percent: Double) {
        print("Download still in progress: \(percent)%")
    }
    
    func downloadDidFinish(data: String) {
        print("Download finished \(data).")
    }
}
var downloadManager = DowloadManager()
downloadManager.dowloadDelegate = DownloadObserver()
downloadManager.startDownload()
downloadManager.inprogressDowload()
downloadManager.finishDowload("data")

// homework2
enum MessageSendingError: Error {
    case networkError
    case internalError
}
class MessageSender {
    var delegate: MessageSenderDelegate?
    
    func sendMessage() {
        if Bool.random() {
            self.delegate?.messageDidSend()
        } else {
            self.delegate?.messageDidFailWithError(error: MessageSendingError.networkError)
        }
    }
}


protocol MessageSenderDelegate {
    func messageDidSend()
    func messageDidFailWithError(error: Error)
}

class MessageObserver: MessageSenderDelegate {
    func messageDidFailWithError(error: any Error) {
        print("Message sending failed: \(error)")
    }
    
    func messageDidSend() {
        print("Message sent successfully")
    }
}
var sender = MessageSender()
var observer = MessageObserver()
sender.delegate = observer
sender.sendMessage()

// homework3
protocol SituationHandlerDelegate: AnyObject {
    func situationDidOccur(type: String)
    func situationDidEnd(type: String)
}
@MainActor
class SituationHandler {
    weak var situationHandlerDelegate: SituationHandlerDelegate?
    
    func handleSituation(type: String) {
        print("Handling situation: \(type)")
        situationHandlerDelegate?.situationDidOccur(type: type)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.situationHandlerDelegate?.situationDidEnd(type: type)
        }
    }
}


class GameObserver: SituationHandlerDelegate {
    func situationDidOccur(type: String) {
        print("Situation occurred: \(type)")
    }
    
    func situationDidEnd(type: String) {
        print("Situation ended: \(type)")
    }
}

let situationHandler = SituationHandler()
let gameObserver = GameObserver()

situationHandler.situationHandlerDelegate = gameObserver
situationHandler.handleSituation(type: "Boss Fight")


