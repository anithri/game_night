module GamingGroupsHelper

  def visibility_icon_for(gaming_group)
    new_icon, new_label = case gaming_group.shared_with.to_s
    when 'private_group'
      ['lock', 'danger']
    when 'summarized_group'
      ['unlock', 'warning']
    when 'public_group'
      ['unlock', 'success']
    end

    content_tag :span, class: "label label-#{new_label} pull-right" do
      icon(new_icon)
    end
  end
end
