//
//  Island.swift
//  MAPD724-W2023-ICE-2B
//
//  Created by Patrick Katigbak on 2023-01-25.
//

import GameplayKit
import SpriteKit

class Cloud : GameObject
{
    
    //initializer
    init()
    {
        super.init(imageString: "cloud", initialScale: 1.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //lifecycle
    override func Start() {
        zPosition = Layer.cloud.rawValue
        alpha = 0.7 // its 50% transparent like opacity
        Reset()
    
    }
    
    override func Update() {
        Move()
        CheckBounds()
    }
    
    override func CheckBounds() {
        if(position.y <= -902)
        {
            Reset()
        }
    }
    
    override func Reset() {
        
        //randomize the vertical speed
        verticalSpeed = CGFloat((randomSource?.nextUniform())! * 5.0) + 5.0 //speed is as slow as ocean. and faster.
        
        //randomize the horizontal speed
        horizontalSpeed = CGFloat((randomSource?.nextUniform())! * 4.0) - 2.0 // speed of -2 to 2 units
        
        //get pseudo random number for X posiiton from -262 to 262
        let randomX: Int = (randomSource?.nextInt(upperBound: 524))! - 262
        position.x = CGFloat(randomX)

        //get pseudo random number for Y posiiton from 902 to 932
        let randomY: Int = (randomSource?.nextInt(upperBound: 30))! + 902
        position.y = CGFloat(randomY)
        
        isColliding = false
        
    }
    
    // public method
    func Move()
    {
        position.x -= horizontalSpeed!
        position.y -= verticalSpeed!
    }
}
