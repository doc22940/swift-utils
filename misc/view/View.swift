import Cocoa
/**
 * TODO: Make the isChildrenInteractive:Bool -> You may want to make a variable that also can set the isInteractive var of children of the view:  
 */
class View :FlippedView{
    var isInteractive:Bool = false
    var hasHandCursor:Bool = false
    override var wantsDefaultClipping:Bool{return false}//avoids clipping the view
    override init(frame: NSRect) {
        super.init(frame: frame)
        self.wantsLayer = false//this avoids calling drawLayer() and enables drawingRect()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /**
     * Avoids covering the graphic behind when dealing with mouse down events
     */
    override func hitTest(aPoint: NSPoint) -> NSView? {return isInteractive ? self : nil}
    /**
     * Enables the hand cursor on enter
     */
    override func resetCursorRects() {
        if(hasHandCursor){
            let cursor:NSCursor = NSCursor.pointingHandCursor()
            addCursorRect(frame, cursor: cursor)
            cursor.setOnMouseEntered(true)
        }else{
            super.resetCursorRects()
        }
    }
}
