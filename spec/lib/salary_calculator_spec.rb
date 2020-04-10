require 'rails_helper'
require './lib/salary_calculator.rb'

RSpec.describe SalaryCalculator do
  context 'when gross salary mode is active' do
    it 'returns the net salary' do
      # setup
      calculator = SalaryCalculator.new(mode: :gross_salary, salary: 9000)

      # exercise
      net_salary = calculator.convert

      # verify
      expect(net_salary).to eq(4500)

      #teardown
    end

    it 'returns the net salary' do
      # setup
      calculator = SalaryCalculator.new(mode: :gross_salary, salary: 6000)

      # exercise
      net_salary = calculator.convert

      # verify
      expect(net_salary).to eq(3000)

      #teardown
    end
  end

  context 'when net salary mode is active' do
    it 'returns the gross salary' do
      # setup
      calculator = SalaryCalculator.new(mode: :net_salary, salary: 3000)

      # exercise
      net_salary = calculator.convert

      # verify
      expect(net_salary).to eq(6000)

      #teardown
    end
  end

  context 'when net salary mode doesn\'t exist' do
    it 'raise error' do
      # setup
      calculator = SalaryCalculator.new(mode: :fake_mode, salary: 3000)

      expect{calculator.convert}.to raise_error(SalaryCalculator::UnknownModeError)

      #teardown
    end
  end

  context 'when net salary is negative' do
    it 'raise error' do
      # setup
      calculator = SalaryCalculator.new(mode: :gross_salary, salary: -3000)

      expect{calculator.convert}.to raise_error(SalaryCalculator::NotABankError)
      #teardown
    end
  end

  context 'when net salary is a string' do
    it 'returns the gross salary' do
      # setup
      calculator = SalaryCalculator.new(mode: :net_salary, salary: '3000')

      # exercise
      net_salary = calculator.convert

      # verify
      expect(net_salary).to eq(6000)
    end

    it 'raise error' do
      # setup
      calculator = SalaryCalculator.new(mode: :net_salary, salary: 'mille')

      expect{calculator.convert}.to raise_error(SalaryCalculator::WrongSalaryTypeError)
    end
  end
end
