class User
  attr_accessor :name, :email
  
  def initialize(attributtes = {})
    @name = attributes[:name]
    @email = attributes[:email]
  end
  def formated_email
    "#{@name} <#{@email}>"
    end
end
