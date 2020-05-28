//
//  QueryCard.swift
//  guuu
//
//  Created by Takumi Abe on 2020/05/23.
//  Copyright © 2020 Takumi Abe. All rights reserved.
//

import SwiftUI
import URLImage

struct QueryCard: View {
    
    var title: String = ""
    var access: String = ""
    var image: String = ""
    
    var body: some View {
        HStack {
            URLImage(URL(string: image)!, delay: 2.00, placeholder: Image(systemName: "circle"))
                .frame(width: 75, height: 75, alignment: .center)
                .cornerRadius(10)
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 5) {
                Text(title)
                    .font(.headline)
                Text(access)
                    .font(.subheadline)
                    .foregroundColor(.green)
            }
        }
        .padding(.vertical, -10)
    }
}

struct QueryCard_Previews: PreviewProvider {
    static var previews: some View {
        QueryCard(title: "shop name", access: "ここからここまで", image: "")
    }
}
