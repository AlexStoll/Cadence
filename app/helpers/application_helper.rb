module ApplicationHelper
  def full_title(page_title = '')                     # Method def, optional arg
    base_title = "Cadence"  # Variable assignment
    if page_title.empty?                              # Boolean test
      base_title                                      # Implicit return
    else
      page_title + " | " + base_title                 # String concatenation
    end
  end
end
