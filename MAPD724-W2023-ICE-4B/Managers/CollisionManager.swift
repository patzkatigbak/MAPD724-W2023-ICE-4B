//
//  CollisionManager.swift
//  GAME724-W2023-ICE-3B
//
//  Created by Patrick Katigbak on 2023-02-01.
//

import GameplayKit
import SpriteKit

class CollisionManager
{
    //get reference to the gameiewcontroller
    public static var gameViewController : GameViewController?
    
    public static func SquaredDistance(point1: CGPoint, point2: CGPoint) -> CGFloat
    {
        let Xs: CGFloat = point2.x - point1.x
        let Ys: CGFloat = point2.y - point1.y
        
        return Xs * Xs + Ys * Ys
        
    }
    
    //Collision Function
    public static func SquaredRadiusCheck(scene: SKScene, object1: GameObject, object2: GameObject)
    {
        let P1 = object1.position
        let P2 = object2.position
        let P1Radius = object1.halfHeight!
        let P2Radius = object2.halfHeight!
        let Radii = P1Radius + P2Radius
        
        //collision check - overlapping circles
        if(SquaredDistance(point1: P1, point2: P2) < (Radii * Radii))
        {
            //we have collision
            if(!object2.isColliding!)
            {
                //if its not already colliding
                switch(object2.name)
                {
                case "island":
//                    print("colliding with ISLAND")
                    ScoreManager.Score += 100
                    gameViewController?.updateScoreLabel()
                    scene.run(SKAction.playSoundFileNamed("yay", waitForCompletion: false))
                    
                    if(ScoreManager.Score % 1000 == 0 ) //for every 1000 score, +1 to lives
                    {
                        ScoreManager.Lives += 1
                        gameViewController?.updateLivesLabel()
                    }
      
                    break
                    
                case "cloud":
//                    print("colliding with CLOUD")
                    ScoreManager.Lives -= 1
                    gameViewController?.updateLivesLabel()
                    scene.run(SKAction.playSoundFileNamed("thunder", waitForCompletion: false))
                    
                    if(ScoreManager.Lives < 1)
                    {
                        gameViewController?.presentEndScene()
                    }

                    break
                    
                default:
                    break
                }
                
                object2.isColliding = true
                
            }
            
            
            
        }
    }
    
}
