import SwiftUI

struct DessertItemView: View {
    var desertItemModel: DessertItemModel
    var isLast: Bool = false

    var body: some View {
        VStack(spacing: 24) {
            NavigationLink {
                DessertDetailsScreen(
                    title: desertItemModel.strMeal,
                    viewModel: DesertDetailsScreenViewModel(desertItemModel.idMeal)
                )
            } label: {
                HStack(spacing: 8) {
                    if let avatarURL = desertItemModel.strMealThumb {
                        AsyncImage(url: avatarURL) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 40, height: 40)
                                .clipShape(Circle())
                        } placeholder: {
                            Circle()
                            .fill(.gray)
                            .frame(width: 40, height: 40)
                        }
                    }
                    Text(desertItemModel.strMeal)
                    Spacer()
                }
            }
        }
        .padding(8)
    }
}

#if DEBUG
#Preview {
    DessertItemView(desertItemModel: .desertItemMock)
}
#endif
