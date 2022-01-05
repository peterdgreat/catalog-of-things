require './label'

class LabelsManager
  def initialize
    labels = File.read('./data/labels.json')
    @labels = labels == '' ? [] : convert_hashs_to_labels(JSON.parse(labels))
  end

  def add_label
    puts 'Enter Title'
    title = gets.chomp
    puts 'Enter Color'
    color = gets.chomp
    label = Label.new(title, color)
    @labels.push(label)
    save_labels
  end

  def save_labels
    hash_arr = []
    @labels.each do |l|
      hash = { title: l.title, color: l.color, id: l.id }
      hash_arr.push(hash)
    end
    json = JSON.generate(hash_arr)
    File.write('./data/labels.json', json)
  end

  def list_all_labels
    @labels.each_with_index do |l, i|
      puts " #{i}) ID: #{l.id}, Title:  #{l.title}, Color #{l.color}"
    end
  end

  private

  def convert_hashs_to_labels(hashes)
    labels = []
    hashes.each do |h|
      l = Label.new(h['title'], h['color'], h['id'])
      labels << l
    end
    labels
  end
end
