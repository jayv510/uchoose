module ApplicationHelper
  def default_url_options
    { host: ENV["HOST"] || "www.uchoose.live" }
  end
end
