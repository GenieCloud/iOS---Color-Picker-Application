//
//  ViewController.swift
//  JonesGio_Exercise02
//
//  Created by Gio on 11/16/25.
//

import UIKit

class ViewController: UIViewController {

    //Variable for UIColor
    var currentColor = UIColor.white
    
    //Outlet for UIView
    @IBOutlet var colorViewMain: UIView?
    
    //Label Outlets
    @IBOutlet var redLabel: UILabel?
    @IBOutlet var greenLabel: UILabel?
    @IBOutlet var blueLabel: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        updateLabels()
        
    }
    
    func updateLabels()
    {
        var red = CGFloat(0)
        var green = CGFloat(0)
        var blue = CGFloat(0)
        
        currentColor.getRed(&red, green: &green, blue: &blue, alpha: nil)
        redLabel?.text = "Red: \(red)"
        greenLabel?.text = "Green: \(green) "
        blueLabel?.text = "Blue: \(blue)"
    }
    
    @IBAction func unwindToFirst(_ segue: UIStoryboardSegue) {
        if let picker = segue.source as? ColorPickerViewController {
            currentColor = picker.currentColor
            colorViewMain?.backgroundColor = currentColor
            updateLabels()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "colorPickerSegue"
        {
            if segue.destination is ColorPickerViewController
            {
                let vc = segue.destination as! ColorPickerViewController;
                vc.currentColor = currentColor;
            }
        }
    }
}
