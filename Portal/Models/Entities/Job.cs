﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Portal.BL.Core;
using System.Linq;

namespace Portal.Models.Entities
{
    [NotMapped]
    public class TaskList
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }

        [StringLength(300)]
        public string Name { get; set; }

        public string ParametersDescribe { get; set; }

        public static List<TaskList> GetTaskLists()
        {
            List<TaskList> res = new List<TaskList> {
                new TaskList{
                    Id = 1,
                    Name = "Общие - Импорт сотрудников из 1С",
                    ParametersDescribe = "Путь к файлу .dbf"
                },
                new TaskList{
                    Id = 2,
                    Name = "Отчеты - Реализации акционных товаров (-50%)",
                    ParametersDescribe = "Набор артикулов через запятую;Id магазина (из УКМ);e-mail получателей через запятую"
                },
                new TaskList{
                    Id = 3,
                    Name = "Общие - Бэкап базы данных",
                    ParametersDescribe = "Путь к файлу бэкапа .bak"
                }
            };
            return res;
        }

        public static string GetParametersDescrive(int id)
        {
            TaskList tl = GetTaskLists().FirstOrDefault(t => t.Id == id);
            return tl != null ? tl.ParametersDescribe : String.Empty;
        }
    }

    public class Job
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }
        public int TaskListId { get; set; }
        public virtual TaskList TaskList { get; set; }

        [StringLength(300)]
        public string CronSchedule { get; set; }

        public Enums.Status Status { get; set; }
        public bool IsActive { get; set; }
        public bool IsAdded { get; set; }
        public string Parameters { get; set; }
    }

    public class JobResult
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }
        public int JobId { get; set; }
        public virtual Job Job { get; set; }
        public DateTime DateRun { get; set; }
        public Enums.Result Result { get; set; }
        public string Description { get; set; }
    }

}