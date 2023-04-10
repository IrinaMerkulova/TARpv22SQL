

--- loome stored procedure, mis kuvab vaate
create procedure spGetEmployees
as begin
	select Name, Gender from Employees
end

spGetEmployees
exec spGetEmployees
execute spGetEmployees

--- küsib Gender ja DepartamentID ning kuvab andmed tabelist
create proc spGetEmployeesByGenderAndDepartment
@Gender nvarchar(20),
@DepartmentId int
as begin
	select Name, Gender, DepartmentId from Employees where Gender = @Gender
	and DepartmentId = @DepartmentId
end

--- kõik esimeses osakonnas meessoost töötavad isikud
spGetEmployeesByGenderAndDepartment 'Male', 1

spGetEmployeesByGenderAndDepartment @DepartmentId =  1, @Gender = 'Male'



--küsib gender ja arvutab töötajate arvu ID järgi
create proc spGetEmployeeCountByGender
@Gender nvarchar(20),
@EmployeeCount int output
as begin
	select @EmployeeCount = count(Id) from Employees where Gender = @Gender
end

-- protseduuri käivitamine, 
--Juhul kui töötajate arv=0 >> "is null"
--juhul kui ei võtdu null >> "is not null"
declare @TotalCount int
exec spGetEmployeeCountByGender 'Female', @TotalCount out
if(@TotalCount = 0)
	print '@TotalCount is null'
else
	print '@TotalCount is not null'
print @TotalCount

-- annab teada, palju on meessoost isikuid
declare @TotalCount int
exec spGetEmployeeCountByGender @EmployeeCount = @TotalCount out, @Gender = 'Male'
print @TotalCount
---arvutab töötajate arv ja annab nime @totalcount

create proc spTotalCount3
@TotalCount int output
as begin
	select @TotalCount = count(Id) from Employees
end
--- käivitame sp
declare @TotalEmployees int
execute spTotalCount3 @TotalEmployees output
select @TotalEmployees

--- küsib id, ja näitab Eesnimi ID järgi
create proc spGetNameById1
@Id int,
@Name nvarchar(50) output
as begin
	select @Name = Name from employees where Id = @Id
end

--proc käivitamine
declare @Name nvarchar(50)
execute spGetNameById1 6, @Name output
print 'Name of the employee = ' + @Name

-- küsib id, ja näitab Eesnimi ID järgi 
create proc spGetNameById2
@Id int
as begin
	 select Name from Employees where Id = @Id
end

-- proc käivitamine
declare @EmployeeName nvarchar(50)
exec @EmployeeName = spGetNameById2 1
print 'Name of the employee = ' + @EmployeeName

select * from Employees
