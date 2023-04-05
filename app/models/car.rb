class Car < ApplicationRecord
  enum state: [ :unknown, :free, :occupied ]
  enum level: [ :unrated, :econom, :comfort, :premium ]

  belongs_to :driver, optional: true
end
