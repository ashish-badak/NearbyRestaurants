//
//  ViewModelProtocols.swift
//  NearBy
//
//  Created by Ashish Badak on 13/03/23.
//

import Foundation

protocol ItemViewModel { }

protocol PlaceDetailsInfoViewModel: ItemViewModel {
    var title: String { get }
    var info: String { get }
}
