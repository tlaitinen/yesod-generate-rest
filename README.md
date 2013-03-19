# yesod-generate-rest

A domain specific language and a code generator desined to create RESTful
services for managing a database with [Yesod web framework](http://www.yesodweb.com/)
and [Persistent](http://www.yesodweb.com/book/persistent).

## Features (parentheses if not yet implemented)
 * splitting database definitions into multiple files
 * generates support code for implementing polymorphic relations and accessing common fields
 * generates boilerplate code for entity validation
 * supports following field types : Word32, Word64, Int32, Int64, Text, Bool, Double, TimeOfDay, Day, UTCTime, ZonedTime
 * (generates RESTful web service for managing entities)
 * (triggers for web service events: beforeCreate, afterCreate, beforeModify, afterModify, etc.)

## License
 * The code generator is distributed under the terms of [Simplified BSD license](enterdsl/blob/master/LICENSE)

## Quick start

### Step 1: get the source code and compile

    git clone git://github.com/tlaitinen/enterdsl.git
    cd enterdsl/database
    make

### Step 2: Create scaffolded Yesod site

    yesod init

### Step 3: write database definition .dbdef-file
```
-- .dbdef-file can include other .dbdef-files for increased 
-- reusability
import "module.dbdef";

entity User {
    implements Named;
    implements Versioned;

    password Text;
    salt Text;
    language Text;
    timezone Text;
}

entity Note {
    implements Named;
    implements Versioned;

    owner   User;
    title   Text check nonempty;
    body    Text;
    created DateTime;
}

entity File {
    implements Named;

    owner User;
    name Text;
    path Text;

    unique UserName user name;
}
interface Named {
    name Text check nonempty;
}
interface Versioned {
    version Maybe Int64; 
}

entity ChangeRecord {
    field    Text;
    oldValue Text;
    newValue Text;
    time     DateTime;
    version  Int64;
    'entity' Maybe Versioned;
}
```

### Step 4: run code generator

    $ yesod-generate-rest main.dbdef

At the moment, the code generator writes config/generated-models, Model/Validation.hs,
   and Model/Interfaces.hs that have the following contents.


#### config/generated-models
```
ChangeRecord
    entityNote NoteId Maybe 
    entityUser UserId Maybe 
    version Int64 
    time UTCTime 
    newValue Text 
    oldValue Text 
    field Text 

File
    path Text 
    owner UserId 
    name Text 
    UniqueOwnerName owner name

Note
    created UTCTime 
    body Text 
    owner UserId 
    version Int64 Maybe 
    name Text 

User
    timezone Text 
    language Text 
    salt Text 
    password Text 
    version Int64 Maybe 
    name Text 
```

#### Model/Validation.hs
```haskell
{-# LANGUAGE OverloadedStrings #-}
module Model.Validation (Validatable(..)) where
import Data.Text
import qualified Model.ValidationFunctions as V
import Import
class Validatable a where
    validate :: a -> [Text]
instance Validatable ChangeRecord where 
    validate d = catMaybes [
    ]
    
instance Validatable File where 
    validate d = catMaybes [
    if (not . V.nonempty) $name d then Just "File.name nonempty" else Nothing
    ]
    
instance Validatable Note where 
    validate d = catMaybes [
    if (not . V.nonempty) $name d then Just "Note.name nonempty" else Nothing
    ]
    
instance Validatable User where 
    validate d = catMaybes [
    if (not . V.nonempty) $name d then Just "User.name nonempty" else Nothing
    ]
```    

#### Model/Interfaces.hs
```haskell
module Model.Interfaces where
import Import
class Versioned a where
    versionedVersion :: a -> Maybe Int64

instance Versioned Note where 
    versionedVersion = noteVersion

instance Versioned User where 
    versionedVersion = userVersion

class Named a where
    namedName :: a -> Text

instance Named File where 
    namedName = fileName

instance Named Note where 
    namedName = noteName

instance Named User where 
    namedName = userName
```
