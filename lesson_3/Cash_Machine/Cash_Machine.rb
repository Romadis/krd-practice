class Cash_Machine

    def initialize(flManager)
      @flManager = flManager
    end
  
    def deposite(sum)
      balance = @flManager.find(0).to_f
      @flManager.update(0, (balance+sum).to_s)
    end
  
    def withdraw(sum)
      balance = @flManager.find(0).to_f
      raise Exception.new "Sum is incorrcet" if sum<0 
      raise Exception.new "Sum is more than balance" if balance - sum < 0
      @flManager.update(0, (balance - sum).to_s)
    end
  
    def balance
      balance = @flManager.find(0)
      balance
    end
    
  end