class Employee
  attr_accessor :boss
  attr_reader :name, :title, :salary

  def initialize(name, title, salary, boss = nil)
    @name = name
    @title = title
    @salary = salary
    @boss = boss


  end

  def calculate_bonus(multiplier)
    @salary * multiplier
  end

  def to_s
    @name
  end

end

class Manager < Employee
  attr_reader :supervises

  def initialize(name, title, salary, boss = nil)
    super
    @supervises = []
  end

  def add_worker(worker)
    @supervises << worker
    worker.boss = self
  end

  def calculate_bonus(multiplier)
    supervised_salary = 0
    @supervises.each do |worker|
      supervised_salary += worker.salary
      if worker.is_a?(Manager)
        supervised_salary += worker.calculate_bonus(1)
      end
    end

    supervised_salary * multiplier
  end


end

# don = Manager.new("Don", "CEO", 100)
#
# man = Manager.new("ed", "foreman", 10)
# guy = Employee.new("jon", "welder", 1)
#
#
# don.add_worker(man)
# man.add_worker(guy)
#
# p don.calculate_bonus(3)
# p man.calculate_bonus(2)
# p guy.calculate_bonus(10000)
