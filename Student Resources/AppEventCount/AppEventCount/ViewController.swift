//
//  ViewController.swift
//  AppEventCount
//
//  Created by Dias on 12/9/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet var didFinishLaunchingLabel: UILabel!
    @IBOutlet var configurationForConnectingLabel: UILabel!
    
    @IBOutlet var willConectToLabel: UILabel!
    @IBOutlet var didBecomeActiveLabel: UILabel!
    @IBOutlet var willResignActiveLabel: UILabel!
    @IBOutlet var willEnterForegroundLabel: UILabel!
    @IBOutlet var didEnterForegroundLabel: UILabel!
    
    var willConnectCount = 0
    var didBecomeActiveCount = 0
    var willResignActiveCount = 0
    var willEnterForegroundCount = 0
    var didEnterForegroungCount = 0
    var didFinishLaunchLabel = 0
    var configurationForConnectingCount = 0
    
    var appDelegate = (UIApplication.shared.delegate as! AppDelegate)
    
    func updateView() {
        didFinishLaunchingLabel.text = "The app has launched \(appDelegate.launchCount) time(s)"
        configurationForConnectingLabel.text = "Configuration for connecting count \(appDelegate.configurationForConnectingCount)"
        willConectToLabel.text = "Will connect count \(willConnectCount)"
        didBecomeActiveLabel.text = "Did become active count \(didBecomeActiveCount)"
        willResignActiveLabel.text = "Will resign active count \(willResignActiveCount)"
        willEnterForegroundLabel.text = "Will enter foreground count \(willEnterForegroundCount)"
        didEnterForegroundLabel.text = "Did enter foreground count \(didEnterForegroungCount)"
    }
}

