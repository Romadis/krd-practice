class FileManager

  def initialize(path, buffer)
    @path = path
    @buffer = buffer
  end

  def index
    File.foreach(@path){|i| puts i}
  end

  def where(name)
    res = []
    File.foreach(@path){|line| res<<line.strip if line.include?(name)}
    res
  end

  def find(id)
    res = -1
    File.foreach(@path).with_index{|line, index| res = line.strip if index==id}
    res
  end

  def update(id, text)
    buff = File.open(@buffer, "w")
    File.foreach(@path).with_index do |actor, index|
      buff.puts(id==index ? text : actor)
    end
    buff.close
    file = File.open(@path, "w")
    file.write(File.read(buff))
    file.close
    File.delete(@buffer) if File.exist?(@buffer)
  end

  def delete(id)
    buff = File.open(@buffer, "w")
    File.foreach(@path).with_index do |actor, index|
      buff.puts(actor) if id!=index
    end

    buff.close
    File.write(@path, File.read(buff))
    File.delete(@buffer) if File.exist?(@buffer)
  end

  def create(text)
    file = File.open(@path, "a")
    file.puts(text)
    file.close()
  end
end