
import pkg_resources
installed_packages = dict([(package.project_name, package.version)
                           for package in pkg_resources.working_set])
#print(installed_packages)


for key, value in installed_packages.iteritems() :
    print(key)
