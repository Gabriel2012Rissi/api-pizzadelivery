ActiveAdmin.register Customer do
  decorate_with CustomerDecorator

  permit_params :first_name, :last_name, :phone, :address

  # Breadcrumbs
  breadcrumb do
    [
      link_to('Admin', admin_root_path),
      link_to('Customers', admin_customers_path)
    ]
  end

  # Filters
  filter :first_name
  filter :last_name
  filter :phone
  filter :address
  filter :created_at

  # Index page
  index do
    selectable_column
    id_column
    column :name, sortable: :first_name do |c|
      c.full_name
    end
    column :phone do |c|
      c.phone_formatted
    end
    column :address
    column :created_at do |c|
      c.created_at_formatted
    end
    actions
  end

  # Show page
  show do
    attributes_table do
      row :id
      row :name do |r|
        r.full_name
      end
      row :phone do |r|
        r.phone_formatted
      end
      row :address
      row :created_at do |r|
        r.created_at_formatted
      end
    end
  end

  # Form
  form decorate: true do |f|
    f.inputs "Customer Details" do
      f.input :first_name
      f.input :last_name
      f.input :phone
      f.input :address
    end
    f.actions
  end
end
