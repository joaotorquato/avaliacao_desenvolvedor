require 'rails_helper'

describe ValidFile, '#valid?' do
  it 'should validate if a given file is valid' do
    archive = File.open('spec/support/parser_test.txt')

    file = ValidFile.new(archive)

    expect(file.valid?).to be true
  end

  it 'should invalidate if a given file is invalid' do
    archive = File.open('spec/support/empty_data.txt')

    file = ValidFile.new(archive)

    expect(file.valid?).to be false
  end

  it 'should invalidate if a given file is null' do
    archive = nil

    file = ValidFile.new(archive)

    expect(file.valid?).to be false
  end
end
