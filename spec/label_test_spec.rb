require './label'

describe Label do
  context 'testing Label class' do
    label = Label.new(id: nil, title: 'Gift', color: 'Red')

    it 'should return Gift as a label title' do
      expect(label.title).to eq 'Gift'
    end

    it 'should return Red as a label color' do
      expect(label.color).to eq 'Red'
    end

    it 'should return 1 as item length' do
      i = Item.new(id: nil, publish_date: '2020-1-1')
      label.add_item i
      expect(label.items.length).to eq 1
    end
  end
end
