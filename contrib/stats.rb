#!/usr/bin/env ruby

abort "usage: #{File.basename($0)} <file_glob>" if ARGV.first.nil?

Row = Struct.new(:file, :lines, :loc, :comments, :blanks) do
  def c2c
    1.0 * loc / comments
  end

  def c2c_str
    "%.2f" % c2c
  end
end

rows = Dir.glob(ARGV.shift).map do |f|
  lines = open(f).readlines.size
  comments = open(f).grep(/^\s*#/).size
  blanks = open(f).grep(/^\s*$/).size
  loc = lines - comments - blanks

  Row.new(f, lines, loc, comments, blanks)
end

totals = [
  rows.inject(0) {|sum,r| sum + r.loc },
  rows.inject(0) {|sum,r| sum + r.comments },
  rows.inject(0) {|sum,r| sum + r.blanks },
  rows.inject(0) {|sum,r| sum + r.lines },
  "%.2f" % (rows.inject(0) {|sum,r| sum + r.c2c } * 1.0 / rows.size)
]

format = "%8s %8s %8s %8s %12s    %s\n"
headings = %w{LOC COMMENTS BLANK LINES CODE:COMMENT}.map { |h| h.rjust(8) }

puts "## Production Code Stats"
printf(format, *headings, "FILE")
rows.each do |r|
  printf(format, r.loc, r.comments, r.blanks, r.lines, r.c2c_str, r.file)
end
printf(format, *totals, "TOTAL")
