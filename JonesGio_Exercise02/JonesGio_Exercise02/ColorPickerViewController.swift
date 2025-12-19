//
//  ColorPickerViewController.swift
//  JonesGio_Exercise02
//
//  Created by Gio on 11/16/25.
//

import UIKit

class ColorPickerViewController: UIViewController {

    @IBOutlet var colorPickerUIView: UIView! = UIView()
    
    @IBOutlet var redSlider: UISlider! = UISlider()
    @IBOutlet var greenSlider: UISlider! = UISlider()
    @IBOutlet  var blueSlider: UISlider! = UISlider()
    @IBOutlet var randomizeButton: UIButton! = UIButton()
    
    @IBOutlet weak var backButton: UIButton!
    var currentColor: UIColor = .white
    
    var red: CGFloat = 0.0
    var green: CGFloat = 0.0
    var blue: CGFloat = 0.0
    var alpha: CGFloat = 1.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
        
        sliderValueChanged(redSlider!)
        sliderValueChanged(greenSlider!)
        sliderValueChanged(blueSlider!)
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider)
    {
        let red = CGFloat(redSlider.value)
        let green = CGFloat(greenSlider.value)
        let blue = CGFloat(blueSlider.value)
        
        colorPickerUIView.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        
        currentColor = UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    @IBAction func randomizeButtonTapped(_ sender: Any)
    {
        let red = CGFloat.random(in: 0...1)
        let green = CGFloat.random(in: 0...1)
        let blue = CGFloat.random(in: 0...1)
        
        redSlider.value = Float(red)
        greenSlider.value = Float(green)
        blueSlider.value = Float(blue)
        
        colorPickerUIView.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        
        currentColor = UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    func updateUI()
    {
        currentColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        redSlider.value = Float(red)
        greenSlider.value = Float(green)
        blueSlider.value = Float(blue)
        
        colorPickerUIView.backgroundColor = currentColor
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
