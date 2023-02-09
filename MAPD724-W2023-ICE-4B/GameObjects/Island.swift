//
//  Island.swift
//  MAPD724-W2023-ICE-2B
//
//  Created by Patrick Katigbak on 2023-01-25.
//

import GameplayKit
import SpriteKit

class Island : GameObject
{
    
    //initializer
    init()
    {
        super.init(imageString: "island", initialScale: 2.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //lifecycle
    override func Start() {
        zPosition = Layer.island.rawValue
        verticalSpeed = 5.0
        Reset()
    
    }
    
    override func Update() {
        Move()
        CheckBounds()
    }
    
    override func CheckBounds() {
        if(position.y <= -876)
        {
            Reset()
        }
    }
    
    override func Reset() {
        
        position.y = 876
        
        //get pseudo random number
        let randomX: Int = (randomSource?.nextInt(upperBound: 626))! - 313
        position.x = CGFloat(randomX)
        isColliding = false
        
    }
    
    // public method
    func Move()
    {
        position.y -= verticalSpeed!
    }
}
