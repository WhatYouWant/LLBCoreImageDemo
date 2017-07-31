//
//  DemoPlayerLayerView.swift
//  CoreImageDemo
//
//  Created by ZhanyaaLi on 2017/7/31.
//  Copyright © 2017年 Hangzhou Zhanya Technology. All rights reserved.
//

import UIKit
import AVFoundation

class DemoPlayerLayerView: UIView {

    override class var layerClass : Swift.AnyClass {
        return AVPlayerLayer.self
    }

}
