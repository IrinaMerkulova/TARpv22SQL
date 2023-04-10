

--- loome stored procedure, mis kuvab vaate
create procedure spGetEmployees
as begin
	select FirstName, Gender from Employees
end
---protseduuri kaivitamine
spGetEmployees
exec spGetEmployees
execute spGetEmployees

--- kusib gender and departamenID ning kuvab andmed tabelist
create proc spGetEmployeesByGenderAndDepartment
@Gender nvarchar(20),
@DepartmentId int
as begin
	select FirstName, Gender, DepartmentId from Employees where Gender = @Gender
	and DepartmentId = @DepartmentId
end

--- kõik esimeses osakonnas meessoost töötavad isikud
spGetEmployeesByGenderAndDepartment 'Male', 1

spGetEmployeesByGenderAndDepartment @DepartmentId =  1, @Gender = 'Male'



--kusib gender eja arvutab tootajate arvu id jarg
create proc spGetEmployeeCountByGender
@Gender nvarchar(20),
@EmployeeCount int output
as begin
	select @EmployeeCount = count(Id) from Employees where Gender = @Gender
end

-- protseduurikaivitamine
--- juhul kui totajaj arv = 0 >> is null
--- juhul kui ei 0 >> is not null
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


--- arvutab tõõtajate arv ja annab nime @totalcount
create proc spTotalCount2
@TotalCount int output
as begin
	select @TotalCount = count(Id) from Employees
end
--- käivitame sp
declare @TotalEmployees int
execute spTotalCount2 @TotalEmployees output
select @TotalEmployees


--- kusib id ja naita eesnimi
create proc spGetNameById1
@Id int,
@FirstName nvarchar(50) output
as begin
	select @FirstName = FirstName from employees where Id = @Id
end

--?
declare @FirstName nvarchar(50)
execute spGetNameById1 6, @FirstName output
print 'Name of the employee = ' + @FirstName

--kusib id ja naita eesnimi
create proc spGetNameById3
@Id int
as begin
	select FirstName from Employees where Id = @Id
end

-- ?
declare @EmployeeName nvarchar(50)
exec @EmployeeName = spGetNameById3 1
print 'Name of the employee = ' + @EmployeeName

select * from Employees
