import SwiftUI

struct DessertDetailItemView: View {
    var dessertDetailsItemModel: DessertDetailItemModel

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            if let avatarURL = dessertDetailsItemModel.strMealThumb {
                AsyncImage(url: avatarURL) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    Rectangle()
                    .fill(.gray)
                    .frame(height: 300)
                }
            }
            HStack {
                Text("Instructions")
                    .font(.headline)
            }
            .padding(8)
            Text(dessertDetailsItemModel.strInstructions)
            HStack {
                Text("Ingredients")
                    .font(.headline)
            }
            .padding(8)
            HStack(spacing: 0) {
                VStack(alignment: .leading, spacing: 8) {
                    ForEach(
                        Array(dessertDetailsItemModel.ingredients.enumerated()),
                        id: \.offset
                    ) { _, ingredient in
                        Text(ingredient)
                            .padding(.vertical, 2)
                    }
                }
                Spacer()
                VStack(spacing: 8) {
                    ForEach(
                        Array(dessertDetailsItemModel.measurements.enumerated()),
                        id: \.offset
                    ) { _, measurement in
                        Text(measurement)
                            .padding(.vertical, 2)
                    }
                }
            }
        }
        .padding()
    }
}

#if DEBUG
#Preview {
    DessertDetailItemView(dessertDetailsItemModel: .desertDetailItemMock)
}
#endif
