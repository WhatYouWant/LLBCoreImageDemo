//
//  CoreImageVideoViewController.swift
//  CoreImageDemo
//
//  Created by ZhanyaaLi on 2017/7/31.
//  Copyright © 2017年 Hangzhou Zhanya Technology. All rights reserved.
//

import UIKit
import AVFoundation
import CoreImage

class CoreImageVideoViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        let filter = CIFilter(name: "CIGaussianBlur")!
//        let documentPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last
        let demoPath = Bundle.main.path(forResource: "demo02", ofType: "mp4")
        let fileURL : URL = URL.init(fileURLWithPath: demoPath!)
        let demoAsset : AVAsset = AVAsset.init(url: fileURL)
        
        let composition = AVVideoComposition(asset: demoAsset) { (request) in
            
            //Clamp to avoid blurring transparent pixels at the image edges
//            let source = request.sourceImage.clampingToExtent()
            let source = request.sourceImage
            filter.setValue(source, forKey: kCIInputImageKey)
            
            //vary filter parameters based on video timing
            let seconds = CMTimeGetSeconds(request.compositionTime)
            print("---second:\(seconds)---")
            filter.setValue(5.0, forKey: kCIInputRadiusKey)
            
            //Crop the blurred output to the bounds of the original image
//            let output = filter.outputImage?.cropping(to: request.sourceImage.extent)
            let output = filter.outputImage
            
            //Provide the filter output to the composition
            request.finish(with: output!, context: nil)
            
        }
        
        let playerItem = AVPlayerItem.init(asset: demoAsset)
        playerItem.videoComposition = composition
        let player : AVPlayer = AVPlayer.init(playerItem: playerItem)
        
        let playerLayerView : DemoPlayerLayerView = DemoPlayerLayerView()
        playerLayerView.backgroundColor = .black
        (playerLayerView.layer as! AVPlayerLayer).player = player
        (playerLayerView.layer as! AVPlayerLayer).videoGravity = AVLayerVideoGravityResizeAspect
        
        view.addSubview(playerLayerView)
        playerLayerView.snp.makeConstraints { (make) in
            make.top.equalTo(100);
            make.left.equalToSuperview();
            make.right.equalToSuperview();
            make.height.equalTo(250);
        }
        player.play()
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Listing 1-4 Applying a filter to a video composition
    

}
