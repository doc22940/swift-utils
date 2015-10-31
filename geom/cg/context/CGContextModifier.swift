import Cocoa
class CGContextModifier{
    /**
    *  
    */
   class func addStar(context:CGContextRef,_ center:CGPoint, _ radius:CGFloat, _ angle:CGFloat){
        let x:CGFloat  = radius * CGFloat(sinf(angle * CGFloat(M_PI) / CGFloat(5.0))) + center.x
    
        let y:CGFloat  = radius * cosf(angle * M_PI / 5.0) + center.y
		CGContextMoveToPoint(context, x, y)
		for(var i:Int = 1; i < 5; ++i){
			let x:CGFloat = radius * sinf((i * 4.0 * M_PI + angle) / 5.0) + center.x;
			let y:CGFloat = radius * cosf((i * 4.0 * M_PI + angle) / 5.0) + center.y;
			CGContextAddLineToPoint(context, x, y)
		}
		CGContextClosePath(context)// And close the subpath.
   }
}