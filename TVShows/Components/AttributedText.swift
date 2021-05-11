import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    var text: String
    var tintColor: Color

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.loadHTMLString(text, baseURL: nil)
        uiView.backgroundColor = .clear
        uiView.tintColor = UIColor(tintColor)
    }
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebView(
            text: "<html><body><h1>Hello World</h1></body></html>",
            tintColor: Color.white
        )
    }
}
