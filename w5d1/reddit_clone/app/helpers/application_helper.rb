module ApplicationHelper

 def get_comments(comment)
   return comment.content if comment.child_comments.empty?
   html_string = "#{comment.content} <br>"
    comment.child_comments.each do |child|
        html_string += "<ul>∆ #{get_comments(child)}</ul>"
     end

     html_string.html_safe
  end

end
