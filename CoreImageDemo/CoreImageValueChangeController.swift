//
//  CoreImageValueChangeController.swift
//  CoreImageDemo
//
//  Created by ZhanyaaLi on 2017/7/31.
//  Copyright © 2017年 Hangzhou Zhanya Technology. All rights reserved.
//

import UIKit

class CoreImageValueChangeController: UIViewController {
    
    lazy var imageView : UIImageView = {
       let imageView = UIImageView.init(image: #imageLiteral(resourceName: "pic1.JPG"))
        return imageView
    }()
    
    lazy var slider : UISlider = {
        let slider = UISlider.init()
        slider.addTarget(self, action: #selector(sliderValueChange), for: .valueChanged)
        slider.maximumValue = 50
        return slider
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.top.equalTo(100);
            make.centerX.equalToSuperview();
            make.width.equalTo(300);
            make.height.equalTo(300);
        }
        
        view.addSubview(slider)
        slider.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-20);
            make.left.equalToSuperview();
            make.right.equalToSuperview();
            make.height.equalTo(50);
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func sliderValueChange() {
        print("---slider.value:\(slider.value)---")
        imageView.image = sliderChangeImageBlur(imageView.image!, value: slider.value)
//        sliderChangeImageBlur(imageView.image!, value: slider.value)
        
    }
    
    
    func sliderChangeImageBlur(_ image: UIImage, value: Float) -> UIImage {
        
        let ciImage: CIImage = CIImage.init(image: #imageLiteral(resourceName: "pic1.JPG"))!
        ciImage.applyingFilter("CIGaussianBlur", withInputParameters: [kCIInputRadiusKey: value])
//        let filter : CIFilter = CIFilter.init(name: "CIGaussianBlur", withInputParameters: [kCIInputRadiusKey: value, kCIInputImageKey: ciImage])!
//        return UIImage.init(ciImage: filter.outputImage!)
        return UIImage.init(ciImage: ciImage)
    }
   

}
