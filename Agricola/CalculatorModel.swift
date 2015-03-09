//
//  CalculatorModel.swift
//  Agricola
//
//  Created by Daniel King on 12/14/14.
//  Copyright (c) 2014 Daniel King. All rights reserved.
//

import Foundation


class Calculator {
    
    // Set up all the class variables
    var grain : Int
    var vegetables : Int
    var sheep : Int
    var boar : Int
    var cattle : Int
    var fields : Int
    var pastures : Int
    var unusedSpaces : Int
    var fencedStables : Int
    var rooms : Int
    var roomType : String
    var familyMembers : Int
    var improvementPoints : Int
    var bonusPoints : Int
    var beggingCards : Int
    
    init () {
        
        // Initialize class member variables
        self.grain = 0
        self.vegetables = 0
        self.sheep = 0
        self.boar = 0
        self.cattle = 0
        self.fields = 0
        self.pastures = 0
        self.unusedSpaces = 0
        self.fencedStables = 0
        self.rooms = 2
        self.roomType = "Wood"
        self.familyMembers = 2
        self.improvementPoints = 0
        self.bonusPoints = 0
        self.beggingCards = 0
        
    }
    
    
    func calculateTotal() -> Int {
        
        var totalScore = 0
        
        totalScore += grainScore(self.grain)
        totalScore += vegetableScore(self.vegetables)
        totalScore += sheepScore(self.sheep)
        totalScore += boarScore(self.boar)
        totalScore += cattleScore(self.cattle)
        totalScore += fieldsScore(self.fields)
        totalScore += pasturesScore(self.pastures)
        totalScore -= self.unusedSpaces
        totalScore += self.fencedStables
        totalScore += familyMembersScore(self.familyMembers)
        totalScore += roomsScore(self.rooms, roomType: self.roomType)
        totalScore += self.improvementPoints
        totalScore += self.bonusPoints
        totalScore += beggingCardsScore(self.beggingCards)
        
        return totalScore
    }
    
    func grainScore(grains: Int) -> Int {
        var score = -1
        
        if grains == 0 {
            score = -1
        } else if 1<=grains && grains<=3 {
            score = 1
        } else if 4<=grains && grains<=5 {
            score = 2
        } else if 6<=grains && grains<=7 {
            score = 3
        } else if 8<=grains {
            score = 4
        }
        
        return score
    }
    
    func vegetableScore(vegetables: Int) -> Int {
        var score = -1

        if vegetables == 0 {
            score = -1
        } else if vegetables == 1 {
            score = 1
        } else if vegetables == 2 {
            score = 2
        } else if vegetables == 3 {
            score = 3
        } else if vegetables >= 4 {
            score = 4
        }
        
        return score
    }

    func sheepScore(sheep: Int) -> Int {
        var score = -1
        
        if sheep == 0 {
            score = -1
        } else if 1 <= sheep && sheep <= 3 {
            score = 1
        } else if 4 <= sheep && sheep <= 5 {
            score = 2
        } else if 6 <= sheep && sheep <= 7 {
            score = 3
        } else if sheep >= 8 {
            score = 4
        }
        
        return score
    }

    func boarScore(boar: Int) -> Int {
        var score = -1
        
        if boar == 0 {
            score = -1
        } else if 1 <= boar && boar <= 2 {
            score = 1
        } else if 3 <= boar && boar <= 4 {
            score = 2
        } else if 5 <= boar && boar <= 6 {
            score = 3
        } else if boar >= 7 {
            score = 4
        }
        
        return score
    }

    func cattleScore(cattle: Int) -> Int {
        var score = -1
        
        if cattle == 0 {
            score = -1
        } else if cattle == 1 {
            score = 1
        } else if 2 <= cattle && cattle <= 3 {
            score = 2
        } else if 4 <= cattle && cattle <= 5 {
            score = 3
        } else if cattle >= 6 {
            score = 4
        }
        
        return score
    }

    func fieldsScore(fields: Int) -> Int {
        var score = -1
        
        if 0 <= fields && fields <= 1 {
            score = -1
        } else if fields == 2 {
            score = 1
        } else if fields == 3 {
            score = 2
        } else if fields == 4 {
            score = 3
        } else if fields >= 5 {
            score = 4
        }
        
        return score
    }

    func pasturesScore(pastures: Int) -> Int {
        var score = -1
        
        if pastures == 0 {
            score = -1
        } else if pastures == 1 {
            score = 1
        } else if pastures == 2 {
            score = 2
        } else if pastures == 3 {
            score = 3
        } else if pastures >= 4 {
            score = 4
        }
        
        return score
    }


    func familyMembersScore(familyMembers: Int) -> Int {
        var score = familyMembers * 3    
        
        return score
    }
    
    func roomsScore(rooms: Int, roomType: String) -> Int {
        
        var multiplier = 0
        if roomType == "Wood" {
            multiplier = 0
        } else if roomType == "Clay" {
            multiplier = 1
        } else if roomType == "Stone" {
            multiplier = 2
        }
        
        let score = rooms * multiplier
        
        return score        
    }
    
    func beggingCardsScore(beggingCards: Int) -> Int {
        var score = beggingCards * (-3)
<<<<<<< HEAD
=======
        
>>>>>>> 1d1eec2098aed7237408b7317a05dfe5f77c3cda
        return score
    }
    
    
    
    
    
}
