class ArticlePolicy < ApplicationPolicy
    attr_reader :user, :article
  
    def initialize(user, article)
      @user = user
      @article = article
    end
  
    def index?
        true
    end
    
    def show?
        true
    end

    def new?
        create?
    end

    def edit?
        update?
    end
    
    def update?
        user.admin? || !article.published
    end

    def create?
        user.admin?
    end

    def destroy?
        user.admin?
    end
    
    
    
end