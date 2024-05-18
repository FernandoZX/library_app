class BookPolicy < ApplicationPolicy
  # NOTE: Up to Pundit v2.3.1, the inheritance was declared as
  # `Scope < Scope` rather than `Scope < ApplicationPolicy::Scope`.
  # In most cases the behavior will be identical, but if updating existing
  # code, beware of possible changes to the ancestors:
  # https://gist.github.com/Burgestrand/4b4bc22f31c8a95c425fc0e30d7ef1f5

  class Scope < ApplicationPolicy::Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end

    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      if user.has_role?(:librarian, Book)
        scope.all
      else
        scope.where(published: true)
      end
    end

    private

    attr_reader :user, :scope
  end
end
