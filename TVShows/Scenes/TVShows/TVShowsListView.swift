import SwiftUI

struct TVShowsListView: View {
    @EnvironmentObject var store: AppStore
    @State var currentPage = 0
    var state: AppState {
        return store.state
    }

    var body: some View {
        VStack {
            content
                .onAppear {
                    store.send(.fetchPage(page: currentPage))
                }
        }
        .preferredColorScheme(.dark)
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                VStack {
                    Text(L10n.appName)
                        .font(Typography.heading1)
                        .foregroundColor(.red)
                }
            }
        }
    }

    private var content: AnyView {
        guard !state.tvShows.isEmpty else {
            return activityIndicator.eraseToAnyView()
        }
        return listView.eraseToAnyView()
    }

    private var listView: some View {
        let columns = [
            GridItem(.flexible()),
            GridItem(.flexible())
        ]

        return ScrollView {
            LazyVGrid(columns: columns, spacing: Dimensions.Margin.xSmall) {
                ForEach(Array(state.tvShows.enumerated()), id: \.offset) { index, tvShow in
                    NavigationLink(destination: TVShowDetailsView(tvShow: tvShow)) {
                        TVShowItemView(tvShow: tvShow)
                            .onAppear {
                                if index >= state.tvShows.count - 1 {
                                    currentPage += 1
                                    store.send(.fetchPage(page: currentPage))
                                }
                            }
                    }
                }
            }.padding(Dimensions.Margin.medium)
        }
    }

    private var activityIndicator: some View {
        return ActivityIndicator()
            .frame(
                width: Dimensions.Size.x3Large,
                height: Dimensions.Size.x3Large
            )
            .foregroundColor(.red)
    }
}

struct TVShowsListView_Previews: PreviewProvider {
    static var previews: some View {
        TVShowsListView()
            .environmentObject(
                AppStore(
                    initialState: .init(),
                    reducer: appReducer,
                    environment: UseCaseProviderMock()
                )
            )
    }
}
