//
//  QuerySystemFilterViewController.swift
//  CoreImageDemo
//
//  Created by ZhanyaaLi on 2017/7/31.
//  Copyright © 2017年 Hangzhou Zhanya Technology. All rights reserved.
//

import UIKit

class QuerySystemFilterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        buildFilterDictionary()
        let image = #imageLiteral(resourceName: "faceDemo02.png")
        let imageView1 = UIImageView.init(image: image)
        view.addSubview(imageView1)
        imageView1.snp.makeConstraints { (make) in
            make.top.equalTo(100);
            make.centerX.equalToSuperview();
            make.height.equalTo(200);
            make.width.equalTo(200);
        }
        
        let imageView2 = UIImageView.init()
        imageView2.backgroundColor = .orange
        view.addSubview(imageView2)
        imageView2.snp.makeConstraints { (make) in
            make.top.equalTo(imageView1.snp.bottom).offset(50);
            make.centerX.equalToSuperview();
            make.height.equalTo(200);
            make.width.equalTo(200);
        }
        
        let filters = buildFilterDictionary()
        /*
        for item in filters {
            let filter = CIFilter.init(name: item.key)
            
        }*/
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //Building a dictionary of filters by functional name
    //return:  [className: filter.attributes]
    func buildFilterDictionary(_ filterClassNames: [String]) -> [String : [String : Any]]{
        var filters = [String : [String : Any]]()
        for className in filterClassNames {
            let filter : CIFilter? = CIFilter.init(name: className)
            if filter != nil {
                filters[className] = filter!.attributes
            }
            else {
                print("could not create \(className) filter")
            }
        }
        return filters
    }
    
    
    //Code that builds a dictionary of filters by functional categories
    func buildFilterDictionary() -> [String : [String : [String : Any]]] {
        var filtersByCategory = [String : [String : [String : Any]]]()
        var filterNames = [String]()
        filterNames.append(contentsOf: CIFilter.filterNames(inCategory: kCICategoryGeometryAdjustment))
        filterNames.append(contentsOf: CIFilter.filterNames(inCategory: kCICategoryDistortionEffect))
        filtersByCategory["Distortion"] = buildFilterDictionary(filterNames)
        
        filterNames.removeAll()
        filterNames.append(contentsOf: CIFilter.filterNames(inCategory: kCICategorySharpen))
        filterNames.append(contentsOf: CIFilter.filterNames(inCategory: kCICategoryBlur))
        filtersByCategory["Focus"] = buildFilterDictionary(filterNames)
        
        for item in filtersByCategory {
            print("---filterByCategory:\(item)---")
        }
        
        return filtersByCategory
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
