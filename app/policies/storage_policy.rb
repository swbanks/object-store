class StoragePolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def create?
    user.present?
  end

  def index?
    user.present?
  end

  def show?
    user.present?
  end

  def destroy?
    user.present?
  end

  def search?
    user.present?
  end
end