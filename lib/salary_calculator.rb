class SalaryCalculator
  class UnknownModeError < StandardError ; end
  class WrongSalaryTypeError < StandardError ; end
  class NotABankError < StandardError ; end

  MODES = [:gross_salary, :net_salary].freeze

  def initialize(mode:, salary:)
    @salary = salary
    @mode = mode
  end

  def convert
    check
    if @mode == :gross_salary
      @salary.to_i / 2
    else
      @salary.to_i * 2
    end
  end

  private

  def check
    raise UnknownModeError unless MODES.include?(@mode)
    raise WrongSalaryTypeError if @salary.class != Integer && @salary.to_i == 0
    raise NotABankError if @salary.to_i < 0
  end
end
