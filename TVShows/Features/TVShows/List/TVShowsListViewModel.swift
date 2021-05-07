import SwiftUI

struct TVShowsListView: View {
    let viewModel: TVShowsListViewModel

    var body: some View {
        Text("TVShowsList")
    }
}

struct TVShowsListView_Previews: PreviewProvider {
    static var previews: some View {
        TVShowsListView(viewModel: TVShowsListViewModel())
    }
}
