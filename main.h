/*!
 \file main.h
 \brief Функция подсчёта следующего вашего юбилея. 
 */

/*!
\brief Функция подсчёта.
 * Целочисленная функция, принимающая два целочисленных аргумента и вычисляющая
 * следующий юбилей.
\param current_year
 * текущий год(целое).
\param year_of_birth
 * год вашего рождения(целое). 
\return result
 * результат(целое).
 */
int func(int current_year, int year_of_birth) {
    int result = current_year + (10 - ((current_year - year_of_birth) % 10));
    return result;
}
