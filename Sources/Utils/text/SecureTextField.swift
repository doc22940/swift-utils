import Cocoa

class SecureTextField:NSTextField {
    override func hitTest(_ aPoint: NSPoint) -> NSView? {
        return super.hitTest(CGPoint(localPos().x,localPos().y))
    }
    override func textDidChange(_ notification:Notification) {
        if(self.superview is IEventSender){
            //Swift.print("superview is IEventSender")
            (self.superview as! IEventSender).event!(TextFieldEvent(Event.update,self))
        }else{
            //Swift.print("superview is NOT IEventSender")
        }
        super.textDidChange(notification)
    }
}
