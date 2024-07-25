//
//  GameViewModel.swift
//  App749
//
//  Created by IGOR on 25/07/2024.
//

import SwiftUI

final class GameViewModel: ObservableObject {

    @Published var scorePl1: Int = 0
    @Published var scorePl2: Int = 0

    @Published var scoreGame1: Int = 0
    @Published var scoreGame2: Int = 0

}

