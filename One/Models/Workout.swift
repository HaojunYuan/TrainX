//
//  Workout.swift
//  One
//
//  Created by Brian Yuan on 2/19/24.
//

import Foundation

// Enum for target muscles
enum WorkoutType: String, Codable, CaseIterable, Hashable {
    case chest
    case back
    case legs
    case arms
    case shoulders
    case core
    case cardio
    case wholeBody
}

enum Unit: String, Codable, CaseIterable {
    case kg
    case lb
    case min
}

struct Workout: Codable {
    var name: String
    var workoutType: WorkoutType
    var sets: [Set]
    var unit: Unit
}

struct Set: Codable {
    var weight: Int?
    var repetitions: Int
}
