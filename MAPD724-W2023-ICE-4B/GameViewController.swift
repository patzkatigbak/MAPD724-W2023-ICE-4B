import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    //instance variables
    var currentScene: GKScene?
    
    @IBOutlet weak var LivesLabel: UILabel!
    @IBOutlet weak var ScoreLabel: UILabel!
    @IBOutlet weak var StartLabel: UILabel!
    @IBOutlet weak var StartButton: UIButton!
    @IBOutlet weak var GameOverLabel: UILabel!
    @IBOutlet weak var RestartButton: UIButton!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
       
        presentStartScene()
        
      //  presentEndScene()
        
        CollisionManager.gameViewController = self

    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask
    {
        return .portrait
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func updateLivesLabel()
    {
        LivesLabel.text = "Lives: \(ScoreManager.Lives)"
    }
    
    func updateScoreLabel()
    {
        ScoreLabel.text = "Score: \(ScoreManager.Score)"
    }
    
    func setScene(sceneName: String) -> Void
    {
        currentScene = GKScene(fileNamed: sceneName)
        
        if let scene = currentScene!.rootNode as! SKScene?
        {
            scene.scaleMode = .aspectFill
            if let view = self.view as! SKView?
            {
                view.presentScene(scene)
                view.ignoresSiblingOrder = true
            }
        }
        
    }
    
    func presentStartScene()
    {
        ScoreLabel.isHidden = true
        LivesLabel.isHidden = true
        StartLabel.isHidden = false
        StartButton.isHidden = false
        setScene(sceneName: "StartScene")
        
    }
    
    func presentEndScene()
    {
        ScoreLabel.isHidden = true
        LivesLabel.isHidden = true
        StartLabel.isHidden = true
        StartButton.isHidden = false
        RestartButton.isHidden = false
        GameOverLabel.isHidden = false
        setScene(sceneName: "EndScene")

    }
    
    @IBAction func StartButton_Pressed(_ sender: UIButton)
    {
        ScoreLabel.isHidden = false
        LivesLabel.isHidden = false
        StartLabel.isHidden = true
        StartButton.isHidden = true
        
        // Initialize the Lives and Score
        ScoreManager.Score = 0
        ScoreManager.Lives = 5
        updateLivesLabel()
        updateScoreLabel()
        setScene(sceneName: "GameScene")
    }
    
    @IBAction func RestartButton_Pressed(_ sender: UIButton)
    {
        RestartButton.isHidden = true
        GameOverLabel.isHidden = true
        ScoreLabel.isHidden = false
        LivesLabel.isHidden = false
  
        
        // Initialize the Lives and Score
        ScoreManager.Score = 0
        ScoreManager.Lives = 5
        updateLivesLabel()
        updateScoreLabel()
        setScene(sceneName: "GameScene")
        
    }
}
