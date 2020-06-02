import SwiftUI
import URLImage

struct QueryCard: View {
    
    var title: String = ""
    var access: String = ""
    var image: String = ""
    
    var body: some View {
        HStack {
            URLImage(URL(string: image)!, placeholder: Image(systemName: "circle")) { proxy in
                proxy.image
                .resizable()
//                .aspectRatio(contentMode: .fit)
            }
                .frame(width: 75, height: 75, alignment: .center)
                .cornerRadius(10)
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 5) {
                Text(title)
                    .font(.headline)
                Spacer()
                Text(access)
                    .font(.subheadline)
                    .foregroundColor(.green)
            }
        }
        .padding(.vertical, -10)
    }
}
