//
//  GameScene.swift
//  DiveToCrater
//
//  Created by 竹渕宥仁 on 2016/04/23.
//  Copyright (c) 2016年 竹渕宥仁. All rights reserved.
//

import SpriteKit

var currentHeight: Double = 1000
var currentSpeed: Double = 0
var currentTime: Double = 0
var bodySurfaceArea: Double!
var height: Double = 0
var v: Double = 0
var v2: Double = 0
var Vmax: Double = 0
var Vmin: Double = 0
var t1: Double = 0
var t2: Double = 0
let g1: Double = 3.71
let g2: Double = 15.0
let k1: Double = 0.27
let k2: Double = 0.012
class GameScene: SKScene {
    var timer = NSTimer()
    
    var label = SKLabelNode(fontNamed: "STLibian-SC-Regular")
    var label2 = SKLabelNode(fontNamed: "DigitalSystem")
    var label3 = SKLabelNode(fontNamed: "DigitalSystem")
    var label4 = SKLabelNode(fontNamed: "DigitalSystem")
    var label5 = SKLabelNode(fontNamed: "DigitalSystem")
    let label6 = SKLabelNode(fontNamed: "DigitalSystem")
    /*
    var label = UILabel(frame: CGRectMake(0, 0, 100, 60))
    var label2 = UILabel(frame: CGRectMake(0, 0, 100, 60))
    var label3 = UILabel(frame: CGRectMake(0, 0, 100, 60))
    var label4 = UILabel(frame: CGRectMake(0, 0, 100, 60))
    var label5 = UILabel(frame: CGRectMake(0, 0, 100, 60))
    */
    
    override func didMoveToView(view: SKView) {
        
        let background = SKSpriteNode(imageNamed: "ESP_014011_1315_RED_C_01_ORTHO")
        background.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.5)
        background.size = self.size
        background.zPosition = -100
        self.addChild(background)
        
        // 線を引くための座標を指定. この場合はx方向に150の長さの線.
        var Points = [CGPoint(x:self.view!.bounds.width*2.4/3,y:self.view!.frame.height*0.8/3),CGPoint(x:self.view!.bounds.width*2.4/3,y:self.view!.frame.height*2.8/3)]
        // 座標から線のShapeNodeを生成.
        let Line = SKShapeNode(points: &Points, count: Points.count)
        // ShapeNodeの座標を指定.
        Line.position = GetMid()
        // ShapeNodeの線の色を白色に指定.
        Line.strokeColor = UIColor.whiteColor()
        // ShapeNpdeをsceneに追加.
        self.addChild(Line)
        
        label.position = CGPoint(x:self.size.width*0.8,y:self.size.height*0.3)//表示位置
        label.text = "4000.0[m]"
        label.fontSize = 100//文字サイズ
        label.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Center
        label.fontColor = UIColor.redColor()////文字色
        label.zPosition = 0
        //label.color = UIColor.blackColor()
        background.addChild(label)
        
        label2.position = CGPoint(x:self.view!.bounds.width*2.4/3,y:self.view!.frame.height*1.5/3)
        label2.fontSize = 15.0
        label2.fontColor = UIColor.blackColor()////文字色
        label2.color = UIColor.blueColor()
        label2.text = "\(currentHeight)[m]"
        self.addChild(label2)
        
        label3.position = CGPoint(x:self.view!.bounds.width*2.4/3,y:self.view!.frame.height*2.8/3)
        label3.fontSize = 15.0
        label3.fontColor = UIColor.purpleColor()////文字色
        label3.color = UIColor.blackColor()
        label3.text = "0[m]"
        self.addChild(label3)
        
        label4.position = CGPoint(x:self.view!.bounds.width*0.6/3,y:self.view!.frame.height*2.8/3)
        label4.fontSize = 15.0
        label4.fontColor = UIColor.greenColor()////文字色
        label4.color = UIColor.blackColor()
        label4.text = "\(currentSpeed)[km/s]"
        self.addChild(label4)
        
        label5.position = CGPoint(x:self.view!.bounds.width*0.6/3,y:self.view!.frame.height*0.6/3)
        label5.fontSize = 15.0
        label5.fontColor = UIColor.yellowColor()////文字色
        label5.color = UIColor.blackColor()
        label5.text = "\(currentTime)[s]"
        self.addChild(label5)
        
        label6.position = CGPoint(x:self.view!.bounds.width/2,y:self.view!.frame.height * 2/5)
        label6.fontSize = 20.0
        label6.fontColor = UIColor.redColor()   ////文字色
        label6.color = UIColor.blackColor()
        label6.text = "Open your parachute"
        self.addChild(label6)
        
        /* TODO ボタンはまた後で */
        /*
         var openButton = UIButton()
         openButton.setTitle("Open", forState: .Normal)
         openButton.titleLabel?.font = UIFont(name:"DigitalSystem",size: 32)
         openButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
         openButton.backgroundColor = UIColor.blackColor()
         openButton.frame = CGRectMake(0, 0, 100, 40)
         openButton.layer.position = CGPoint(x: self.view!.frame.width/2, y: self.view!.frame.height/2)
         openButton.layer.cornerRadius = 5
         openButton.addTarget(self, action: "tappedOpenButton", forControlEvents: .TouchDown)
         self.view!.addSubview(openButton)
         */
        
        self.timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "calcStatus", userInfo: nil, repeats: true)
    }
    
    func GetMid()->CGPoint{
        return CGPointMake(self.frame.midX, self.frame.midY)
    }
    
    func calcStatus() {
        let myStartScene = StartScene()
        
        while true {
            t1 += 0.01
            Vmax = height * g1 * k1 // CHANGE myStartScene.weith -> height
            v =  g1 * t1
                
            if v >= Vmax {
                v = Vmax
            }
            
            height -= (v * 0.01)
           if(height <= 1200)   // CHANGE myStartScene.height! -> height(2)
            {
                break
            }
        }
        
        func tappedOpenButton() {
            while(height > 0)   // CHANGE myStartScene.height! -> height
            {
                t2 += 0.01
                label5.text = String(t1 + t2)
                Vmin = height * g2 * k2 // CHANGE myStartScene.weith -> height
                v2 = g2 * t2
                v = v2
                
                if((v-v2) <=  Vmin)
                {
                    label6.text = "Warning!: Terminal Velocity"
                    v = Vmin
                }
                else if((v-v2) <= 0)
                {
                    label6.text = "Warning!: Terminal Velocity"
                } else {
                    label6.text = "Slow down now!"
                }
                
                height -= (Vmin * 0.01)
                if(height <= 0) // CHANGE myStartScene.height -> height(2)
                {
                    label6.text = "Touch down!"
                }
            }
        }
        currentSpeed = v
        currentHeight = height  // CHANGE myStartScene.height -> height
        currentTime = t1 + t2
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
