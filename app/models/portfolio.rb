class Portfolio < ApplicationRecord
    validates_presence_of :title, :body

    # Also can implement Custom Scope using class method
    def self.react?
        where(subtitle: "React Js")
    end

    scope :portfolio_items, -> { where(:subtitle => "React Js")} # 2 way of creating custom scope
    # Ex:- scope :active, -> {where(:active => true)}

    after_initialize :set_defaults

    def set_defaults
      self.main_image ||= "http://placehold.it/600x400"
      self.thumb_image ||=  "http://placehold.it/350x200"
    end


end
