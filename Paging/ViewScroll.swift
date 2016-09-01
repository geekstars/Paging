//
//  ViewScroll.swift
//  Paging
//
//  Created by Hoàng Minh Thành on 9/1/16.
//  Copyright © 2016 Hoàng Minh Thành. All rights reserved.
//

import UIKit

class ViewScroll: UIViewController {
    
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
    var photo = UIImageView()
    var pageImages: [String] = []
    var first = false
    override func viewDidLoad() {
        super.viewDidLoad()
        pageImages = ["image","food","shark"]
        pageController.currentPage = 0
        pageController.numberOfPages = pageImages.count
    }
    override func viewDidLayoutSubviews() {
        if (first == false)
        {
            first = true
            let pagesScrollViewSize = scrollView.frame.size
            scrollView.contentSize = CGSizeMake(pagesScrollViewSize.width * CGFloat(pageImages.count),0)
            for i in 0..<pageImages.count
            {
                let imgView = UIImageView(image: UIImage(named: pageImages[i] + ".jpg"))
                imgView.frame = CGRectMake(CGFloat(i) * scrollView.frame.size.width, 0, scrollView.frame.size.width, scrollView.frame.size.height)
                imgView.contentMode = .ScaleAspectFit
                self.scrollView.addSubview(imgView)
            }
        }

    }
    @IBAction func onChange(sender: AnyObject) {
        scrollView.contentOffset = CGPointMake(CGFloat(pageController.currentPage) * scrollView.frame.size.width, 0)
    }
    func scrollViewDidScroll(scrollView: UIScrollView)
    {
        pageController.currentPage = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
    }
}
