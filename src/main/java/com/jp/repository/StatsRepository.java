/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jp.repository;

import java.util.Date;
import java.util.List;

/**
 *
 * @author kid03
 */
public interface StatsRepository {
    List<Object[]> careerStats(Date fromDate, Date toDate);
    List<Object[]> careerStatsList(Date fromDate, Date toDate);
}
