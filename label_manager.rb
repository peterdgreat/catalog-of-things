class LabelManager
    def initialize
        @labels = []
    end

    def add_label label
        @labels.push(label)
    end

    def list_all_labels
        @labels.each_with_index do |l, i|
            puts " #{i}) ID: #{b.id} Title:  #{l.title} Color #{l.color}"
        end
    end
end