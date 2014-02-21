# MAINTAINABLE CODE ON A LARGE PROJECT!!

# you shouldn't be able to use an object wrongly

# avoid mutability, especially to the outside world and to inputs. work with values
  def accrue_interest(loan, start_date, end_date)
    loan.accrued_interest = (loan.daily_interest_rate * loan.principal) * (start_date - end_date)
  end

  # becomes

  def interest_accrued_over(loan, start_date, end_date)
    (loan.daily_interest_rate * loan.principal) * (start_date - end_date)
  end
  loan.accrued_interest = interest_accrued_over loan, start_date, end_date

# tend towards primitives
  def interest_accrued_over(daily_interest_rate, principal, start_date, end_date)
    (daily_interest_rate * principal) * (start_date - end_date)
  end
  loan.accrued_interest = interest_accrued_over loan.daily_interest_rate,
                                                loan.principal,
                                                start_date,
                                                end_date
  interest_accrued_over 1.23, 500, start_date, end_date

# don't hide important details under abstractions
  # http://michaelfeathers.typepad.com/michael_feathers_blog/2013/11/unconditional-programming.html
  def pad ary, n
    pad_length = [0, n - ary.length].max
    ary + [0] * pad_length
  end

  def padded_take ary, n
    pad(ary, n).take(n)
  end

# an obvious place to start (when reading)
  # https://github.com/JoshCheek/seeing_is_believing/blob/master/lib/seeing_is_believing/binary/comment_formatter.rb
  # https://github.com/JoshCheek/seeing_is_believing/blob/master/spec/binary/comment_formatter_spec.rb
  class Something
    def initialize(input)
      self.input
    end

    def call # no inputs
      # ...
    end

    private

    # ...
  end

# explicit inputs
  # pass in everything you need to do the job, don't rely on the external context
  # makes debugging much easier
  # reduces the amount of state that you need to keep in your head
  # makes refactoring easier
  # easier to test
  def do_something(a, b)
    @c + ARGV.select { |arg| ... }
  end

  # becomes

  def do_something(argv, a, b, c)
    c + argv.select { |arg| ... }
  end

  # another example

  class SomethingController < ApplicationController
    def create
      # what can I even do in here?
    end
  end

# all dependencies point downwards (use dependency inversion if necessary)
  calculator = Calculator.new(self, @apr)
  # if our class is immutable, this isn't such a big deal
  # but we can't see how we change based on what this class does to us

  # also discourages knowledge coupling

# don't put methods onto models (Rails). really, just the ISP
  class PaymentsController < ApplicationController
    def create
      current_loan.add_payment params[:payment]
    end
  end

  # becomes

  class PaymentsController < ApplicationController
    def create
      Loan::AddPayment.new(current_loan, params[:payment]).call
    end
  end

  # or, if possible
  class PaymentsController < ApplicationController
    def create
      Loan::AddPayment.new(current_loan, params[:payment]).call.save
    end
  end

# don't hard-code assumptions, don't assume a current "always",
# leave room for new use cases
  class Loan
    before_create :notify_user_they_got_the_loan # do I really **ALWAYS** want to do this?
                                                 # even if there are regulations, don't assume "yes"
  end

# kick everything off explicitly
  class Loan
    before_create :notify_user_they_got_the_loan
  end

  # becomes

  class CreateLoan
    def call
      loan = Loan.new(loan_params)
      notify_user_they_got_the_loan if loan.save
    end
  end


# avoid modules (inheritance), choose composition instead
  class SomethingController < ApplicationController
    def create
      Rails.version                  # => "4.0.0"
      singleton_class.ancestors.size # => 63
      methods.size                   # => 336
    end
  end

# caller is responsible for formatting inputs
  def notify_user(user_or_id, message)
    user = user_or_id
    user = User.find user_or_id unless user.kind_of? User
    # ...
  end

  # becomes

  def notify_user(user, message)
    # ...
  end

# corey's thought: much of this is about having the meat of your system be
#   immutable (Gary's talk "imperative shell, functional core")

# fuck metaprogramming
# fuck dsls
# build yourself tools / take the time to make things better
