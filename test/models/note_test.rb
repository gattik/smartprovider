require 'test_helper'
class NoteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

   test "note title can't be blank" do
  	note = Note.new(title: "")
  	assert note.invalid?
    assert note.errors[:title].any?
  end

  test "note description can't be blank" do
  	note = Note.new(description: "")
  	assert note.invalid?
    assert note.errors[:description].any?
  end
end


