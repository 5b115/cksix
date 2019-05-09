package com.zut.wl.bean;

import lombok.Data;

import java.util.List;

/**
 * @Author xiumu
 * @Date 2019/5/7 16:41
 */
@Data
public class PageInfoHelper<T> {
    private int page;
    private int max_page;
    private int per;
    private List<T> list;
}
