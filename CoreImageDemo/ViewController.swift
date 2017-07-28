//
//  ViewController.swift
//  CoreImageDemo
//
//  Created by ZhanyaaLi on 2017/7/28.
//  Copyright © 2017年 Hangzhou Zhanya Technology. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func demo1Action(_ sender: UIButton) {
        navigationController?.pushViewController(ProcessingImagesViewController(), animated: true)
    }

    @IBAction func demo02Action(_ sender: UIButton) {
        navigationController?.pushViewController(CoreImageDemo02ViewController(), animated: true)
    }
}

