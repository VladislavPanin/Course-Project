package com.sibertech.degr;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/** Проект демонстрации деградации скорости вставки в таблицы на реляционных СУБД. 
 *  Сравнение скорости деградации вставки в БД проводится для трех случаев архитектуры базы данных.
 *  Структура, перечень и связи таблиц всех трех случаях идеинтичны, объем данных, на котором демонстрируется сравнение - также идентичны.
 *  При этом, различается архитектура построения баз данных:
 *      1) (базовый) в БД одна база данных для всех данных с двумя большими таблицами, и множеством мелких.
 *      2) БД спроектирована с секционированными (table partitioning) двумя большии таблицами, во всем остальном структура БД идентична случаю 1)
 *      3) БД с сегментированием (DB sharding) данных таблицы по регионам. В качестве шард используются отдельные БД для каждого региона.
 *
 *  Вставка в большие таблицы сложная, с проверками и модификацией уже вставленных значений полей таблицы, но идентичная во всех трех случаях.
 */
@SpringBootApplication
public class DegrApplication {

	public static void main(String[] args) {
		SpringApplication.run(DegrApplication.class, args);
	}

}