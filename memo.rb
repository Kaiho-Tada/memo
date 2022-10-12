require "csv"

puts "1(新規でメモを作成) 2(既存のメモを編集する)"

memo_type = gets.to_i
p "選択:#{memo_type}"
if memo_type == 1
    puts "新規でメモを作成します。拡張子を除いたファイル名を入力してください"
    file_name = gets.chomp
    puts "メモの内容を記入してください。"
    puts "完了したらCtrl + Dを押します"
    input_memo = STDIN.read
    memo = input_memo.chomp
    
    CSV.open("#{file_name}.csv", "w") do |csv|
        csv << ["#{memo}"]
    end
elsif memo_type == 2
    puts "編集するメモのファイル名を拡張子を除いて入力してください"
    edit_file_name = gets.chomp
    puts "メモの内容を編集してください"
    puts "完了したらCtrl + Dを押します"
    edit_input_memo = STDIN.read
    edit_memo = edit_input_memo.chomp
    CSV.open("#{edit_file_name}.csv", "w") do |csv|
        csv << ["#{edit_memo}"]
    end
else
    puts "1か2の数字を入力してください"
end