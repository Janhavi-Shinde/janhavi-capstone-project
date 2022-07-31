class GoalSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :description
end
