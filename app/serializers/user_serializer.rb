class UserSerializer < ActiveModel::Serializer
  include ActiveModel::Validations
  include ActiveModel::AttributeAssignment
  include NullAttributesRemover
  attributes :email, :password
  validates_presence_of :email, strict: true
end
