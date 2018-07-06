import Foundation

class Concentration
{
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices {
                if foundIndex == nil {
                    foundIndex = index
                } else {
                    return nil
                }
            }
            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    func chooseCard(at index: Int) {
        //Ignore matched cards
        if !cards[index].isMatched {
            //If there's one and only face up card and you chose that card, ignore it.
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                //Check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
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
        for _ in 1...pairsOfCards {
            let card = Card()
            cards += [card, card]
        }
    }
    //TODO: Shuffle the cards
}
