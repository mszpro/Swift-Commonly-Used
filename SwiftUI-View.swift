// Dismiss a SwiftUI view within the view
@Environment(\.presentationMode) var presentationMode
presentationMode.wrappedValue.dismiss()

// Use a SwiftUI view (InfoView) in UIStoryBoard
class InfoViewHostingController: UIHostingController<InfoView> {

    required init?(coder: NSCoder) {
        super.init(coder: coder,rootView: InfoView());
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
