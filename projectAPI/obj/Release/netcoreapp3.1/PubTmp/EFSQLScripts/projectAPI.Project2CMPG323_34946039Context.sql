IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220831113256_Initial')
BEGIN
    CREATE TABLE [Category] (
        [CategoryID] uniqueidentifier NOT NULL,
        [CategoryName] nvarchar(max) NOT NULL,
        [CategoryDescription] nvarchar(max) NULL,
        [DateCreated] datetime NOT NULL DEFAULT ((getdate())),
        CONSTRAINT [PK_Category] PRIMARY KEY ([CategoryID])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220831113256_Initial')
BEGIN
    CREATE TABLE [Device] (
        [DeviceID] uniqueidentifier NOT NULL,
        [DeviceName] nvarchar(max) NULL,
        [CategoryID] uniqueidentifier NOT NULL,
        [ZoneID] uniqueidentifier NOT NULL,
        [Status] nvarchar(max) NULL,
        [IsActvie] bit NOT NULL,
        [DateCreated] datetime NOT NULL DEFAULT ((getdate())),
        CONSTRAINT [PK_Device] PRIMARY KEY ([DeviceID])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220831113256_Initial')
BEGIN
    CREATE TABLE [Zone] (
        [ZoneID] uniqueidentifier NOT NULL,
        [ZoneName] nvarchar(max) NOT NULL,
        [ZoneDescription] nvarchar(max) NULL,
        [DateCreated] datetime NOT NULL DEFAULT ((getdate())),
        CONSTRAINT [PK_Zone] PRIMARY KEY ([ZoneID])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220831113256_Initial')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220831113256_Initial', N'3.1.28');
END;

GO

