class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :email, :spheres
end
