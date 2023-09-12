require 'rails_helper'

RSpec.describe Note, type: :model do
  it "is valid with a name" do
    user = User.create(name: "abc", email: "xyz")
    note = Note.new(title: "abc", content: "xyz", user: user)
    expect(note).to be_valid
  end
end
