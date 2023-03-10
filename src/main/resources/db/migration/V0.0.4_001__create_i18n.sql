--
-- Copyright © 2021 the Konveyor Contributors (https://konveyor.io/)
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--     http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
--

create table translated_text (
     id int8 not null,
     createTime timestamp,
     createUser varchar(255),
     deleted boolean,
     updateTime timestamp,
     updateUser varchar(255),
     key varchar(255),
     language varchar(255),
     text varchar(1000),
     primary key (id)
);
CREATE UNIQUE INDEX translated_text_key_language_unique_idx
    ON translated_text (key, language)
    WHERE (deleted is not true);

ALTER TABLE assessment_category ADD COLUMN questionnaire_categoryId int8;
ALTER TABLE assessment_question ADD COLUMN questionnaire_questionId int8;
ALTER TABLE assessment_singleoption ADD COLUMN questionnaire_optionId int8;