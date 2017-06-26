module CommonValidate

  #protected

  def val_is_empty?(val)
    raise "Value can not be empty!" if val.empty?
  end

  def self.val_is_int?(val)
    raise "Value is not an int!" if !val.is_a? Integer
  end
end