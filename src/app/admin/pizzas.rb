ActiveAdmin.register Pizza do
  # Decorator
  decorate_with PizzaDecorator

  # Strong parameters
  permit_params :name, :description, :code, :price

  # Breadcrumbs
  breadcrumb do
    [
      link_to('Admin', admin_root_path),
      link_to('Pizzas', admin_pizzas_path)
    ]
  end

  # Filters
  filter :name
  filter :code
  filter :price
  filter :created_at

  # Index page
  index do
    selectable_column
    id_column
    column :name
    column :code
    column :price do |c|
      c.price_formatted
    end
    column :created_at do |c|
      c.created_at_formatted
    end
    actions
  end

  # Show page
  show do
    attributes_table do
      row :name
      row :description
      row :code
      row :price do |r|
        r.price_formatted
      end
      row :created_at do |r|
        r.created_at_formatted
      end
    end
  end

  # Form
  form do |f|
    f.inputs "Pizza Details" do
      f.input :name
      f.input :description
      f.input :code
      f.input :price
    end
    f.actions
  end
end
