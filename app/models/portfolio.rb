class Portfolio < ApplicationRecord
    validates_presence_of :title, :body

    scope :portfolio_items, -> { where(:subtitle => "React Js")}
    # Ex:- scope :active, -> {where(:active => true)}
end
