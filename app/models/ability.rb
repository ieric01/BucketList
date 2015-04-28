class Ability
  include CanCan::Ability

  def initialize(user)
    if user.name == "guest" 
      can? :read, :all
    else
      binding.pry

      # can? :manage, :all
      # Ability.rules << can?(:create, :all)
    end

  end
end
