//
//  AutoEnhanceViewController.swift
//  CoreImageDemo
//
//  Created by ZhanyaaLi on 2017/7/31.
//  Copyright © 2017年 Hangzhou Zhanya Technology. All rights reserved.
//

import UIKit
import ImageIO

class AutoEnhanceViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "AutoEnhanceFilter"
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        let itemWidth = 310
        let itemHeight = 210
        let darkImage = #imageLiteral(resourceName: "faceDarkDemo.png")
        let oldImageView : UIImageView = UIImageView.init(image: darkImage)
        view.addSubview(oldImageView)
        oldImageView.snp.makeConstraints { (make) in
            make.top.equalTo(100);
            make.centerX.equalToSuperview();
            make.height.equalTo(itemHeight);
            make.width.equalTo(itemWidth);
        }
        
        
        let newImageView = UIImageView()
        newImageView.backgroundColor = .orange
        self.view.addSubview(newImageView)
        newImageView.snp.makeConstraints { (make) in
            make.top.equalTo(oldImageView.snp.bottom).offset(50);
            make.centerX.equalToSuperview();
            make.height.equalTo(itemHeight);
            make.width.equalTo(itemWidth);
        }
        
        DispatchQueue.global().async { [unowned self] in
            let newImage = self.autoEnhanceFilter(darkImage)
            DispatchQueue.main.async {
                newImageView.image = newImage
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func autoEnhanceFilter(_ image: UIImage) -> UIImage {
        var myImage = CIImage.init(image: image)
//        let options = [CIDetectorImageOrientation: myImage?.properties[kCGImagePropertyOrientation as String]]
//        let adjustments = myImage?.autoAdjustmentFilters(options: options)
        let adjustments = myImage?.autoAdjustmentFilters()
        for filter in adjustments! {
            print("---filterClass name:\(filter.self)---")
//            CIRedEyeCorrection
//            if filter.isKind(of: CIFilter.self) {
            
//            }
            filter.setValue(myImage, forKey: kCIInputImageKey)
            myImage = filter.outputImage!
        }
        return UIImage.init(ciImage: myImage!)
    }
    
}
