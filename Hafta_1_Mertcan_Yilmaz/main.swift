//
//  main.swift
//  Hafta_1_Mertcan_Yilmaz
//
//  Created by Mertcan Yılmaz on 25.09.2022.
//

import Foundation

print("***************************")
print("* Welcome to  Poke & You! *")
print("***************************")
print("\nPlease Register.\n")

class trainer{
    var id : Int
    var name : String
    var money : Int
    var type : PokeType.RawValue
    
    init(id: Int, name: String, money: Int, type: PokeType.RawValue) {
        self.id = id
        self.name = name
        self.money = money
        self.type = type
    }
}

struct pokemon{
    var name : String
    var lvl : Int
    var price : Int
    
    init(name: String, lvl: Int, price: Int) {
        self.name = name
        self.lvl = lvl
        self.price = price
    }
}

func showPokemon(pokemon : pokemon){
    print("Name: \(pokemon.name)")
    print("Level: \(pokemon.lvl)")
    print("Price: \(pokemon.price)")
}

let charizard = pokemon(name: "Charizard", lvl: 34, price: 67)
let butterfree = pokemon(name: "Butterfree", lvl: 23, price: 55)
let pidgeotto = pokemon(name: "Pidgeotto", lvl: 3, price: 4)
let flyingPokemons = [charizard, butterfree, pidgeotto]

let magmar = pokemon(name: "Magmar", lvl: 12, price: 22)
let flareon = pokemon(name: "Flareon", lvl: 54, price: 99)
let charmender = pokemon(name: "Charmender", lvl: 12, price: 31)
let firePokemons = [magmar, flareon, charmender]

let squirtle = pokemon(name: "Squirtle", lvl: 41, price: 84)
let psyduck = pokemon(name: "Psyduck", lvl: 2, price: 4)
let staryu = pokemon(name: "Staryu", lvl: 23, price: 32)
let waterPokemons = [squirtle, psyduck, staryu]

let pikachu = pokemon(name: "Pikachu", lvl: 65, price: 141)
let jolteon = pokemon(name: "Jolteon", lvl: 23, price: 55)
let voltrob = pokemon(name: "Voltrob", lvl: 44, price: 89)
let electricPokemons = [pikachu, jolteon, voltrob]
let allTypes = [firePokemons, waterPokemons, electricPokemons, flyingPokemons]

enum PokeType : Int {
    case Fire, Water, Electric, Flying
}

var isRegistered = false

func register() -> trainer{
    print("--Trainer Info--")
    print("Name: ", terminator: "")
    var name : String = readLine()!
    
    print("ID: ", terminator: "")
    var id : Int = Int(readLine()!)!
    
    print("Money: ", terminator: "")
    var money : Int = Int(readLine()!)!
    
    print("Trainer Type; Fire(0), Water(1), Electric(2), Flying(3): ", terminator: "")
    var trainerType : Int = Int(readLine()!)!
    
    if let pokeType = PokeType(rawValue: trainerType) {
        switch pokeType {
        case .Fire, .Electric, .Flying, .Water:
            print("\nRegister Complate!\n")
        }
    } else {
        print("\nWrong Type Selection\n")
        return register()
    }
    
    var newTrainer = trainer(id: id,
                             name: name,
                             money: money,
                             type: trainerType)
    
    isRegistered = true
    return newTrainer
}

func store(trn : trainer){
    print("\nShop Shop Shop!")
    
    for (i,j) in allTypes[trn.type].enumerated(){
        print(i,". ", j.name)
    }
    print("\nSelect one: ", terminator: "")
    if let selection : Int = Int(readLine()!){
        if (selection < 3 && selection >= 0){
            print("\nPokemon Info")
            showPokemon(pokemon: allTypes[trn.type][selection])
            print("Buy? Y/N")
            let ans = readLine()
            if ans == "Y" {
                if trn.money >= allTypes[trn.type][selection].price{
                    print("Success!")
                    trn.money = trn.money - allTypes[trn.type][selection].price
                    store(trn: trn)
                }else{
                    print("Insufficient Funds")
                    store(trn: trn)
                }
            }else {
                print("?")
                store(trn: trn)
            }
        } else {
            print("\nWrong Pokemon Selection\n")
            store(trn: trn)
        }
    } else {
        print("Wrong Pokemon Selection\n")
        store(trn: trn)
    }
}

var newUserr = register()

store(trn: newUserr)
