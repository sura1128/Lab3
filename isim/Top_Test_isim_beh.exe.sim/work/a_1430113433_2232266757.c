/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "F:/Documents/School/NUS/Lab3/MIPS.vhd";
extern char *IEEE_P_3620187407;
extern char *IEEE_P_2592010699;

unsigned char ieee_p_2592010699_sub_1605435078_503743352(char *, unsigned char , unsigned char );
char *ieee_p_3620187407_sub_767668596_3965413181(char *, char *, char *, char *, char *, char *);


static void work_a_1430113433_2232266757_p_0(char *t0)
{
    char t1[16];
    char t6[16];
    char t26[16];
    char t28[16];
    char t30[16];
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t7;
    char *t8;
    int t9;
    unsigned int t10;
    char *t11;
    unsigned int t12;
    unsigned char t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    unsigned char t19;
    unsigned char t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    int t27;
    char *t29;
    char *t31;
    char *t32;
    int t33;
    unsigned int t34;
    char *t35;
    char *t36;
    char *t37;
    char *t38;

LAB0:    xsi_set_current_line(247, ng0);
    t2 = (t0 + 2632U);
    t3 = *((char **)t2);
    t2 = (t0 + 13152U);
    t4 = (t0 + 13859);
    t7 = (t6 + 0U);
    t8 = (t7 + 0U);
    *((int *)t8) = 0;
    t8 = (t7 + 4U);
    *((int *)t8) = 2;
    t8 = (t7 + 8U);
    *((int *)t8) = 1;
    t9 = (2 - 0);
    t10 = (t9 * 1);
    t10 = (t10 + 1);
    t8 = (t7 + 12U);
    *((unsigned int *)t8) = t10;
    t8 = ieee_p_3620187407_sub_767668596_3965413181(IEEE_P_3620187407, t1, t3, t2, t4, t6);
    t11 = (t1 + 12U);
    t10 = *((unsigned int *)t11);
    t12 = (1U * t10);
    t13 = (32U != t12);
    if (t13 == 1)
        goto LAB2;

LAB3:    t14 = (t0 + 8192);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    memcpy(t18, t8, 32U);
    xsi_driver_first_trans_fast(t14);
    xsi_set_current_line(248, ng0);
    t2 = (t0 + 3912U);
    t3 = *((char **)t2);
    t13 = *((unsigned char *)t3);
    t2 = (t0 + 3432U);
    t4 = *((char **)t2);
    t19 = *((unsigned char *)t4);
    t20 = ieee_p_2592010699_sub_1605435078_503743352(IEEE_P_2592010699, t13, t19);
    t2 = (t0 + 8256);
    t5 = (t2 + 56U);
    t7 = *((char **)t5);
    t8 = (t7 + 56U);
    t11 = *((char **)t8);
    *((unsigned char *)t11) = t20;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(249, ng0);
    t2 = (t0 + 4072U);
    t3 = *((char **)t2);
    t13 = *((unsigned char *)t3);
    t19 = (t13 == (unsigned char)3);
    if (t19 != 0)
        goto LAB4;

LAB6:    xsi_set_current_line(252, ng0);
    t2 = (t0 + 6632U);
    t3 = *((char **)t2);
    t13 = *((unsigned char *)t3);
    t19 = (t13 == (unsigned char)3);
    if (t19 != 0)
        goto LAB9;

LAB11:    xsi_set_current_line(255, ng0);
    t2 = (t0 + 6472U);
    t3 = *((char **)t2);
    t2 = (t0 + 8320);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t7 = (t5 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t3, 32U);
    xsi_driver_first_trans_fast(t2);

LAB10:
LAB5:    xsi_set_current_line(258, ng0);
    t2 = (t0 + 2632U);
    t3 = *((char **)t2);
    t2 = (t0 + 8384);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t7 = (t5 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t3, 32U);
    xsi_driver_first_trans_fast_port(t2);
    xsi_set_current_line(262, ng0);
    t2 = (t0 + 1192U);
    t3 = *((char **)t2);
    t10 = (31 - 31);
    t12 = (t10 * 1U);
    t21 = (0 + t12);
    t2 = (t3 + t21);
    t4 = (t0 + 8448);
    t5 = (t4 + 56U);
    t7 = *((char **)t5);
    t8 = (t7 + 56U);
    t11 = *((char **)t8);
    memcpy(t11, t2, 6U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(263, ng0);
    t2 = (t0 + 1192U);
    t3 = *((char **)t2);
    t10 = (31 - 25);
    t12 = (t10 * 1U);
    t21 = (0 + t12);
    t2 = (t3 + t21);
    t4 = (t0 + 8512);
    t5 = (t4 + 56U);
    t7 = *((char **)t5);
    t8 = (t7 + 56U);
    t11 = *((char **)t8);
    memcpy(t11, t2, 5U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(264, ng0);
    t2 = (t0 + 1192U);
    t3 = *((char **)t2);
    t10 = (31 - 20);
    t12 = (t10 * 1U);
    t21 = (0 + t12);
    t2 = (t3 + t21);
    t4 = (t0 + 8576);
    t5 = (t4 + 56U);
    t7 = *((char **)t5);
    t8 = (t7 + 56U);
    t11 = *((char **)t8);
    memcpy(t11, t2, 5U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(265, ng0);
    t2 = (t0 + 1192U);
    t3 = *((char **)t2);
    t10 = (31 - 15);
    t12 = (t10 * 1U);
    t21 = (0 + t12);
    t2 = (t3 + t21);
    t4 = (t0 + 8640);
    t5 = (t4 + 56U);
    t7 = *((char **)t5);
    t8 = (t7 + 56U);
    t11 = *((char **)t8);
    memcpy(t11, t2, 16U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(269, ng0);
    t2 = (t0 + 3752U);
    t3 = *((char **)t2);
    t10 = (1 - 1);
    t12 = (t10 * 1U);
    t21 = (0 + t12);
    t2 = (t3 + t21);
    t4 = (t0 + 8704);
    t5 = (t4 + 56U);
    t7 = *((char **)t5);
    t8 = (t7 + 56U);
    t11 = *((char **)t8);
    memcpy(t11, t2, 2U);
    xsi_driver_first_trans_delta(t4, 0U, 2U, 0LL);
    xsi_set_current_line(270, ng0);
    t2 = (t0 + 1192U);
    t3 = *((char **)t2);
    t10 = (31 - 5);
    t12 = (t10 * 1U);
    t21 = (0 + t12);
    t2 = (t3 + t21);
    t4 = (t0 + 8704);
    t5 = (t4 + 56U);
    t7 = *((char **)t5);
    t8 = (t7 + 56U);
    t11 = *((char **)t8);
    memcpy(t11, t2, 6U);
    xsi_driver_first_trans_delta(t4, 2U, 6U, 0LL);
    xsi_set_current_line(271, ng0);
    t2 = (t0 + 5512U);
    t3 = *((char **)t2);
    t2 = (t0 + 8768);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t7 = (t5 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t3, 32U);
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(273, ng0);
    t2 = (t0 + 4552U);
    t3 = *((char **)t2);
    t13 = *((unsigned char *)t3);
    t19 = (t13 == (unsigned char)3);
    if (t19 != 0)
        goto LAB14;

LAB16:    xsi_set_current_line(276, ng0);
    t2 = (t0 + 5672U);
    t3 = *((char **)t2);
    t2 = (t0 + 8832);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t7 = (t5 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t3, 32U);
    xsi_driver_first_trans_fast(t2);

LAB15:    xsi_set_current_line(281, ng0);
    t2 = (t0 + 3112U);
    t3 = *((char **)t2);
    t2 = (t0 + 8896);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t7 = (t5 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t3, 32U);
    xsi_driver_first_trans_fast_port(t2);
    xsi_set_current_line(282, ng0);
    t2 = (t0 + 5672U);
    t3 = *((char **)t2);
    t2 = (t0 + 8960);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t7 = (t5 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t3, 32U);
    xsi_driver_first_trans_fast_port(t2);
    xsi_set_current_line(286, ng0);
    t2 = (t0 + 5032U);
    t3 = *((char **)t2);
    t13 = *((unsigned char *)t3);
    t19 = (t13 == (unsigned char)3);
    if (t19 != 0)
        goto LAB17;

LAB19:    xsi_set_current_line(289, ng0);
    t2 = (t0 + 1192U);
    t3 = *((char **)t2);
    t10 = (31 - 20);
    t12 = (t10 * 1U);
    t21 = (0 + t12);
    t2 = (t3 + t21);
    t4 = (t0 + 9024);
    t5 = (t4 + 56U);
    t7 = *((char **)t5);
    t8 = (t7 + 56U);
    t11 = *((char **)t8);
    memcpy(t11, t2, 5U);
    xsi_driver_first_trans_fast(t4);

LAB18:    xsi_set_current_line(292, ng0);
    t2 = (t0 + 4392U);
    t3 = *((char **)t2);
    t13 = *((unsigned char *)t3);
    t19 = (t13 == (unsigned char)3);
    if (t19 != 0)
        goto LAB20;

LAB22:    xsi_set_current_line(295, ng0);
    t2 = (t0 + 4232U);
    t3 = *((char **)t2);
    t13 = *((unsigned char *)t3);
    t19 = (t13 == (unsigned char)3);
    if (t19 != 0)
        goto LAB25;

LAB27:    xsi_set_current_line(298, ng0);
    t2 = (t0 + 3112U);
    t3 = *((char **)t2);
    t2 = (t0 + 9088);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t7 = (t5 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t3, 32U);
    xsi_driver_first_trans_fast(t2);

LAB26:
LAB21:    t2 = (t0 + 8112);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_size_not_matching(32U, t12, 0);
    goto LAB3;

LAB4:    xsi_set_current_line(250, ng0);
    t2 = (t0 + 6472U);
    t4 = *((char **)t2);
    t10 = (31 - 31);
    t12 = (t10 * 1U);
    t21 = (0 + t12);
    t2 = (t4 + t21);
    t5 = (t0 + 1192U);
    t7 = *((char **)t5);
    t22 = (31 - 25);
    t23 = (t22 * 1U);
    t24 = (0 + t23);
    t5 = (t7 + t24);
    t11 = ((IEEE_P_2592010699) + 4024);
    t14 = (t6 + 0U);
    t15 = (t14 + 0U);
    *((int *)t15) = 31;
    t15 = (t14 + 4U);
    *((int *)t15) = 28;
    t15 = (t14 + 8U);
    *((int *)t15) = -1;
    t9 = (28 - 31);
    t25 = (t9 * -1);
    t25 = (t25 + 1);
    t15 = (t14 + 12U);
    *((unsigned int *)t15) = t25;
    t15 = (t26 + 0U);
    t16 = (t15 + 0U);
    *((int *)t16) = 25;
    t16 = (t15 + 4U);
    *((int *)t16) = 0;
    t16 = (t15 + 8U);
    *((int *)t16) = -1;
    t27 = (0 - 25);
    t25 = (t27 * -1);
    t25 = (t25 + 1);
    t16 = (t15 + 12U);
    *((unsigned int *)t16) = t25;
    t8 = xsi_base_array_concat(t8, t1, t11, (char)97, t2, t6, (char)97, t5, t26, (char)101);
    t16 = (t0 + 13862);
    t29 = ((IEEE_P_2592010699) + 4024);
    t31 = (t30 + 0U);
    t32 = (t31 + 0U);
    *((int *)t32) = 0;
    t32 = (t31 + 4U);
    *((int *)t32) = 1;
    t32 = (t31 + 8U);
    *((int *)t32) = 1;
    t33 = (1 - 0);
    t25 = (t33 * 1);
    t25 = (t25 + 1);
    t32 = (t31 + 12U);
    *((unsigned int *)t32) = t25;
    t18 = xsi_base_array_concat(t18, t28, t29, (char)97, t8, t1, (char)97, t16, t30, (char)101);
    t25 = (4U + 26U);
    t34 = (t25 + 2U);
    t20 = (32U != t34);
    if (t20 == 1)
        goto LAB7;

LAB8:    t32 = (t0 + 8320);
    t35 = (t32 + 56U);
    t36 = *((char **)t35);
    t37 = (t36 + 56U);
    t38 = *((char **)t37);
    memcpy(t38, t18, 32U);
    xsi_driver_first_trans_fast(t32);
    goto LAB5;

LAB7:    xsi_size_not_matching(32U, t34, 0);
    goto LAB8;

LAB9:    xsi_set_current_line(253, ng0);
    t2 = (t0 + 6472U);
    t4 = *((char **)t2);
    t2 = (t0 + 13392U);
    t5 = (t0 + 6312U);
    t7 = *((char **)t5);
    t10 = (31 - 29);
    t12 = (t10 * 1U);
    t21 = (0 + t12);
    t5 = (t7 + t21);
    t8 = (t0 + 13864);
    t15 = ((IEEE_P_2592010699) + 4024);
    t16 = (t26 + 0U);
    t17 = (t16 + 0U);
    *((int *)t17) = 29;
    t17 = (t16 + 4U);
    *((int *)t17) = 0;
    t17 = (t16 + 8U);
    *((int *)t17) = -1;
    t9 = (0 - 29);
    t22 = (t9 * -1);
    t22 = (t22 + 1);
    t17 = (t16 + 12U);
    *((unsigned int *)t17) = t22;
    t17 = (t28 + 0U);
    t18 = (t17 + 0U);
    *((int *)t18) = 0;
    t18 = (t17 + 4U);
    *((int *)t18) = 1;
    t18 = (t17 + 8U);
    *((int *)t18) = 1;
    t27 = (1 - 0);
    t22 = (t27 * 1);
    t22 = (t22 + 1);
    t18 = (t17 + 12U);
    *((unsigned int *)t18) = t22;
    t14 = xsi_base_array_concat(t14, t6, t15, (char)97, t5, t26, (char)97, t8, t28, (char)101);
    t18 = ieee_p_3620187407_sub_767668596_3965413181(IEEE_P_3620187407, t1, t4, t2, t14, t6);
    t29 = (t1 + 12U);
    t22 = *((unsigned int *)t29);
    t23 = (1U * t22);
    t20 = (32U != t23);
    if (t20 == 1)
        goto LAB12;

LAB13:    t31 = (t0 + 8320);
    t32 = (t31 + 56U);
    t35 = *((char **)t32);
    t36 = (t35 + 56U);
    t37 = *((char **)t36);
    memcpy(t37, t18, 32U);
    xsi_driver_first_trans_fast(t31);
    goto LAB10;

LAB12:    xsi_size_not_matching(32U, t23, 0);
    goto LAB13;

LAB14:    xsi_set_current_line(274, ng0);
    t2 = (t0 + 6312U);
    t4 = *((char **)t2);
    t2 = (t0 + 8832);
    t5 = (t2 + 56U);
    t7 = *((char **)t5);
    t8 = (t7 + 56U);
    t11 = *((char **)t8);
    memcpy(t11, t4, 32U);
    xsi_driver_first_trans_fast(t2);
    goto LAB15;

LAB17:    xsi_set_current_line(287, ng0);
    t2 = (t0 + 1192U);
    t4 = *((char **)t2);
    t10 = (31 - 15);
    t12 = (t10 * 1U);
    t21 = (0 + t12);
    t2 = (t4 + t21);
    t5 = (t0 + 9024);
    t7 = (t5 + 56U);
    t8 = *((char **)t7);
    t11 = (t8 + 56U);
    t14 = *((char **)t11);
    memcpy(t14, t2, 5U);
    xsi_driver_first_trans_fast(t5);
    goto LAB18;

LAB20:    xsi_set_current_line(293, ng0);
    t2 = (t0 + 1192U);
    t4 = *((char **)t2);
    t10 = (31 - 15);
    t12 = (t10 * 1U);
    t21 = (0 + t12);
    t2 = (t4 + t21);
    t5 = (t0 + 13866);
    t11 = ((IEEE_P_2592010699) + 4024);
    t14 = (t6 + 0U);
    t15 = (t14 + 0U);
    *((int *)t15) = 15;
    t15 = (t14 + 4U);
    *((int *)t15) = 0;
    t15 = (t14 + 8U);
    *((int *)t15) = -1;
    t9 = (0 - 15);
    t22 = (t9 * -1);
    t22 = (t22 + 1);
    t15 = (t14 + 12U);
    *((unsigned int *)t15) = t22;
    t15 = (t26 + 0U);
    t16 = (t15 + 0U);
    *((int *)t16) = 0;
    t16 = (t15 + 4U);
    *((int *)t16) = 15;
    t16 = (t15 + 8U);
    *((int *)t16) = 1;
    t27 = (15 - 0);
    t22 = (t27 * 1);
    t22 = (t22 + 1);
    t16 = (t15 + 12U);
    *((unsigned int *)t16) = t22;
    t8 = xsi_base_array_concat(t8, t1, t11, (char)97, t2, t6, (char)97, t5, t26, (char)101);
    t22 = (16U + 16U);
    t20 = (32U != t22);
    if (t20 == 1)
        goto LAB23;

LAB24:    t16 = (t0 + 9088);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    t29 = (t18 + 56U);
    t31 = *((char **)t29);
    memcpy(t31, t8, 32U);
    xsi_driver_first_trans_fast(t16);
    goto LAB21;

LAB23:    xsi_size_not_matching(32U, t22, 0);
    goto LAB24;

LAB25:    xsi_set_current_line(296, ng0);
    t2 = (t0 + 1512U);
    t4 = *((char **)t2);
    t2 = (t0 + 9088);
    t5 = (t2 + 56U);
    t7 = *((char **)t5);
    t8 = (t7 + 56U);
    t11 = *((char **)t8);
    memcpy(t11, t4, 32U);
    xsi_driver_first_trans_fast(t2);
    goto LAB26;

}


extern void work_a_1430113433_2232266757_init()
{
	static char *pe[] = {(void *)work_a_1430113433_2232266757_p_0};
	xsi_register_didat("work_a_1430113433_2232266757", "isim/Top_Test_isim_beh.exe.sim/work/a_1430113433_2232266757.didat");
	xsi_register_executes(pe);
}
