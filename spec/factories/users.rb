FactoryBot.define do
    factory :user do
        email { "accountant@kpmg.com"}
        company { Company.create(name: "KPMG" ) }
        password { "password" }
    end
end