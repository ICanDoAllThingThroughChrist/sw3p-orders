module TasksHelper
    def last_updated(task)
        task.updated_at.strftime("Last updated %A, %b %e, at %l:%M %p")
    end
    def user_id_field(task)
        if task.user.nil?
          select_tag "task[user_id]", options_from_collection_for_select(User.all, :id, :name)
        else
          hidden_field_tag "task[user_id]", task.user_id
        end
      end
end
