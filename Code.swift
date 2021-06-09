class Todo {
	var title: String
	var content: String
	var priority: Int
	var creationTime: Int
	var description: String {
		return """
				title: \(self.title)
				content: \(self.content)
				priority: \(self.priority)
				"""
			}

	init(title: String, content: String, priority: Int, creationTime: Int) {
		self.title = title
		self.content = content
		self.priority = priority
		self.creationTime = creationTime
	}
}

enum SortType {
	case time
    case title
	case priority
}

func sort(type: SortType, _ ascending: Bool) {
	switch type {
		case SortType.time:
			if ascending {
				todoList = todoList.sorted(by: {$0.creationTime < $1.creationTime})
			} else {
				todoList = todoList.sorted(by: {$0.creationTime > $1.creationTime})
			}
		case SortType.title:
			if ascending {
				todoList = todoList.sorted(by: {$0.title < $1.title})
			} else {
				todoList = todoList.sorted(by: {$0.title > $1.title})
			}
		case SortType.priority:
			if ascending {
				todoList = todoList.sorted(by: {$0.priority < $1.priority})
			} else {
				todoList = todoList.sorted(by: {$0.priority > $1.priority})
			}
		default:
			break
	}
}

var todoList: [Todo] = []

var exit = false
var invalid = false
var pre = 0, time = 0
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
		print("5. Sort todo items")
		print("6. Exit")
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
			todoList.append(Todo(title: title!, content: content!, priority: priority, creationTime: time))
			time += 1
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
			print("SORT MENU")
			print("1. Creation time")
			print("2. Title")
			print("3. Priority")
			print("Enter sort type:")
			var y = readLine()
			let yInt = Int(y!) ?? 0
			if yInt == 0 || yInt > 3 {
				pre = 5
				invalid = true
				print("Invalid choice, try again!")
				break
			}
			print("1. Ascending")
			print("2. Decending")
			var z = readLine()
			let zInt = Int(z!) ?? 0
			var ascending = zInt == 1 ? true : false
			switch yInt {
				case 1:
					sort(type: SortType.time, ascending)
				case 2:
					sort(type: SortType.title, ascending)
				case 3:
					sort(type: SortType.priority, ascending)
				default:
					break
			}
			print("List sorted")
		case 6:
			exit = true
		default:
			print("invalid choice")
	}
}