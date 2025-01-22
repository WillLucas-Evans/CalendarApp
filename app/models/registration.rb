class Registration
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :email_address, :string
  attribute :password, :string

  validates :email_address, presence: true
  validates :password, length: 6..128

  def save
    if valid?
      User.create!(email_address: email_address, password: password)
    end
  end

  def model_name
    ActiveModel::Name.new(self, nil, self.class.name)
  end
end
