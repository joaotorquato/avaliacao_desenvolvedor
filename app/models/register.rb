class Register < ActiveRecord::Base
  def self.save_registers(registers)
    registers.each do |register|
      create(register)
    end
    true
  end

  def self.total_price
    Register.all.to_a.sum do |p|
      p.unity_price * p.quantity
    end
  end
end
