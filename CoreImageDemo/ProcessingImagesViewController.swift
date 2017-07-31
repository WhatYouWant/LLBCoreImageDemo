//
//  ProcessingImagesViewController.swift
//  CoreImageDemo
//
//  Created by ZhanyaaLi on 2017/7/28.
//  Copyright © 2017年 Hangzhou Zhanya Technology. All rights reserved.
//

import UIKit
import CoreImage
import SnapKit

class ProcessingImagesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        listing1_1BasicFeature()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func listing1_1BasicFeature() {
        let context = CIContext()
        let itemWidth = 200
        let imageView1 = UIImageView(image: #imageLiteral(resourceName: "pic1.JPG"))
        view.addSubview(imageView1)
        imageView1.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(64+50);
            make.centerX.equalToSuperview();
            make.width.equalTo(itemWidth);
            make.height.equalTo(itemWidth);
        }
        
        let dispatchQueue = DispatchQueue.init(label: "ImageProcess")
        dispatchQueue.async {
            let filter = CIFilter(name: "CISepiaTone")
            filter?.setValue(0.8, forKey: kCIInputIntensityKey)
            let image = CIImage.init(image: #imageLiteral(resourceName: "pic1.JPG"))
            filter?.setValue(image, forKey: kCIInputImageKey)
            let result = filter?.outputImage
//            let cgImage = context.createCGImage(result!, from: (result?.extent)!)
            let cgImage = context.createCGImage(result!, from: CGRect.init(x: (result?.extent.midX)! / 2, y: (result?.extent.midY)! / 2, width: (result?.extent.midX)!, height: (result?.extent.midY)!))
            let pic2 = UIImage.init(cgImage: cgImage!)
            
            DispatchQueue.main.async { [unowned self] in
                let imageView2 = UIImageView(image: pic2)
                self.view.addSubview(imageView2)
                imageView2.snp.makeConstraints { (make) in
                    make.top.equalTo(imageView1.snp.bottom).offset(50);
                    make.centerX.equalToSuperview();
                    make.width.equalTo(itemWidth);
                    make.height.equalTo(itemWidth);
                }
            }
        }
        
        
    }

}
