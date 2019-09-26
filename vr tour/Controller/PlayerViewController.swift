//
//  PlayerViewController.swift
//  vr tour
//
//  Created by student on 7/8/2562 BE.
//  Copyright © 2562 student. All rights reserved.
//

import UIKit
import OmniVirtSDK

class PlayerViewController: UIViewController, VRPlayerDelegate {
    func playerLoaded(_ player: VRPlayer, withMaximumQuality maximum: Int, andCurrentQuality current: Quality, andCardboardMode mode: Mode) {
        player.play()
    }
    
    func playerStarted(_ player: VRPlayer) {
        
    }
    
    func playerPaused(_ player: VRPlayer) {
        print("pause")
    }
    
    func playerEnded(_ player: VRPlayer) {
        print("end")
    }
    
    func playerSkipped(_ player: VRPlayer) {
        
    }
    
    func playerDurationChanged(_ player: VRPlayer, withValue value: Double) {
        
    }
    
    func playerProgressChanged(_ player: VRPlayer, withValue value: Double) {
        
    }
    
    func playerBufferChanged(_ player: VRPlayer, withValue value: Double) {
        
    }
    
    func playerSeekChanged(_ player: VRPlayer, withValue value: Double) {
        
    }
    
    func playerCardboardChanged(_ player: VRPlayer, withMode value: Mode) {
        
    }
    
    func playerVolumeChanged(_ player: VRPlayer, withLevel value: Double) {
        
    }
    
    func playerQualityChanged(_ player: VRPlayer, withQuality value: Quality) {
        
    }
    
    func playerExpanded(_ player: VRPlayer) {
        
    }
    
    func playerCollapsed(_ player: VRPlayer) {
        
    }
    
    func playerLatitudeChanged(_ player: VRPlayer, withLatitude value: Double) {
        
    }
    
    func playerLongitudeChanged(_ player: VRPlayer, withLongitude value: Double) {
        
    }
    
    func playerSwitched(_ player: VRPlayer, withScene name: String, withHistory history: [String]) {
        
    }
    
    func playerMessageReceived(_ player: VRPlayer, withName name: String, andValue json: String) {
        
    }
    
    var player:VRPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        player = VRPlayer.create()
        player.load(withContentID: 36492) // Replace with your Content ID
        player.frame = view.frame
        view.addSubview(player)
        player.layoutSubviews()
        player.delegate = self
        
        let closeButton:UIButton = UIButton(frame: CGRect (x: 4, y: 35, width:50, height: 50))
//        closeButton.setTitle("close", for: .normal)
//        closeButton.setTitleColor(.white, for: .normal)
        closeButton.setImage(UIImage(named: "map"), for: .normal)
        view.addSubview(closeButton)
        closeButton.addTarget(self, action: #selector(closeVRPlayer), for: .touchUpInside)
        
        
    }
    
    @objc func closeVRPlayer(){
        player.pause()
        print("go to map")
        let alertController = UIAlertController(title: "Quests", message: "Do you want to play quests now?", preferredStyle: .alert)
        
        let action1 = UIAlertAction(title: "Ok", style: .default) { (action:UIAlertAction) in
            print("You've can go to Quest")
            //let quest = UIStoryboard.main
            let presentingVC = self.presentingViewController!
            self.dismiss(animated: true) {
                //presentingVC.present(quest, animated: true, completion: nil)
                presentingVC.performSegue(withIdentifier: "openQuest", sender: presentingVC)
            }
            
        }
        
        let action2 = UIAlertAction(title: "Later", style: .cancel) { (action:UIAlertAction) in
            print("You've pressed cancel")
            self.dismiss(animated: true, completion: nil)
        }
        
        alertController.addAction(action1)
        alertController.addAction(action2)
        self.present(alertController, animated: true, completion: nil)
        
        
        
    }
    


}
