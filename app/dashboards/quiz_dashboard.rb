require "administrate/base_dashboard"

class QuizDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    organiser: Field::BelongsTo.with_options(class_name: "User"),
    # organiser: BelongsToScoped,
    id: Field::String.with_options(searchable: false),
    title: Field::String,
    organiser_id: Field::String.with_options(searchable: false),
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :organiser,
    :id,
    :title,
    # organiser_id: Field::String.with_options(searchable: false),
    # :organiser_id,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :organiser,
    :id,
    :title,
    :organiser_id,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :organiser,
    :title,
  ].freeze

  # Overwrite this method to customize how quizzes are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(quiz)
    "Quiz ##{quiz.id.slice(0,6)}"
  end
end
