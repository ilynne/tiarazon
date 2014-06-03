class Account < ActiveRecord::Base
  self.table_name = "plutus_accounts"
  # has_many :credit_amounts, :extend => AmountsExtension, :class_name => 'Plutus::CreditAmount'
  # has_many :debit_amounts, :extend => AmountsExtension, :class_name => 'Plutus::DebitAmount'
  has_many :credit_entries, :through => :credit_amounts, :source => :entry, :class_name => 'Plutus::Entry'
  has_many :debit_entries, :through => :debit_amounts, :source => :entry, :class_name => 'Plutus::Entry'

  validates_presence_of :type, :name
  validates_uniqueness_of :name

  # The credit balance for the account.
  #
  # @example
  #   >> asset.credits_balance
  #   => #<BigDecimal:103259bb8,'0.1E4',4(12)>
  #
  # @return [BigDecimal] The decimal value credit balance
  def credits_balance
    credit_amounts.balance
  end

  # The debit balance for the account.
  #
  # @example
  #   >> asset.debits_balance
  #   => #<BigDecimal:103259bb8,'0.3E4',4(12)>
  #
  # @return [BigDecimal] The decimal value credit balance
  def debits_balance
    debit_amounts.balance
  end

  # The trial balance of all accounts in the system. This should always equal zero,
  # otherwise there is an error in the system.
  #
  # @example
  #   >> Account.trial_balance.to_i
  #   => 0
  #
  # @return [BigDecimal] The decimal value balance of all accounts
  def self.trial_balance
    unless self.new.class == Account
      raise(NoMethodError, "undefined method 'trial_balance'")
    else
      Asset.balance - (Liability.balance + Equity.balance + Revenue.balance - Expense.balance)
    end
  end

end
