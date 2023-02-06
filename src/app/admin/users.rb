ActiveAdmin.register AdminUser do
  decorate_with AdminUserDecorator
  # Strong parameters
  permit_params :email, :password, :password_confirmation

  # Breadcrumbs
  breadcrumb do
    [
      link_to('Admin', admin_root_path),
      link_to('Admin Users', admin_admin_users_path)
    ]
  end

  # Filters
  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  # Index page
  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at do |c|
      c.created_at_formatted
    end
    actions
  end

  # Show page
  show do
    attributes_table do
      row :email
      row :current_sign_in_at
      row :sign_in_count
      row :created_at do |c|
        c.created_at_formatted
      end
      row :updated_at do |c|
        c.updated_at_formatted
      end
    end
  end

  # Form
  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end
