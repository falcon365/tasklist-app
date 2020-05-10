class Task < ApplicationRecord
    belongs_to :user
    validates :content, presence: true, length: { maximum: 255}
    validates :status, presence: true, length: { maximum: 10}
 
 
    def index
     if logged_in?
      @task = current_user.tasks.build  # form_with 用
      @tasks = current_user.tasks.order(id: :desc).page(params[:page])
     end
    end  
end
