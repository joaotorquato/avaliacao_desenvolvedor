class ValidFile
  attr_reader :content, :errors

  def initialize(file)
    @file = file
    @errors = []
  end

  def valid?
    return false if file_nil?
    @content = @file.read
    return false if content_empty?
    if @content.split("\n").first.force_encoding('UTF-8') == "Comprador	descrição	Preço Uniário	Quantidade	Endereço	Fornecedor"
      true
    else
      @errors.push('This file is invalid, please select a valid one')
      false
    end
  end

  def file_nil?
    if @file.nil?
      @errors.push('File not found. Please select a file before click \'save\'')
      true
    else
      false
    end
  end

  def content_empty?
    if @content.empty?
      @errors.push('Empty file. Please upload a valid one')
      true
    else
      false
    end
  end
end
