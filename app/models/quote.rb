class Quote < ApplicationRecord
    validates :name, presence: true
    scope :ordered, -> { order(id: :desc) }

                            # when a new quote is created,
                            # broadcasts the HTML of new quotes
                            # to the "quotes" stream asynchronously:

    # after_create_commit ->  { broadcast_prepend_later_to "quotes" }

                            # implied by Rails conventions:
                            # partial: "quotes/quote",
                            # locals: { quote: self },
                            # target: "quotes"

                            # target prepends to the DOM node
                            # with the id of "quotes"

    # for edits and destruction:
    # after_update_commit ->  { broadcast_replace_later_to "quotes" }
    # after_destroy_commit -> { broadcast_remove_to "quotes" }

    # all of the above code can be distilled to this one line:
    broadcasts_to ->(quote) { "quotes" }, inserts_by: :prepend
    # :O
end
