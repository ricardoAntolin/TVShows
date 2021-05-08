import SwiftUI

struct TVShowsListView: View {
    @EnvironmentObject var store: AppStore
    var state: AppState {
        return store.state
    }

    var body: some View {
        VStack {
            content
        }
    }

    private var content: AnyView {
        guard !state.tvShows.isEmpty else {
            return activityIndicator.eraseToAnyView()
        }
        return listView.eraseToAnyView()
    }

    private var listView: some View {
        return VStack {
            ForEach(state.tvShows) { tvShow in
                Text("\(tvShow.id)")
            }
        }
    }

    private var activityIndicator: some View {
        return ActivityIndicator()
            .frame(width: 50, height: 50)
            .foregroundColor(.red)
    }
}

struct TVShowsListView_Previews: PreviewProvider {
    static var previews: some View {
        TVShowsListView()
    }
}
