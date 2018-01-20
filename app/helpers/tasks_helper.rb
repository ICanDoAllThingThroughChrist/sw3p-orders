module TasksHelper
    def last_updated(task)
        task.updated_at.strftime("Last updated %A, %b %e, at %l:%M %p")
      end
end
