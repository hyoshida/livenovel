# The NewTodoController renders the part of the page responsible for showing
# the field where you add the todo.
module Main
  class NovelController < Volt::ModelController
    before_action only: [:new] do
      require_login('Login to post')
    end

    def index
    end

    def new
      self.model = store._novels.buffer
    end

    # Save the post
    def save
      model.save! do
        redirect_to '/'
      end.fail do |errors|
        flash._errors << errors.to_s
      end
    end
  end
end
