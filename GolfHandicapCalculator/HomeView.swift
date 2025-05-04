//
//  HomeView.swift
//  GolfHandicapCalculator
//
//  Created by Sean Stone  on 5/3/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                NavigationLink("Manage Golfers", destination: GolferListView())
                NavigationLink("Manage Scorecards", destination: ScorecardListView())
                NavigationLink("Start New Game", destination: GameSetupView())
            }
            .navigationTitle("Golf Handicap Calculator")
        }
    }
}
