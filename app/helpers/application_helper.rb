module ApplicationHelper

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    current_user ? true : false
  end


   def ugly_lyrics(lyrics)
      formatted_lyrics = ""
      lyrics.lines.each do |line|
        formatted_lyrics << "&#9835; #{h(line)}"
      end

      "<pre>#{formatted_lyrics}</pre>".html_safe
   end

end
