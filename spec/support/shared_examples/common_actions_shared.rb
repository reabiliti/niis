# frozen_string_literal: true

require 'rails_helper'

RSpec.shared_examples 'returns status success' do |template|
  it 'returns success status' do
    expect(response).to have_http_status(:success)
  end

  it 'renders template' do
    expect(response).to render_template template
  end
end

RSpec.shared_examples 'redirects to' do |namespace|
  it 'redirects to url' do
    expect(response).to have_http_status(:redirect)
    expect(response).to redirect_to(redirect_url(namespace))
  end
end

# options:
# :class - class record
RSpec.shared_examples 'get #index' do |options = {}|
  before { get :index }

  it_behaves_like 'returns status success', :index

  it 'assigns the objects' do
    expect(assigns(options[:class].name.downcase.pluralize))
      .to include(public_send(object_variable(options[:class])))
  end
end

# options:
# :param - if the record is not searched for by id, example: :slug
# :class - class record
RSpec.shared_examples 'get #show' do |options = {}|
  before { get :show, params: params(options) }

  it_behaves_like 'returns status success', :show

  it 'assigns the objects' do
    expect(assigns(object_variable(options[:class]))).to eq(public_send(object_variable(options[:class])))
  end
end

# options:
# :class - class record
# :parent - class parent
RSpec.shared_examples 'get #new' do |options = {}|
  before { get :new, params: params_parent(options) }

  it_behaves_like 'returns status success', :new

  it 'assigns the object' do
    expect(assigns(object_variable(options[:class]))).to be_a_new(options[:class])
  end
end

# options:
# :url - indicates if you want to redirect to some other URL than: model/id
# :class - class record
# :not_model - true if you do not need to redirect to a object
RSpec.shared_examples 'post #create' do |options = {}|
  context 'valid params' do
    it 'created new Object' do
      expect { post :create, params: { object_variable(options[:class]) => valid_params } }
        .to change(options[:class], :count).by(1)
    end

    it 'assigns a newly created object as @object' do
      post :create, params: { object_variable(options[:class]) => valid_params }
      expect(assigns(object_variable(options[:class]))).to be_a(options[:class])
      expect(assigns(object_variable(options[:class]))).to be_persisted
    end

    it 'redirects to the created object' do
      post :create, params: { object_variable(options[:class]) => valid_params }
      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to(url_show(options))
    end
  end

  context 'invalid_params' do
    context 'invalid attributes return http success' do
      before { post :create, params: { object_variable(options[:class]) => invalid_params } }

      it_behaves_like 'returns status success', :new

      it 'assigns a newly created but unsaved object as @object' do
        expect(assigns(object_variable(options[:class]))).to be_a_new(options[:class])
      end
    end

    it 'invalid_attributes do not create a object class' do
      expect { post :create, params: { object_variable(options[:class]) => invalid_params } }
        .not_to change(options[:class], :count)
    end
  end
end

# options:
# :class - class record
RSpec.shared_examples 'get #edit' do |options = {}|
  before { get :edit, params: params(options) }

  it_behaves_like 'returns status success', :edit

  it 'assigns the object' do
    expect(assigns(object_variable(options[:class]))).to eq(public_send(object_variable(options[:class])))
  end
end

# options:
# :url - indicates if you want to redirect to some other URL than: model/id
# :class - class record
RSpec.shared_examples 'put #update' do |options = {}|
  context 'valid params' do
    before do
      put :update, params: params(options).merge(object_variable(options[:class]) => valid_params)
    end

    it 'assings the object' do
      expect(assigns(object_variable(options[:class]))).to eq public_send(object_variable(options[:class]))
    end

    it 'returns http redirect' do
      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to(url_show(options))
    end
  end

  context 'invalid_params' do
    before do
      put :update, params: params(options).merge(object_variable(options[:class]) => invalid_params)
    end

    it_behaves_like 'returns status success', :edit
  end
end

# options:
# :url - indicates if you want to redirect to some other URL than: model/id
# :class - class record
RSpec.shared_examples 'delete #destroy' do |options = {}|
  before { get :show, params: params(options) }

  it 'destroy the requested select_options' do
    expect { delete :destroy, params: params(options) }
      .to change(options[:class], :count).by(-1)
  end

  it 'redirects to objects' do
    delete :destroy, params: params(options)
    expect(response).to redirect_to(url_index(options))
  end
end

def object_variable(object_class)
  object_class.name.underscore.to_sym
end

def url_show(options)
  object = options[:class].last unless options[:not_model]
  url = options[:url] || options[:class].name.underscore
  public_send("#{url}_path", object)
end

def url_index(options)
  url = options[:url] || options[:class].name.downcase.pluralize
  public_send("#{url}_path")
end

def redirect_url(namespace)
  public_send("#{namespace}_path")
end

def params(options)
  param = options[:param] || :id
  { param => public_send(object_variable(options[:class])).public_send(param) }
end

def params_parent(options)
  return {} unless options[:parent]

  { "#{options[:parent].name.underscore}_id".to_sym => public_send(object_variable(options[:parent])).id }
end
