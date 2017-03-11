require "administrate/base_dashboard"

class DonationDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    member: Field::BelongsTo,
    id: Field::Number,
    amount: Field::Number,
    plan: Field::String,
    comment: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    status: Field::String,
    recipient_id: Field::Number,
    pay_status: Field::String,
    payment_text: Field::String,
    pop: Field::String,
    matchtime: Field::DateTime,
    blocktime: Field::DateTime,
    withdrawal_id: Field::Number,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :member,
    :id,
    :amount,
    :plan,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :member,
    :id,
    :amount,
    :plan,
    :comment,
    :created_at,
    :updated_at,
    :status,
    :recipient_id,
    :pay_status,
    :payment_text,
    :pop,
    :matchtime,
    :blocktime,
    :withdrawal_id,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :member,
    :amount,
    :plan,
    :comment,
    :status,
    :recipient_id,
    :pay_status,
    :payment_text,
    :pop,
    :matchtime,
    :blocktime,
    :withdrawal_id,
  ].freeze

  # Overwrite this method to customize how donations are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(donation)
  #   "Donation ##{donation.id}"
  # end
end
