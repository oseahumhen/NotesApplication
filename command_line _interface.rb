puts "                    Welcome to Notes Taking App"
puts "                ************************************"
puts "                ************************************"
puts "                ************************************"

puts "What is your name?"
name = gets.chomp
puts "Welcome #{name}!"
puts "Do you want to continue? choose Y or N"
choice1 = gets.chomp
if choice1 != "Y"
	puts "Goodbye #{name}. I hope to see you soon!"
else
	puts "MENU"
	puts "type 1 to Create new note"
	puts "type 2 to list out your notes"
	puts "type 3 to find a note"
	puts "type 4 to search through your notes"
	puts "type 5 to delete a note"
	puts "type 6 to edit a note"

	my_notes = NotesApplication.new(name)
	while (true)
		puts "Enter a number from menu: or 0 to exit"
		choice2 = gets.chomp.to_i
		case choice2
		when 1
			puts "Please type in your note:"
			note_content = gets.chomp
			my_notes.create(note_content)
			puts "Note created!"

		when 2
			my_notes.list()

		when 3
			puts "Please enter note id:"
			note_id = gets.chomp.to_i
			puts my_notes.get(note_id)

		when 4
			puts "Please enter search text:"
			search_text = gets.chomp
			my_notes.search(search_text)

		when 5
			puts "Please enter note id to be deleted:"
			note_id = gets.chomp.to_i
			puts "Are you sure? choose Y or N"
			answer = gets.chomp
			if (answer == "Y")
				my_notes.delete(note_id)
			else
				puts "delete exited!"
			end

		when 6
			puts "Please enter note id to be edited:"
			note_id = gets.chomp.to_i
			puts "Please enter new note content:"
			new_content = gets.chomp
			my_notes.edit(note_id,new_content)
			puts "editing successful"

		when 0
			puts "Goodbye #{name} I hope to see you soon!"
			break
		end
end	
end
