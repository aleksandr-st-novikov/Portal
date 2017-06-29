﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Net.Mime;
using System.Text;
using System.Threading.Tasks;
using Portal.BL.Core;

namespace Portal.BL.Utils
{
    public class Service
    {

        public static void SendMessage(string messageTo, string subject, string message, string attachmentFile = "")
        {
            SmtpClient Smtp = new SmtpClient(Data.PostHost, Data.PostPort);
            //Smtp.Credentials = new NetworkCredential("login", "password");
            MailMessage Message = new MailMessage();
            Message.IsBodyHtml = true;

            Message.From = new MailAddress(Data.messageFrom);
            string[] listTo = messageTo.Split(',');
            foreach (string lt in listTo)
            {
                Message.To.Add(new MailAddress(lt.Trim()));
            }

            Message.Subject = subject;
            Message.Body = message + "\n\r";

            if (attachmentFile != "")
            {
                Attachment attach = new Attachment(attachmentFile, MediaTypeNames.Application.Octet);
                Message.Attachments.Add(attach);
            }
            Smtp.Send(Message);
        }

    }
}