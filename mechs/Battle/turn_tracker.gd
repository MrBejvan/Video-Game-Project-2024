class CharacterNode:
    var character   #use character_name as unique call?
    var speed       # speed = swift (lol)
    var nextUp      # ref to character with next highest speed score -> include blocks for tie


func _init(character, speed):
    self.character = character
    self.speed = speed
    self.next = null


class TurnTracker:
    var head

    func _init():
        head = null
    
    func insert(character, speed):                  #correct; insert based on character keyword map
        var newTurnNode = CharacterNode.new()

        if head == null:
            newTurnNode.next = newTurnNode
            head = newTurnNode
        else:
            var current = head
            while current.next != head and current.next.speed < speed:
                current = current.next

            newTurnNode.next = current.next
            current.next  = newTurnNode

    func printTracker():
        var current = head
        if current == null:
            print("Empty")
            return
        while current.next != head:
            print(current.character, ":", current.speed)
            current = current.next
        print(current.character, ":", current.seed)

