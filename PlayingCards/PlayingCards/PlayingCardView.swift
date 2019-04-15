//
//  PlayingCardView.swift
//  PlayingCards
//
//  Created by Poonam Bhadikar on 13/04/19.
//  Copyright © 2019 poonam-bhadikar. All rights reserved.
//

import UIKit

//This is a custom view in storyboary we have taken a normal UIView and set its class as this class
class PlayingCardView: UIView {
    
    var rank:Int = 11 { didSet{ setNeedsDisplay();setNeedsLayout()}}
    var suit:String = "♠" { didSet{ setNeedsDisplay();setNeedsLayout()}}
    var isFaceUp:Bool = true { didSet{ setNeedsDisplay();setNeedsLayout()}}
    
    
    //Utility that will return centered attributed string
    func centeredAttributedString(string:String,fontSize:CGFloat) -> NSAttributedString {
        var font =
            
            UIFont.preferredFont(forTextStyle: .body).withSize(fontSize)
        //Below line of code makes sure if user changes scale of font from setttings , font is scaled accordingle : v imp
        font = UIFontMetrics(forTextStyle:.body).scaledFont(for: font)
        
        let paraGraphStyle = NSMutableParagraphStyle()
        paraGraphStyle.alignment = .center
        
        return NSAttributedString(string: string, attributes: [.paragraphStyle:paraGraphStyle,.font:font])
        
    }
    
    var cornerString:NSAttributedString{
        return centeredAttributedString(string: "\(rankString)\n\(suit)" , fontSize: cornerFontSize)
    }
    
    private lazy var upperLeftLabel = createCornerLable()
    private lazy var lowerRightLabel = createCornerLable()
    
    
    //Createlabel
    func createCornerLable()->UILabel{
        let label = UILabel()
        label.numberOfLines = 0
        addSubview(label)
        return label
    }
    //since we added subview we need to redraw it at some situvations also we need to postion it every time bounds chanes
    override func layoutSubviews() {
        super.layoutSubviews()
        
        configureLabel(upperLeftLabel)
        //This will position the label in coordinate sys of superview
        upperLeftLabel.frame.origin = bounds.origin.offSetBy(dx: cornerOffset, dy: cornerOffset)
        
        //we set origit to maxX, maxY, then we shifted ot to offset insidethe rec hence -, againshofted it to labels origin i.e - its width and -height
        
        configureLabel(lowerRightLabel)
        
        //but we need to rotate lowerleft string to look it like card : use transfor for scale, rotate etc a view
        //
        //        lowerRightLabel.transform = CGAffineTransform.identity.rotated(by: CGFloat.pi)// wrong as oring is shifted
        
        //We first need to again shift the origin to offset and then rotate
        lowerRightLabel.transform = CGAffineTransform.identity
        .translatedBy(x: lowerRightLabel.frame.size.width, y: lowerRightLabel.frame.size.height)
        .rotated(by: CGFloat.pi)
        
         lowerRightLabel.frame.origin = CGPoint(x: bounds.maxX, y: bounds.maxY).offSetBy(dx: -cornerOffset, dy: -cornerOffset).offSetBy(dx: -lowerRightLabel.frame.size.width, dy: -lowerRightLabel.frame.size.height)
    }
    func configureLabel(_ label:UILabel){
        label.attributedText = cornerString // set text
        label.bounds.size = CGSize.zero
        label.sizeToFit()// to fit text in label but we need to make width of label to 0 before applying this func
        label.isHidden = !isFaceUp
    }
    
    
    //observs whether trait changes , say user increesd size of text in accessibility :ios setting, the app should reflect that
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        setNeedsDisplay()
        setNeedsLayout()
    }
    
    
    //Below method we should not call explicitly we will call setNeedsDisplay() which will call draw internally
    override func draw(_ rect: CGRect) {
        // SomeBasicsOfDraw() : This just for learning not a part of playing card
        
        
        let roundedRect = UIBezierPath(roundedRect: bounds, cornerRadius: 16.0)
        roundedRect.addClip()
        UIColor.white.setFill()
        roundedRect.fill()
        
        //When we run we don't see rounded rect on screen we see a rectangular white view, actually we are drawing a rectangular view ehich is white on white view taken in story board controller we need to make background color for view in story board as clear and its opaqe to false which is by default checked in storyboard
        
        
        //Draw image
        if let faceCardImage = UIImage(named: rankString+suit){
            faceCardImage.draw(in:bounds.zoom(by: SizeRatio.facecardImageSizeToBoundsSize))
            
            //faceCardImage.
        
        }
    }
    
    
    func SomeBasicsOfDraw()
    {
        // 1 Using context and path
        //Drawing using context // start angle zero is to the right , then it fraws circle clockwide or anti clockwise
        //
        //        let context = UIGraphicsGetCurrentContext()
        //        context?.addArc(center: CGPoint(x:bounds.midX,y:bounds.midY), radius: 100, startAngle: 0, endAngle: 2*CGFloat.pi, clockwise: true)
        //        context?.setLineWidth(5.0)
        //        UIColor.gray.setStroke()
        //        context?.strokePath()
        //        UIColor.blue.setFill()
        //        context?.fillPath()
        
        //It actually does not fill the circle as path is not availabe after stroke
        
        //2. using Bezier path
        let path = UIBezierPath()
        path.addArc(withCenter: CGPoint(x:bounds.midX,y:bounds.midY), radius: 100, startAngle: 0, endAngle: 2*CGFloat.pi, clockwise: true)
        path.lineWidth = 5
        UIColor.blue.setStroke()
        path.stroke()
        UIColor.gray.setFill()
        path.fill()
        
        //Problem : Run the code you will ses circle in potrait mode but you will se an oval in landsacpe as views bounds were changes but view is not redraw (draw is not called again)
        //Solution : go in story board , select view -> set its content mode to redraw :) before it was scale to fit
        
        // Drawing code
    }
    
}

