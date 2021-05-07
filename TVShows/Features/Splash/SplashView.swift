import SwiftUI

struct SplashView: View {

    let viewModel: SplashViewModel

    var body: some View {
        Text("SplashView")
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView(viewModel: SplashViewModel())
    }
}
