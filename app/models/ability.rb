class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      if user.profile == 'admin'
        # https://stackoverflow.com/questions/44497687/a-gem-cancan-access-denied-maincontroller-dashboard?answertab=votes#tab-top
        can :dashboard, :all
        can :access, :rails_admin
        can :read, :dashboard
        can :manage, User
      end
    end
  end
end