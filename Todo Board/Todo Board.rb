class Item
    
    def self.valid_date?(date_string)
        dates = date_string.split('-')
        year = dates[0]
        month = dates[1]
        days = dates[2]
    return false if year.length != 4
    return false if  month.to_i > 12 || days.to_i > 31
    true
    end
    attr_reader :deadline, :done
    attr_accessor :title, :description
    def initialize(title, deadline, description)
        raise 'Wrong Date!' if !Item.valid_date?(deadline)
        @title = title
        @description = description
        @deadline = deadline
        @done = false
    end
    def deadline=(new_deadline)
        raise 'Wrong Date!' if !Item.valid_date?(deadline)
        @deadline = new_deadline
    end
    def toggle
        @done = !@done
    end

end

Item.new('Fix login page', '2019-10-25', 'The page loads too slow.')

Item.new(
    'Buy Cheese',
    '2019-10-21',
    'You require American, Swiss, Feta, and Mozzarella cheese for the Happy hour!'
)

Item.new(
    'Fix checkout page',
    '10-25-2019',
    'The font is too small.'
) # raises error due to invalid date