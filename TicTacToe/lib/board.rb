class Board
  attr_accessor :format

  def initialize(rows, cols)
    @format = Array.new(rows) { Array.new(cols, "B")}
  end

  public
    def display
      format.each do |rows|
        rows.each { |cols| print "#{cols} " }
        puts ""
      end
    end

    def update(row, col, player)
      return format[row][col] = player.symbol
    end

    def winner?
      lines = []
      lines += format
      lines += format.transpose

      lines << format.each_index.map { |i| format[i][i] }
      lines << format.each_index.map { |i| format[i][format.length - 1 - i] }

      lines.each do |line|
        return line[0] if line.all? { |cell| cell == line[0] && cell != "B" }
      end

      nil
    end
end
