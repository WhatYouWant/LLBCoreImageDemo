//
//  DetectorViewController.swift
//  CoreImageDemo
//
//  Created by ZhanyaaLi on 2017/7/31.
//  Copyright © 2017年 Hangzhou Zhanya Technology. All rights reserved.
//

import UIKit
import ImageIO

class DetectorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let imageView = UIImageView.init(image: createFaceDetector(#imageLiteral(resourceName: "faceDemo02.png")))
        imageView.backgroundColor = .orange
        view.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.top.equalTo(100);
            make.centerX.equalToSuperview();
            make.width.equalTo(250);
            make.height.equalTo(250);
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createFaceDetector(_ image: UIImage) -> UIImage {
        var myImage : CIImage = CIImage.init(image: image)!
        let context = CIContext.init()
        var opts = [CIDetectorAccuracy: CIDetectorAccuracyHigh]
        let detector: CIDetector = CIDetector.init(ofType: CIDetectorTypeFace, context: context, options: opts)!
        let features : [CIFaceFeature] = detector.features(in: myImage, options: opts) as! [CIFaceFeature]
        for face in features {
            print("---faceBound:\(face.bounds)---")
            if face.hasLeftEyePosition {
                print("---left eye:\(face.leftEyePosition.x), \(face.leftEyePosition.y)")
            }
            
            if face.hasRightEyePosition {
                print("---right eye:\(face.rightEyePosition.x), \(face.rightEyePosition.y)")
            }
            
            if face.hasMouthPosition {
                print("---mouse:\(face.mouthPosition.x), \(face.mouthPosition.y)")
            }
        }
        myImage = myImage.settingAlphaOne(inExtent: (features.last?.bounds)!)

        return UIImage.init(ciImage: myImage)
    }
    
    
    
    

}
