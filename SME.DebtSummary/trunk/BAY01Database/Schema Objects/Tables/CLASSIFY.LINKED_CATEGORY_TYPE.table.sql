﻿CREATE TABLE [CLASSIFY].[LINKED_CATEGORY_TYPE] (
    [ID]                        INT IDENTITY (1, 1) NOT NULL,
    [CATEGORY_TYPE_KEY]         INT NOT NULL,
    [LINK_TO_CATEGORY_TYPE_KEY] INT NOT NULL,
    [LINKED_TYPE_KEY]           INT NOT NULL,
    [DEL_FLAG]                  BIT NULL
);

