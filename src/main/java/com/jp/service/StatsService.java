/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jp.service;

import java.util.Date;
import java.util.List;

/**
 *
 * @author kid03
 */
public interface StatsService {
    List<Object[]> careerStats(Date fromDate, Date toDate);
}
