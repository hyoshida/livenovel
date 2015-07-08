# The MainController is responsible for showing the individual Todos and listing
# things like how many are checked.
module Main
  class MainController < Volt::ModelController
    model :store

    def index
      store.novels.first.then do |novel|
        store.novels << Novel.new if novel.nil?
      end
    end

    private

    # The main template contains a #template binding that shows another
    # template.  This is the path to that template.  It may change based
    # on the params._component, params._controller, and params._action values.
    def main_path
      "#{params._component || 'main'}/#{params._controller || 'main'}/#{params._action || 'index'}"
    end
  end
end
