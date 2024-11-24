# frozen_string_literal: true

class TodoListCardComponent < ViewComponent::Base
  with_collection_parameter :todo_list

  def initialize(todo_list)
    @todo_list = todo_list[:todo_list] || todo_list
  end
end
