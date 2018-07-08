import Foundation

class Concentration
{
    private(set) var cards = [Card]()
    
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            return cards.indices.filter { cards[$0].isFaceUp }.oneAndOnly
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index)): chosen index not in the cards.")
        //Ignore matched cards
        if !cards[index].isMatched {
            //If there's one and only face up card and you chose that card, ignore it.
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                //Check if cards match
                if cards[matchIndex] == cards[index] {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {
                //Either no cards, or two cards face up
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
        
//        if cards[index].isFaceUp {
//            cards[index].isFaceUp = false
//        } else {
//            cards[index].isFaceUp = true
//        }
    }
    
    init(pairsOfCards: Int) {
        assert(pairsOfCards > 0, "Concentration.init(\(pairsOfCards)): you must have at least one pair of cards.")
        for _ in 1...pairsOfCards {
            let card = Card()
            cards += [card, card]
        }
    }
    //TODO: Shuffle the cards
}

extension Collection {
    var oneAndOnly: Element? {
        return count == 1 ? first : nil
    }
}
