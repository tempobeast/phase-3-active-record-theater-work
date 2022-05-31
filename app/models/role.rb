class Role < ActiveRecord::Base
    has_many :auditions

    def actors
        self.auditions.collect(&:actor)
    end

    def locations
        self.auditions.collect(&:location)
    end

    def lead
        if self.auditions.where(hired: true)
            self.auditions.where(hired: true)
        else
            "no actor has been hired for this role"
        end
    end

end