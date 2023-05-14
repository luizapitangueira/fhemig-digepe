# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user&.profile == 'admin'
      # https://stackoverflow.com/questions/44497687/a-gem-cancan-access-denied-maincontroller-dashboard?answertab=votes#tab-top
      can :dashboard, :all
      can :access, :rails_admin
      can :read, :dashboard
      can :manage, User
      can :manage, Hospital
      can :manage, Employee
      can :manage, Career
      can :manage, Contract
      can :manage, ContractEffective
      can :manage, Job
      can :manage, JobEffective
      can :manage, Mark
      can :manage, Restriction
      can :read, Ahoy::Event
      # can :read, Ahoy::Visit
      # can :read, Job
      # can :update, Job
      # can :show, Job
      # can :export, Job
    end
  end
end