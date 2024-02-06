package com.nut.study.service;


import com.nut.study.entity.Banner;

import java.util.List;

public interface BannerService {
    List<Banner> getBannerList();
    void createBanner(Banner banner);
    void deleteBanner(String id);

    void updateBanner(Banner banner);
}
