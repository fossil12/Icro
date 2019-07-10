//
//  UserListView.swift
//  Icro
//
//  Created by martin on 30.06.19.
//  Copyright © 2019 Martin Hartl. All rights reserved.
//

import SwiftUI
import Kingfisher
import IcroKit

extension Author: Identifiable {
    public var id: String {
        return name
    }
}

struct UserListView: SwiftUI.View {
    @ObjectBinding var viewModel: UserListViewModel
    let itemNavigator: ItemNavigator

    @State var show = false

    var body: some SwiftUI.View {
        List(viewModel.users) { author in
            HStack {
                NetworkImage(imageURL: author.avatar,
                             placeholderImage: UIImage(symbol: .person_fill)!)
                .frame(width: 40, height: 40)
                .clipShape(Circle())
                HStack {
                    Text(author.name)
                        .font(.headline)
                    Text(author.username ?? "")
                        .font(.subheadline)
                        .color(.secondary)
                }
            }
        }
        .navigationBarTitle(Text("Following"))
    }
}