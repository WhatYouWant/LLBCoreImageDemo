//
//  CoreImageDemo02ViewController.swift
//  CoreImageDemo
//
//  Created by ZhanyaaLi on 2017/7/28.
//  Copyright © 2017年 Hangzhou Zhanya Technology. All rights reserved.
//

import UIKit

class CoreImageDemo02ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        demo02Process()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func demo02Process() {
        let ciImage = CIImage.init(image: #imageLiteral(resourceName: "demoPic.png"))
        let image = UIImage.init(ciImage: applyFilterChain(to: ciImage!))
        let imageView = UIImageView.init(image: image)
        view.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.top.equalTo(64+50);
            make.centerX.equalToSuperview();
            make.width.equalTo(75);
            make.height.equalTo(75);
        }
        
        let imageView2 = UIImageView.init(image: UIImage.init(ciImage: anotherApplyFilterChain(to: ciImage!)))
        view.addSubview(imageView2)
        imageView2.snp.makeConstraints { (make) in
            make.top.equalTo(imageView.snp.bottom).offset(50);
            make.centerX.equalToSuperview();
            make.width.equalTo(75);
            make.height.equalTo(75);
        }
        /*
        let imageView3 = UIImageView.init(image: UIImage.init(ciImage: blurFilterChain(to: ciImage!)))
        view.addSubview(imageView3)
        imageView3.snp.makeConstraints { (make) in
            make.top.equalTo(imageView2.snp.bottom).offset(50);
            make.centerX.equalToSuperview();
            make.width.equalTo(75);
            make.height.equalTo(75);
        }
        */
        
    }
    
    private func applyFilterChain(to image: CIImage) -> CIImage {
        let colorFilter = CIFilter(name: "CIPhotoEffectProcess", withInputParameters: [kCIInputImageKey: image])!
        
        let bloomImage = colorFilter.outputImage?.applyingFilter("CIBloom", withInputParameters: [kCIInputRadiusKey: 10.0, kCIInputIntensityKey: 1.0])
        
        let cropRect = CGRect(x: 175, y: 175, width: 75, height: 75)
        let croppedImage = bloomImage?.cropping(to: cropRect)
        
        return croppedImage!
    }
    
    func anotherApplyFilterChain(to image: CIImage) -> CIImage {
        let cropRect = CGRect(x: 175, y: 175, width: 75, height: 75)
        let croppedImage = image.cropping(to: cropRect)
        let colorFilter = CIFilter(name: "CIPhotoEffectProcess", withInputParameters: [kCIInputImageKey: croppedImage])
        let bloomImage = colorFilter?.outputImage?.applyingFilter("CIBloom", withInputParameters: [kCIInputRadiusKey: 1.0, kCIInputIntensityKey: 1.0])
        return bloomImage!
    }
    
    func blurFilterChain(to image: CIImage) -> CIImage {
        let cropRect = CGRect(x: 175, y: 175, width: 75, height: 75)
        let croppedImage = image.cropping(to: cropRect)
        let blurFilter = CIFilter(name: "CIGaussianBlur", withInputParameters: [kCIInputRadiusKey: 1, kCIInputImageKey: croppedImage])
        return (blurFilter?.outputImage)!
    }

}








































