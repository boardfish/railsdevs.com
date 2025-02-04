module StripeHelper
  class BalanceTransaction
    attr_reader :id, :amount, :created, :description, :fee, :type

    def initialize(amount:, created:, description:, fee:, type:)
      @id = "ch_#{rand(1...10000)}"
      @amount = amount
      @created = created
      @description = description
      @fee = fee
      @type = type
    end
  end

  class Subscription
    attr_reader :items

    def initialize(amount:, cancelled: false)
      @cancel_at_period_end = cancelled ? Date.yesterday : nil
      @items = [SubscriptionItem.new(amount)]
    end

    def cancel_at_period_end?
      !!@cancel_at_period_end
    end
  end

  class SubscriptionItem
    attr_reader :price

    def initialize(amount)
      @price = Price.new(amount)
    end
  end

  class Price
    attr_reader :unit_amount

    def initialize(amount)
      @unit_amount = amount
    end
  end
end
