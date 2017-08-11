# BestBooksTDD-SSDT

A Visual Studio SSDT (SQL Server Data Tools) Sample to show how tSQLt is used to implement TDD (Test-Driven Development). 

![Screenshot](https://github.com/haroonashraf/BestBooksTDD-SSDT/blob/master/BestBooksTDD-SSDT-screenshot.png)

## Install

(1) Download the solution and Open in Visual Studio (2015).

(2) Change the connection strings and point them to your local SQL instance.

(3) Compile Solution to see if all works well.

(4) Debug Solution (F5) to run (already written) automated tests followed by deploying changes to debug databases.

## FAQ

What to do if my automated tSQLt unit tests do not run when I debug my solution?  

Please make sure that you have selected "Multiple startup projects" under Startup Project Properties in Solution settings as shown below:

![Screenshot](https://github.com/haroonashraf/BestBooksTDD-SSDT/blob/master/BestBooksTDD-SSDT-Setup.png)

## Contributing

If you'd like to contribute to this Project, please read the [contributing guidelines](./.github/CONTRIBUTING.md).

## License

[MIT License](./LICENSE)
