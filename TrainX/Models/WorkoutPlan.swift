//
//  Template.swift
//  One
//
//  Created by Brian Yuan on 2/19/24.
//

import Foundation

struct WorkoutPlan: Codable, Hashable {
    var name: String = "New Plan"
    var workouts: [Workout] = []
}
