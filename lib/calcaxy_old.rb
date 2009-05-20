
class CalcaxyOld

  File = ::File

  def initialize(app, path)
    @app = app
    @path = File.expand_path(path)
  end

  def call(env)
    status, header, response = @app.call(env)
    if status == 404
      file = File.join(@path, env['PATH_INFO'])
      if File.exists?(file)
        content = File.read(file)
        length = "".respond_to?(:bytesize) ? content.bytesize.to_s : content.size.to_s
        [503, {'Content-Type' => 'text/html', 'Content-Length' => length}, [content]]
      else
        [status, header, response]
      end
    else
      [status, header, response]
    end
  end
end