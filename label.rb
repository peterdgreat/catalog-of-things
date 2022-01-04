class Label
    attr_reader :id, :title, :color, :items
    def initialize  title, color
        @id = Random.rand(0..1000000)
        @title = title
        @color = color
        @items = []
    end

    def add_item item
        item.label = self;
        @items.push(item)
    end
end