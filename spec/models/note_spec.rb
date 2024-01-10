require 'rails_helper'

RSpec.describe Note, type: :model do

   subject { User.new(title: "Mithgoyal", content: "This is my note.") }

  it "should be invalid without a title" do
    note = Note.new
    expect(note).to be_invalid
    expect(note.errors[:title]).to include("can't be blank")
  end

  it "should be invalid without a content" do                                                        
    note = Note.new
    expect(note).to be_invalid
    expect(note.errors[:content]).to include("can't be blank")
  end

  #  it { should validate_length_of(:title).maximum(20) }

  # it { should validate_length_of(:content).maximum(20) }

  it "should validate length of title maximum 20" do
    note = Note.new(title: "test case in rails" , content: "This is my cool note.")
    expect(note).to be_invalid
    expect(note.errors[:title]).to include("length max 20")
  end

  # it "creates a valid note" do
  #   note = Note.create(title: "My Note", content: "This is my cool note.")
  #   expect(note).to be_valid
  #   expect(note.title).to eq("My Note")
  #   expect(note.content).to eq("This is my note.")
  # end
end
