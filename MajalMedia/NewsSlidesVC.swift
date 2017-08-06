//
//  NewsSlidesVC.swift
//  MajalMedia
//
//  Created by Ahmad Owais on 8/6/17.
//  Copyright © 2017 Ahmad Owais. All rights reserved.
//

import UIKit

class NewsSlidesVC: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrollViewNews: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollViewNews.delegate = self
        let slides:[Slide] = createSlide()
        setupSlideScrollView(slides: slides)
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0
    }
    
    func createSlide() -> [Slide]{
        let slide1:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide1.lbl_title.text = "Slide1"
        
        let slide2:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide2.lbl_title.text = "Slide2"
        
        return [slide1,slide2]
    }
    
    func setupSlideScrollView(slides: [Slide]){
        scrollViewNews.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        scrollViewNews.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height)
        scrollViewNews.isPagingEnabled = true
        for i in 0..<slides.count{
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            scrollViewNews.addSubview(slides[i])
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollViewNews.contentOffset.x/view.frame.width)
        pageControl.currentPage = Int(pageIndex)
    }

}
