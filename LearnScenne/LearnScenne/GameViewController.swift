import UIKit
import SceneKit

class GameViewController: UIViewController {
    var scnView: SCNView!
    var scnScene: SCNScene!

    func setupView() {
      scnView = self.view as! SCNView
    }
    func setupScene() {
      scnScene = SCNScene()
      scnView.scene = scnScene
    }

  override func viewDidLoad() {
    super.viewDidLoad()
      setupScene()
      setupView()
  }

//  override func shouldAutorotate() -> Bool {
//    return true
//  }
//
//  override func prefersStatusBarHidden() -> Bool {
//    return true
//  }
}

