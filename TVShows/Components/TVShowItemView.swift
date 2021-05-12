import SwiftUI
import SDWebImageSwiftUI

struct TVShowItemView: View {
    var tvShow: TVShowUIModel

    var body: some View {
        ZStack(alignment: .bottom) {
            WebImage(url: tvShow.thumbnailURL)
                .placeholder(Image(uiImage: Asset.placeholder.image))
                .resizable()

            Text(tvShow.name)
                .frame(maxWidth: .infinity)
                .font(Typography.bodyBold)
                .foregroundColor(.white)
                .padding(Dimensions.Margin.small)
                .background(Color.white.opacity(Dimensions.Opacity.medium))
        }
        .accessibility(identifier: "TVShowItemView \(tvShow.id)")
        .cornerRadius(Dimensions.Radius.x2Small)
    }
}

struct TVShowItemView_Previews: PreviewProvider {
    static var previews: some View {
        TVShowItemView(tvShow: TVShowMother.uiModel())
    }
}
