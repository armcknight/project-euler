#In the card game poker, a hand consists of five cards and are ranked, from lowest to highest, in the following way:

#High Card: Highest value card.
#One Pair: Two cards of the same value.
#Two Pairs: Two different pairs.
#Three of a Kind: Three cards of the same value.
#Straight: All cards are consecutive values.
#Flush: All cards of the same suit.
#Full House: Three of a kind and a pair.
#Four of a Kind: Four cards of the same value.
#Straight Flush: All cards are consecutive values of same suit.
#Royal Flush: Ten, Jack, Queen, King, Ace, in same suit.
#The cards are valued in the order:
#2, 3, 4, 5, 6, 7, 8, 9, 10, Jack, Queen, King, Ace.
#
#If two players have the same ranked hands then the rank made up of the highest value wins; for example, a pair of eights beats a pair of fives (see example 1 below). But if two ranks tie, for example, both players have a pair of queens, then highest cards in each hand are compared (see example 4 below); if the highest cards tie then the next highest cards are compared, and so on.

#Consider the following five hands dealt to two players:

#Hand	 	Player 1	 	Player 2	 	Winner
#1	 	5H 5C 6S 7S KD
#Pair of Fives
#2C 3S 8S 8D TD
#Pair of Eights
#Player 2
#2	 	5D 8C 9S JS AC
#Highest card Ace
#2C 5C 7D 8S QH
#Highest card Queen
#Player 1
#3	 	2D 9C AS AH AC
#Three Aces
#3D 6D 7D TD QD
#Flush with Diamonds
#Player 2
#4	 	4D 6S 9H QH QC
#Pair of Queens
#Highest card Nine
#3D 6D 7H QD QS
#Pair of Queens
#Highest card Seven
#Player 1
#5	 	2H 2D 4C 4D 4S
#Full House
#With Three Fours
#3C 3D 3S 9S 9D
#Full House
#with Three Threes
#Player 1
#The file, poker.txt, contains one-thousand random hands dealt to two players. Each line of the file contains ten cards (separated by a single space): the first five are Player 1's cards and the last five are Player 2's cards. You can assume that all hands are valid (no invalid characters or repeated cards), each player's hand is in no specific order, and in each hand there is a clear winner.

#How many hands does Player 1 win?

class Card
    attr_accessor :value #either a char or int for 2-A
    attr_accessor :suit #a char: either C, D, S, H
    attr_accessor :face #boolean, true if value is J-A
    
    #input: a string containing two chars, the first for value and second for suit
    def initialize c
        
        case c.split("").first 
        when "2"
            v = 2
        when "3"
            v = 3
        when "4"
            v = 4
        when "5"
            v = 5
        when "6"
            v = 6
        when "7"
            v = 7
        when "8"
            v = 8
        when "9"
            v = 9
        when "10"
            v = 10
        when "J"
            v = "J"
        when "Q"
            v = "Q"
        when "K"
            v = "K"
        else
            v = "A"
        end
        
        @suit = c.split("").last
        @value = v
        if v == "J" or v == "Q" or v == "K" or v == "A"
            @face = true
        else
            @face == false
        end
    end
    
    def to_s
        return "#{@value}#{suit}"
    end
    
    def ==(rhs)
        return @value == rhs.value
    end
    
    def >(rhs)
        if self == rhs
            return false
        elsif @face and rhs.face
            thisFaceRank = @value=="A"?3:@value=="K"?2:@value=="@"?1:0
            rhsFaceRank = rhs.value=="A"?3:rhs.value=="K"?2:rhs.value=="@"?1:0
            return thisFaceRank > rhsFaceRank
        elsif @face and !rhs.face
            return true
        elsif !@face and rhs.face
            return false
        else
            return @value > rhs.value
        end
    end

    def <(rhs)
        if self==rhs
            return false
        else
            return rhs>self
        end
    end

    def <=>(rhs)
        if self > rhs
            return 1
        elsif self < rhs
            return -1
        else
            return 0
        end
    end
end

