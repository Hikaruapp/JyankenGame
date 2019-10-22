//
//  ViewController.swift
//  JyankenGame
//
//  Created by Yanase Yuji on 2019/10/22.
//  Copyright © 2019 hikaruApp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var buttonGU: CustomButton!
    @IBOutlet weak var buttonTyoki: CustomButton!
    @IBOutlet weak var buttonPa: CustomButton!
    @IBOutlet weak var buttonStart: CustomButton!
    
    @IBOutlet weak var cpJyankenImage: UIImageView!
    @IBOutlet weak var jyankenmessage: CustomLabel!
    
    // グーが押されたとき
    @IBAction func buttonGu(_ sender: Any) {
        self.buttonTyoki.isHidden = true
        self.buttonPa.isHidden = true
        
        let cp = CpEngine().jyankenValue()
        
        self.jyankenmessage.text = jyankenAPi.GU(cp).statusMessage
        self.cpJyankenImage.image = jyankenAPi.GU(cp).cpJyankenImage
        
        again()

    }
    
    // チョキが押されたとき
    @IBAction func buttonTyoki(_ sender: Any) {
        self.buttonGU.isHidden = true
        self.buttonPa.isHidden = true
        
        let cp = CpEngine().jyankenValue()
        
        self.jyankenmessage.text = jyankenAPi.TYOKI(cp).statusMessage
        self.cpJyankenImage.image = jyankenAPi.TYOKI(cp).cpJyankenImage
        
        again()
    }
    
    // パーが押されたとき
    @IBAction func buttonPa(_ sender: Any) {
        self.buttonGU.isHidden = true
        self.buttonTyoki.isHidden = true
        
        let cp = CpEngine().jyankenValue()
        
        self.jyankenmessage.text = jyankenAPi.PA(cp).statusMessage
        self.cpJyankenImage.image = jyankenAPi.PA(cp).cpJyankenImage
        
        again()
    }
    
    // ジャンケンをする
    @IBAction func buttonStart(_ sender: Any) {
        
        self.buttonGU.isHidden = false
        self.buttonTyoki.isHidden = false
        self.buttonPa.isHidden = false
        
        self.buttonStart.isHidden = true
        
        self.jyankenmessage.text = "ジャンケン！"
        self.cpJyankenImage.image = UIImage()
    }
    
    // もう一度ジャンケンをする
    func again() {
        self.buttonStart.setTitle("もう一度ジャンケンをする", for: .normal)
        self.buttonStart.isHidden = false
        
    }
}

