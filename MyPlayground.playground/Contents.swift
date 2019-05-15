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

struct Form: Decodable {
    let formContainer: FormContainer
    
    enum CodingKeys: String, CodingKey {
        case formContainer = "forms"
    }
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

struct MoveContainer: Decodable {
    let name: String
    let url: String
}
struct VersionGroupContainer: Decodable {
    let name: String
    let url: String
}

struct MoveLearnMethodContainer: Decodable {
    let name: String
    let url: String
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

struct SpeciesContainer: Decodable {
    let name: String
    let url: String
}

struct SpriteContainer: Decodable {
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




struct Pokemon: Decodable{
    let abilities: [Ability]
    let baseExperience: Int
//    let forms: [Form]
//    let gameIndices: [GameIndices]
    let height: Int
    let id: Int
    let isDefault: Bool             // coding key
    let locationAreaEncounter: String
//    let moves: [Move]
    let name: String
    let order: Int
//    let species: SpeciesContainer /* work on this */
//    let sprites: SpriteContainer /* work on this */
    //let stats: [Stats] /* work on this */
    //let types: [Type] /* work on this */
    let weight: Int        //  coding key
    
    
    
    
    enum CodingKeys: String, CodingKey {
        case abilities
        case baseExperience = "base_experience"
//        case forms
//        case gameIndices = "game_indices"
        case height
        case id
        case isDefault = "is_default"
        case locationAreaEncounter = "location_area_encounters"
//        case moves
        case name
        case order
//        case species
//        case sprites
//        case stats
//        case types
        case weight
    }
    
    
//    init?(dictionary: [String: Any]) {
//        guard let pokemonName       = dictionary["name"] as? String,
//            let pokemonHeight       = dictionary["height"] as? Int,
//            let pokemonWeight       = dictionary["weight"] as? Int,
//            let pokemonExperience   = dictionary["base_experience"] as? Int else {
//                return nil
//        }
//        self.name           = pokemonName
//        self.height         = pokemonHeight
//        self.weight         = pokemonWeight
//        self.baseExperience = pokemonExperience
//    }
}


//let data = try! Data(contentsOf: url)
//let jsonObject = try! JSONSerialization.jsonObject(with: data, options: [])
//let jsonDictionary = jsonObject as! [String: Any]
//let pokemon = try? JSONDecoder().decode(Pokemon.self
//    , from: data)

//print(pokemon!)

let apiURL = URL(string: "https://pokeapi.co/api/v2/pokemon/34")!


URLSession.shared.dataTask(with: apiURL) {
    (data, _, _) in
    let calledPokemon = try? JSONDecoder().decode(Pokemon.self, from: data!)
    if let pokemonName  = calledPokemon?. {
        print(pokemonName)
    }
    
//print(calledPokemon)
}.resume()



