module ApplicationHelper

 def alert_class(type)
    {:error => "alert-error", :notice => "alert-success", :alert => "alert-info"}[type]
  end
end
