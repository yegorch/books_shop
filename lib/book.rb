class Book < Product
  attr_accessor :title, :genre, :director

  def self.from_file(file_path)
    lines = File.readlines(file_path, encoding: 'UTF-8').map { |l| l.chomp }

    self.new(
      title: lines[0],
      genre: lines[1],
      director: lines[2],
      price: lines[3].to_i,
      amount: lines[4].to_i
    )
  end

  def initialize(params)
    super

    @title = params[:title]
    @genre = params[:genre]
    @director = params[:director]
  end

  def to_s
    "Книга «#{@title}», #{@genre}, автор — #{@director}, #{super}"
  end

  def update(params)
    super

    @title = params[:title] if params[:title]
    @genre = params[:genre] if params[:genre]
    @director = params[:director] if params[:director]
  end
end
