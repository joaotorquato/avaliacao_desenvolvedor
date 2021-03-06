require 'rails_helper'

describe Parser, '#registers' do
  it 'should parse the content to a hash' do
    file = File.open('spec/support/parser_test.txt')

    parser = Parser.new(file.read)

    expect(parser.registers)
      .to eq [{ buyer: 'João Silva',
                description: 'R$10 off R$20 of food',
                unity_price: 10.0,
                quantity: 2,
                address: '987 Fake St',
                supplier: 'Bob\'s Pizza'
               }]
  end
end
