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
package io.tackle.pathfinder.dto;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyDescription;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;
import io.quarkus.runtime.annotations.RegisterForReflection;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;


/**
 * 
 */
@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonPropertyOrder({
    "categories",
    "title",
    "description",
    "language"
})
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@RegisterForReflection
public class AssessmentQuestionnaireDto {

    /**
     * 
     * (Required)
     * 
     */
    @JsonProperty("categories")
    @JsonPropertyDescription("")
    @Builder.Default
    private List<AssessmentCategoryDto> categories = new ArrayList<AssessmentCategoryDto>();
    /**
     * 
     * (Required)
     * 
     */
    @JsonProperty("title")
    @JsonPropertyDescription("")
    private String title;
    /**
     * 
     */
    @JsonProperty("description")
    @JsonPropertyDescription("")
    private String description;
    /**
     * 
     * (Required)
     * 
     */
    @JsonProperty("language")
    @JsonPropertyDescription("")
    private String language;
}
