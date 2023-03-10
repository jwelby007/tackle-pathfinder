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
package io.tackle.pathfinder.services;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import io.quarkus.hibernate.orm.panache.PanacheEntity;
import io.tackle.pathfinder.model.Constants;
import io.tackle.pathfinder.model.i18n.TranslatedText;
import lombok.extern.java.Log;
import org.apache.commons.lang3.StringUtils;

import javax.enterprise.context.ApplicationScoped;
import javax.transaction.Transactional;
import javax.validation.constraints.NotNull;
import java.util.Base64;

@ApplicationScoped
@Log
public class TranslatorSvc {

    public String getKey(PanacheEntity b, String concept) {
        return getKey(b.getClass().getSimpleName(), b.id, concept);
    }

    public String getKey(String table, Long id, String field) {
        return String.format("%s_%s_%s", table, id, field);
    }

    @Transactional
    public String translate(@NotNull String key, @NotNull String destinationLanguage, String defaultText) {
        if (StringUtils.isBlank(destinationLanguage)) {
            return defaultText;
        }
        return TranslatedText.find("key=?1 and language=?2", key, destinationLanguage.toUpperCase())
            .firstResultOptional().map( a -> ((TranslatedText)a).text)
            .orElse(defaultText);
    }

    public TranslatedText addOrUpdateTranslation(@NotNull PanacheEntity entity, String concept, String text, String language) {
        return addOrUpdateTranslation(getKey(entity, concept), text, language);
    }

    @Transactional
    public TranslatedText addOrUpdateTranslation(@NotNull String key, String text, String language) {
        TranslatedText translatedText = (TranslatedText) TranslatedText.find("key=?1 and language=?2", key, language.toUpperCase())
            .firstResultOptional()
            .map(a -> {
                ((TranslatedText)a).text = text;
                return a;
            })
            .orElseGet(() -> TranslatedText.builder()
                .key(key)
                .text(text)
                .language(language).build());
        translatedText.persist();
        return translatedText;
    }

    public String getLanguage(String token, String queryLanguage) {
        if (StringUtils.isNotBlank(queryLanguage)) return queryLanguage;
        if (token == null || token.isEmpty()) return Constants.defaultLanguage;

        String tokenBodyJson = new String(Base64.getDecoder().decode(token.split("\\.")[1]));
        return getLocaleFromTokenBody(tokenBodyJson);
    }

    private String getLocaleFromTokenBody(String tokenBodyJson) {
        ObjectMapper tokenJson = new ObjectMapper();
        try {
            ObjectNode body = tokenJson.readValue(tokenBodyJson, ObjectNode.class);
            return body.has("locale") ? body.get("locale").textValue() : "null";
        } catch (JsonProcessingException e) {
            return null;
        }
    }
}
