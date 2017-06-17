class CreateUsers < ActiveRecord::Migration
  def change
    #t表示users表的对象,此时无需过多纠结t对象是如何对应到数据表的，抽象层的东西不必过多纠结
    create_table :users do |t|
      t.string :name
      t.string :email
      #timestamps是个特殊的方法，它会自动创建两个列，created_at updated_at
      t.timestamps null: false
    end
    #如果执行 db:migrate之后想撤销可以通过 db:rollback进行回退,但是有些操作比如
    #删除列这样的操作就不可以通过rollback自动回退了，需要手动编写回退方法，change方法
    # 也要写为 up,回退方法写为down
  end
end
