require_relative '../src/note_application.rb'
include NotesProject
RSpec.describe "NotesApplication Tests" do
	it "verifies that new object belongs to the class" do
		my_notes = NotesApplication.new("ose")
		expect(my_notes.class).to eq NotesProject::NotesApplication
	end

	it "verifies list function returns nil when no note is created" do
		my_notes = NotesApplication.new("ose")
		expect(my_notes.list()).to eq nil
	end

	it "verifies nothing is edited when note content does not exist" do
		my_notes = NotesApplication.new("ose")
		my_notes.create("i am a girl")
		expect(my_notes.edit(100,"i am a girl" )).to eq nil
	end


	it "verifies nothing is returned when a note id that does not exist is called for" do
		my_notes = NotesApplication.new("ose")
		my_notes.create("i am a girl")
		expect(my_notes.get(100)).to eq nil
	end

	it "verifies get function returns nil when note id is not a number" do
		my_notes = NotesApplication.new("ose")
		my_notes.create("i am a girl")
		expect(my_notes.get("ose")).to eq nil
	end

	it "verifies delete function returns nil when note id is not a number" do
		my_notes = NotesApplication.new("ose")
		my_notes.create("i am a girl")
		expect(my_notes.delete("ose")).to eq nil
	end

	it "verifies nil is returned when a note that does not exist is tried to be deleted" do
		my_notes = NotesApplication.new("ose")
		my_notes.create("i am a girl")
		expect(my_notes.delete(100)).to eq nil
	end

	it "verifies that list function works" do
		my_notes = NotesApplication.new("ose")
		my_notes.create("i am a girl")
		expect(my_notes.list()).to eq  true
	end


	it "verifies that note content has entered note" do
		my_notes = NotesApplication.new("ose")
		my_notes.create("i am a girl")
		expect(my_notes.create("i am a girl")).to eq true
	end


	it "verifies that actual id is accessed by get(id_function) function" do
		my_notes = NotesApplication.new("ose")
		my_notes.create("i am a girl")
		expect(my_notes.get(0)).to eq "i am a girl"
	end

		it "verifies that actual id is accessed by get(id_function) function" do
		my_notes = NotesApplication.new("ose")
		my_notes.create("i am a girl")
		my_notes.create("i am a boy")
		my_notes.create("i am a child")
		my_notes.create("i am a woman")
		my_notes.create("i am a man")
		expect(my_notes.get(4)).to eq "i am a man"
	end

	it "verifies that search return true when text is found" do
		my_notes = NotesApplication.new("ose")
		my_notes.create("i am a girl")
		my_notes.create("hello everyone here. how do you do?")
		expect(my_notes.search("how do you do?")).to eq true
	end

	it "verifies that search return nil when result not found" do
		my_notes = NotesApplication.new("ose")
		my_notes.create("i am a girl")
		my_notes.create("i am a boy")
		my_notes.create("i am a child")
		my_notes.create("i am a woman")
		my_notes.create("i am a man")
		expect(my_notes.search("how do you do?")).to eq nil
	end

	it "verifies that search return true when text is found" do
		my_notes = NotesApplication.new("ose")
		my_notes.create("i am a girl")
		my_notes.create("i am a boy")
		my_notes.create("i am a child")
		my_notes.create("i am a woman")
		my_notes.create("i am a man")
		expect(my_notes.search("i am a child")).to eq true
	end

	it "verifies that search return nil when result not found" do
		my_notes = NotesApplication.new("ose")
		my_notes.create("i am a girl")
		my_notes.create("hello everyone here. how do you do?")
		expect(my_notes.search("ose is good")).to eq nil
	end

	it "verifies that search text takes non-strings" do
		my_notes = NotesApplication.new("ose")
		my_notes.create("i am a girl")
		my_notes.create("1234")
		expect(my_notes.search(1234)).to eq true
	end

	it "verifies that when a note is deleted true is returned" do
		my_notes = NotesApplication.new("ose")
		my_notes.create("i am a girl")
		my_notes.create("hello everyone here. how do you do?")
		expect(my_notes.delete(0)).to eq true
	end

	it "verifies that a note is actually deleted" do
		my_notes = NotesApplication.new("ose")
		my_notes.create("i am a girl")
		my_notes.create("hello everyone here. how do you do?")
		my_notes.delete(0)
		expect(my_notes.get(0)).to eq "hello everyone here. how do you do?"
	end

	it "verifies that a note is actually deleted" do
		my_notes = NotesApplication.new("ose")
		my_notes.create("i am a girl")
		my_notes.create("i am a boy")
		my_notes.create("i am a child")
		my_notes.create("i am a woman")
		my_notes.create("i am a man")
		my_notes.delete(1)
		expect(my_notes.get(1)).to eq "i am a child"
	end

	it "verifies that when a note is edited true is returned" do
		my_notes = NotesApplication.new("ose")
		my_notes.create("i am a girl")
		my_notes.create("hello everyone here. how do you do?")
		expect(my_notes.edit(0,"i am a boy")).to eq true
	end

	it "verifies that a note content changes when edited" do
		my_notes = NotesApplication.new("ose")
		my_notes.create("i am a girl")
		my_notes.create("hello everyone here. how do you do?")
		my_notes.edit(0,"i am a boy")
		expect(my_notes.get(0)).to eq "i am a boy"
	end


end
