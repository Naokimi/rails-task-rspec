require 'rails_helper'

RSpec.describe Task, type: :model do
  let(:task) { Task.new(title: 'Title', description: 'Once upon a time I had to invent a description') }

  describe '#initialize' do
    it 'is valid with all columns present' do
      expect(task.valid?).to eq(true)
    end

    context 'with missing title' do
      before do
        task.title = nil
      end

      it 'is not valid' do
        expect(task.valid?).to eq(false)
      end

      it 'returns error message' do
        task.valid?
        expect(task.errors.messages).to eq({ title: ["can't be blank"] })
      end
    end

    context 'with missing title' do
      before do
        task.description = nil
      end

      it 'is not valid' do
        expect(task.valid?).to eq(false)
      end

      it 'returns error message' do
        task.valid?
        expect(task.errors.messages).to eq({ description: ["can't be blank"] })
      end
    end
  end

  describe '#truncated_description' do
    context 'with long description' do
      it 'returns truncated description' do
        expect(task.truncated_description).to eq('Once upon a...')
      end
    end

    context 'with short description' do
      before do
        task.description = 'Hello'
      end

      it 'returns the original description' do
        expect(task.truncated_description).to eq(task.description)
      end
    end
  end
end
