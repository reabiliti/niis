# frozen_string_literal: true

class FilterProposalsQuery
  attr_reader :initial_scope, :params

  def initialize(initial_scope:, params:)
    @initial_scope = initial_scope
    @params = params
  end

  def call
    scoped = search(initial_scope, params[:search])
    scoped = sort(scoped, params[:sort_type], params[:sort_direction])
    paginate(scoped, params[:page])
  end

  private

  def search(scoped, query)
    return scoped unless query

    scoped.where('number LIKE ?', "%#{query}%")
  end

  def sort(scoped, sort_type, sort_direction)
    sort_type ||= :desc
    sort_direction ||= :created_at
    scoped.order(sort_direction&.to_sym => sort_type)
  end

  def paginate(scoped, page_number)
    page_number ||= 1
    scoped.page(page_number)
  end
end
