//
//  ContentView.swift
//  nikolai
//
//  Created by Samy CHBINOU on 01/03/2026.
//

import SwiftUI

struct Question {
    let id: Int
    let text: String
    let imageName: String
    let answers: [Answer]
}

struct Answer {
    let text: String
    let nextQuestionId: Int?
    let stressChange: Int
    let budgetChange: Int
}

let questions: [Question] = [
    Question(
        id: 0,
        text: "Game Over ! Fin du jeu !",
        imageName: "",
        answers: [
            Answer(text: "Redémarre une nouvelle partie.", nextQuestionId: 1, stressChange: 0, budgetChange: 0),
        ]
    ),
    Question(
        id: 1,
        text: "Il est 6h30 ton réveil sonne. Encore une journée à survivre. Tu es Nikolai, cadre sup’, bac+5, CDI. Tu as tout fait comme on t’a dit. Mais aujourd’hui, tout peut basculer. Que fais-tu ?",
        imageName: "reveil",
        answers: [
            Answer(text: "Je me lève et prends mon RER B comme d’habitude.", nextQuestionId: 2, stressChange: 20, budgetChange: -10),
            Answer(text: "Je reste au lit. J’en ai marre.", nextQuestionId: 3, stressChange: 0, budgetChange: 0),
        ]
    ),
    Question(
        id: 2,
        text: "Tu es dans le RER B. Un SDF a les pieds nus sur le siège à côté de toi, et une bagarre éclate à l’autre bout du wagon. Ton téléphone affiche : ‘Solde : 2100€’. Que fais-tu ?",
        imageName: "rer",
        answers: [
            Answer(text: "Je change de wagon pour éviter la bagarre.", nextQuestionId: 4, stressChange: -10, budgetChange: 0),
            Answer(text: "Je m’engueule avec le SDF.", nextQuestionId: 5, stressChange: 30, budgetChange:0),
            Answer(text: "Je descends à la prochaine station et prends un Uber.", nextQuestionId: 6, stressChange: 10, budgetChange: -10)
        ]
    ),
    Question(
        id: 3,
        text: "Tu es licencié pour absence. Game Over! Ton score : 0.",
        imageName: "viré",
        answers: [
            Answer(text: "Redémarre une nouvelle partie.", nextQuestionId: 1, stressChange: 0, budgetChange:0),
        ]
    ),
    Question(
        id: 4,
        text: "Je sors vite d'ici, c'est chaud!",
        imageName: "bagarre",
        answers: [
            Answer(text: "...", nextQuestionId: 7, stressChange: 0, budgetChange:0),
        ]
    ),
    Question(
        id: 5,
        text: "",
        imageName: "engeulade",
        answers: [
            Answer(text: "...", nextQuestionId: 7, stressChange: 0, budgetChange:0),
        ]
    ),
    Question(
        id: 6,
        text: "Merci Uber, en retard !",
        imageName: "uber",
        answers: [
            Answer(text: "...", nextQuestionId: 7, stressChange: 0, budgetChange:0),
        ]
    ),
    Question(
        id: 7,
        text: "Tu es à ton bureau dans l'open space. Ton patron t’envoie un mail : ‘Réunion à 14h : Brainstorming sur la synergie des processus’. Ton collègue te propose de saboter la réunion. Que fais-tu ?",
        imageName: "openspace",
        answers: [
            Answer(text: "Je vais à la réunion et fais semblant de travailler.", nextQuestionId: 8, stressChange: 10, budgetChange: 50),
            Answer(text: "Je sabote la réunion avec mon collègue.", nextQuestionId: 9, stressChange: 20, budgetChange: 0),
            Answer(text: "Je quitte mon boulot et je pars près de la mer au soleil.", nextQuestionId: 10, stressChange: -30, budgetChange: -50)
        ]
    ),
    Question(
        id: 8,
        text: "",
        imageName: "réunion",
        answers: [
            Answer(text: "...", nextQuestionId: 11, stressChange: 0, budgetChange:0),
        ]
    ),
    Question(
        id: 9,
        text: "",
        imageName: "licencié",
        answers: [
            Answer(text: "...", nextQuestionId: 11, stressChange: 0, budgetChange:0),
        ]
    ),
    Question(
        id: 10,
        text: "",
        imageName: "plage",
        answers: [
            Answer(text: "...", nextQuestionId: 11, stressChange: 0, budgetChange:0),
        ]
    ),
    Question(
        id: 11,
        text: "Le Retour à la Maison. 20h, tu rentres chez toi. Dans ton hall, des jeunes inhalent du protoxyde. Ta boîte aux lettres déborde de courriers : ‘Avis d’imposition’, ‘Augmentation des charges’. Que fais-tu ?",
        imageName: "retourmaison",
        answers: [
            Answer(text: "Je paie mes charges et je me couche.", nextQuestionId: 12, stressChange: 20, budgetChange: -30),
            Answer(text: "Je jette les courriers et je vais boire un verre.", nextQuestionId: 13, stressChange: 10, budgetChange: -10),
            Answer(text: "Je frappe chez mon voisin, le Fantôme, pour lui demander conseil.", nextQuestionId: 14, stressChange: 0, budgetChange: 0),
        ]
    ),
    Question(
        id: 12,
        text: "Ce sera mieux que pire, avant hier que demain!",
        imageName: "couché",
        answers: [
            Answer(text: "...", nextQuestionId: 0, stressChange: 0, budgetChange:0),
        ]
    ),
    Question(
        id: 13,
        text: "Et hop ! cul-sec !",
        imageName: "lebaratin",
        answers: [
            Answer(text: "...", nextQuestionId: 0, stressChange: 0, budgetChange:0),
        ]
    ),
    Question(
        id: 14,
        text: "La Rencontre avec le Fantôme, Ton voisin t’ouvre, en tongs, un thé matcha à la main. ‘Salut, Nikolai. T’as l’air crevé. Veux-tu…’",
        imageName: "fantome",
        answers: [
            Answer(text: "…savoir comment il fait pour éviter les impôts ?", nextQuestionId: 0, stressChange:-20, budgetChange: -20),
            Answer(text: "…lui demander de t’héberger ?", nextQuestionId: 0, stressChange: -10, budgetChange: 50),
            Answer(text: "…lui voler son cold wallet ?", nextQuestionId: 0, stressChange: 20, budgetChange: 100),
        ]
    ),
]

struct ContentView: View {
    @State private var currentQuestionId: Int = 1
    @State private var stress: Int = 0
    @State private var budget: Int = 100

    var currentQuestion: Question? {
        questions.first { $0.id == currentQuestionId }
    }

    var body: some View {
        VStack(spacing: 20) {
            if let question = currentQuestion {
                Image(question.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 350)
                    .cornerRadius(10)
                
                Text(question.text)
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                    .padding()
                
                Text("Stress : \(stress), Budget : \(budget)")
                    .font(.subheadline)

                ForEach(question.answers, id: \.text) { answer in
                    Button(action: {
                        if let nextId = answer.nextQuestionId {
                            currentQuestionId = nextId
                            stress += answer.stressChange
                            if nextId == 1 {
                                stress = 0
                            }
                            budget += answer.budgetChange
                            if nextId == 1 {
                                budget = 100
                            }
                        }
                    }) {
                        Text(answer.text)
                            .frame(maxWidth: .infinity)
                            .padding(8)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
            } else {
                Text("Fin du jeu !")
                    .font(.title)
            }
        }
        .padding()
    }
}
