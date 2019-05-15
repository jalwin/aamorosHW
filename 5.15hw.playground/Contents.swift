/*
    Alwin Amoros
    Getting APi from server, parsing it to jsondecoder by passig
    the correct labeled struct.
  */

import UIKit

//let url = Bundle.main.url(forResource: "PokemonExample", withExtension: "json")!


struct Ability: Decodable {
    let abilityContainer: AbilityContainer
    let isHidden: Bool
    let slot: Int
    
    enum CodingKeys: String, CodingKey {
        case abilityContainer = "ability"
        case isHidden = "is_hidden"
        case slot
    }
    
}

struct AbilityContainer: Decodable {
    let name: String
    let url: URL
}

struct FormContainer: Decodable {
    let name: String
    let url: String
}

struct GameIndices: Decodable {
    let gameIndex: Int
    let versionContainer: VersionContainer
    
    enum CodingKeys: String, CodingKey {
        case gameIndex = "game_index"
        case versionContainer = "version"
    }
}

struct VersionContainer: Decodable {
    let name: String
    let url: String
}

struct Move: Decodable {
    let move: MoveContainer
    let versionGroupDetails: [VersionGroupDetails]
    
    enum CodingKeys: String, CodingKey {
        case move
        case versionGroupDetails = "version_group_details"
    }
}

struct VersionGroupDetails: Decodable {
    let levelLearnedAt: Int
    let moveLearnMethod: MoveLearnMethodContainer
    let versionGroup: VersionGroupContainer
    
    enum CodingKeys: String, CodingKey {
        case levelLearnedAt = "level_learned_at"
        case moveLearnMethod = "move_learn_method"
        case versionGroup = "version_group"
    }
}

struct MoveLearnMethodContainer: Decodable {
    let name: String
    let url: String
}


struct MoveContainer: Decodable {
    let name: String
    let url: String
}
struct VersionGroupContainer: Decodable {
    let name: String
    let url: String
}

struct Species: Decodable {
    let name: String
    let url: String
}

struct Sprite: Decodable {
    let backDefault: String
    let backFemale: String?
    let backShiny: String
    let backShinyFemale: String?
    let frontDefault: String
    let frontFemale: String?
    let frontShiny: String
    let frontShinyFemale: String?
    
    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backFemale = "back_female"
        case backShiny = "back_shiny"
        case backShinyFemale = "back_shiny_female"
        case frontDefault = "front_default"
        case frontFemale = "front_female"
        case frontShiny = "front_shiny"
        case frontShinyFemale = "front_shiny_female"
    }
}

struct Stats: Decodable {
    let baseStat: Int
    let effort: Int
    let stat: Stat
    
    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case effort
        case stat
    }
}

struct Stat: Decodable {
    let name: String
    let url: String
}

struct Types: Decodable {
    let slot: Int
    let type: Type
}

struct Type: Decodable {
    let name: String
    let url: String
}

struct Pokemon: Decodable {
    let abilities: [Ability]            /* works */
    let baseExperience: Int             /* works */
    let forms: [FormContainer]          /* works */
    let gameIndices: [GameIndices]      /* works */
    let height: Int                     /* works */
    let id: Int                         /* works */
    let isDefault: Bool                 /* works */
    let locationAreaEncounter: String   /* works */
    let moves: [Move]                   /* works */
    let name: String                    /* works */
    let order: Int                      /* works */
    let species: Species                /* works */
    let sprites: Sprite                 /* works */
    let stats: [Stats]                  /* works */
    let types: [Type]
    let weight: Int                     /* works */
    enum CodingKeys: String, CodingKey {
        case abilities
        case baseExperience = "base_experience"
        case forms
        case gameIndices = "game_indices"
        case height
        case id
        case isDefault = "is_default"
        case locationAreaEncounter = "location_area_encounters"
        case moves
        case name
        case order
        case species
        case sprites
        case stats
        case types
        case weight
    }
}

let apiURL = URL(string: "https://pokeapi.co/api/v2/pokemon/34")!


URLSession.shared.dataTask(with: apiURL) {
    (data, _, _) in
    let calledPokemon = try? JSONDecoder().decode(Pokemon.self, from: data!)
    print(calledPokemon)
    }.resume()
