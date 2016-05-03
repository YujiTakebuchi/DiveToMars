//
//  startScene.swift
//  DiveToCrater_2
//
//  Created by 竹渕宥仁 on 2016/04/23.
//  Copyright © 2016年 竹渕宥仁. All rights reserved.
//


import SpriteKit
import CoreMotion

class StartScene: SKScene {
    //var myCMAltimeter: CMAltimeter!
    var height: Double = 170.0
    
    override func didMoveToView(view: SKView) {
        let background = SKSpriteNode(imageNamed: "dive_to_mars_background")
        background.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        background.size = self.size
        self.addChild(background)
        
        let title = SKSpriteNode(imageNamed: "SKYDIVING")
        title.position = CGPoint(x: self.size.width/2, y: self.size.height*2/3)
        title.size.width = self.size.width * 4/5
        title.size.height = self.size.height * 1/10
        self.addChild(title)
        
        let touch = SKSpriteNode(imageNamed: "touch")
        touch.position = CGPoint(x: self.size.width/2, y: self.size.height*0.8/3)
        touch.size.width = self.size.width * 6/7
        touch.size.height = self.size.height * 1/15
        self.addChild(touch)
        
        /* スプライト作成用 */
        /*
        let origin = UILabel(frame: CGRectMake(0, 0, 200, 60))
        origin.text = "SKYDIVING"
        origin.center = CGPoint(x:self.view!.bounds.width/2,y:self.view!.frame.height/9);//表示位置
        origin.textAlignment = NSTextAlignment.Center//整列
        origin.font = UIFont(name:"HelveticaNeue-UltraLight",size: 36)//文字サイズ
        origin.textColor = UIColor.whiteColor();////文字色
        self.view?.addSubview(origin);
       */
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* 後々実装したい */
        /*
        // CMAltimeterを取得.
        myCMAltimeter = CMAltimeter()
        
        // CMAltimeterが利用できるか(iPhone5SではNoが返ってくる).
        let isAltimeter = CMAltimeter.isRelativeAltitudeAvailable()
        // Altimeterのモニタリングのスタート.
        if isAltimeter {
            myCMAltimeter.startRelativeAltitudeUpdatesToQueue(NSOperationQueue.mainQueue(), withHandler: {data, error in
                if error == nil {
                    self.height = Double(data!.relativeAltitude)
                }
            })
        } else{
            height = 170.0
        }
        */
        let myGameScene = GameScene()
        let transition = SKTransition.crossFadeWithDuration(1.0)
        let view = self.view! as SKView
        view.presentScene(myGameScene, transition: transition)
    }
}