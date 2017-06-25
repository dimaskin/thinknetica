module CommonValidate
  def val_is_blank?(val)
    raise "Value can not be blank!" if val.blank?
  end
end