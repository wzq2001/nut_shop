package com.nut.study.service;


import com.nut.study.entity.Classification;

import java.util.List;

public interface ClassificationService {
    List<Classification> getClassificationList();
    void createClassification(Classification Classification);
    void deleteClassification(String id);

    void updateClassification(Classification Classification);
}
