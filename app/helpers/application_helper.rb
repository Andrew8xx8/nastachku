module ApplicationHelper
  include AuthHelper
  include CustomUrlHelper

  def navbar_link(label, path, options = {})
    patch = options[:with]

    if patch
      label << " ("
      label << patch.to_s
      label << ")"
    end

    link_to label, path
  end
end
