class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def index?
    true
  end

  def new?
    true
  end

  def edit?
    user.booking_ids.include?(record.id) ? true : false
  end

  def create?
    record.user == user ? true : false
  end
  
  def destroy?
    record.user == user ? true : false
  end

end
