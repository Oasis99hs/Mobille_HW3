class Todo {
	var title: String
	var content: String
	var priority: Int
	var description: String {
		return """
				title: \(self.title)
				content: \(self.content)
				priority: \(self.priority)
				"""
			}

	init(title: String, content: String, priority: Int) {
		self.title = title
		self.content = content
		self.priority = priority
	}
}

var todoList: [Todo] = []

var exit = false
var invalid = false
var pre = 0
while !exit {
	let xInt : Int
	if invalid {
		xInt = pre
		invalid = false
	} else {
		print("\nMAIN MENU")
		print("1. Add todo item")
		print("2. See all todo items")
		print("3. Edit todo items")
    print("4. Delete todo item")
		print("5. Exit")
		var x = readLine()
		xInt = Int(x!) ?? 0
	}
	switch xInt {
		case 1:
			print("Enter todo title:", terminator: " ")
			var title = readLine()
			print("Enter todo contetnt:", terminator: " ")
			var content = readLine()
			print("Enter todo priority:", terminator: " ")
			var pr = readLine()
			var priority = Int(pr!) ?? 0
			todoList.append(Todo(title: title!, content: content!, priority: priority))
            print("Item added")
		case 2:
			if todoList.isEmpty {
				print("No items to show")
				break
			}
			print("Todo List items:")
			for (index, item) in todoList.enumerated() {
				print(index + 1, item.description)
			}
			print("1. Edit todo item")
			print("2. Back")
			var y = readLine()
			let yInt = Int(y!) ?? 0
			if yInt == 1 {
				fallthrough
			} else {
				break
			}
		case 3:
			print("EDIT MENU")
			print("Not entered fields won't change")
			print("Enter item number:", terminator: " ")
			var n = readLine()
			let nInt = Int(n!) ?? 0
			if nInt == 0 || nInt > todoList.count {
				pre = 3
				invalid = true
				print("Item doesn't exist, try again!")
				break
			}
			var todo = todoList[nInt - 1]

			print("Enter todo title:", terminator: " ")
			var title = readLine()
			if title != nil && title != "" {
				todo.title = title!
			}

			print("Enter todo contetnt:", terminator: " ")
			var content = readLine()
			if content != nil && content != "" {
				todo.content = content!
			}

			print("Enter todo priority:", terminator: " ")
			var pr = readLine()
			var priority = Int(pr!)
			if priority != nil {  //considered priority can be zero
				todo.priority = priority!
			}
        case 4:
            print("DELETE MENU")
            print("Enter item number:", terminator: " ")
            var n = readLine()
			let nInt = Int(n!) ?? 0
            if nInt == 0 || nInt > todoList.count {
				pre = 4
				invalid = true
				print("Item doesn't exist, try again!")
				break
			}
            todoList.remove(at: nInt - 1)
            print("Item removed")
		case 5:
			exit = true
		default:
			print("invalid choice")
	}
}