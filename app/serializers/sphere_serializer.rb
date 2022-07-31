class SphereSerializer
  include FastJsonapi::ObjectSerializer
  attributes :created_at
  belongs_to :user
end
