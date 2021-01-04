//
//  ViewController.swift
//  ViperSlider
//
//  Created by Mat Louis on 1/3/21.
//

import UIKit

protocol ColorValueDelegate {
    func onColorValueChange() -> ()
}

class HomeViewController: UIViewController {
    
    @IBOutlet weak var sliderRed: UISlider!
    @IBOutlet weak var sliderGreen: UISlider!
    @IBOutlet weak var sliderBlue: UISlider!
    
    @IBOutlet weak var labelRGB: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rgb = loadColors()
        
        sliderRed.value = Float(rgb.0)
        sliderGreen.value = Float(rgb.1)
        sliderBlue.value = Float(rgb.2)
        
        labelRGB.text = "RGB(\(rgb.0), \(rgb.1), \(rgb.2))"
        
        self.view.backgroundColor = UIColor(red: rgb.0/255, green: rgb.1/255, blue: rgb.2/255, alpha: 1.0)
    }
    
    func loadColors() -> (CGFloat, CGFloat, CGFloat) {
        let red = CGFloat(UserDefaults.standard.float(forKey: "Red"))
        let green = CGFloat(UserDefaults.standard.float(forKey: "Green"))
        let blue = CGFloat(UserDefaults.standard.float(forKey: "Blue"))
        
        return (red, green, blue)
    }

    @IBAction func onRedChange(_ sender: UISlider) {
        onColorValueChange()
    }
    
    @IBAction func onGreenChange(_ sender: UISlider) {
        onColorValueChange()
    }
    
    @IBAction func onBlueChange(_ sender: UISlider) {
        onColorValueChange()
    }
    
    func saveCurrentColor(rgb: (CGFloat, CGFloat, CGFloat)) {
        UserDefaults.standard.set(rgb.0, forKey: "Red")
        UserDefaults.standard.set(rgb.1, forKey: "Green")
        UserDefaults.standard.set(rgb.2, forKey: "Blue")
        
        print("Current colors saved!")
    }
}

extension HomeViewController: ColorValueDelegate {
    
    func onColorValueChange() {
        let red = CGFloat(round(sliderRed.value))
        let green = CGFloat(round(sliderGreen.value))
        let blue = CGFloat(round(sliderBlue.value))
        
        labelRGB.text = "RGB(\(red), \(green), \(blue))"
        
        self.view.backgroundColor = UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1.0)
        
        saveCurrentColor(rgb: (red, green, blue))
    }
}

