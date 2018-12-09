class ProfitLoss < ApplicationRecord
  def revenue_total
    revenue_tot =
      january +
      february +
      march +
      april +
      may +
      june +
      july +
      august +
      september +
      october +
      november +
      december
    revenue_tot
  end
end
