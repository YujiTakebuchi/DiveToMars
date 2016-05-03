//
//  GameViewController.swift
//  test
//
//  Created by 竹渕宥仁 on 2016/04/24.
//  Copyright (c) 2016年 竹渕宥仁. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let start = StartScene()
        //View ControllerのViewをSKView型として取り出す
        let view = self.view as! SKView
        //ビュー上にシーンを表示
        view.presentScene(start)
        
        /*
        let scene = GameScene()
        view.presentScene(scene)
         */
    }

    override func shouldAutorotate() -> Bool {
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
