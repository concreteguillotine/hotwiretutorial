FactoryBot.define do
    factory :quote do
        name { "Example quote" }
        company { Company.create(name: "KPMG" ) }
    end
end