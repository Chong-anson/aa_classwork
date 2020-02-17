require 'byebug'
require 'active_support'
require 'active_support/core_ext'
require 'erb'
require_relative './session'

class ControllerBase
  attr_reader :req, :res, :params

  # Setup the controller
  def initialize(req, res, routes_params={})
    @req = req
    @res = res
    # debugger
    @params = req.params
    routes_params.each do | k,v | 
      @params[k] = v
    end 

  end

  # Helper method to alias @already_built_response
  def already_built_response?
    @already_built_response
  end

  # Set the response status code and header
  def redirect_to(url)
    if already_built_response?
      raise "DoubleRenderError" 
    else 
      @res.status = 302 
      # @res.set_header('Content-Type', content_type)
      @res.set_header('location', url)
      # @res.write(content) 
      session.store_session(res)
      # debugger
      @already_built_response = true 
      # debugger
    end 
  end

  # Populate the response with content.
  # Set the response's content type to the given type.
  # Raise an error if the developer tries to double render.
  def render_content(content, content_type="text/html")
    if already_built_response?
      raise "DoubleRenderError" 
    else 
      @res['Content-Type'] = content_type
      @res.write(content) 
      session.store_session(res)
      @already_built_response = true 
      
    end 
    
  end

  # use ERB and binding to evaluate templates
  # pass the rendered html to render_content
  def render(template_name)
    if already_built_response? 
      raise "DoubleRenderError"
    else 
      controller_name = self.class.to_s.underscore 
      dir = File.join("views",controller_name, "#{template_name}.html.erb")
      # debugger
      content = File.read(dir).split("\n")
      content.map! do | statement | 
        start_point = /<%/ =~ statement
        # debugger
        if start_point.nil? 
          statement
        else 
          front_part = statement[0...start_point]
          # returning =  
          # start_point += statement[start_point+2] == "=" ? 2 : 1
          end_point = /%>/ =~ statement 
          end_point += 1
          rear_part = statement[end_point+2..-1]
          front_part.to_s + ERB.new(statement[start_point..end_point]).result(binding) + rear_part.to_s
        end 
      end 
      render_content(content)
    end 
  end

  # method exposing a `Session` object
  def session
    @session ||= Session.new(req)
  end

  # use this with the router to call action_name (:index, :show, :create...)
  def invoke_action(name)
    # debugger
    self.send(name)
    render(name.to_s) unless already_built_response?
  end
end

