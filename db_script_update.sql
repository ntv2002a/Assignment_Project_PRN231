USE [master]
GO
/****** Object:  Database [PRN231_OnlineLearning]    Script Date: 3/19/2024 1:11:01 AM ******/
CREATE DATABASE [PRN231_OnlineLearning]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PRN231_OnlineLearning', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PRN231_OnlineLearning.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PRN231_OnlineLearning_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PRN231_OnlineLearning_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PRN231_OnlineLearning] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PRN231_OnlineLearning].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PRN231_OnlineLearning] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PRN231_OnlineLearning] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PRN231_OnlineLearning] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PRN231_OnlineLearning] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PRN231_OnlineLearning] SET ARITHABORT OFF 
GO
ALTER DATABASE [PRN231_OnlineLearning] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PRN231_OnlineLearning] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PRN231_OnlineLearning] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PRN231_OnlineLearning] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PRN231_OnlineLearning] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PRN231_OnlineLearning] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PRN231_OnlineLearning] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PRN231_OnlineLearning] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PRN231_OnlineLearning] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PRN231_OnlineLearning] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PRN231_OnlineLearning] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PRN231_OnlineLearning] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PRN231_OnlineLearning] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PRN231_OnlineLearning] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PRN231_OnlineLearning] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PRN231_OnlineLearning] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PRN231_OnlineLearning] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PRN231_OnlineLearning] SET RECOVERY FULL 
GO
ALTER DATABASE [PRN231_OnlineLearning] SET  MULTI_USER 
GO
ALTER DATABASE [PRN231_OnlineLearning] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PRN231_OnlineLearning] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PRN231_OnlineLearning] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PRN231_OnlineLearning] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PRN231_OnlineLearning] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PRN231_OnlineLearning] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PRN231_OnlineLearning', N'ON'
GO
ALTER DATABASE [PRN231_OnlineLearning] SET QUERY_STORE = OFF
GO
USE [PRN231_OnlineLearning]
GO
/****** Object:  User [vunt]    Script Date: 3/19/2024 1:11:01 AM ******/
CREATE USER [vunt] FOR LOGIN [vunt] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 3/19/2024 1:11:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [nvarchar](max) NOT NULL,
	[description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 3/19/2024 1:11:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[course_id] [int] IDENTITY(1,1) NOT NULL,
	[course_name] [nvarchar](max) NOT NULL,
	[category_id] [int] NOT NULL,
	[expert_id] [int] NOT NULL,
	[image] [nvarchar](max) NULL,
	[status] [bit] NOT NULL,
	[description] [nvarchar](max) NULL,
	[create_at] [datetime] NULL,
	[update_at] [datetime] NULL,
	[price] [decimal](18, 2) NULL,
	[sale_percent] [decimal](3, 2) NULL,
	[duration] [int] NOT NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[course_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Enrollments]    Script Date: 3/19/2024 1:11:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enrollments](
	[enrollments_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[course_id] [int] NOT NULL,
	[is_archived] [bit] NOT NULL,
	[join_at] [datetime] NOT NULL,
	[end_at] [datetime] NOT NULL,
 CONSTRAINT [PK_Enrollments] PRIMARY KEY CLUSTERED 
(
	[enrollments_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lessons]    Script Date: 3/19/2024 1:11:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lessons](
	[lesson_id] [int] IDENTITY(1,1) NOT NULL,
	[course_id] [int] NOT NULL,
	[lesson_name] [nvarchar](max) NULL,
	[lesson_content] [nvarchar](max) NULL,
	[video_url] [nvarchar](max) NULL,
	[lesson_order] [int] NOT NULL,
 CONSTRAINT [PK_Lessons] PRIMARY KEY CLUSTERED 
(
	[lesson_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Questions]    Script Date: 3/19/2024 1:11:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Questions](
	[question_id] [int] IDENTITY(1,1) NOT NULL,
	[quiz_id] [int] NOT NULL,
	[question_content] [nvarchar](max) NULL,
	[options] [nvarchar](max) NOT NULL,
	[correct_answer] [int] NOT NULL,
	[question_level] [bit] NOT NULL,
 CONSTRAINT [PK_Questions] PRIMARY KEY CLUSTERED 
(
	[question_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quiz]    Script Date: 3/19/2024 1:11:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quiz](
	[quiz_id] [int] IDENTITY(1,1) NOT NULL,
	[course_id] [int] NOT NULL,
	[quiz_name] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[time_limit] [int] NOT NULL,
 CONSTRAINT [PK_Quiz] PRIMARY KEY CLUSTERED 
(
	[quiz_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 3/19/2024 1:11:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[role_id] [int] IDENTITY(1,1) NOT NULL,
	[role_name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tokens]    Script Date: 3/19/2024 1:11:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tokens](
	[token_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[token_string] [nvarchar](max) NOT NULL,
	[expired_date] [datetime] NOT NULL,
 CONSTRAINT [PK_Tokens] PRIMARY KEY CLUSTERED 
(
	[token_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Results]    Script Date: 3/19/2024 1:11:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Results](
	[result_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[quiz_id] [int] NOT NULL,
	[score] [decimal](3, 2) NOT NULL,
	[result_date] [datetime] NOT NULL,
 CONSTRAINT [PK_User_Results] PRIMARY KEY CLUSTERED 
(
	[result_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 3/19/2024 1:11:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[user_name] [nvarchar](max) NULL,
	[email] [nvarchar](max) NOT NULL,
	[password] [nvarchar](max) NOT NULL,
	[phone] [nvarchar](max) NULL,
	[address] [nvarchar](max) NULL,
	[country] [nvarchar](max) NULL,
	[gender] [bit] NULL,
	[image] [nvarchar](max) NULL,
	[account_balance] [decimal](18, 3) NULL,
	[status] [bit] NOT NULL,
	[create_at] [datetime] NULL,
	[last_update] [datetime] NULL,
	[role_id] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_Courses_Categories] FOREIGN KEY([category_id])
REFERENCES [dbo].[Categories] ([category_id])
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK_Courses_Categories]
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_Courses_Users] FOREIGN KEY([expert_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK_Courses_Users]
GO
ALTER TABLE [dbo].[Enrollments]  WITH CHECK ADD  CONSTRAINT [FK_Enrollments_Courses] FOREIGN KEY([course_id])
REFERENCES [dbo].[Courses] ([course_id])
GO
ALTER TABLE [dbo].[Enrollments] CHECK CONSTRAINT [FK_Enrollments_Courses]
GO
ALTER TABLE [dbo].[Enrollments]  WITH CHECK ADD  CONSTRAINT [FK_Enrollments_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Enrollments] CHECK CONSTRAINT [FK_Enrollments_Users]
GO
ALTER TABLE [dbo].[Lessons]  WITH CHECK ADD  CONSTRAINT [FK_Lessons_Courses] FOREIGN KEY([course_id])
REFERENCES [dbo].[Courses] ([course_id])
GO
ALTER TABLE [dbo].[Lessons] CHECK CONSTRAINT [FK_Lessons_Courses]
GO
ALTER TABLE [dbo].[Questions]  WITH CHECK ADD  CONSTRAINT [FK_Questions_Quiz] FOREIGN KEY([quiz_id])
REFERENCES [dbo].[Quiz] ([quiz_id])
GO
ALTER TABLE [dbo].[Questions] CHECK CONSTRAINT [FK_Questions_Quiz]
GO
ALTER TABLE [dbo].[Quiz]  WITH CHECK ADD  CONSTRAINT [FK_Quiz_Courses] FOREIGN KEY([course_id])
REFERENCES [dbo].[Courses] ([course_id])
GO
ALTER TABLE [dbo].[Quiz] CHECK CONSTRAINT [FK_Quiz_Courses]
GO
ALTER TABLE [dbo].[Tokens]  WITH CHECK ADD  CONSTRAINT [FK_Tokens_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Tokens] CHECK CONSTRAINT [FK_Tokens_Users]
GO
ALTER TABLE [dbo].[User_Results]  WITH CHECK ADD  CONSTRAINT [FK_User_Results_Quiz] FOREIGN KEY([quiz_id])
REFERENCES [dbo].[Quiz] ([quiz_id])
GO
ALTER TABLE [dbo].[User_Results] CHECK CONSTRAINT [FK_User_Results_Quiz]
GO
ALTER TABLE [dbo].[User_Results]  WITH CHECK ADD  CONSTRAINT [FK_User_Results_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[User_Results] CHECK CONSTRAINT [FK_User_Results_Users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([role_id])
REFERENCES [dbo].[Roles] ([role_id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
USE [master]
GO
ALTER DATABASE [PRN231_OnlineLearning] SET  READ_WRITE 
GO
