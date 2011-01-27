module ApplicationHelper
  
  # Return a title on a per-page basis.
  def global_title
    base_title = "Brandon Hire: Order Drinks"
    @title ? base_title + " | " + @title : base_title
  end
  
  # Return a body id on a per-page basis.
  def body_id
    @title ? @title.downcase : nil
  end
  
end
