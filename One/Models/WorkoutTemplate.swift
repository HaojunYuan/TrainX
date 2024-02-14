//
//  Workout.swift
//  One
//
//  Created by Brian Yuan on 2/13/24.
//

import Foundation

// Enum for workout type with associated data for clearer UI display logic
enum WorkoutType {
    case strengthTraining
    case cardio
}

// Enum for target muscles
enum TargetMuscle {
    case chest
    case back
    case legs
    case arms
    case shoulders
    case core
    // Add more as needed
}

// Enum for set type, no need for a separate cardio type here
enum SetType {
    case warmUp
    case formal
}

struct WorkoutSet {
    let type: SetType
    var weight: Double? // Optional, used for strength training
    var repetitions: Int // Used for number of reps in strength training, duration in minutes for cardio
}

struct Workout {
    var name: String
    var type: WorkoutType
    var targetMuscle: TargetMuscle?
    var sets: [WorkoutSet]
}

struct WorkoutTemplate {
    var workouts: [Workout]
}

