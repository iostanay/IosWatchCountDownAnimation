//
//  InterfaceController.swift
//  IosWatchCountDownAnimation WatchKit Extension
//
//  Created by Tanay Bhattacharjee on 11/12/19.
//  Copyright © 2019 Tanay Bhattacharjee. All rights reserved.
//gg



import WatchKit
import Foundation

class InterfaceController: WKInterfaceController {
    
    @IBOutlet var timerLabel1: WKInterfaceLabel!
    @IBOutlet var timerLabel: WKInterfaceLabel!
    @IBOutlet var animator: WKInterfaceGroup!
    var timerVal: Int = 6
    var timer: Timer? = nil
    @IBOutlet var baseGroup: WKInterfaceGroup!
    @IBOutlet var inSessionGroup: WKInterfaceGroup!
    @IBOutlet var group1: WKInterfaceGroup!
    @IBOutlet var group2: WKInterfaceGroup!
    @IBOutlet var group3: WKInterfaceGroup!
    @IBOutlet var group4: WKInterfaceGroup!
    override func awake(withContext context: Any?) {
        
        super.awake(withContext: context)
        
    }
    override func willActivate() {
     self.baseGroup.setAlpha(0)
        
       timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (timer) in
            
            if self.timerVal == 0
                
            {
                DispatchQueue.main.async
                    {
                
                        WKInterfaceController.reloadRootPageControllers(withNames: ["Next"], contexts: nil, orientation: .vertical, pageIndex: 0)
                        
                }
    
                timer.invalidate()
                
                return
                
            }
            
            switch self.timerVal
            {
                
            case 6:
                
                self.scroll(to: self.inSessionGroup, at: .centeredVertically, animated: true)
            case 5:
                self.scroll(to: self.group4, at: .centeredVertically, animated: true)
            case 4:
                self.baseGroup.setAlpha(1)
                self.scroll(to: self.group3, at: .centeredVertically, animated: true)
                
            case 3:
                self.scroll(to: self.group2, at: .centeredVertically, animated: true)
                
            case 2:
                self.scroll(to: self.group1, at: .centeredVertically, animated: true)
                
                
                
            case 1:
                self.scroll(to: self.inSessionGroup, at: .centeredVertically, animated: true)
                
                
            default:
                
                break
            }
            
            print("time val\(self.timerVal)")
            
            
            self.timerVal = self.timerVal - 1
            
        })
        
        timer?.fire()
        
        super.willActivate()
        
    }
    
    override func didDeactivate() {
        
        // This method is called when watch view controller is no longer visible
        
        super.didDeactivate()
        
    }
    
    
    
    
}

