class WithGameSummaries::SearchAndPaginate
  include Interactor

  def call
    q_param = params[:q] || default_params
    page = params[:page]
    per_page = params[:per_page]
    if q_param.has_key?(:per_page_eq)
      per_page = q_param.delete(:per_page_eq)
    end
    context.q = initial_scope.ransack q_param
    q.sorts = 'name asc' if q.sorts.empty?
    context.game_summaries = q.result(distinct: true).page(page).per(per_page)
  end

  def q
    context.q
  end

  def initial_scope
    context.initial_scope
  end

  def params
    context.params
  end

  def default_params
    context.default_params || {}
  end
end
