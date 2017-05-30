require 'active_support'
require 'active_support/core_ext'
require 'erb'
require_relative './session'
require 'byebug'

class ControllerBase
  attr_reader :req, :res, :params

  # Setup the controller
  def initialize(req, res)
    @res = res
    @req = req
  end

  # Helper method to alias @already_built_response
  def already_built_response?
    !!@already_built_response
  end

  # Set the response status code and header
  def redirect_to(url)
    raise "can not render twice" if already_built_response?

    res.location = url
    res.status = 302
    session.store_session(res)
    @already_built_response = true
  end

  # Populate the response with content.
  # Set the response's content type to the given type.
  # Raise an error if the developer tries to double render.
  def render_content(content, content_type)
    raise "can not render twice" if already_built_response?
    #debugger
    res['Content-Type'] = content_type
    res.body = [content]
    session.store_session(res)
    @already_built_response = true
    #debugger
  end

  # use ERB and binding to evaluate templates
  # pass the rendered html to render_content
  def render(template_name)

    content = File.read("views/#{self.class.to_s.underscore}/#{template_name}.html.erb")
    # content = File.read("views\/(\D*)_controller\/#{template_name}.html.erb")

    content_erb = ERB.new(content).result(binding)
    #debugger
    render_content(content_erb, 'text/html')
  end

  # method exposing a `Session` object
  def session
    @session ||= Session.new(req)
  end

  # use this with the router to call action_name (:index, :show, :create...)
  def invoke_action(name)
  end
end
