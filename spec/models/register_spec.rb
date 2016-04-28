require 'rails_helper'

describe Register, '.save_registers' do
  it 'should save successfuly, all records from a given array' do
    # setup
    parser = Parser.new(File.open('spec/support/dados.txt').read)

    # exercise
    result = Register.save_registers(parser.registers)

    # verify
    expect(result).to eq true

    # teardown is handled for you by RSpec
  end
end

describe Register, '.total_price' do
  it 'should return the total price from all registers' do
    # setup
    create(:register, quantity: 5, unity_price: 12)
    create_list(:register, 5)

    # exercise
    total_price = Register.total_price

    # verify
    expect(total_price).to eq 110.0

    # teardown is handled for you by RSpec
  end
end
