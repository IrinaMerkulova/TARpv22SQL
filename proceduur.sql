

--- loome stored procedure, mis kuvab vaate
create procedure spGetEmployees
as begin
	select Name, Gender from Employees
end

-- protseduuri käivitamine
spGetEmployees
exec spGetEmployees
execute spGetEmployees

--- küsib Gender ja DepartmentId ning kuvab andmed tabelist
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



--küsib Gender ja arvutab töötajate arvu ID järgi
create proc spGetEmployeeCountByGender
@Gender nvarchar(20),
@EmployeeCount int output
as begin
	select @EmployeeCount = count(Id) from Employees where Gender = @Gender
end

-- protseduuri käivitamine
-- juhul kui töötajate arv=0 >> "is null"
-- juhul kui ei võrdu null >> "is not null"
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

---arvutab töötajate arv ja annab nime @TotalCount
create proc spTotalCount2
@TotalCount int output
as begin
	select @TotalCount = count(Id) from Employees
end
--- käivitame sp
declare @TotalEmployees int
execute spTotalCount2 @TotalEmployees output
select @TotalEmployees

--- küsib Id ja näitab Eesnimi ID järgi
create proc spGetNameById1
@Id int,
@FirstName nvarchar(50) output
as begin
	select @FirstName = Name from employees where Id = @Id
end

-- proc käivitamine
declare @FirstName nvarchar(50)
execute spGetNameById1 6, @FirstName output
print 'Name of the employee = ' + @FirstName

-- küsib Id ja näitab Eesnimi ID järgi
create proc spGetNameById3
@Id int
as begin
	select FirstName from Employees where Id = @Id
end

-- proc käivitamine
declare @EmployeeName nvarchar(50)
exec @EmployeeName = spGetNameById3 1
print 'Name of the employee = ' + @EmployeeName

select * from Employees
