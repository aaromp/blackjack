#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    (@get 'playerHand').on 'gameOver', @gameOver, @
    (@get 'playerHand').on 'stand', @dealerTurn, @

  gameOver: ->
    console.log('Game over, DOOD!') #TODO: re-deal

  dealerTurn: ->
    do (@get 'dealerHand').at(0).flip

    while (do @get('dealerHand').score) < 17
      do (@get 'dealerHand').hit

    @scoreGame (do (@get 'playerHand').score), (do (@get 'dealerHand').score)

  scoreGame: (playerScore, dealerScore) ->
    if dealerScore > 21 then console.log 'Dealer busts!'
    else if playerScore > dealerScore then console.log 'Player WINS!!!!1!!!!!11!!!! THATS YOU!!!!'
    else if playerScore < dealerScore then console.log 'Dealer wins :('
    else console.log "puuuuushhh ugghh"
