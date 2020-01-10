# CI Admin Starter (CIAS) 2

### Description

CIAS2 is another version of CIAS, provides Login Authentication, User Management, Web Setting and User Profile build on CodeIgniter framework(version 3.1.10). You can add more modules as needed.

# Feature List
- Built with CodeIgniter 3.1.10
- HMVC architecture
- User registration
- User Login
- Login with email or username
- Password reset
- Avatar and logo upload
- E-Mail verification for new users
- Manage Users
- Invite new user for registration
- Restrict Public User Registration
- Manage User Types
- Manage permissions
- Assign permission to User Type
- Built using AdminLTE
- Bootstrap Responsive Theme
- Email Templates for Forgot Password, Invite users
- SMTP Email Setting
- Site Logo, Title, Favicon Change settings

# Installation
- Extract Source Code to htdocs
- Import db_cias2.sql to your database
- Configure file database.php 

# Default Login
- Administrator :
	email : admin@cias.com
	password : 1234
- Manager  :
	email :  manager@cias.com
	password : 1234
- Employee  :
	email : employee@cias.com
	password : 1234

# ISSUES
- Controller is not found --> enable mod_rewrite.dll (or mod_rewrite.so) by removing # in httpd.conf.
- Undefined function password_verify() --> change to hash function such as md5('string'), sha1('string')
