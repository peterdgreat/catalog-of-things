class Label
    attr_reader :id, :title, :color, :items
    def initialize   id = 0, title, color
        @id = id == 0 ? Random.rand(1..1000000) : id
        @title = title
        @color = color
        @items = []
    end

    def add_item item
        item.label = self;
        @items.push(item)
    end
end