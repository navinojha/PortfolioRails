class Portfolio < ApplicationRecord
    has_many :technologies
    accepts_nested_attributes_for :technologies, 
                                   reject_if: ->(attributes){ attributes['name'].blank? }, allow_destroy: true
    include Placeholder
    validates_presence_of :title, :body

    # Also can implement Custom Scope using class method
    def self.react?
        where(subtitle: "React Js")
    end

    scope :portfolio_items, -> { where(:subtitle => "Ruby on Rails")} # 2 way of creating custom scope
    # Ex:- scope :active, -> {where(:active => true)}

    after_initialize :set_defaults

    def set_defaults
      self.main_image ||= Placeholder.image_generator(height: '600', width: '400')
      self.thumb_image ||= Placeholder.image_generator(height: '350', width: '200')
    end

end
