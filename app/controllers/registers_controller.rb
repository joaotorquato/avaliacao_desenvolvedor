class RegistersController < ApplicationController
  def new
  end

  def create
    register_params = params[:register]
    if register_params.nil? || (content = register_params[:file].read).empty?
      flash[:notice] = 'Empty file. Please upload a valid one.'
      render :new
    else
      parser = Parser.new(content)
      Register.save_registers(parser.registers)
      flash[:success] = 'Your file was saved successfuly.'
      redirect_to registers_path
    end
  end

  def index
    @registers = Register.all
    @total = Register.total_price
  end
end