//We are keeping all the logic related to size, ratio, constants etc
extension PlayingCardView{
    
    // We have constants in swift in follwing way
    private struct  SizeRatio{
        static let cornerFontSizeToBoundsHeight:CGFloat = 0.085
        static let cornerRadiusToBoundsHeight:CGFloat = 0.06
        static let cornerOffsetToCornerRadius:CGFloat = 0.33
        static let facecardImageSizeToBoundsSize:CGFloat = 0.95
    }
    
    private var cornerRadius: CGFloat {
        return bounds.size.height * SizeRatio.cornerRadiusToBoundsHeight;
    }
    private var cornerOffset: CGFloat {
        return cornerRadius * SizeRatio.cornerOffsetToCornerRadius;
    }
    private var cornerFontSize: CGFloat {
        return bounds.size.height * SizeRatio.cornerFontSizeToBoundsHeight;
    }
    
    private var rankString:String{
        switch rank {
        case 1: return "A"
        case 2...10: return String(rank)
        case 11: return "J"
        case 12:return "Q"
        case 13: return "K"
        default:
            return "?"
        }
    }
}

extension CGRect{
    var LeftHalf:CGRect{
        return CGRect(x:minX, y: minY, width: width/2, height: height)
    }
    
    var RightHalf:CGRect{
        return CGRect(x:midX, y: minY, width: width/2, height: height)
    }
    
    
    //Returns a rectangle that is smaller or larger than the source rectangle, with the same center point.
    
    func  insetby(size:CGSize) -> CGRect {
        return insetBy(dx: size.width, dy: size.height)
    }
    
    func  sized(to size:CGSize) -> CGRect {
        return  CGRect(origin: origin, size: size)
    }
    
    func zoom(by scale:CGFloat) -> CGRect {
        let newWidth = width*scale
        let newHeight = height*scale
        return insetBy(dx: (newWidth-width)/2, dy: (newHeight-height)/2)
    }
    
}

extension CGPoint{
    func offSetBy(dx:CGFloat,dy:CGFloat) -> CGPoint {
        return CGPoint(x: x+dx, y: y+dy)
    }
}
