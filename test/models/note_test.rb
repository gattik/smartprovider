require 'test_helper'
class NoteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

   test "note title can't be blank" do
  	note = Note.new(title: "")
  	assert !note.valid? 
  end

  test "note description can't be blank" do
  	note = Note.new(description: "")
  	assert !note.valid? 
  end
end


