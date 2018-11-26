/*!
 \file main.c
 \brief main.c -- программа вычисления юбилея
 *
 * Программа помогает вычислить ваш следующий юбилей исходя из текущего года  
 * и года вашего рождения.
 *
 * Copyright (c) 2016, Алексеев Владислав <valeksee@cs.karelia.ru>
 *
 * This code is licensed under a MIT-style license.
 */

/*!
 \brief Считывание данных.
 * В функции main считываются текущий год и год вашего рождени, после
 * вызывается функция для подсчёта юбилея. 
 \param integer current_year
 * текущий год. 
 \param integer year_of_birth
 * год рождения.
 */ 
#include <stdio.h>
#include "main.h"

int main()
{    
    /* Текущий год */
    int current_year;

    /* Год рождения */
    int year_of_birth;
 
    /* Запрашиваем с клавиатуры текущий год */
    fprintf(stdout, "Введите который сейчас год: ");
    fscanf(stdin, "%d", &current_year);

    /* Запрашиваем с клавиатуры год рождения */
    fprintf(stdout, "Введите год рождения: ");
    fscanf(stdin, "%d", &year_of_birth);

    /* Выводим год следующего юбилея */
    fprintf(stdout, "Вы празднуете следующий юбилей в %d году\n", func(current_year, year_of_birth));
    
    return 0;
}

    
	
