ActiveAdmin.register Post do
  permit_params :category_id, :title, :body, :user_id
  # index do
  #   # selectable_column
  #   # id_column
  #   # column :title
  #   # actions
  # end
end
