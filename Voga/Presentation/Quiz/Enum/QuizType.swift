//
//  QuizType.swift
//  Voga
//
//  Created by Caio Roberto Aceti on 14/09/21.
//

enum QuizType {
    case threeLooksRule
    case fiveReasons
    case detachmentTest
    
    var questions: [Question] {
        switch self {
        case .threeLooksRule:
            return [
                Question(
                    text: "Pense em um look combinando as roupas que você já tem com a peça que você quer comprar.",
                    question: "Alguma ideia em mente?",
                    illustrativeContentImage: "three-looks-rule-first-question"
                ),
                Question(
                    text: "Agora imagine mais um look. Reflita se a combinação pode ser usada de dia ou de noite!",
                    question: "Conseguiu pensar em algum?",
                    illustrativeContentImage: "three-looks-rule-second-question"
                ),
                Question(
                    text: "Por último, pense no terceiro look. Não deixe os acessórios de lado!",
                    question: "Imaginou o terceiro look?",
                    illustrativeContentImage: "three-looks-rule-third-question"
                )
            ]
        case .fiveReasons:
            return [
                Question(
                    text: "Olhe com atenção para essa peça.",
                    question: "Você realmente precisa dela?",
                    illustrativeContentImage: "five-questions-first-image"
                ),
                Question(
                    text: "Considere o custo benefício dessa peça que você deseja.",
                    question: "Essa é uma boa compra?",
                    illustrativeContentImage: "five-questions-second-image"
                ),
                Question(
                    text: "Pondere sobre suas finanças.",
                    question: "Você tem dinheiro pra isso?",
                    illustrativeContentImage: "five-questions-third-image"
                ),
                Question(
                    text: "Pense nas motivações que te levaram a querer essa peça.",
                    question: "Elas são válidas?",
                    illustrativeContentImage: "five-questions-fourth-image"
                ),
                Question(
                    text: "Cogite os impactos ambientais do tecido dessa peça de roupa.",
                    question: "O tecido é sustentável?",
                    illustrativeContentImage: "five-questions-fifth-image"
                )
            ]
        case .detachmentTest:
            return [
                Question(
                    text: "Vista a peça de roupa e reflita como você se sente ao usa-lá. Bonito, confortável e alegre...?",
                    question: "Você gosta dessa peça?",
                    illustrativeContentImage: "detachment-test-first-image"
                ),
                Question(
                    text: "Pense se essa peça ainda faz parte do seu estilo e veja se ela combina com as outras peças que você tem.",
                    question: "E aí, ela combina?",
                    illustrativeContentImage: "detachment-test-second-image"
                ),
                Question(
                    text: "Pense na frequência em que você usa esta peça: tente se lembrar da última vez em que você usou ela... ",
                    question: "Você usou ela no último ano?",
                    illustrativeContentImage: "detachment-test-third-image"
                ),
                Question(
                    text: "Pense se a peça é única no seu armário, isto é, se não há peças repetidas ou que são parecidas.",
                    question: "Ela é única?",
                    illustrativeContentImage: "detachment-test-fourth-image"
                )
            ]
        }
    }
    
    var negativeFeedbackModel: QuizFeedbackCardViewModel {
        switch self {
        case .threeLooksRule:
            return .init(
                quizFeedback: "Não foi dessa vez...",
                quizFeedbackImage: "shopping-bag",
                quizFeedbackExplanation: "Essa peça vai ficar encalhada no seu guarda roupa se você comprar ela, porque ela não combina com as suas outras peças."
            )
        case .fiveReasons:
            return .init(
                quizFeedback: "Você precisa mesmo?",
                quizFeedbackImage: "shopping-bag",
                quizFeedbackExplanation: "Parece que essa compra não é tão importante assim, né?! Acho que você concorda que não precisa dessa peça."
            )
        case .detachmentTest:
            return .init(
                quizFeedback: "O que está esperando?",
                quizFeedbackImage: "donation-box",
                quizFeedbackExplanation: "Poxa, já está na hora de desapegar dessa peça, né?! Se ela estiver em boa condição, doe; se não, descarte corretamente."
            )
        }
    }
    
    var positiveFeedbackModel: QuizFeedbackCardViewModel {
        switch self {
        case .threeLooksRule:
            return .init(
                quizFeedback: "Você conseguiu!",
                quizFeedbackImage: "shopping-success-image",
                quizFeedbackExplanation: "Essa peça não vai ficar encostada no seu guarda roupa se você comprá-la, pois combina com as suas outras peças!"
            )
        case .fiveReasons:
            return .init(
                quizFeedback: "É uma boa compra!",
                quizFeedbackImage: "shopping-success-image",
                quizFeedbackExplanation: "Parece que você realmente precisa dessa peça, hein?! E o legal é que você está fazendo uma compra sustentável!"
            )
        case .detachmentTest:
            return .init(
                quizFeedback: "Calma aí!",
                quizFeedbackImage: "green-dress",
                quizFeedbackExplanation: "Essa peça ainda é uma grande aliada na hora de compor looks, então talvez ainda não esteja na hora de desapegar dela!"
            )
        }
    }
    
    var quizTitle: String {
        switch self {
        case .threeLooksRule:
            return "REGRA DOS TRÊS LOOKS"
        case .fiveReasons:
            return "AS 5 QUESTÕES"
        case .detachmentTest:
            return "DESAPEGA!"
        }
    }
}
