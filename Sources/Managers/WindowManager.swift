import Cocoa
import RxSwift

class WindowManager: NSObject, NSWindowDelegate {
    private var instances = [String: NSWindowController]()
    
    func windowWillClose(_ notification: Notification) {
        guard let closingWindow = notification.object as? NSWindow else { return }
        let name = closingWindow.frameAutosaveName
        closingWindow.saveFrame(usingName: name)
        
        if let (key, _) = instances.first(where: { $0.1.window === closingWindow }) {
            instances.removeValue(forKey: key)
        }
        
        // We handle app termination requirements here
//        if instances.isEmpty && AppDelegate.instance.applicationShouldTerminateAfterLastWindowClosed(NSApp) {
//            DispatchQueue.main.async {
//                NSApp.terminate(NSApp)
//            }
//        }
    }
    
    func get<W, T: WindowController<W>>(_ type: T.Type) -> T {
        if let instance = instances[T.windowNibPath] as? T {
            return instance
        }
        
        let instance = T()
        instances[T.windowNibPath] = instance
        instance.window?.delegate = self
        return instance
    }
    
    func set<W, T: WindowController<W>>(_ viewController: NSViewController, for type: T.Type) {
        let windowController = get(type)
        windowController.viewController = viewController
    }
    
    func show<Window, T: WindowController<Window>>(_ type: T.Type, viewController: NSViewController? = nil, sender: NSObject? = nil) {
        let windowController = get(type)
        if let viewController = viewController {
            windowController.viewController = viewController
        }
        windowController.showWindow(sender)
    }
    
    func close<Window, T: WindowController<Window>>(_ type: T.Type) {
        get(type).close()
        instances.removeValue(forKey: T.windowNibPath)
    }
}
