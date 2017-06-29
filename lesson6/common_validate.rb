module CommonValidate

  protected
  
  def valid?
    validate!
  rescue
    false
  end

end