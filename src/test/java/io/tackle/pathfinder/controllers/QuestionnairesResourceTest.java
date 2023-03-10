/*
 * Copyright © 2021 the Konveyor Contributors (https://konveyor.io/)
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package io.tackle.pathfinder.controllers;

import io.quarkus.test.junit.QuarkusTest;
import io.quarkus.test.junit.TestProfile;
import io.tackle.pathfinder.AbstractResourceTest;
import io.tackle.pathfinder.DefaultTestProfile;
import io.tackle.pathfinder.dto.questionnaire.QuestionnaireHeaderDto;
import io.tackle.pathfinder.model.questionnaire.Questionnaire;
import io.tackle.pathfinder.services.TranslatorSvc;
import org.junit.jupiter.api.Test;

import javax.inject.Inject;
import javax.transaction.HeuristicMixedException;
import javax.transaction.HeuristicRollbackException;
import javax.transaction.NotSupportedException;
import javax.transaction.RollbackException;
import javax.transaction.SystemException;
import javax.transaction.UserTransaction;

import static io.restassured.RestAssured.given;
import static org.assertj.core.api.Assertions.assertThat;

@QuarkusTest
@TestProfile(DefaultTestProfile.class)
public class QuestionnairesResourceTest extends AbstractResourceTest {
    @Inject
    TranslatorSvc translatorSvc;

    @Inject
    UserTransaction userTransaction;

    @Test
    public void given_Questionnaire_When_Get_Then_ReturnsHeaderDto() {
        QuestionnaireHeaderDto[] questionnaires = given()
            .queryParam("language", "EN")
            .when()
            .get("/questionnaires")
            .then()
            .statusCode(200)
            .extract().as(QuestionnaireHeaderDto[].class);

        assertThat(questionnaires)
            .hasSizeGreaterThan(0)
            .usingRecursiveComparison()
            .ignoringFields("id")
            .isEqualTo(QuestionnaireHeaderDto.builder()
                .name("Pathfinder")
                .language("EN")
                .build());
    }

    @Test
    public void given_Questionnaire_When_GetInADifferentLanguage_Then_ReturnsHeaderDtoInThatLanguage() throws SystemException, NotSupportedException, HeuristicRollbackException, HeuristicMixedException, RollbackException {
        userTransaction.begin();
        translatorSvc.addOrUpdateTranslation(Questionnaire.findAll().firstResult(), "name", "CA Pathfinder", "CA");
        userTransaction.commit();

        QuestionnaireHeaderDto[] questionnaires = given()
            .queryParam("language", "CA")
            .when()
            .get("/questionnaires")
            .then()
            .statusCode(200)
            .extract().as(QuestionnaireHeaderDto[].class);

        assertThat(questionnaires)
            .hasSizeGreaterThan(0)
            .usingRecursiveComparison()
            .ignoringFields("id")
            .isEqualTo(QuestionnaireHeaderDto.builder()
                .name("CA Pathfinder")
                .language("CA")
                .build());
    }
}
