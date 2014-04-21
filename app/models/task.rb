class Task < ActiveRecord::Base

belongs_to :list

def self.completed
	where(completed: true)
end

def self.incomplete
	where(completed: [false, nil])
end

end