class Hand
    attr_accessor :cards #array of cards sorted by value
    attr_accessor :rank #rank of hand
    attr_accessor :handStart #idx's of the beginning of hand, eg pair, trips, etc.
    attr_accessor :handSubstart #substart is beginning of second pair or second half of full house
    
    
    #input: 5 Card objects
    def initialize (cards)
        #sort the cards and store them in @cards
        @cards = Array.new
        cards.each do |card|
            @cards << Card.new(card)
        end
        @cards.sort!
        
        #determine the rank of the hand
        @rank = 0
        
        #see if at least one pair exists
        if @cards[0] == @cards[1] or @cards[1] == @cards[2] or @cards[2] == @cards[3] or @cards[3] == @cards[4]
            @handStart = @cards[0] == @cards[1] ? 0 : @cards[1] == @cards[2] ? 1 : @cards[2] == @cards[3] ? 2 : 3
            @rank = 1 #one pair
            #see if it's part of a three of a kind
            if @cards[0] == @cards[2] or cards[1] == @cards[3] or cards[2] == @cards[4]
                #see if hand is a full house
                if (@cards[0] == @cards[1] and @cards[2] == @cards[3] and @cards[2] == @cards[4]) or (@cards[0] == @cards[1] and @cards[0] == @cards[2] and @cards[3] == @cards[4])
                    @handSubstart = @cards[2] == @cards[4] ? 2 : 3
                    @rank = 6 #full house
                else
                    @rank = 3 #three of a kind
                    
                    #see if it's part of a four of a kind
                    if @cards[0] == @cards[3] or @cards[1] == @cards[4]
                        @rank = 7 #four of a kind
                    end
                end
            else
                #see if there are two pairs
                if (@cards[0] == @cards[1] and @cards[2] == @cards[3]) or (@cards[1] == @cards[2] and @cards[3] == @cards[4]) or (@cards[0] == @cards[1] and @cards[3] == @cards[4])
                    @rank = 2 #two pairs
                    @handSubstart = @cards[2] == @cards[4] ? 2 : 3
                end
            end
        else
            #check for straight
            inorder = true
            0.upto(@cards.count - 2) do |x|
                if @cards[x].face and !@cards[x+1].face
                    inorder = false
                    break
                elsif !@cards[x].face and !@cards[x+1].face
                    unless @cards[x].value + 1 == @cards[x+1].value
                        inorder = false
                        break
                    end
                else
                    unless @cards[x+1].value == "J"
                        inorder = false
                        break
                    end
                end
            end
            if inorder
                @rank = 4 #straight
            end
        end
                    
        #check for flush, straight flush and royal flush
        flush = true
        suit = @cards[0].suit
        @cards.each do |card|
            unless card.suit == suit
                flush = false
                break
            end
        end
        if flush
            if @rank == 4
                @rank = 8 #straight flush
            elsif @cards[1].face and @cards[2].face and @cards[3].face and @cards[4].face
                @rank = 9 #royal flush
            elsif @rank < 6
                @rank = 5 #flush
            end
        end
    end
    
    def to_s
        return cards.join(" ")
    end
    
    #input: Hand object representing opponent's hand
    #output: boolean value
    def >(rhs)
        if @rank == rhs.rank
            if @rank == 0
                #compare highest cards
                if @cards[4] == rhs.cards[4]
                    if @cards[3] == rhs.cards[3]
                        if @cards[2] == rhs.cards[2]
                            if @cards[1] == rhs.cards[1]
                                return @cards[0] > rhs.cards[0]
                            else
                                return @cards[1] > rhs.cards[1]
                            end
                        else
                            return @cards[2] > rhs.cards[2]
                        end
                    else
                        return @cards[3] > rhs.cards[3]
                    end
                else
                    return @cards[4] > rhs.cards[4]
                end
            elsif @rank == 1
                #find higher pair
                return @cards[@handStart] > rhs.cards[rhs.handStart]
            elsif @rank == 2
                #find higher pair
                if @cards[@handStart] == rhs.cards[rhs.handStart]
                    return @cards[@handSubstart] > rhs.cards[rhs.handSubstart]
                else
                    return @cards[@handStart] > rhs.cards[rhs.handStart]
                end
            elsif @rank == 3
                #find higher triplet
                return @cards[@handStart] > rhs.cards[rhs.handStart]
            elsif @rank == 4
                #find higher straight
                return @cards[0] > rhs.cards[0]
            elsif @rank == 5
                #find higher flush
                return @cards[4] > rhs.cards[4]
            elsif @rank == 6
                #find higher full house
                    if @handSubstart == 3
                        if rhs.handSubstart == 3
                            #both trips in front
                            if @cards[@handStart] == rhs.cards[rhs.handStart]
                                return @cards[@handSubstart] > rhs.cards[rhs.handSubstart]
                            else
                                return @cards[@handStart] > rhs.cards[rhs.handStart]
                            end
                        else
                            #trip in front vs trip in back
                            if @cards[@handStart] == rhs.cards[rhs.handSubstart]
                                return @cards[@handSubstart] > rhs.cards[rhs.handStart]
                            else
                                return @cards[@handStart] > rhs.cards[rhs.handSubstart]
                            end
                        end
                    elsif @handSubstart == 2
                        #both trips in back
                        if rhs.handSubstart == 2
                            if @cards[@handSubstart] == rhs.cards[rhs.handSubstart]
                                return @cards[@handStart] > rhs.cards[rhs.handStart]
                                else
                                return @cards[@handSubstart] > rhs.cards[rhs.handSubstart]
                            end
                        else
                            #trip in back vs trip in front
                            if @cards[@handSubstart] == rhs.cards[rhs.handStart]
                                return @cards[@handStart] > rhs.cards[rhs.handSubstart]
                            else
                                return @cards[@handSubstart] > rhs.cards[rhs.handStart]
                            end
                        end
                        
                    end
            elsif @rank == 7
                #find higher quadruplet
                return @cards[self.handStart] > rhs.cards[rhs.handStart]
            elsif @rank == 8
                #find higher straight flush
                return @cards[0] > rhs.cards[0]
            elsif @rank == 9
                #find higher royal flush
            end
        else
            return @rank > rhs.rank
        end
    end
end

games = File.open("poker.txt")
count = 0
games.readlines.each do |game|
    plyr1, plyr2 = Hand.new(game.split(" ")[0..4]), Hand.new(game.split(" ")[5..9])
    if plyr1 > plyr2
        count += 1
        puts "#{plyr1}(#{plyr1.rank}) beats #{plyr2}(#{plyr2.rank})"
    else
        puts "#{plyr1}(#{plyr1.rank}) loses to #{plyr2}(#{plyr2.rank})"
    end
end
puts count