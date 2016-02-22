module NotesProject
	class NotesApplication

		def initialize(author)
			@author = author
			@notes = []	
		end

		def create(note_content)
			@notes << note_content
			return true
		end

		def list()
			length = @notes.length
			if (length != 0)
				for i in 0...length
					puts "Note ID: #{i}"
					puts "#{@notes[i]}"
					puts "By #{@author}"
				end
				return true
			else
				puts "No notes!"
			end
		end

		def get(note_id)
			if (note_id.is_a? Fixnum)
				if (@notes[note_id] != nil)
					return @notes[note_id]
				else
					puts "note does not exist"
				end

			else
				puts "note id must be a numeric"
			end
		end

		def search(search_text)
			@search_text = search_text
			length = @notes.length
			count = 0
			if !(search_text.is_a? String)
				search_text = search_text.to_s
			end
			for i in 0...length
				if (@notes[i].include? search_text)
					puts "showing results for '#{search_text}' "
					puts "Note ID: #{i}"
					puts "#{@notes[i]}"
					puts "By #{@author}"
					count += 1
					return true
				end
			end
			if (count == 0)
				puts "No search result found"
			end

		end



		def delete(note_id)
			if (note_id.is_a? Fixnum)
				if (@notes[note_id] != nil)
				@notes.delete(@notes[note_id])
				puts "deleted!"
				return true
				else
					puts "note does not exit"
				end
			else
				puts "note id must be a numeric"
			end

		end

		def edit(note_id, new_content)
			if (@notes[note_id] != nil)
				@notes[note_id] = new_content
				return true
			else
				puts "index does not exist"
			end
		end


	end
end

