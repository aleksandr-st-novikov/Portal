using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Portal.Models.Entities
{
    public class UserLog
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }

        [Display(Name = "Имя пользователя")]
        [StringLength(100)]
        public string UserName { get; set; }

        [Display(Name = "IPv4 адрес")]
        [StringLength(15)]
        public string IPv4 { get; set; }

        [Display(Name = "Имя компьютера")]
        [StringLength(100)]
        public string PCName { get; set; }

        [Display(Name = "Адрес")]
        [StringLength(1000)]
        public string Request { get; set; }

        [Display(Name = "Дата визита")]
        public DateTime VisitDate { get; set; }
    }

    [NotMapped]
    public class PagesName
    {
        public string PagePath { get; set; }
        public string PageName { get; set; }

        public static List<PagesName> GetPagesNames()
        {
            List<PagesName> res = new List<PagesName> {
                new PagesName{ PagePath = "/", PageName = "Главная" },
                new PagesName{ PagePath = "/pages/journal/admission/manageadmission.aspx", PageName = "Журналы - Допуски сотрудников" },
                new PagesName{ PagePath = "/pages/journal/oftransport/manageoftransport.aspx", PageName = "Журналы - Служебный транспорт" },
                new PagesName{ PagePath = "/pages/journal/transport/managetransport.aspx", PageName = "Журналы - Транспорт" },
                new PagesName{ PagePath = "/pages/maintenance/contact/managecontact.aspx", PageName = "Поддержка - Организации, контакты" },
                new PagesName{ PagePath = "/pages/maintenance/departmentwork/managedepartmentwork.aspx", PageName = "Поддержка - Работа отдела" },
                new PagesName{ PagePath = "/pages/maintenance/manual/managemanual.aspx", PageName = "Поддержка - Инструкции" },
                new PagesName{ PagePath = "/pages/maintenance/scheduler/managescheduler.aspx", PageName = "Поддержка - Планировщик заданий" },
                new PagesName{ PagePath = "/pages/report/birthday/managebirthday.aspx", PageName = "Отчеты - Дни рождения" },
                new PagesName{ PagePath = "/pages/admin/employee/manageemployee.aspx", PageName = "Администрирование - Сотрудники предприятия" },
                new PagesName{ PagePath = "/pages/admin/employee/importemployee.aspx", PageName = "Администрирование - Сотрудники предприятия - Импорт" },
                new PagesName{ PagePath = "/pages/admin/employee/managedepartment.aspx", PageName = "Администрирование - Сотрудники предприятия - Подразделения" },
                new PagesName{ PagePath = "/pages/admin/employee/manageposition.aspx", PageName = "Администрирование - Сотрудники предприятия - Должности" },
                new PagesName{ PagePath = "/pages/admin/setting/manageconstant.aspx", PageName = "Администрирование - Настройки - Константы" },
                new PagesName{ PagePath = "/pages/admin/users/manageusers.aspx", PageName = "Администрирование - Управление пользователями - Пользователи" },
                new PagesName{ PagePath = "/pages/admin/users/adduser.aspx", PageName = "Администрирование - Управление пользователями - Добавить пользователя" },
                new PagesName{ PagePath = "/pages/admin/users/manageroles.aspx", PageName = "Администрирование - Управление пользователями - Роли" },
                new PagesName{ PagePath = "/pages/admin/logs/managelogs.aspx", PageName = "Администрирование - Логи - Посещенные страницы" }
            };
            return res;
        }
    }
}