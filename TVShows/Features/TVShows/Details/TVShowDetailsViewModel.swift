import SwiftUI

struct TVShowDetailsView: View {

    let viewModel: TVShowDetailsViewModel

    var body: some View {
        Text("TVShowDetailsView")
    }
}

struct TVShowDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        TVShowDetailsView(viewModel: TVShowDetailsViewModel())
    }
}
