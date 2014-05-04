#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    (@get 'playerHand').on 'gameOver', @gameOver, @
    (@get 'playerHand').on 'stand', @dealerTurn, @

  gameOver: ->
    alert('Game over, DOOD!') #TODO: re-deal
    do @newHand

  dealerTurn: ->
    do (@get 'dealerHand').at(0).flip

    while (do @get('dealerHand').score) < 17
      do (@get 'dealerHand').hit

    @scoreHand (do (@get 'playerHand').score), (do (@get 'dealerHand').score)

  scoreHand: (playerScore, dealerScore) ->
    if dealerScore > 21 then alert 'Dealer busts!'
    else if playerScore > dealerScore then alert 'Player WINS!!!!1!!!!!11!!!! THATS YOU!!!!'
    else if playerScore < dealerScore then alert 'Dealer wins :('
    else alert "puuuuushhh ugghh"
    do @newHand

  newHand: ->
    window.app = @
    playerHand = @get 'playerHand'
    dealerHand = @get 'dealerHand'
    playerHand.reset()
    dealerHand.reset()
    playerHand.hit()
    playerHand.hit()
    dealerHand.hit()
    dealerHand.hit()
    dealerHand.at(0).flip()

    # @set 'playerHand', (@get 'deck').dealPlayer()
    # # get the hand view and set its model to the new hand
    # #
    # @set 'dealerHand', (@get 'deck').dealDealer()

