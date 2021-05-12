import SwiftUI
import SDWebImageSwiftUI

struct TVShowDetailsView: View {
    @State var tvShow: TVShowUIModel
    var formatedRating: String {
        return String(format: "%.2f", tvShow.ratingAverage)
    }

    var body: some View {
            GeometryReader { geometry in
                VStack(spacing: Dimensions.Margin.small) {
                    WebImage(url: tvShow.imageURL)
                        .placeholder(Image(uiImage: Asset.placeholder.image))
                        .resizable()
                        .accessibility(identifier: "TVShowDetailsViewImage")
                        .frame(
                            width: geometry.size.width,
                            height: geometry.size.height * 0.66,
                            alignment: .center
                        )
                    Divider()
                    ScrollView(.vertical, showsIndicators: true) {
                        VStack(alignment: .leading) {
                            Text("Rating: \(formatedRating)/10")
                                .font(.title3)
                                .foregroundColor(.white)
                                .accessibility(identifier: "TVShowDetailsViewSummary")
                            Divider()
                            Text(tvShow.summary.extractHTMLTags())
                                .font(.body)
                                .foregroundColor(.white)
                                .accessibility(identifier: "TVShowDetailsViewSummary")
                        }

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
                            .accessibility(identifier: "TVShowDetailsViewTitle \(tvShow.name)")
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
