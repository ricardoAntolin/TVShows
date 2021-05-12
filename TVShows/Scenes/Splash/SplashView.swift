import SwiftUI

struct SplashView: View {
    @EnvironmentObject var store: AppStore
    @State var goToNextStep: Bool = false
    @State var scale: CGFloat = 1
    @State var opacity: Double = 0.1
    @State var timing: Int = 0
    let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()

    var body: some View {
        NavigationView {
            ZStack {
                VStack(alignment: .center) {
                    Spacer()
                    Text("TVShows")
                        .font(Typography.heading1)
                        .foregroundColor(.red)
                        .scaleEffect(scale)
                        .opacity(opacity)
                        .accessibility(identifier: "SplashViewText")
                        .onAppear(perform: {
                            withAnimation(.easeIn(duration: 1.0)) {
                                scale = 3
                                opacity = 1
                            }
                        })
                    Spacer()
                }.frame(
                    maxWidth: .infinity,
                    maxHeight: .infinity,
                    alignment: .center
                )
                NavigationLink(
                    destination: TVShowsListView(),
                    isActive: $goToNextStep) {}
                    .buttonStyle(PlainButtonStyle())
            }
            .onReceive(timer) { _ in
                guard timing < 4 else {
                    goToNextStep = true
                    timer.upstream.connect().cancel()
                    return
                }
                timing += 1
            }
        }
        .accentColor(.red)
        .preferredColorScheme(.dark)
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
