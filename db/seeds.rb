# company seeds

kpmg       = Company.create! :name     => "KPMG"

pwc        = Company.create! :name     => "PWC"

# user seeds

accountant   = User.create!( :email    => "accountant@kpmg.com",
                             :password => "password",
                             :company  =>  kpmg )
manager      = User.create!( :email    => "manager@kpmg.com",
                             :password => "password",
                             :company  =>  kpmg  )
eavesdropper = User.create!( :email    => "eavesdropper@pwc.com",
                             :password => "password",
                             :company  =>  pwc  )