# frozen_string_literal: true

FactoryBot.define do
  factory :inventory do
    date_from { Date.new }
    exec_name { 'exec_name' }
    list_doc { 'list_doc' }
    list_page { 'list_page' }
    os_chief_name { 'os_chief_name' }
    proposal
  end
end
