import SwiftUI
import SDWebImageSwiftUI

struct TVShowDetailsView: View {
    @State var tvShow: TVShowUIModel

    var body: some View {
            GeometryReader { geometry in
                VStack(spacing: Dimensions.Margin.small) {
                    WebImage(url: tvShow.imageURL)
                        .resizable()
                        .frame(width: geometry.size.width, height: geometry.size.height / 2, alignment: .center)
                    Divider()
                    ScrollView(.vertical, showsIndicators: true) {
                        Text(tvShow.summary.extractHTMLTags())
                            .font(.body)
                            .foregroundColor(.white)
                    }.frame(width: geometry.size.width)
                }

            }
            .padding(Dimensions.Margin.small)
            .preferredColorScheme(.dark)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack {
                        Text(tvShow.name)
                            .font(Typography.heading1)
                            .foregroundColor(.red)
                    }
                }

        }

    }
}

struct TVShowDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        TVShowDetailsView(tvShow: TVShowMother.uiModel())
    }
}
