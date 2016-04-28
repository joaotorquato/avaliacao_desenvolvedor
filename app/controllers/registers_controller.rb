class RegistersController < ApplicationController
  def new
  end

  def create
    file = ValidFile.new(register_params[:file])
    if !file.valid?
      flash[:notice] = file.errors.join(',')
      render :new
    else
      parser = Parser.new(file.content)
      Register.save_registers(parser.registers)
      flash[:success] = 'Your file was saved successfuly.'
      redirect_to registers_path
    end
  end

  def index
    @registers = Register.all
    @total = Register.total_price
  end

  private

  def register_params
    params[:register] = { file: nil } if params[:register].nil?
    params.require(:register)
  end
end
