//
//  main.swift
//  ProtocolsCodable
//
//  Created by Gabriel Mors  on 07/09/23.
//

import Foundation

//MARK: NÃO ESQUEÇA O SIGNIFICADO DE CADA UM

//MARK: Decodable:
// Decodifica-lo
// É quando você transforma um tipo de dado JSON para um Objeto Swift

//MARK: Encodable:
// Codificá-lo
//É quando você transforma um Objeto Swift para um JSON

//MARK: Codable:
// Ele faz os dois, tanto codifica quanto decodifica


struct Person: Codable {
    var name: String?
    var age: Int?
    var lastName: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "name_App"
        case age = "age_App"
        case lastName = "last_Name"
    }
}

// Encodable (Codificação)
let person = Person(name: "Gabriel", age: 18, lastName: "Mors")
let jsonEncoder = JSONEncoder()
jsonEncoder.outputFormatting = .prettyPrinted

do {
    let jsonData = try jsonEncoder.encode(person)
    if let jsonString = String(data: jsonData, encoding: .utf8) {
        print("JSON CODIFICADO:")
        print(jsonString)
    }
} catch {
    print("Erro ao codificar meu JSON: \(error)")
}


// Decodable (Decodificação)
let jsonString = """
{
    "name_App": "Gabriel",
    "age_App": 18,
    "last_Name": "Mors"
}
"""

let jsonDecoder = JSONDecoder()

if let jsonData = jsonString.data(using: .utf8) {
    do {
        let decoderPerson: Person = try jsonDecoder.decode(Person.self, from: jsonData)
        print("Decodificado:")
        print("Nome: \(decoderPerson.name ?? ""), Idade: \(decoderPerson.age ?? 0), Sobrenome: \(decoderPerson.lastName ?? "")")
    } catch {
        print("Erro ao decodificar meu JSON: \(error)")
    }
}


































